#' Extract ANSP polygon at defined flight level
#'
#' @param ansps   the \code{sf} holding the ANSP polygons, i.e.
#'                \code{pruatlas::ansps_ace_406}
#' @param ansp_id optional, the ANSP ID of the relevant country, "ENAV" otherwise.
#'                It can be a regular expression, i.e. "DFS|ENAV" for matching Germany and Italy.
#' @param fl      the flight level of interest
#'
#' @return a polygon for the ANSP(s)
#' @export
#'
#' @examples
#' \dontrun{
#' country_ansp(ansps_ace_406, "DFS", fl = 350)
#'
#' # more complicated for Italy/ENAV: there is a hole over Rome.
#' # if we want to get rid of it we can use smoothr::fill_holes()
#' enav <- pruatlas::ansps_ace_406 %>%
#'   country_ansp(ansp_id = "ENAV", fl = 355) %>%
#'   smoothr::fill_holes(units::set_units(10000, km^2))
#' }
country_ansp <- function(ansps, ansp_id = "ENAV", fl = 300) {
  ansps %>%
    dplyr::filter(stringr::str_detect(.$ace_code, ansp_id), .$min_fl <= fl & fl <= .$max_fl) %>%
    sf::st_as_sf() %>%
    sf::st_union() %>%
    sf::st_sf(geometry = ., id = stringr::str_c(ansp_id, "_ANSP"))
}
