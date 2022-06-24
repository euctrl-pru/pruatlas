#!/usr/bin/env Rscript

"Export (ACE) ANSPs to GeoJSON file.

Usage: export-ace-ansp-geojson [-h] [-o FILE] <cfmu_airac>

  -o FILE, --output FILE   name of output GeoJSON file [default: ansp_ace_<cfmu_airac>.geojson]
  -h --help                show this help text

Arguments:
    <cfmu_airac>  the AIRAC number (CFMU format)
" -> doc

#' Suppresses console output, including printing
#'
#' This is copied from my personal package, `desiderata`.
#'
#' @param expr (Expression) An expression to evaluate.
#'
#' @return Evaluates `expr`.
#'
#' @md
shhh <- function(expr) {
  call <- quote(expr)

  invisible(
    utils::capture.output(
      out <-
        suppressWarnings(
          suppressMessages(
            suppressPackageStartupMessages(
              eval(call)))))
  )
  return(invisible(out))
}

shhh(library(docopt))

# retrieve the command-line arguments
opts <- docopt(doc)

usr <- Sys.getenv("PRU_DEV_USR")
pwd <- Sys.getenv("PRU_DEV_PWD")
dbn <- Sys.getenv("PRU_DEV_DBNAME")

if (usr == "") {
  cat("Error: you should at least set your DB user via PRU_DEV_USR")
  q(status = -1)
}

shhh(library('ROracle'))
shhh(library(stringr))
shhh(library(dplyr))
shhh(library(readr))
shhh(library(sf))

cfmu_airac       <- opts$cfmu_airac
opts$output      <- str_replace(opts$output, "<cfmu_airac>", cfmu_airac)
opts["--output"] <- opts$output


retrieve_data <- function(usr, pwd, dbn, cfmu_airac) {
  # NOTE: to be set before you create your ROracle connection!
  # See http://www.oralytics.com/2015/05/r-roracle-and-oracle-date-formats_27.html
  withr::local_envvar(c("TZ" = "UTC",
                        "ORA_SDTZ" = "UTC"))
  withr::local_namespace("ROracle")
  con <- withr::local_db_connection(
    DBI::dbConnect(
      DBI::dbDriver("Oracle"),
      usr, pwd,
      dbname = dbn,
      timezone = "UTC")
  )

  sqlq_ansp <- "WITH
  AIRSPACE_NAMES
  AS
  (
    SELECT DISTINCT AIRSPACE_ID, AIRSPACE_TYPE, NAME, ACE_CODE, CODE
    FROM ENV_SP.AIRSPACE A, PRU_CFMU_ANSP P
    WHERE
    A.AIRSPACE_ID = P.ID
    AND A.AIRSPACE_KIND = 'ANSP'
    AND AC_ID = ?CFMU_AIRAC
  )
  SELECT '{ \"type\": \"FeatureCollection\", \"features\": [' ||
  rtrim(SWH_MAP.clobagg('{ \"type\": \"Feature\", \"geometry\": '
  || SWH_MAP.SDO2GEOJSON(SHAPE,3,0,0)
  || ', \"properties\": {'
  || '\"AC_ID\": '               || A.AC_ID                 || ', '
  || '\"AV_AIRSPACE_ID\": \"'    || A.AIRSPACE_ID           || '\", '
  || '\"MIN_FLIGHT_LEVEL\": '    || A.MIN_FLIGHT_LEVEL      || ', '
  || '\"MAX_FLIGHT_LEVEL\": '    || A.MAX_FLIGHT_LEVEL      || ', '
  || '\"NAME\": \"'              || AIRSPACE_NAMES.NAME     || '\", '
  || '\"ACE_CODE\": \"'          || AIRSPACE_NAMES.ACE_CODE || '\", '
  || '\"CODE\": \"'              || AIRSPACE_NAMES.CODE     || '\", '
  || '\"AIRSPACE_TYPE\": \"'     || A.AIRSPACE_TYPE         || '\"'
  || '}}' || ',' || chr(13)),',' || chr(13)) || ']}'
  FROM ENV_SP.AIRSPACE A
  LEFT JOIN AIRSPACE_NAMES
  ON
    A.AIRSPACE_ID = AIRSPACE_NAMES.AIRSPACE_ID
    AND A.AIRSPACE_TYPE = AIRSPACE_NAMES.AIRSPACE_TYPE
  WHERE
    A.AC_ID = ?CFMU_AIRAC
    AND A.AIRSPACE_TYPE = 'ANSP'
    AND A.SHAPE IS NOT NULL
  "

  query <- DBI::sqlInterpolate(con, sqlq_ansp, CFMU_AIRAC = cfmu_airac)
  flt <- DBI::dbSendQuery(con, query)
  data <- DBI::fetch(flt, n = -1)
  data
}

data <- retrieve_data(usr, pwd, dbn, cfmu_airac)
data <- data %>%
  dplyr::first() %>%
  dplyr::as_tibble() %>%
  read_sf(quiet = TRUE) %>%
  # filter out CODE's in 'AIRPORT', 'UNKNOWN', 'MILITARY'
  dplyr::filter(!CODE %in% c('AIRPORT', 'UNKNOWN', 'MILITARY')) %>%
  # filter out empty ACE_CODEs
  # (BUT this will remove ANSPs not in ACE, i.e. Morocco and Israel
  #  AND it will avoid overlapping Oceanic/Continental ANSPs, i.e. NATS, Avinor)
  # filter(ACE_CODE != '') %>%
  rename(
    airac_cfmu    = AC_ID,
    id            = AV_AIRSPACE_ID,
    code          = CODE,
    min_fl        = MIN_FLIGHT_LEVEL,
    max_fl        = MAX_FLIGHT_LEVEL,
    name          = NAME,
    ace_code      = ACE_CODE,
    airspace_type = AIRSPACE_TYPE,
    NULL
  ) %>%
  select(airac_cfmu, id, code, name, ace_code, min_fl, max_fl, airspace_type) %>%
  # save as GeoJSON
  st_write(opts$output, driver = "GeoJSON", delete_dsn = TRUE, quiet = TRUE)
