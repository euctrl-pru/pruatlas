
# remotes::install_github("yonghah/esri2sf")
library(esri2sf)
library(dplyr)
url <- "https://gis.icao.int/ArcGIS/rest/services/FIRMSD/MapServer/18"
df <- esri2sf(url,
              outFields = c("FID", "Shape", "FIRname", "REGION",
                            "KIND", "UPPER", "LOWER", "ULC",
                            "ICAOCODE", "RESP", "NOM_COMP", "HISTORIC",
                            "REMARKS", "REMARKS2", "REMARKS3",
                            "centlong", "centlat",
                            "AREAsqkm", "PERIMEkm",
                            "SUPP_REGIO", "ET_ID")) %>%
  rename(fir_id = FID, fir_name = FIRname,
         icao_code = ICAOCODE,
         area_sqkm = AREAsqkm,  perimeter_km = PERIMEkm,
         centroid_lon = centlong, centroid_lat = centlat,
         region = REGION, supporting_region = SUPP_REGIO,
         responsible = RESP) %>%
  janitor::clean_names()

df %>%
  write_sf("icao_fir.geojson")

# df %>%
#   filter(REGION == "EUR") %>%
#   filter(ULC == "LC", str_starts(ICAOCODE, "E") | str_starts(ICAOCODE, "L")) %>%
#   ggplot() +
#   geom_sf()
