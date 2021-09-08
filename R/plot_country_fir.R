#' Plot country and relevant FIR.
#'
#' @inheritParams country_fir
#' @param name    The name used to title the plot.
#' @param buffer  Buffer around FIR (km)
#' @param merge   Do you want to merge (default: TRUE)
#'
#' @return A ggplot object with country and relevant FIR.
#' @export
#'
#' @examples
#' \dontrun{
#' plot_country_fir("LI", "Italy")
#' # UK and Portugal have oceanic part...
#' plot_country_fir("EG", "United Kingdom (oceanic)")
#' # decoupling oceanic, manually
#' uk_continental <- firs_nm_406 %>%
#'   dplyr::filter(icao == "EG", min_fl <= 0, 0 <= max_fl) %>%
#'   dplyr::filter(!(id %in% c("EGGXFIR", "EGGX")))
#' plot_country_fir("EG", "United Kingdom (continental)", firs = uk_continental)
#' # EUROCONTROL
#' plot_country_fir(icao_id = "E.|L.|UD|UG|GM|UK|GC",
#'                  "EUROCONTROL Member States",
#'                  buffer = 350,
#'                  fl = 200)
#' }
plot_country_fir <- function(icao_id,
                             name,
                             fl = 0,
                             buffer = 100,
                             firs = pruatlas::firs_nm_406,
                             merge = TRUE) {

  # TODO: avoid hardcoding the colours
  colour_fir        <- "blue"
  colour_fir_border <- "red"
  buffer_m          <- buffer * 1e3 # 100 km

  fir_ctry <- country_fir(firs, icao_id = icao_id, fl = fl, merge = merge) %>%
    sf::st_transform(crs = st_crs(3035))

  bbox <- fir_ctry %>%
    sf::st_convex_hull() %>%
    sf::st_buffer(buffer_m) %>%
    sf::st_bbox()

  base_map() +
    ggplot2::geom_sf(data = fir_ctry, fill = colour_fir, alpha = 0.15, colour = colour_fir_border) +
    ggplot2::coord_sf(xlim = bbox[c(1, 3)], ylim = bbox[c(2, 4)]) +
    ggplot2::ggtitle(
      label = stringr::str_c("Country FIR for", name, sep = " "),
      subtitle = paste0("at altitude FL", formatC(as.integer(fl), width = 3, flag = "0"))
    ) +
    theme_map()
}
