# Note: This script converts the .rda files in data/ to .parquet files
# Load necessary libraries
library(sf)
library(dplyr)
library(arrow)
library(glue)

process_and_save_parquet <- function(dataset_name) {
  file_path <- glue("data/{dataset_name}.rda")
  load(file_path)

  if (!exists(dataset_name)) {
    stop(paste("Dataset", dataset_name, "not found in the environment."))
  }

  dataset <- get(dataset_name)

  if (!"geometry" %in% colnames(dataset)) {
    stop(paste("Dataset", dataset_name, "does not have a 'geometry' column."))
  }

  # Convert 'geometry' to Well Known Text (wkt) and save as Parquet
  dataset %>%
    mutate(geometry_wkt = st_as_text(geometry)) %>%
    tibble() %>%
    select(-geometry) %>%
    write_parquet(glue("data/{dataset_name}.parquet"))

  message(paste("Dataset", dataset_name, "processed and saved as Parquet."))
}

process_and_save_parquet("ansps_ace_406")
process_and_save_parquet("ansps_ace_481")
process_and_save_parquet("ansps_ace_524")
process_and_save_parquet("countries50m")
process_and_save_parquet("firs_nm_406")
process_and_save_parquet("firs_nm_481")
process_and_save_parquet("firs_nm_524")
process_and_save_parquet("sphere_laea")

load('data/member_states.rda')
member_states %>%
  write_parquet('data/member_states.parquet')
