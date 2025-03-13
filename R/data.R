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

#' NM FIRs for AIRAC 481.
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
"firs_nm_481"

#' NM FIRs for AIRAC 524.
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
"firs_nm_524"

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

#' ACE ANSPs for AIRAC 481.
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
"ansps_ace_481"

#' ACE ANSPs for AIRAC 524.
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
"ansps_ace_524"


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

#' The Lambert Azimuthal Equal-Area projection used in the package.
#'
#'@seealso \url{https://en.wikipedia.org/wiki/Lambert_azimuthal_equal-area_projection}
#'
"pru_laea_proj"

#' EUROCONTROL's Member States
#'
#' A data frame with the following fields
#' \describe{
#'   \item{name}{the country name, e.g. "Italy"}
#'   \item{iso3c}{the 3-letter ISO code, e.g. "ITA"}
#'   \item{iso2c}{the 2-letter ISO code, e.g. "IT"}
#'   \item{icao}{the 2-letter ICAO code, e.g. "LI"}
#'   \item{iso3n}{the 3-digits ISO code, e.g. "380"}
#'   \item{date}{the date of `status` code, e.g. 1996-04-01}
#'   \item{status}{the status code, e.g. "M"
#'   (`M` Member State, `C` Comprehensive Agreement State, `T` Transitional State)}
#' }
#' These are useful to grab the right spatial polygons in case of need.
#' Note: Kosovo is also included in the list.
"member_states"

