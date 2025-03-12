# calculate sphere in LAEA
library(sf)
library(magrittr)

system('export_ace_ansp_geojson.R  -o ansp_ace_406.geojson 406')
ansps_ace_406 <- read_sf("data-raw/ansp_ace_406.geojson") |>
  sf::st_make_valid()
ansps_ace_406 |>
  sf::st_write("data-raw/ansp_ace_406.geojson", delete_dsn=TRUE)
fs::file_move("data-raw/ansp_ace_406.geojson", "inst/extdata/ansp-ace-406.geojson")
usethis::use_data(
  ansps_ace_406,
  compress = "bzip2",
  overwrite = TRUE)

system('export_ace_ansp_geojson.R  -o ansp_ace_481.geojson 481')
ansps_ace_481 <- read_sf("data-raw/ansp_ace_481.geojson") |>
  sf::st_make_valid()
ansps_ace_481 |>
  sf::st_write("data-raw/ansp_ace_481.geojson", delete_dsn=TRUE)
fs::file_move("data-raw/ansp_ace_481.geojson", "inst/extdata/ansp-ace-481.geojson")
usethis::use_data(
  ansps_ace_481,
  compress = "bzip2",
  overwrite = TRUE)

system('export_ace_ansp_geojson.R  -o ansp_ace_524.geojson 524')
ansps_ace_524 <- read_sf("data-raw/ansp_ace_524.geojson") |>
  sf::st_make_valid()
ansps_ace_524 |>
  sf::st_write("data-raw/ansp_ace_524.geojson", delete_dsn=TRUE)
fs::file_move("data-raw/ansp_ace_524.geojson", "inst/extdata/ansp-ace-524.geojson")
usethis::use_data(
  ansps_ace_524,
  compress = "bzip2",
  overwrite = TRUE)
