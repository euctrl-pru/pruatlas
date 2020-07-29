#' NM FIRs for AIRCA 406.
#'
#' A dataset containing the definition of the FIRs as used by the
#' \href{http://ansperformance.eu/references/acronym/nm-cfmu.html}{Network Manager}.
#'
#'
#' @format A Simple Feature dataset with 111 FIRs and 9 variables:
#' \describe{
#'   \item{airacnm}{the AIRAC cycle number in CFMU format}
#'   \item{firid}{the code name for the FIR}
#'   \item{firid}{the ICAO country code for the FIR}
#'   \item{minfl}{the minimum flight level of the FIR}
#'   \item{maxfl}{the maximum flight level of the FIR}
#'   \item{firname}{the name of the FIR}
#'   \item{objid}{unique numerical id for the FIR}
#'   \item{SHAPE_LEN}{the leangth of the perimeter of the polygon of the FIR}
#'   \item{geometry}{the Simple Feature describing the FIR}
#' }
#' @source \url{https://github.com/euctrl-pru/eurocontrol-atlas}
"firs_nm_406"

#' World countries at 50m scale.
#'
#' A dataset containing the definition of the world countries.
#'
#'
#' @format A Simple Feature dataset with 240 countries and 4 variables:
#' \describe{
#'   \item{iso_a3}{\href{https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3}{ISO 3166-1 alpha-3}
#'   three-letter country code}
#'   \item{iso_n3}{\href{https://en.wikipedia.org/wiki/ISO_3166-1_numeric}{ISO 3166-1 numeric}
#'   three digits country code}
#'   \item{admin}{Country's English short name according to ISO 3166}
#'   \item{geometry}{the Simple Feature describing the country}
#' }
#' @source \url{https://github.com/euctrl-pru/eurocontrol-atlas}
"countries50m"

#' A special object to represent the spherical Earth in a given projection.
#'
#'@seealso \url{http://stackoverflow.com/q/43207947/963575}
#'
#' @source \url{https://github.com/euctrl-pru/eurocontrol-atlas}
"sphere_laea"
