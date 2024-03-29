% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/country_ansp.R
\name{country_ansp}
\alias{country_ansp}
\title{Extract ANSP polygon at defined flight level}
\usage{
country_ansp(ansps, ansp_id = "ENAV", fl = 300)
}
\arguments{
\item{ansps}{the \code{sf} holding the ANSP polygons, i.e.
\code{pruatlas::ansps_ace_406}}

\item{ansp_id}{optional, the ANSP ID of the relevant country, "ENAV" otherwise.
It can be a regular expression, i.e. "DFS|ENAV" for matching Germany and Italy.}

\item{fl}{the flight level of interest}
}
\value{
a polygon for the ANSP(s)
}
\description{
Extract ANSP polygon at defined flight level
}
\examples{
\dontrun{
country_ansp(ansps_ace_406, "DFS", fl = 350)

# more complicated for Italy/ENAV: there is a hole over Rome.
# if we want to get rid of it we can use smoothr::fill_holes()
enav <- pruatlas::ansps_ace_406 \%>\%
  country_ansp(ansp_id = "ENAV", fl = 355) \%>\%
  smoothr::fill_holes(units::set_units(10000, km^2))
}
}
