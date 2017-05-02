#' Provide base country layer for PRU maps.
#'
#' @return a ggplot2 object with world countries in LAEA projection.
#' @export
#'
#' @examples
#' # Plot a world map in LAEA projection.
#' bm <- base_map()
base_map <- function() {
  colour_sea <- "#D8F4FF"
  colour_land <- "grey89"
  colour_border <- "#A9A9A9"
  colour_graticule <- "#D3D3D3"
  colour_fir <- "blue"
  colour_fir_border <- "red"
  colour_backgroud <- "#f5f5f2"

  graticule <- sf::st_graticule(crs = pru_laea_proj)

  ggplot2::ggplot() +
    ggplot2::geom_sf(data = sphere_laea, fill = colour_sea) +
    ggplot2::geom_sf(data = ctrys50m, fill = colour_land) +
    ggplot2::geom_sf(data = graticule, colour = colour_graticule) +
    theme_map()
}
