# Eurocontrol Member States
# Name, ICAO code, ISO 2 letter code, ISO #, ISO region

library(readr)
member_states <- read_csv("data-raw/member_states.csv")
usethis::use_data(
  member_states,
  compress = "bzip2",
  overwrite = TRUE)
