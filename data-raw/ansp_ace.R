library(sf)
library(magrittr)
library(here)
library(arrow)
library(dplyr)
library(stringr)
library(fs)
library(eurocontrol)

conn <- eurocontrol::db_connection("PRU_DEV")

prepare_ansp_data <- function(cfmu_airac, conn) {
  ansps_ace <- eurocontrol::ansp_sf(conn = conn, cfmu_airac = cfmu_airac) |>
    sf::st_make_valid()

  fn <- str_glue("ansps_ace_{cfmu_airac}.geojson")
  ansps_ace |>
    sf::st_write(here("inst", "extdata", fn), delete_dsn = TRUE)

  fn <- fs::path_ext_set(fn, "parquet")
  ansps_ace |>
    mutate(geometry_wkt = st_as_text(geometry)) %>%
    tibble() %>%
    select(-geometry) %>%
    write_parquet(here("inst", "extdata", fn))

  ansps_ace
}

ansps_ace_406 <- prepare_ansp_data(406, conn)
usethis::use_data(
  ansps_ace_406,
  compress = "bzip2",
  overwrite = TRUE
)

ansps_ace_481 <- prepare_ansp_data(481, conn)
usethis::use_data(
  ansps_ace_481,
  compress = "bzip2",
  overwrite = TRUE
)

ansps_ace_524 <- prepare_ansp_data(524, conn)
usethis::use_data(
  ansps_ace_524,
  compress = "bzip2",
  overwrite = TRUE
)

# Prepare Upper Airspace for Balint
# fl_u <- 300
# ansps_ace_540 <- prepare_ansp_data(540)
#
# ansps_u <- ansps_ace_540 |>
#   # upper airspace
#   dplyr::filter(
#     min_fl <= fl_u & fl_u <= max_fl,
#     str_detect(name, "Oceanic", negate = TRUE)
#   ) |>
#   dplyr::filter(code != "NAVEP_SM")
#
# enav_u <- ansps_u |>
#   filter(code == "ENAV") |>
#   smoothr::fill_holes(units::set_units(10000, km^2))
#
# ansps_u <- ansps_u |>
#   filter(code != "ENAV") |>
#   bind_rows(enav_u)
#
# ansps_u |> geojsonio::topojson_write(file = "ansps_upper_540.json")
