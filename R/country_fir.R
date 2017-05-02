#' Return the country FIR for a EUROCONTROL's Member State.
#'
#' @importFrom magrittr %>%
#' @param firs the relevant NM FIRs.
#' @param icaoid optional, the ICAO ID of the relevant country, "LI" otherwise.
#' @export
#' @return An Simple Feature for the relevant country FIR.
#' @examples
#' country_fir(firs_nm_406, "LF")
country_fir <- function(firs, icaoid = "LI") {
  firs %>%
    dplyr::filter(icao == icaoid & minfl == 0) %>%
    sf::st_as_sf() %>%
    sf::st_union() %>%
    sf::st_sf(geometry = ., firid = stringr::str_c(icaoid, "FIR"))
}
