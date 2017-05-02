# calculate sphere in LAEA
library(sf)
library(magrittr)

laea <- "+proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +datum=WGS84 +units=m +no_defs"

sphere_laea <- st_graticule(ndiscr = 10000, margin = 10e-6) %>%
  st_transform(crs = laea) %>%
  sf::st_convex_hull() %>%
  sf::st_union() %>%
  sf::st_sf(geometry = ., name = 'sphere')

devtools::use_data(sphere_laea,
                   compress = "bzip2", overwrite = TRUE)
