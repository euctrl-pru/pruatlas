# calculate sphere in LAEA
library(sf)
library(magrittr)

system('export_ace_ansp_geojson.R  406')
fs::file_move("ir-481.geojson", "inst/extdata/")
ansps_ace_406 <- read_sf("data-raw/ansp_ace_406.geojson")
usethis::use_data(
  ansps_ace_406,
  compress = "bzip2",
  overwrite = TRUE)

system('export_ace_ansp_geojson.R  481')
ansps_ace_481 <- read_sf("data-raw/ansp_ace_481.geojson")
usethis::use_data(
  ansps_ace_481,
  compress = "bzip2",
  overwrite = TRUE)
