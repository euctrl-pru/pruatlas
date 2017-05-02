#' Default colours for PRU maps.
#'
#' @return The colours for the various elements of a map, i.e. see, land, fir, ...
#' @export
#'
colours <- function() {
  tibble::tribble(
    ~what, ~name,
    "colour_sea", "#D8F4FF",
    "colour_land", "grey89",
    "colour_border", "#A9A9A9",
    "colour_graticule", "#D3D3D3",
    "colour_fir", "blue",
    "colour_fir_border", "red",
    "colour_backgroud", "#f5f5f2"
  )
}
