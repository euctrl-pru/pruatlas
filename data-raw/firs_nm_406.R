# calculate sphere in LAEA
library(sf)
library(magrittr)

firs_nm_406 <- read_sf("data-raw/ir-406.geojson")
usethis::use_data(
  firs_nm_406,
  compress = "bzip2",
  overwrite = TRUE)
