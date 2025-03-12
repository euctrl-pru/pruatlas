library(sf)
library(magrittr)
library(fs)
library(here)
library(tidyverse)

# extract [FU]IR from PRISME
system('export_nm_fir_geojson.R 406')

firs_nm_406 <- read_sf(here("data-raw/", "ir-406.geojson"))

fs::file_delete(here("inst","extdata","ir-406.geojson"))
firs_nm_406 |>
  st_write(here("inst", "extdata", "ir-406.geojson"), append = FALSE)
usethis::use_data(
  firs_nm_406,
  compress = "bzip2",
  overwrite = TRUE)


# extract [FU]IR from PRISME
system('export_nm_fir_geojson.R 481')

firs_nm_481 <- read_sf(here("data-raw/", "ir-481.geojson"))

firs_nm_481 <- firs_nm_481 |>
  mutate(name = case_when(
    code == "BIRD" ~ "REYKJAVIK FIR",
    code == "BODO" ~ "BODO OCEANIC FIR",
    .default = name
  ))

fs::file_delete(here("inst","extdata","ir-481.geojson"))
firs_nm_481 |>
  st_write(here("inst","extdata","ir-481.geojson"), append = FALSE)

usethis::use_data(
  firs_nm_481,
  compress = "bzip2",
  overwrite = TRUE)



# extract [FU]IR from PRISME
system('export_nm_fir_geojson.R 524')

firs_nm_524 <- read_sf(here("data-raw", "ir-524.geojson"))

firs_nm_524 <- firs_nm_524 |>
  mutate(name = case_when(
    code == "BODO" ~ "BODO OCEANIC FIR",
    .default = name
  ))

fs::file_delete(here("inst","extdata","ir-524.geojson"))
firs_nm_524 |>
  st_write(here("inst","extdata","ir-524.geojson"), append = FALSE)

usethis::use_data(
  firs_nm_524,
  compress = "bzip2",
  overwrite = TRUE)
