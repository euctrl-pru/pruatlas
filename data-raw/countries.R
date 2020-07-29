## prepare exported data: countries from Natural Earth (sf)
library(rnaturalearth)
library(dplyr)
library(sf)

countries50m <- ne_countries(scale = 50, type = "countries", returnclass = "sf") %>%
  select(iso_a3, iso_n3, admin)

usethis::use_data(countries50m, overwrite = TRUE)
