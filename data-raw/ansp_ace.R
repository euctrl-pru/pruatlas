# calculate sphere in LAEA
library(sf)
library(magrittr)

system('export_ace_ansp_geojson.R  -o ansp_ace_406.geojson 406')
ansps_ace_406 <- read_sf("data-raw/ansp_ace_406.geojson") |>
  sf::st_make_valid()
ansps_ace_406 |>
  sf::st_write("data-raw/ansp_ace_406_new.geojson", delete_dsn=TRUE)
fs::file_move("data-raw/ansp_ace_406_new.geojson", "inst/extdata/ir-406.geojson")
usethis::use_data(
  ansps_ace_406,
  compress = "bzip2",
  overwrite = TRUE)

system('export_ace_ansp_geojson.R  -o ansp_ace_481.geojson 481')
ansps_ace_481 <- read_sf("data-raw/ansp_ace_481.geojson") |>
  sf::st_make_valid()
ansps_ace_481 |>
  sf::st_write("data-raw/ansp_ace_481_new.geojson", delete_dsn=TRUE)
fs::file_move("data-raw/ansp_ace_481_new.geojson", "inst/extdata/ir-481.geojson")
usethis::use_data(
  ansps_ace_481,
  compress = "bzip2",
  overwrite = TRUE)
