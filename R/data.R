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


#' EUROCONTROL's Member States
#'
#' A data frame with the following fields
#' @format A Simple Feature dataset with airspace definitions for ANSPs:
#' \describe{
#'   \item{name}{the country name}
#'   \item{icao}{the 2-letter ICAO code}
#'   \item{iso2a}{the 2-letter ISO code}
#'   \item{iso3n}{the 3-digits ISO code}
#'   \item{iso_region}{the ISO region code, needed for Canary Islands}
#' }
"member_states"

