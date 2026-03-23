# Return the extent of a set of FIRs.

Return the extent of a set of FIRs.

## Usage

``` r
extent_fir(firs, crs)
```

## Arguments

- firs:

  the relevant NM FIRs.

- crs:

  the `proj` projection string.

## Value

A data frame of the extent of the input data.

## Examples

``` r
if (FALSE) { # \dontrun{
crs <- sf::st_crs(3035)
extent_fir(firs_nm_406, crs)
} # }
```
