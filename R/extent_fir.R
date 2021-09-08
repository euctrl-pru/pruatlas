#' Return the extent of a set of FIRs.
#'
#' @importFrom magrittr %>%
#' @param firs the relevant NM FIRs.
#' @param crs the `proj` projection string.
#' @export
#' @return A data frame of the extent of the input data.
#' @examples
#' crs <- st_crs("+proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +datum=WGS84 +units=m +no_defs")
#' extent_fir(firs_nm_406, crs)
extent_fir <- function(firs, crs) {
  extent <- firs %>%
    sf::st_transform(crs = st_crs(crs)) %>%
    sf::st_bbox()
  extent_x <- c(extent["xmin"], extent["xmax"])
  extent_y <- c(extent["ymin"], extent["ymax"])
  tibble::tibble(extent_x, extent_y)
}
