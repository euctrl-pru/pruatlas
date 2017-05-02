#' PRU theme for maps.
#'
#' A clean theme for displaying maps.
#'
#' @importFrom ggplot2 %+replace%
#' @inheritParams ggplot2::theme_grey
#' @param ... other theme parameters
#' @export
theme_map <- function(base_size = 9, base_family = "", ...) {

  colour_sea <- "#D8F4FF"
  colour_land <- "grey89"
  colour_border <- "#A9A9A9"
  colour_graticule <- "#D3D3D3"
  colour_fir <- "blue"
  colour_fir_border <- "red"
  colour_backgroud <- "#f5f5f2"

  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      axis.line = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_blank(),
      panel.background = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_line(color = "#ebebe5", size = 0.2),
      panel.grid.major = ggplot2::element_line(color = "#ebebe5", size = 0.2),
      panel.border = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      panel.spacing = ggplot2::unit(0, "lines"),
      plot.background = ggplot2::element_blank(),
      legend.background = ggplot2::element_rect(fill = colour_backgroud, color = NA),
      legend.justification = c(0, 0),
      legend.position = c(0, 0),
      ...
    )
}
