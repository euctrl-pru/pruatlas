#' ECAC Oceanic FIRs
#'
#' @param firs the global FIRs
#'
#' @return the subset of FIRs composing ECAC Oceanic
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
                     .$icao == "BI"))
  ecac_oc
}

#' ECAC North West FIRs
#'
#' @param firs the global FIRs
#'
#' @return the subset of FIRs composing ECAC North West
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
    dplyr::filter(!(.$id %in% c("EGGXFIR", "EGGX")))

  ecac_nw
}


#' ECAC South West FIRs
#'
#' @param firs the global FIRs
#'
#' @return the subset of FIRs composing ECAC South West
#' @export
#'
#' @examples
#' \dontrun{
#' ecac_southhwest()
#' }
ecac_southhwest <- function(firs = pruatlas::firs_nm_406) {
  ecac_sw_codes <- c("GC",
                     # "GE", <-- no specific FIR for Ceuta & Melilla
                     "LE", "LP",
                     # "LX", <-- no specific FIR for Gilbratar
                     NULL)
  ecac_sw <- firs %>%
    dplyr::filter(.$icao %in% ecac_sw_codes,
                  .$min_fl <= 0, 0 <= .$max_fl) %>%
    # exclude oceanic portion (Santa Maria)
    dplyr::filter(!(.$id %in% c("LPPOFIR")))

  ecac_sw
}


#' ECAC North East FIRs
#'
#' @param firs the global FIRs
#'
#' @return the subset of FIRs composing ECAC North East
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
    dplyr::filter(!(.$id %in% c("ENOBFIR")))

  ecac_ne
}



#' ECAC South East FIRs
#'
#' @param firs the global FIRs
#'
#' @return the subset of FIRs composing ECAC South East
#' @export
#'
#' @examples
#' \dontrun{
#' ecac_southeast()
#' }
ecac_southeast <- function(firs = pruatlas::firs_nm_406) {
  ecac_se <- c("LA", "LB", "LC", "LD", "LG", "LH", "LI",
               "LJ", "LM", "LQ", "LR", "LT", "LU", "LW",
               "LY", "UB", "UD", "UG") %>%
    purrr::map_dfr(~ suppressMessages(country_fir(firs, icao_id = .x)))

  ecac_se
}
