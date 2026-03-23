# Provide base country layer for PRU maps.

Provide base country layer for PRU maps.

## Usage

``` r
base_map(
  colour_sea = "#D8F4FF",
  colour_land = "grey89",
  colour_border = "#A9A9A9",
  colour_graticule = "#D3D3D3",
  colour_backgroud = "#f5f5f2",
  border_size = 0.2
)
```

## Arguments

- colour_sea:

  colour of the sea

- colour_land:

  colour of the land

- colour_border:

  colour of the country border

- colour_graticule:

  colour of the graticule

- colour_backgroud:

  background colour

- border_size:

  thickness of the border line

## Value

a ggplot2 object with world countries in LAEA projection.

## Examples

``` r
if (FALSE) { # \dontrun{
library(pruatlas)
# Plot a world map in LAEA projection.
bm <- base_map()
} # }
```
