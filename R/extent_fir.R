#' Return the extent of a set of FIRs.
#'
#' @importFrom magrittr %>%
#' @param firs the relevant NM FIRs.
#' @param crs the `proj` projection string.
#' @export
#' @return A data frame of the extent of the input data.
#' @examples
#' \dontrun{
#' crs <- sf::st_crs(3035)
#' extent_fir(firs_nm_406, crs)
#' }
extent_fir <- function(firs, crs) {
  extent <- firs %>%
    sf::st_transform(crs = sf::st_crs(crs)) %>%
    sf::st_bbox()
  extent_x <- c(extent["xmin"], extent["xmax"])
  extent_y <- c(extent["ymin"], extent["ymax"])
  tibble::tibble(extent_x, extent_y)
}
