# calculate sphere in LAEA
library(sf)
library(magrittr)

ansps_ace_406 <- read_sf("data-raw/ansp_ace_406.geojson")
usethis::use_data(
  ansps_ace_406,
  compress = "bzip2",
  overwrite = TRUE)
