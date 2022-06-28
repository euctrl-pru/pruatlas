library(tidyverse)
library(sf)
library(pruatlas)
library(glue)
library(here)
library(smoothr)

fl_u <- 300
fl_l <- 200

airac <- 400

# FIRST export using export_ace_ansp_geojson.R
ansps <- read_sf(here("data-raw", glue("ansp_ace_{airac}.geojson")))

# upper airspace
ansps_u <- ansps %>%
  dplyr::filter(.$min_fl <= fl_u & fl_u <= .$max_fl, str_detect(name, "Oceanic", negate = TRUE)) %>%
  dplyr::filter(code != "NAVEP_SM")

enav_u <- ansps_u %>%
  filter(code == "ENAV") %>%
  smoothr::fill_holes(units::set_units(10000, km^2))

ansps_u <- ansps_u %>%
  filter(code != "ENAV") %>%
  bind_rows(enav_u)


# lower airspace
ansps_l <- ansps %>%
  dplyr::filter(.$min_fl <= fl_l & fl_l <= .$max_fl, str_detect(name, "Oceanic", negate = TRUE)) %>%
  dplyr::filter(code != "NAVEP_SM")

enav_l <- ansps_l %>%
  filter(code == "ENAV") %>%
  smoothr::fill_holes(units::set_units(10000, km^2))

ansps_l <- ansps_l %>%
  filter(code != "ENAV") %>%
  bind_rows(enav_l)



plot_country_ansp("DFS", "DFS, Germany", fl = fl_u, ansps = ansps_u)
plot_country_ansp("MUAC", "MUAC, EUROCONTROL", fl = fl_u, ansps = ansps_u)
plot_country_ansp("ENAV", "ENAV, Italy", fl = fl_u, ansps = ansps_u)
plot_country_ansp("BHANSA", "BHANSA, xxx", fl = fl_u, ansps = ansps_u)

plot_country_ansp("LVNL", "LVNL, The Netherlands", fl = fl_l, ansps = ansps_l)
plot_country_ansp("BELGOCONTROL", "skeyes, Belgium", fl = fl_l, ansps = ansps_l)
plot_country_ansp("DFS", "DFS, Germany", fl = fl_l, ansps = ansps_l)
plot_country_ansp("ENAV", "ENAV, Italy", fl = fl_l, ansps = ansps_l)
plot_country_ansp("AENA", "ENAIRE, Spain", fl = fl_l, ansps = ansps_l)


# export as GEOJSON
ansps_u %>%
  st_write(glue("ansp_upper_{airac}.geojson"))
ansps_l %>%
  st_write(glue("ansp_lower_{airac}.geojson"))

# reload mapshaper -clean file
ansps_l <- read_sf("C:/Users/spi/Downloads/ansp_lower_490.json")
country_ansp("DHMI", ansps = ansps_l, fl = fl_l)
plot_country_ansp("DHMI", "DHMI, Turkey", fl = fl_l, ansps = ansps_l)
