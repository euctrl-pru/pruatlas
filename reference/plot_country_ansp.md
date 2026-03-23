# Plot country and relevant ANSP.

Plot country and relevant ANSP.

## Usage

``` r
plot_country_ansp(
  ansp_id,
  name,
  fl = 300,
  buffer = 100,
  ansps = pruatlas::ansps_ace_406
)
```

## Arguments

- ansp_id:

  optional, the ANSP ID of the relevant country, "ENAV" otherwise. It
  can be a regular expression, i.e. "DFS\|ENAV" for matching Germany and
  Italy.

- name:

  The name used to title the plot.

- fl:

  the flight level of interest

- buffer:

  Buffer around ANSP (km)

- ansps:

  the `sf` holding the ANSP polygons, i.e.
  [`pruatlas::ansps_ace_406`](https://pruatlas.ansperformance.eu/reference/ansps_ace_406.md)

## Value

A ggplot object with country and relevant ANSP.

## Examples

``` r
if (FALSE) { # \dontrun{
plot_country_ansp("DFS", "Germany")
# Italy'ENAV has a hole above Rome...
plot_country_ansp("ENAV", "Italy (hole over Rome)")
# ...filling the hole, manually
enav <- pruatlas::ansps_ace_406 %>%
  country_ansp(ansp_id = "ENAV", fl = 355) %>%
  dplyr::mutate(min_fl = 355, max_fl = 355, id = "ENAV") %>%
  smoothr::fill_holes(units::set_units(10000, km^2))
plot_country_ansp(ansp_id = "ENAV", name = "Italy", fl = 355, ansps = enav)
} # }
```
