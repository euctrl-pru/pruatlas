#' ECAC Oceanic FIRs
#'
#' @param firs the global FIRs
#'
#' @return the subset of FIRs composing ECAC Oceanic
#' @export
#'
ecac_oceanic <- function(firs = pruatlas::firs_nm_406) {
  ecac_oc_codes <- c("BI", "EG", "EK", "EN", "LP")
  ecac_oc <- firs %>%
    dplyr::filter(icao %in% ecac_oc_codes, min_fl <= 0, 0 <= max_fl) %>%
    # include oceanic: SHANWICK, BODO
    dplyr::filter((id %in% c("EGGXFIR", "ENOBFIR", "LPPOFIR") | icao == "BI"))
  ecac_oc
}

