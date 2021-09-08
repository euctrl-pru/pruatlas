#' Provide base country layer for PRU maps.
#'
#' @param colour_sea colour of the sea
#' @param colour_land colour of the land
#' @param colour_border colour of the country border
#' @param colour_graticule colour of the graticule
#' @param colour_fir colour of the FIR
#' @param colour_fir_border colour of the FIR border
#' @param colour_backgroud background colour
#'
#' @return a ggplot2 object with world countries in LAEA projection.
#' @export
#'
#' @examples
#' \dontrun{
#' library(pruatlas)
#' # Plot a world map in LAEA projection.
#' bm <- base_map()
#' }
base_map <- function(
  colour_sea        = "#D8F4FF",
  colour_land       = "grey89",
  colour_border     = "#A9A9A9",
  colour_graticule  = "#D3D3D3",
  colour_fir        = "blue",
  colour_fir_border = "red",
  colour_backgroud  = "#f5f5f2"
) {

  graticule <- sf::st_graticule(crs = st_crs(3035))

  ggplot2::ggplot() +
    ggplot2::geom_sf(data = pruatlas::sphere_laea,  fill   = colour_sea) +
    ggplot2::geom_sf(data = pruatlas::countries50m,
                     fill   = colour_land,
                     colour = colour_border,
                     size = 0.2) +
    ggplot2::geom_sf(data = graticule,    colour = colour_graticule) +
    theme_map()
}
