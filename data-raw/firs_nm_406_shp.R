## prepare exported data: FIRs/UIRs from shapefiles

library(sf)
library(plyr)
library(dplyr)

zipfiles <- c(
  "firs_nm_406.zip"
)

l_ply(zipfiles, function(x) {
  file <- paste0("data-raw/", x)
  message("Unzipping ", x)
  unzip(file, exdir = "data-raw/firs")
})


# fs::dir_ls(path = "data-raw/firs/", glob = "*.shp") %>%
#   sf::st_read() %>%
#   st_zm() %>%
#   transmute(airacnm = AC_ID,
#             firid = AV_AIRSPAC,
#             icao = AV_ICAO_ST,
#             minfl = MIN_FLIGHT,
#             maxfl = MAX_FLIGHT,
#             firname = AV_NAME,
#             objid = OBJECTID,
#             SHAPE_LEN = SHAPE_LEN,
#             geometry)


shapefiles <- Sys.glob("data-raw/firs/*.shp")
shapefiles <- gsub(".shp", "", shapefiles)
shapefiles <- gsub("data-raw/firs/", "", shapefiles)

l_ply(shapefiles, function(x) {
  shp <- read_sf(here::here("data-raw", "firs", paste0(x, ".shp"))) %>%
    st_zm() %>%
    transmute(airacnm = AC_ID,
              firid = AV_AIRSPAC,
              icao = AV_ICAO_ST,
              minfl = MIN_FLIGHT,
              maxfl = MAX_FLIGHT,
              firname = AV_NAME,
              objid = OBJECTID,
              SHAPE_LEN = SHAPE_LEN,
              geometry)
  assign(x, shp, envir = globalenv())
})

usethis::use_data(
  firs_nm_406,
  compress = "bzip2",
  overwrite = TRUE)
