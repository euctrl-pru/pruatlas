# calculate sphere in LAEA
library(sf)
library(magrittr)
library(here)
library(arrow)
library(dplyr)
library(stringr)
library(fs)

# To Be Run on the command line in data-raw/
# $ system('export_ace_ansp_geojson.R  -o ansps_ace_406.geojson" 406')
prepare_ansp_data <- function(cfmu_airac) {
  fn <- str_glue("ansps_ace_{cfmu_airac}.geojson")
  ansps_ace <- read_sf(here("data-raw", fn)) |>
    sf::st_make_valid()
  ansps_ace |>
    sf::st_write(here("inst", "extdata", fn), delete_dsn=TRUE)
  fs::file_delete(here("data-raw", fn))

  fn <- fs::path_ext_set(fn, "parquet")
  ansps_ace |>
    mutate(geometry_wkt = st_as_text(geometry)) %>%
    tibble() %>%
    select(-geometry) %>%
    write_parquet(here("inst", "extdata", fn))

  ansps_ace
}

ansps_ace_406 <- prepare_ansp_data(406)
usethis::use_data(
  ansps_ace_406,
  compress = "bzip2",
  overwrite = TRUE)

ansps_ace_481 <- prepare_ansp_data(481)
usethis::use_data(
  ansps_ace_481,
  compress = "bzip2",
  overwrite = TRUE)

ansps_ace_524 <- prepare_ansp_data(524)
usethis::use_data(
  ansps_ace_524,
  compress = "bzip2",
  overwrite = TRUE)
