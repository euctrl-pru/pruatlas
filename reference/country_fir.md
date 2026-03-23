# Return the country FIR for a EUROCONTROL's Member State.

Return the country FIR for a EUROCONTROL's Member State.

## Usage

``` r
country_fir(firs, icao_id = "LI", fl = 0, merge = TRUE, exclude = NULL)
```

## Arguments

- firs:

  the relevant NM FIRs.

- icao_id:

  optional, the ICAO ID of the relevant country, "LI" otherwise. It can
  be a regular expression, i.e. "LI\|LF" for matching France and Italy.

- fl:

  flight level at which assemble the composing polygons.

- merge:

  Do you want to merge? (Default: TRUE).

- exclude:

  List of IDs to filter out. It can be useful to use when only
  continental portion of FIR is of interest, i.e. exclude SANTA MARIA
  FIR for Portugal.

## Value

An Simple Feature for the relevant country FIR.

## Examples

``` r
if (FALSE) { # \dontrun{
# France
country_fir(pruatlas::firs_nm_406, "LF")
# EUROCONTROL's Member States
country_fir(pruatlas::firs_nm_406, icao_id = "E.|L.|UD|UG|GM|UK|GC")
# Consider only continental portion of Portugal FIR
country_fir(pruatlas::firs_nm_406, icao_id = "LP", exclude = c("LPPOFIR"))
} # }
```
