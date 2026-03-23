# Extract ANSP polygon at defined flight level

Extract ANSP polygon at defined flight level

## Usage

``` r
country_ansp(ansps, ansp_id = "ENAV", fl = 300)
```

## Arguments

- ansps:

  the `sf` holding the ANSP polygons, i.e.
  [`pruatlas::ansps_ace_406`](https://pruatlas.ansperformance.eu/reference/ansps_ace_406.md)

- ansp_id:

  optional, the ANSP ID of the relevant country, "ENAV" otherwise. It
  can be a regular expression, i.e. "DFS\|ENAV" for matching Germany and
  Italy.

- fl:

  the flight level of interest

## Value

a polygon for the ANSP(s)

## Examples

``` r
if (FALSE) { # \dontrun{
country_ansp(ansps_ace_406, "DFS", fl = 350)

# more complicated for Italy/ENAV: there is a hole over Rome.
# if we want to get rid of it we can use smoothr::fill_holes()
enav <- pruatlas::ansps_ace_406 %>%
  country_ansp(ansp_id = "ENAV", fl = 355) %>%
  smoothr::fill_holes(units::set_units(10000, km^2))
} # }
```
