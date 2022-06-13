#' Return the polygon represent the spherical Earth.
#'
#' @param crs a `proj` projection string
#'
#' @return A Simple Feature representing the spherical contour of the Earch in the relevant projection.
#' @export
sphere <- function(crs = pruatlas::pru_laea_proj) {
  sf::st_graticule(ndiscr = 10000, margin = 10e-6) %>%
  sf::st_transform(crs = sf::st_crs(crs)) %>%
  sf::st_convex_hull() %>%
  sf::st_union() %>%
  sf::st_sf(geometry = ., name = 'sphere')
}
