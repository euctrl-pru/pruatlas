# Plot country and relevant FIR.

Plot country and relevant FIR.

## Usage

``` r
plot_country_fir(
  icao_id,
  name,
  fl = 0,
  buffer = 100,
  firs = pruatlas::firs_nm_406,
  merge = TRUE
)
```

## Arguments

- icao_id:

  optional, the ICAO ID of the relevant country, "LI" otherwise. It can
  be a regular expression, i.e. "LI\|LF" for matching France and Italy.

- name:

  The name used to title the plot.

- fl:

  flight level at which assemble the composing polygons.

- buffer:

  Buffer around FIR (km)

- firs:

  the relevant NM FIRs.

- merge:

  Do you want to merge (default: TRUE)

## Value

A ggplot object with country and relevant FIR.

## Examples

``` r
if (FALSE) { # \dontrun{
plot_country_fir("LI", "Italy")
# UK and Portugal have oceanic part...
plot_country_fir("EG", "United Kingdom (oceanic)")
# decoupling oceanic, manually
uk_continental <- firs_nm_406 %>%
  dplyr::filter(icao == "EG", min_fl <= 0, 0 <= max_fl) %>%
  dplyr::filter(!(id %in% c("EGGXFIR", "EGGX")))
plot_country_fir("EG", "United Kingdom (continental)", firs = uk_continental)
# EUROCONTROL
plot_country_fir(icao_id = "E.|L.|UD|UG|GM|UK|GC",
                 "EUROCONTROL Member States",
                 buffer = 350,
                 fl = 200)
} # }
```
