#' Parse CRCO Airspace Charging Zone format
#'
#' @description
#'
#' `parse_airspace_crco` reads the airspace CRCO format and returns a tibble
#' where each row describes an airspace.
#' The airspace file can be found on \href{https://www.eurocontrol.int/publication/route-state-overflown-rso-distance-tool-area-boundary-model}{EUROCONTROL website}.
#'
#' Each airspace in CRCO format is described by:
#' \enumerate{
#'   \item Airspace description (one row):
#'     \itemize{
#'       \item `nb_point` the number of points
#'       \item `latitude` the latitude (of the label)
#'       \item `longitude` the longitude (of the label)
#'       \item `flights`
#'       \item `bottom_level` low level of the volume (flight level)
#'       \item `top_level` high level of the volume (flight level)
#'       \item `surface`
#'       \item `sector_num`
#'       \item `flight time`
#'       \item `traffic density`
#'       \item `x mileage`
#'       \item `rte extens.`
#'       \item `value 1`
#'       \item `value 2`
#'       \item `name` airspace name/code
#'     }
#'   \item `latitude` `longitude`: coordinates (`nb_point` rows in minutes decimal)
#' }
#'
#' @param lines text lines of the PRISME airspace representation
#'
#' @return a tibble of airspaces (CRS = 4326)
#'
#' @family read/export
#' @export
#'
#' @examples
#' \dontrun{
#' bo <- system.file("extdata", "sbm_bz_20200527.txt", package = "pruatlas")
#' crco <- readr::read_lines(bo) %>%
#'   parse_airspace_crco()
#' }
parse_airspace_crco <- function(lines) {
  airspace <- list()
  i <- 1
  pts <- NULL

  for (l in lines) {
    if (is.null(pts)) {
      # parse the airspace header
      h <- stringr::str_split(l, " ") %>% `[[`(1)
      name <- h[15] # airspace name
      min_fl <- h[5] %>% as.integer() # min FL
      max_fl <- h[6] %>% as.integer() # Max FL
      lon <- (h[3] %>% as.double()) / 60.0
      lat <- (h[2] %>% as.double()) / 60.0
      n <- h[1] %>% as.integer() # number of vertices
      len <- n
      pts <- character(n)
    } else {
      if (n > 0) {
        pts[len - n + 1] <-  l
        n <- n - 1
        if (n == 0) {
          pol <- pts %>%
            stringi::stri_split(fixed = " ", simplify = TRUE) %>%
            apply(2, as.double) %>%
            magrittr::divide_by(60.0) %>%
            {list(.)} %>%
            as.data.frame() %>%
            sf::st_as_sf(coords = c("X2", "X1"), crs = 4326) %>%
            dplyr::summarise(unit = name,
                             min_fl = min_fl, max_fl = max_fl,
                             lon = lon, lat = lat,
                             geometry = sf::st_combine(.$geometry)) %>%
            sf::st_cast("POLYGON")

          airspace[[i]] <- pol
          i <- i + 1
          pts <- NULL
        }
      }
    }
  }
  # sf::st_as_sf(data.table::rbindlist(airspace))
  sf::st_as_sf(dplyr::bind_rows(airspace))
}
