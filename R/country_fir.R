#' Return the country FIR for a EUROCONTROL's Member State.
#'
#' @importFrom magrittr %>%
#' @param firs    the relevant NM FIRs.
#' @param icao_id optional, the ICAO ID of the relevant country, "LI" otherwise.
#'                It can be a regular expression, i.e. "LI|LF" for matching France and Italy.
#' @param fl      flight level at which assemble the composing polygons.
#' @param merge   Do you want to merge? (Default: TRUE).
#' @param exclude List of IDs to filter out. It can be useful to use when only continental
#'                portion of FIR is of interest, i.e. exclude SANTA MARIA FIR for Portugal.
#'
#' @export
#' @return An Simple Feature for the relevant country FIR.
#' @examples
#' \dontrun{
#' # France
#' country_fir(pruatlas::firs_nm_406, "LF")
#' # EUROCONTROL's Member States
#' country_fir(pruatlas::firs_nm_406, icao_id = "E.|L.|UD|UG|GM|UK|GC")
#' # Consider only continental portion of Portugal FIR
#' country_fir(pruatlas::firs_nm_406, icao_id = "LP", exclude = c("LPPOFIR"))
#' }
country_fir <- function(firs, icao_id = "LI", fl = 0, merge = TRUE, exclude = NULL) {
  firs %>%
    dplyr::filter(stringr::str_detect(.$icao, icao_id) & .$min_fl <= fl & fl <= .$max_fl) %>%
    {
      if (!is.null(exclude)) {
        dplyr::filter(., !.$id %in% exclude)
      }
      else .
    } %>%
    sf::st_as_sf() %>%
    sf::st_make_valid() %>%
    {
      if (merge) {
        sf::st_union(.) %>%
          sf::st_sf(geometry = ., id = stringr::str_c(icao_id, "FIR"))
      }
      else .
    }
}
