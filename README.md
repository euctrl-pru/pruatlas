
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PRU Atlas

<!-- badges: start -->

[![R-CMD-check](https://github.com/euctrl-pru/pruatlas/workflows/R-CMD-check/badge.svg)](https://github.com/euctrl-pru/pruatlas/actions)
[![pkgdown](https://github.com/euctrl-pru/pruatlas/workflows/pkgdown/badge.svg)](https://github.com/euctrl-pru/pruatlas/actions)
<!-- badges: end -->

This is still **Work In Progress** but we value constructive feedback:
please check the [issues
page](https://github.com/euctrl-pru/pruatlas/issues) and eventually file
a bug or a feature request.

The `pruatlas` package provides helpers for generating maps of interest
for PRU publications.

There are both high and low level facilities. For an example of a high
level helper, the code for plotting a map of the Germany country FIR and
ANSP is as follows:

``` r
library(sf)
library(pruatlas)
fl <- 300
plot_country_fir("ED", "Germany", fl = fl)
plot_country_ansp("DFS", "DFS, Germany", fl = fl)
```

<img src="man/figures/README-lf-fir-1.png" alt="A map of Germany's FIR's area at flight level 300" width="50%" /><img src="man/figures/README-lf-fir-2.png" alt="A map of Germany's ANSP's area at flight level 300" width="50%" />

Or EUROCONTROL’s Member States FIR area:

``` r
ms <- "BI|E.|L.|UD|UG|GM|UK|GC"
plot_country_fir(icao_id = ms, "EUROCONTROL Member States", buffer = 350, fl = 200)
```

<img src="man/figures/README-euctrl-ms-1.png" alt="A map of all EUROCONTROL Member States' merged FIR's at flight level 200" width="80%" />

Lower level functions or datasets include for example `countries50m`,
the Simple Feature for the whole world countries or `extent_fir()` to
calculate the bounding box of a country FIR.

Useful functions are:

- `plot_country_fir()`
- `plot_country_ansp()`

The package contains the following aviation GIS datasets (for CFMU AIRAC
406, see below):

- `firs_nm_406`: the FIR’s as defined/used by EUROCONTROL’s Network
  Manager
- `ansps_ace_406`: the ANSP’s as defined/used in ACE Benchmarking Report

(CFMU) AIRAC 406, a.k.a.
[AIRAC](https://ansperformance.eu/acronym/airac/) `1512`, spans the
28-day interval 2015-11-12 UTC–2015-12-10 UTC.

If you need polygons in different AIRAC’s that the one in the package
and have access to EUROCONTROL DB, you can have a look at the scripts in
the `data-raw` directory. For example `export_nm_fir_geojson.R` or
`export_ace_ansp_geojson.R` allow for exporting FIR’s or ANSP’s to
GeoJSON which can be read as {`sf`} features via `sf::read_sf()`.

# Installation

`Pruatlas` is still in early development and it is only available on
GitHub. It relies and uses the functionality from the `sf` package and
this relies on a working installation of GDAL, see the `sf` installation
instructions for directions.

In order to install `pruatlas` you need to run:

``` r
library(remotes)
install_github("euctrl-pru/pruatlas")
```

# To Do’s

- [ ] implement similar facilities as FIR’s/ANSP’s for Elementaty
  Sectors (ES’s) in order to be able to plot single ES or ACC’s
- [ ] include `export_<airspace_type>` in the package API rather than as
  scripts for the package datasets
- [ ] extract style from plot functions and make it a better theme
- [x] extend Member States dataset

# Development

In order to build the relevant `pkgdown` web pages, execute the
following code:

``` r

# How to build the pkgdown from behind proxied Internet
library(withr)
library(pkgdown)

with_options(list(pkgdown.internet = FALSE),
             build_site())
```
