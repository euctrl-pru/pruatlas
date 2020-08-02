country_ansp <- function(ansps, ansp_id = "ENAV", fl = 300) {
  ansps %>%
    dplyr::filter(.$id == ansp_id, .$min_fl <= fl & fl <= .$max_fl) %>%
    sf::st_as_sf() %>%
    sf::st_union() %>%
    sf::st_sf(geometry = ., id = stringr::str_c(ansp_id, "_ANSP"))
}
