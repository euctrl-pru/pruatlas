# EUROCONTROL Maps

``` r
library(pruatlas)
library(dplyr)
library(sf)
library(ggplot2)
library(stringr)
library(readr)
library(purrr)
```

## Single Country

### FIR

Let’s plot Italian FIR at FL300

``` r
plot_country_fir("LI", "Italy", fl = 300)
```

![A map of Italy's Country FIR at flight level
300](eurocontrol-maps_files/figure-html/italy-1.png)

For UK, things are more complicated because it has also an Oceanic bit
of volume

``` r
plot_country_fir("EG", "UK (oceanic)", fl = 200)
```

![A map of UK's Country FIR, including oceanic part, at flight level
200](eurocontrol-maps_files/figure-html/uk-1.png)

So to plot the *continental* part only we need to split things:

``` r
uk_continental <- firs_nm_406 %>%
  dplyr::filter(icao == "EG", min_fl <= 0, 0 <= max_fl) %>%
  dplyr::filter(!(code %in% c("EGGXFIR", "EGGX")))
plot_country_fir(
  "EG",
  "UK (continental)",
  firs = uk_continental,
  fl = 200)
```

![A map of UK's Country FIR, excluding the oceanic part, at flight level
200](eurocontrol-maps_files/figure-html/uk-continental-1.png)

### Aiport location in FIR

``` r
# some airports
apts <- tibble::tribble(
   ~ICAO_CODE, ~IATA_CODE,               ~LON,    ~LAT,           ~NAME,
       "EDDF",      "FRA",   8.5706, 50.0333,               "Frankfurt",
       "EHAM",      "AMS",   4.7642, 52.3080,               "Amsterdam",
       "LFPG",      "CDG",   2.5478, 49.0097, "Paris/Charles-De-Gaulle",
       "EGLL",      "LHR", -0.46139, 51.4775,         "London/Heathrow"
   )

# transform to sf
apts_sf <- apts %>%
   st_as_sf(coords = c("LON", "LAT"), crs = 4326)

# keep only EGLL
apt <- apts_sf %>%
      filter(ICAO_CODE == "EGLL")


# single country (FIR)
uk_continental <- firs_nm_406 %>%
   dplyr::filter(icao == "EG", min_fl <= 0, 0 <= max_fl) %>%
   dplyr::filter(!(id %in% c("EGGXFIR", "EGGX")))

bbox <- uk_continental %>%
   st_transform(crs = sf::st_crs(3035)) %>%
   st_bbox()

plot_country_fir(
  "EG",
  "UK (continental)",
  firs = uk_continental,
  fl = 200) +
  ggplot2::geom_sf(
    data = apt,
    shape = 10,
    linewidth = 3) +
  ggplot2::geom_sf_text(
    data = apt,
    aes(label = ICAO_CODE),
    vjust = -0.5) +
  # (re-)zoom to the correct bounding box
  ggplot2::coord_sf(xlim = bbox[c(1, 3)], ylim = bbox[c(2, 4)]) +
  # (re-)define the title and subtitle (`plot_country_fir()` adds its own)
  ggtitle(label = str_glue("{name} ({icao})", name = apt$NAME, icao = apt$ICAO_CODE),
          subtitle = "United Kingdom FIR (continental) at FL200")
```

![A map of UK's Country FIR, including oceanic part, at flight level 200
with the location of EGLL airport
(Heathrow)](eurocontrol-maps_files/figure-html/country-airport-1.png)

## EUROCONTROL

### Merged Member States FIRs

For plotting EUROCONTROL Member States’ FIR area we can select and merge
the various airspaces:

``` r
plot_country_fir(icao_id = "BI|E.|L.|UD|UG|GM|UK|GC",
                 "EUROCONTROL",
                 buffer = 350,
                 fl = 200)
```

![A map of all EUROCONTROL Member States' merged FIRs at flight level
200](eurocontrol-maps_files/figure-html/eurocontrol-1.png)

### All Member States FIRs

``` r
ms_codes <- member_states %>% 
  # filter out Germany (military, no specific FIR),
  #   Luxembourg (managed by Belgium) and Monaco (managed by France)
  filter(!icao %in% c("ET", "EL", "LN")) %>% 
  distinct(icao) %>%
  pull(icao)


ms_firs <- ms_codes %>% 
  purrr::map_dfr(~ suppressMessages(
    country_fir(pruatlas::firs_nm_406, icao_id = .x))) %>% 
  mutate(id = str_sub(id, 1, 2)) %>%
  left_join(member_states %>%
              filter(!icao %in% c("ET", "EL", "LN")) %>%
              distinct(icao, .keep_all = TRUE),
            by = c("id" = "icao")) %>% 
  mutate(
    name = case_when(
      id == "EB" ~ "Belgium and Luxemburg",
      id == "LF" ~ "France and Monaco",
      id == "LY" ~ "Serbia and Montenegro",
      id == "EG" ~ "United Kingdom",
      TRUE       ~ name),
    icao = id,
    min_fl = 200,
    max_fl = 200)

plot_country_fir(firs = ms_firs,
                 icao_id = ms_codes,
                 fl = 200,
                 name = "EUROCONTROL",
                 merge = FALSE)
```

![A map of all EUROCONTROL Member States' FIRs at flight level
200](eurocontrol-maps_files/figure-html/member-states-1.png)

### CRCO Charging Zones

You can get the CRCO charging zones boundaries from [EUROCONTROL web
site](https://www.eurocontrol.int/publication/route-state-overflown-rso-distance-tool-area-boundary-model).
This package stores a real file as an example.

``` r
bo <- system.file("extdata", "sbm_bz_20200527.txt", package = "pruatlas")
crco <- readr::read_lines(bo) %>%
  parse_airspace_crco() %>% 
  mutate(icao = unit)
codes <- crco %>% pull(icao) %>% unique()

plot_country_fir(firs = crco,
                 fl = 200,
                 icao_id = codes,
                 name = "CRCO charging zones",
                 merge = FALSE)
```

![A map of all EUROCONTROL Member States' CRCO charging zones at flight
level 200](eurocontrol-maps_files/figure-html/crco-1.png)

## STATFOR Areas

### ECAC Oceanic

``` r
ecac_oceanic() %>% 
  plot_country_fir(icao_id = "ECOC",
                   name = "ECAC Oceanic",
                   firs = .)
```

![A map of STATFOR's ECAC Oceaning
area](eurocontrol-maps_files/figure-html/ecac-oc-1.png)

### ECAC North West

``` r
ecac_northwest() %>% 
  plot_country_fir(icao_id = "ECNW",
                   name = "ECAC North West",
                   firs = .)
```

![A map of STATFOR's ECAC North West
area](eurocontrol-maps_files/figure-html/ecac-nw-1.png)

### ECAC South West

``` r
ecac_southwest() %>% 
  plot_country_fir(icao_id = "ECSW",
                   name = "ECAC South West",
                   firs = .)
```

![A map of STATFOR's ECAC South West
area](eurocontrol-maps_files/figure-html/ecac-sw-1.png)

### ECAC North East

``` r
ecac_northeast() %>% 
  plot_country_fir(icao_id = "ECNE",
                   name = "ECAC North East",
                   firs = .)
```

![A map of STATFOR's ECAC North East
area](eurocontrol-maps_files/figure-html/ecac-ne-1.png)

### ECAC South East

``` r
ecac_southeast() %>% 
  plot_country_fir(icao_id = "ECSE",
                   name = "ECAC South East",
                   firs = .)
```

![A map of STATFOR's ECAC South East
area](eurocontrol-maps_files/figure-html/ecac-se-1.png)

### Complete ECAC

``` r
ecac_region() %>% 
  plot_country_fir(icao_id = "ECAC",
                   name = "ECAC",
                   firs = .)
```

![A map of STATFOR's whole ECAC
area](eurocontrol-maps_files/figure-html/ecac-whole-1.png)

### North Atlantic

`st_segmentize` improved things but THIS IS still BAD!

``` r
firs <- system.file("extdata", "icao_firs.geojson", package = "pruatlas") %>% 
  read_sf() %>% 
  rename(icao = icao_code)
north_atlantic() %>% 
  sf::st_segmentize(dfMaxLength = units::set_units(50, km)) %>% 
  plot_country_fir(icao_id = "NOAT",
                   name = "STATFOR North Atlantic",
                   firs = .)
```

![A map of STATFOR's North Atlantic
area](eurocontrol-maps_files/figure-html/north-atlantic-1.png)
