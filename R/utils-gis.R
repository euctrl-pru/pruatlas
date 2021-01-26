lonlat2UTM <- function(lonlat) {
  utm = (floor((lonlat[1] + 180) / 6) %% 60) + 1
  if (lonlat[2] > 0) {
    utm + 32600
  } else {
    utm + 32700
  }
}


lonlat_bbox <- function(data, buffer) {
  # global bounding box
  bbox_3035 <- data %>%
    # put all buffers together...
    sf::st_union() %>%
    # ...take the polygon enclosing all of them ...
    sf::st_convex_hull() %>%
    # st_transform(3035) %>%
    # ...with a buffer around ...
    sf::st_buffer(units::set_units(150, units::as_units("km"))) %>%
    sf::st_bbox() %>%
    # TODO: use 'round away from zero' eventually
    #       https://shrektan.com/post/2018/04/25/human-round-round-to-nearest-ties-away-from-zero/
    # round() %>%
    as.numeric() %>%
    `names<-`(c("left", "bottom", "right", "top"))
}
