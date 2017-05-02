#' Lambert Azimuthal Equal-Area projection for PRU maps.
#'
#' The following PROJ.4 string is used: \code{+proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +datum=WGS84 +units=m +no_defs}
#'
#' In a ggplot2+sf context, you can just use variable name as the value for the \code{proj}
#' parameter to \code{ggalt::coord_proj()}. i.e. \code{coord_proj(us_laea_proj)}.
#'
#' @export
#' @examples
#' ctrys <- ctrys50m
pru_laea_proj <- "+proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +datum=WGS84 +units=m +no_defs"
