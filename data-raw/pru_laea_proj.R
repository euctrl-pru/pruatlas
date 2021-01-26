## prepare exported data: proj's projection string for PRU LAEA

# NOTE: deprecated, now we use EPSG:3035 directly
pru_laea_proj <- "+proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +datum=WGS84 +units=m +no_defs"
usethis::use_data(pru_laea_proj, overwrite = TRUE)
