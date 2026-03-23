# Package index

## Functions for countries and regions

Functions to return `sf` representations for Airspaces of countries or
() ECAC regions.

- [`country_ansp()`](https://pruatlas.ansperformance.eu/reference/country_ansp.md)
  : Extract ANSP polygon at defined flight level
- [`country_fir()`](https://pruatlas.ansperformance.eu/reference/country_fir.md)
  : Return the country FIR for a EUROCONTROL's Member State.
- [`ecac_northeast()`](https://pruatlas.ansperformance.eu/reference/ecac_northeast.md)
  : STATFOR ECAC North East region
- [`ecac_northwest()`](https://pruatlas.ansperformance.eu/reference/ecac_northwest.md)
  : STATFOR ECAC North West region
- [`ecac_oceanic()`](https://pruatlas.ansperformance.eu/reference/ecac_oceanic.md)
  : STATFOR ECAC Oceanic region
- [`ecac_region()`](https://pruatlas.ansperformance.eu/reference/ecac_region.md)
  : STATFOR ECAC region
- [`ecac_southeast()`](https://pruatlas.ansperformance.eu/reference/ecac_southeast.md)
  : STATFOR ECAC South East region
- [`ecac_southwest()`](https://pruatlas.ansperformance.eu/reference/ecac_southwest.md)
  : STATFOR ECAC South West region
- [`north_atlantic()`](https://pruatlas.ansperformance.eu/reference/north_atlantic.md)
  : STATFOR North Atlantic region

## Plot functions

Plotting functions for airspaces et al.

- [`base_map()`](https://pruatlas.ansperformance.eu/reference/base_map.md)
  : Provide base country layer for PRU maps.
- [`plot_country_ansp()`](https://pruatlas.ansperformance.eu/reference/plot_country_ansp.md)
  : Plot country and relevant ANSP.
- [`plot_country_fir()`](https://pruatlas.ansperformance.eu/reference/plot_country_fir.md)
  : Plot country and relevant FIR.
- [`pru_colours()`](https://pruatlas.ansperformance.eu/reference/pru_colours.md)
  : Default colours for PRU maps.
- [`theme_map()`](https://pruatlas.ansperformance.eu/reference/theme_map.md)
  : PRU theme for maps.

## Helper functions

Various helper functions

- [`extent_fir()`](https://pruatlas.ansperformance.eu/reference/extent_fir.md)
  : Return the extent of a set of FIRs.
- [`parse_airspace_crco()`](https://pruatlas.ansperformance.eu/reference/parse_airspace_crco.md)
  : Parse CRCO Airspace Charging Zone format
- [`sphere()`](https://pruatlas.ansperformance.eu/reference/sphere.md) :
  Return the polygon represent the spherical Earth.

## Data sets

Airspaces and boundaries from various entities such as Flight
Information Regions (FIR), Air Navigation Services Providers polygons
(ANSP) and world countries. Helper datasets for [Lambert azimuthal
equal-area (LAEA)
projection](https://en.wikipedia.org/wiki/Lambert_azimuthal_equal-area_projection),
and EUROCONTROL Member States’ details.

- [`ansps_ace_406`](https://pruatlas.ansperformance.eu/reference/ansps_ace_406.md)
  : ACE ANSPs for AIRAC 406.
- [`ansps_ace_481`](https://pruatlas.ansperformance.eu/reference/ansps_ace_481.md)
  : ACE ANSPs for AIRAC 481.
- [`ansps_ace_524`](https://pruatlas.ansperformance.eu/reference/ansps_ace_524.md)
  : ACE ANSPs for AIRAC 524.
- [`countries50m`](https://pruatlas.ansperformance.eu/reference/countries50m.md)
  : World countries at 50m scale.
- [`firs_nm_406`](https://pruatlas.ansperformance.eu/reference/firs_nm_406.md)
  : NM FIRs for AIRAC 406.
- [`firs_nm_481`](https://pruatlas.ansperformance.eu/reference/firs_nm_481.md)
  : NM FIRs for AIRAC 481.
- [`firs_nm_524`](https://pruatlas.ansperformance.eu/reference/firs_nm_524.md)
  : NM FIRs for AIRAC 524.
- [`member_states`](https://pruatlas.ansperformance.eu/reference/member_states.md)
  : EUROCONTROL's Member States
- [`pru_laea_proj`](https://pruatlas.ansperformance.eu/reference/pru_laea_proj.md)
  : The Lambert Azimuthal Equal-Area projection used in the package.
- [`sphere_laea`](https://pruatlas.ansperformance.eu/reference/sphere_laea.md)
  : A special object to represent the spherical Earth in a given
  projection.
