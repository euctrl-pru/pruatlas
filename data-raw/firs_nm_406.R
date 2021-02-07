library(sf)
library(magrittr)

# extract [FU]IR from PRISME
system('export_nm_fir_geojson.R 406')
fs::file_move("ir-406.geojson", "inst/extdata/")

firs_nm_406 <- read_sf("inst/extdata/ir-406.geojson")
usethis::use_data(
  firs_nm_406,
  compress = "bzip2",
  overwrite = TRUE)
