#' NM FIRs for AIRAC 406.
#'
#' A dataset containing the definition of the FIRs as used by the
#' \href{http://ansperformance.eu/references/acronym/nm-cfmu.html}{Network Manager}.
#'
#'
#' @format A Simple Feature dataset with 111 FIRs and 9 variables:
#' \describe{
#'   \item{airac_cfmu}{the AIRAC cycle number in CFMU format}
#'   \item{icao}{the ICAO region code for the FIR}
#'   \item{id}{the ID for the FIR}
#'   \item{min_fl}{the minimum flight level of the FIR}
#'   \item{max_fl}{the maximum flight level of the FIR}
#'   \item{name}{the name of the FIR}
#'   \item{airspace_type}{the type of the airspace (FIR)}
#'   \item{geometry}{the Simple Feature describing the FIR}
#' }
"firs_nm_406"

#' ACE ANSPs for AIRAC 406.
#'
#' A dataset containing the definition of the
#' \href{https://ansperformance.eu/acronym/ansp/}{ANSP}s as
#' used in the \href{https://ansperformance.eu/acronym/ace/}{ACE}
#' Benchmarking Report.
#'
#'
#' @format A Simple Feature dataset with airspace definitions for ANSPs:
#' \describe{
#'   \item{airac_cfmu}{the AIRAC cycle number in CFMU format}
#'   \item{id}{the ID for the ANSP}
#'   \item{name}{the name of the ANSP}
#'   \item{ace_code}{the code of the ANSP used in ACE}
#'   \item{min_fl}{the minimum flight level of the ANSP}
#'   \item{max_fl}{the maximum flight level of the ANSP}
#'   \item{airspace_type}{the type of the airspace (ANSP)}
#'   \item{geometry}{the Simple Feature describing the ANSP}
#' }
#' @source \url{https://github.com/euctrl-pru/eurocontrol-atlas}
"ansps_ace_406"

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


#' Lambert Azimuthal Equal-Area projection for PRU maps.
#'
#' The following PROJ.4 string is used:
#' \code{+proj=laea +lat_0=52 +lon_0=10 +x_0=4321000 +y_0=3210000 +datum=WGS84 +units=m +no_defs}
#'
#' In a ggplot2+sf context, you can just use variable name as the value for the \code{proj}
#' parameter to \code{ggalt::coord_proj}. i.e. \code{coord_proj(us_laea_proj)}.
#'
"pru_laea_proj"
