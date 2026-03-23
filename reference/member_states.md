# EUROCONTROL's Member States

A data frame with the following fields

- name:

  the country name, e.g. "Italy"

- iso3c:

  the 3-letter ISO code, e.g. "ITA"

- iso2c:

  the 2-letter ISO code, e.g. "IT"

- icao:

  the 2-letter ICAO code, e.g. "LI"

- iso3n:

  the 3-digits ISO code, e.g. "380"

- date:

  the date of `status` code, e.g. 1996-04-01

- status:

  the status code, e.g. "M" (`M` Member State, `C` Comprehensive
  Agreement State, `T` Transitional State)

These are useful to grab the right spatial polygons in case of need.
Note: Kosovo is also included in the list.

## Usage

``` r
member_states
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 45
rows and 7 columns.
