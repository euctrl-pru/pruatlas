#!/usr/bin/env Rscript

"Export ACC (Area Control Centre) to GeoJSON file.

Usage: export_acc_geojson [-h] [-o FILE] <cfmu_airac>

  -o FILE, --output FILE   name of output GeoJSON file [default: acc-<cfmu_airac>.geojson]
  -h --help                show this help text

Arguments:
    <cfmu_airac>  the AIRAC number (CFMU format)
" -> doc

suppressMessages(library(docopt))

# retrieve the command-line arguments
opts <- docopt(doc)

suppressMessages(library('ROracle'))
suppressMessages(library(eurocontrol))
suppressMessages(library(stringr))
suppressMessages(library(dplyr))
suppressMessages(library(readr))
suppressMessages(library(sf))

cfmu_airac <- opts$cfmu_airac
opts$output <- str_replace(opts$output, "<cfmu_airac>", cfmu_airac)
opts["--output"] <- opts$output


# NOTE: to be set before you create your ROracle connection!
# See http://www.oralytics.com/2015/05/r-roracle-and-oracle-date-formats_27.html

withr::local_envvar(c(TZ = "UTC", ORA_SDTZ = "UTC", NLS_LANG = ".AL32UTF8"))
con <- withr::local_db_connection(eurocontrol::db_connection("PRU_DEV"))


sqlq <- "
WITH
  AIRSPACE_NAMES AS (
    SELECT
      ID,
      CODE,
      NAME,
      PRU_ATC_TYPE AS AIRSPACE_TYPE
    FROM
      PRU_STAT_AUA
    WHERE
      PRU_ATC_TYPE IN ('ACC', 'OAC')
  )
SELECT
  '{ \"type\": \"FeatureCollection\", \"features\": [' ||
  rtrim(SWH_MAP.clobagg('{ \"type\": \"Feature\", \"geometry\": '
  || SWH_MAP.SDO2GEOJSON(SHAPE,3,0,0)
  || ', \"properties\": {'
  || '\"AC_ID\": '               || A.AC_ID                 || ', '
  || '\"AV_AIRSPACE_ID\": \"'    || A.AIRSPACE_ID           || '\", '
  || '\"MIN_FLIGHT_LEVEL\": '    || A.MIN_FLIGHT_LEVEL      || ', '
  || '\"MAX_FLIGHT_LEVEL\": '    || A.MAX_FLIGHT_LEVEL      || ', '
  || '\"NAME\": \"'              || B.NAME                  || '\", '
  || '\"CODE\": \"'              || B.CODE                  || '\", '
  || '\"AIRSPACE_TYPE\": \"'     || B.AIRSPACE_TYPE         || '\"'
  || '}}' || ',' || chr(13)),',' || chr(13))                || ']}'
FROM
  ENV_SP.AIRSPACE A
  INNER JOIN AIRSPACE_NAMES B
    ON (
      A.AIRSPACE_ID = B.AIRSPACE_ID
      AND AIRSPACE_KIND = 'STAT_AUA'
    )
WHERE
  A.AC_ID = ?CFMU_AIRAC
  AND A.SHAPE IS NOT NULL
"


query <- DBI::sqlInterpolate(con, sqlq, CFMU_AIRAC = cfmu_airac)
flt <- DBI::dbSendQuery(con, query)
data <- DBI::fetch(flt, n = -1)

data %>%
  dplyr::first() %>%
  st_read() %>%
  # save as GeoJSON
  st_write(opts$output, driver = "GeoJSON", delete_dsn = TRUE)
