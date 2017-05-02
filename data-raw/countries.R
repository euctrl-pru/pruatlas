## prepare exported data: countries from Natural Earth (sf)
library(rnaturalearth)
library(dplyr)
library(sf)

ctrys50m <- ne_countries(scale = 50, type = "countries", returnclass = "sf") %>%
  select(iso_a3, iso_n3, admin)

devtools::use_data(ctrys50m, overwrite = TRUE)
