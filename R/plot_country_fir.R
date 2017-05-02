#' Plot country and relevant FIR.
#'
#' @param icao the ICAO code for the country, "LI" for Italy.
#' @param name The name used to title the plot.
#'
#' @return A ggplot object with country and relevant FIR.
#' @export
#'
#' @examples
#' plot_country_fir("LI", "Italy")
plot_country_fir <- function(icao, name) {
  # TODO: avoid hardcoding the colours
  colour_fir <- "blue"
  colour_fir_border <- "red"

  fir_ctry <- country_fir(firs_nm_406, icaoid = icao)

  # TODO: projection as an input argument?
  p <- pru_laea_proj
  e_ctry <- extent_fir(fir_ctry, crs = p)

  base_map() +
    ggplot2::geom_sf(data = fir_ctry, fill = colour_fir, alpha = 0.15, colour = colour_fir_border) +
    ggplot2::coord_sf(crs = p, xlim = e_ctry$extent_x, ylim = e_ctry$extent_y) +
    ggplot2::ggtitle(label = stringr::str_c("Country FIR for", name, sep = " "),
            subtitle = "Merged FIR's (at FL000)")
}
