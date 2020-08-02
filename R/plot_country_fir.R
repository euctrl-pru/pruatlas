#' Plot country and relevant FIR.
#'
#' @param icao_id the ICAO code for the country, "LI" for Italy.
#' @param name    The name used to title the plot.
#' @param fl      Flight level at which to plot the map
#' @param buffer  Buffer around FIR (km)
#' @param firs    FIRs to be used (sf object)
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
#' dplyr::filter(icao == "EG", min_fl <= 0, 0 <= max_fl) %>%
#'   dplyr::filter(!(id %in% c("EGGXFIR", "EGGX")))
#' plot_country_fir("EG", "United Kingdom (continental)", firs = uk_continental)
#' }
plot_country_fir <- function(icao_id,
                             name,
                             fl = 0,
                             buffer = 100,
                             firs = pruatlas::firs_nm_406) {

  # TODO: avoid hardcoding the colours
  colour_fir        <- "blue"
  colour_fir_border <- "red"
  buffer_m          <- buffer * 1e3 # 100 km

  p        <- pruatlas::pru_laea_proj
  fir_ctry <- country_fir(firs, icao_id = icao_id)

  utm <- suppressWarnings(sf::st_centroid(fir_ctry)) %>%
    sf::st_coordinates() %>%
    lonlat2UTM()
  # get buffered bounding box (pick right UTM)
  bbox <- fir_ctry %>%
    sf::st_transform(crs = utm) %>%
    sf::st_buffer(buffer_m) %>%
    sf::st_transform(crs = sf::st_crs(fir_ctry)) %>%
    sf::st_bbox()

  base_map() +
    ggplot2::geom_sf(data = fir_ctry, fill = colour_fir, alpha = 0.15, colour = colour_fir_border) +
    ggplot2::coord_sf(crs = p, xlim = bbox[c(1, 3)], ylim = bbox[c(2, 4)]) +
    ggplot2::ggtitle(
      label = stringr::str_c("Country FIR for", name, sep = " "),
      subtitle = paste0("at altitude FL", formatC(as.integer(fl), width = 3, flag = "0"))
    ) +
    theme_map()
}
