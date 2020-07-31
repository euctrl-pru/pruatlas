#' Return the country FIR for a EUROCONTROL's Member State.
#'
#' @importFrom magrittr %>%
#' @param firs   the relevant NM FIRs.
#' @param icaoid optional, the ICAO ID of the relevant country, "LI" otherwise.
#' @param fl     flight level at which assemble the composing polygons.
#'
#' @export
#' @return An Simple Feature for the relevant country FIR.
#' @examples
#' \dontrun{
#' country_fir(pruatlas::firs_nm_406, "LF")
#' }
country_fir <- function(firs, icaoid = "LI", fl = 0) {
  firs %>%
    dplyr::filter(.$icao == icaoid & .$minfl <= fl & fl <= .$maxfl) %>%
    sf::st_as_sf() %>%
    sf::st_union() %>%
    sf::st_sf(geometry = ., firid = stringr::str_c(icaoid, "FIR"))
}
