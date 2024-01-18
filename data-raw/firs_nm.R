library(sf)
library(magrittr)
library(fs)
library(here)
library(tidyverse)

# extract [FU]IR from PRISME
system('export_nm_fir_geojson.R 406')
fs::file_move("ir-406.geojson", "inst/extdata/")

firs_nm_406 <- read_sf("inst/extdata/ir-406.geojson")
usethis::use_data(
  firs_nm_406,
  compress = "bzip2",
  overwrite = TRUE)


# extract [FU]IR from PRISME
system('export_nm_fir_geojson.R 481')
fs::file_move(here("data-raw/", "ir-481.geojson"), here("inst","extdata/"))

firs_nm_481 <- read_sf("inst/extdata/ir-481.geojson")

firs <- firs_nm_481 |>
  mutate(name = case_when(
    code == "BIRD" ~ "REYKJAVIK FIR",
    code == "BODO" ~ "BODO OCEANIC FIR",
    .default = name
  ))

usethis::use_data(
  firs_nm_481,
  compress = "bzip2",
  overwrite = TRUE)
