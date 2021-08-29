#' STATFOR ECAC Oceanic region
#'
#' @param firs the global FIRs
#'
#' @return the FIR-based STATFOR ECAC Oceanic region
#' @export
#'
#' @examples
#' \dontrun{
#' ecac_oceanic()
#' }
ecac_oceanic <- function(firs = pruatlas::firs_nm_406) {
  ecac_oc_codes <- c("BI", "EG", "EK", "EN", "LP")
  ecac_oc <- firs %>%
    dplyr::filter(.$icao %in% ecac_oc_codes,
                  .$min_fl <= 0, 0 <= .$max_fl) %>%
    # include oceanic: SHANWICK, BODO
    dplyr::filter((.$id %in% c("EGGXFIR", "ENOBFIR", "LPPOFIR") |
                     .$icao == "BI")) %>%
    sf::st_as_sf() %>%
    sf::st_make_valid() %>%
    sf::st_union() %>%
    sf::st_sf(geometry = .,
              id = "ECOC",
              name = "ECAC Oceanic",
              icao = "ECOC"
    ) %>%
    dplyr::mutate(min_fl = 0, max_fl = 999)

  ecac_oc
}

#' STATFOR ECAC North West region
#'
#' @param firs the global FIRs
#'
#' @return the FIR-based STATFOR ECAC North West region
#' @export
#'
#' @examples
#' \dontrun{
#' ecac_northwest()
#' }
ecac_northwest <- function(firs = pruatlas::firs_nm_406) {
  ecac_nw_codes <- c("EB", "ED", "EG", "EH", "EI", "EK",
                     # "EL", <-- covered by Belgium
                     "LF",
                     # "LN", <-- covered by France
                     "LO", "LS")

  ecac_nw <- firs %>%
    dplyr::filter(.$icao %in% ecac_nw_codes,
                  .$min_fl <= 0, 0 <= .$max_fl) %>%
    # exclude oceanic portion
    dplyr::filter(!(.$id %in% c("EGGXFIR", "EGGX"))) %>%
    sf::st_as_sf() %>%
    sf::st_make_valid() %>%
    sf::st_union() %>%
    sf::st_sf(geometry = .,
              id = "ECNW",
              name = "ECAC North West",
              icao = "ECNW"
    ) %>%
    dplyr::mutate(min_fl = 0, max_fl = 999)

  ecac_nw
}


#' STATFOR ECAC South West region
#'
#' @param firs the global FIRs
#'
#' @return the FIR-based STATFOR ECAC South West region
#' @export
#'
#' @examples
#' \dontrun{
#' ecac_southhwest()
#' }
ecac_southwest <- function(firs = pruatlas::firs_nm_406) {
  ecac_sw_codes <- c("GC",
                     # "GE", <-- no specific FIR for Ceuta & Melilla
                     "LE", "LP",
                     # "LX", <-- no specific FIR for Gilbratar
                     NULL)
  ecac_sw <- firs %>%
    dplyr::filter(.$icao %in% ecac_sw_codes,
                  .$min_fl <= 0, 0 <= .$max_fl) %>%
    # exclude oceanic portion (Santa Maria)
    dplyr::filter(!(.$id %in% c("LPPOFIR"))) %>%
    sf::st_as_sf() %>%
    sf::st_make_valid() %>%
    sf::st_union() %>%
    sf::st_sf(geometry = .,
              id = "ECSW",
              name = "ECAC South West",
              icao = "ECSW"
    ) %>%
    dplyr::mutate(min_fl = 0, max_fl = 999)

  ecac_sw
}


#' STATFOR ECAC North East region
#'
#' @param firs the global FIRs
#'
#' @return the FIR-based STATFOR ECAC North East region
#' @export
#'
#' @examples
#' \dontrun{
#' ecac_northeast()
#' }
ecac_northeast <- function(firs = pruatlas::firs_nm_406) {
  ecac_ne_codes <- c("EE", "EF", "EN", "EP", "ES", "EV", "EY",
                     "LK", "LZ", "UK")
  ecac_ne <- firs %>%
    dplyr::filter(.$icao %in% ecac_ne_codes,
                  .$min_fl <= 0, 0 <= .$max_fl) %>%
    # exclude oceanic BODO
    dplyr::filter(!(.$id %in% c("ENOBFIR"))) %>%
    sf::st_as_sf() %>%
    sf::st_make_valid() %>%
    sf::st_union() %>%
    sf::st_sf(geometry = .,
              id = "ECNE",
              name = "ECAC North East",
              icao = "ECNE"
    ) %>%
    dplyr::mutate(min_fl = 0, max_fl = 999)

  ecac_ne
}



#' STATFOR ECAC South East region
#'
#' @param firs the global FIRs
#'
#' @return the FIR-based STATFOR ECAC South East region
#' @export
#'
#' @examples
#' \dontrun{
#' ecac_southeast()
#' }
ecac_southeast <- function(firs = pruatlas::firs_nm_406) {
  ecac_se_codes <- c("LA", "LB", "LC", "LD", "LG", "LH", "LI",
               "LJ", "LM", "LQ", "LR", "LT", "LU", "LW",
               "LY", "UB", "UD", "UG")
  ecac_se <- firs %>%
    dplyr::filter(.$icao %in% ecac_se_codes,
                  .$min_fl <= 0, 0 <= .$max_fl) %>%
    sf::st_as_sf() %>%
    sf::st_make_valid() %>%
    sf::st_union() %>%
    sf::st_make_valid() %>%
    sf::st_sf(geometry = .,
              id = "ECSE",
              name = "ECAC South East",
              icao = "ECSE"
    ) %>%
    dplyr::mutate(min_fl = 0, max_fl = 999)

  ecac_se
}


#' STATFOR ECAC region
#'
#' @param firs the global FIRs
#'
#' @return the FIR-based STATFOR ECAC region
#' @export
#'
#' @examples
#' \dontrun{
#' ecac_region()
#' }
ecac_region <- function(firs = pruatlas::firs_nm_406) {
  ecac <- list(ecac_oceanic(firs),
               ecac_northwest(firs),
               ecac_southwest(firs),
               ecac_southeast(firs),
               ecac_northeast(firs)
  ) %>%
    purrr::map_dfr(.f = dplyr::bind_rows) %>%
    sf::st_as_sf() %>%
    sf::st_union() %>%
    sf::st_sf(geometry = .,
              id = "ECAC",
              name = "ECAC",
              icao = "ECAC"
    ) %>%
    dplyr::mutate(min_fl = 0, max_fl = 999)
  ecac
}



#' STATFOR North Atlantic region
#'
#' @param firs the global FIRs
#'
#' @return the FIR-based STATFOR North Atlantic
#' @export
#'
#' @examples
#' \dontrun{
#' north_atlantic()
#' }
north_atlantic <- function(firs = pruatlas::firs_nm_406) {
  noat <- firs %>%
    dplyr::filter(stringr::str_sub(.$icao, start = 1, end = 1) %in% c("C","K", "P"),
                  .$min_fl <= 0, 0 <= .$max_fl) %>%
    sf::st_as_sf() %>%
    sf::st_make_valid() %>%
    sf::st_union() %>%
    sf::st_sf(geometry = .,
              id = "NOAT",
              name = "North Atlantic",
              icao = "NOAT"
    ) %>%
    dplyr::mutate(min_fl = 0, max_fl = 999)

  noat
}
