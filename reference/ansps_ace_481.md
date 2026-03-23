# ACE ANSPs for AIRAC 481.

A dataset containing the definition of the
[ANSP](https://ansperformance.eu/acronym/ansp/)s as used in the
[ACE](https://ansperformance.eu/acronym/ace/) Benchmarking Report.

## Usage

``` r
ansps_ace_481
```

## Format

A Simple Feature dataset with airspace definitions for ANSPs:

- airac_cfmu:

  the AIRAC cycle number in CFMU format

- id:

  the ID for the ANSP

- name:

  the name of the ANSP

- ace_code:

  the code of the ANSP used in ACE

- min_fl:

  the minimum flight level of the ANSP

- max_fl:

  the maximum flight level of the ANSP

- airspace_type:

  the type of the airspace (ANSP)

- geometry:

  the Simple Feature describing the ANSP

## Source

<https://github.com/euctrl-pru/eurocontrol-atlas>
