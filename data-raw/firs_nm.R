library(sf)
library(magrittr)
library(fs)
library(here)
library(tidyverse)
library(arrow)
library(eurocontrol)

prepare_firs_data <- function(cfmu_airac) {
  df <- eurocontrol::fir_sf(cfmu_airac = cfmu_airac) |>
    sf::st_make_valid()

  fn <- str_glue("ir-{cfmu_airac}.geojson")
  df |>
    sf::st_write(here("inst", "extdata", fn), delete_dsn = TRUE)

  fn <- str_glue("firs_nm_{cfmu_airac}.parquet")
  df |>
    mutate(geometry_wkt = st_as_text(geometry)) %>%
    tibble() %>%
    select(-geometry) %>%
    write_parquet(here("inst", "extdata", fn))

  df
}


firs_nm_406 <- prepare_firs_data(406)
usethis::use_data(
  firs_nm_406,
  compress = "bzip2",
  overwrite = TRUE)

firs_nm_481 <- prepare_firs_data(481)
usethis::use_data(
  firs_nm_481,
  compress = "bzip2",
  overwrite = TRUE)

firs_nm_524 <- prepare_firs_data(524)
usethis::use_data(
  firs_nm_524,
  compress = "bzip2",
  overwrite = TRUE)
