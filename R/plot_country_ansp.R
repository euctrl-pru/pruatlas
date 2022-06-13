#' Plot country and relevant ANSP.
#'
#' @inheritParams country_ansp
#' @param name    The name used to title the plot.
#' @param buffer  Buffer around ANSP (km)
#'
#' @return A ggplot object with country and relevant ANSP.
#' @export
#'
#' @examples
#' \dontrun{
#' plot_country_ansp("DFS", "Germany")
#' # Italy'ENAV has a hole above Rome...
#' plot_country_ansp("ENAV", "Italy (hole over Rome)")
#' # ...filling the hole, manually
#' enav <- pruatlas::ansps_ace_406 %>%
#'   country_ansp(ansp_id = "ENAV", fl = 355) %>%
#'   dplyr::mutate(min_fl = 355, max_fl = 355, id = "ENAV") %>%
#'   smoothr::fill_holes(units::set_units(10000, km^2))
#' plot_country_ansp(ansp_id = "ENAV", name = "Italy", fl = 355, ansps = enav)
#' }
plot_country_ansp <- function(ansp_id,
                             name,
                             fl = 300,
                             buffer = 100,
                             ansps = pruatlas::ansps_ace_406) {

  # TODO: avoid hardcoding the colours
  colour_fir        <- "blue"
  colour_fir_border <- "red"
  buffer_m          <- buffer * 1e3 # 100 km

  ansp_ctry <- country_ansp(ansps, ansp_id = ansp_id, fl = fl) %>%
    sf::st_transform(crs = sf::st_crs(3035))

  # get buffered bounding box (pick right UTM)
  bbox <- ansp_ctry %>%
    sf::st_convex_hull() %>%
    sf::st_buffer(buffer_m) %>%
    sf::st_bbox()

  base_map() +
    ggplot2::geom_sf(data = ansp_ctry, fill = colour_fir, alpha = 0.15, colour = colour_fir_border) +
    ggplot2::coord_sf(xlim = bbox[c(1, 3)], ylim = bbox[c(2, 4)]) +
    ggplot2::ggtitle(
      label = stringr::str_c("Country ANSP for", name, sep = " "),
      subtitle = paste0("at altitude FL", formatC(as.integer(fl), width = 3, flag = "0"))
    ) +
    theme_map()
}
