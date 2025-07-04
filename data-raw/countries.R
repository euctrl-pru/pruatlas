## prepare exported data: countries from Natural Earth (sf)
library(rnaturalearth)
library(dplyr)
library(sf)

countries50m <- ne_countries(
  scale = 50,
  type = "countries",
  returnclass = "sf"
) %>%
  select(adm0_a3, iso_n3, admin) |>
  mutate(
    adm0_a3 = if_else(admin == "Kosovo", "XKX", adm0_a3),
    iso_n3 = if_else(admin == "Kosovo", "926", iso_n3)
  )

usethis::use_data(countries50m, overwrite = TRUE)
