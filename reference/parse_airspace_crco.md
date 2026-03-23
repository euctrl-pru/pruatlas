# Parse CRCO Airspace Charging Zone format

`parse_airspace_crco` reads the airspace CRCO format and returns a
tibble where each row describes an airspace. The airspace file can be
found on [EUROCONTROL
website](https://www.eurocontrol.int/publication/route-state-overflown-rso-distance-tool-area-boundary-model).

Each airspace in CRCO format is described by:

1.  Airspace description (one row):

    - `nb_point` the number of points

    - `latitude` the latitude (of the label)

    - `longitude` the longitude (of the label)

    - `flights`

    - `bottom_level` low level of the volume (flight level)

    - `top_level` high level of the volume (flight level)

    - `surface`

    - `sector_num`

    - `flight time`

    - `traffic density`

    - `x mileage`

    - `rte extens.`

    - `value 1`

    - `value 2`

    - `name` airspace name/code

2.  `latitude` `longitude`: coordinates (`nb_point` rows in minutes
    decimal)

## Usage

``` r
parse_airspace_crco(lines)
```

## Arguments

- lines:

  text lines of the PRISME airspace representation

## Value

a tibble of airspaces (CRS = 4326)

## Examples

``` r
if (FALSE) { # \dontrun{
bo <- system.file("extdata", "sbm_bz_20200527.txt", package = "pruatlas")
crco <- readr::read_lines(bo) %>%
  parse_airspace_crco()
} # }
```
