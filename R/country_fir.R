#' Return the country FIR for a EUROCONTROL's Member State.
#'
#' @importFrom magrittr %>%
#' @param firs    the relevant NM FIRs.
#' @param icao_id optional, the ICAO ID of the relevant country, "LI" otherwise.
#'                It can be a regular expression, i.e. "LI|LF" for matching France and Italy.
#' @param fl      flight level at which assemble the composing polygons.
#'
#' @export
#' @return An Simple Feature for the relevant country FIR.
#' @examples
#' \dontrun{
#' # France
#' country_fir(pruatlas::firs_nm_406, "LF")
#' # EUROCONTROL's Member States
#' country_fir(pruatlas::fir_nm_406, icao_id = "E.|L.|UD|UG|GM|UK|GC")
#' }
country_fir <- function(firs, icao_id = "LI", fl = 0) {
  firs %>%
    dplyr::filter(stringr::str_detect(.$icao, icao_id) & .$min_fl <= fl & fl <= .$max_fl) %>%
    sf::st_as_sf() %>%
    sf::st_union() %>%
    sf::st_sf(geometry = ., id = stringr::str_c(icao_id, "FIR"))
}
