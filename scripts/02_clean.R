
library(tidyverse)
library(here)
library(pdftools)
options(pdftools.quiet = TRUE)

dir_raw  <- here("data", "raw")
dir_proc <- here("data", "processed")
dir.create(dir_proc, recursive = TRUE, showWarnings = FALSE)

# 1) Baugenehmigungen München
raw_baug <- read_csv(file.path(dir_raw, "raw_baugenehm_muc.csv"), show_col_types = FALSE)
sp_a     <- names(raw_baug)[str_detect(names(raw_baug), regex("^auspr", ignore_case = TRUE))][1]
sp_r     <- names(raw_baug)[str_detect(names(raw_baug), regex("^raumbez", ignore_case = TRUE))][1]
sp_v     <- names(raw_baug)[str_detect(names(raw_baug), regex("basiswert.*2$", ignore_case = TRUE))][1]
baug_muc <- raw_baug %>%
  filter(.data[[sp_a]] == "Wohnfläche", .data[[sp_r]] == "Stadt München") %>%
  transmute(year = as.integer(Jahr), dwellings_permitted = as.integer(.data[[sp_v]]))
write_rds(baug_muc, file.path(dir_proc, "baug_muc.rds"))

# 2) Übernachtungen Bayern
raw_tour_by <- read_csv2(file.path(dir_raw, "raw_tourismus_by.csv"), show_col_types = FALSE)
code_sp     <- names(raw_tour_by)[str_detect(names(raw_tour_by), regex("^value_variable_code$", ignore_case = TRUE))][1]
time_sp     <- names(raw_tour_by)[str_detect(names(raw_tour_by), regex("^time$", ignore_case = TRUE))][1]
val_sp      <- names(raw_tour_by)[str_detect(names(raw_tour_by), regex("^value$", ignore_case = TRUE))][1]
tour_by     <- raw_tour_by %>%
  filter(.data[[code_sp]] == "GUEB03") %>%
  transmute(year = as.integer(.data[[time_sp]]), overnights_by = as.integer(.data[[val_sp]]))
write_rds(tour_by, file.path(dir_proc, "tour_by.rds"))

# 3) POI-Zählung München
raw_poi   <- read_csv(file.path(dir_raw, "raw_tourismus_muc.csv"), show_col_types = FALSE)
poi_count <- nrow(raw_poi)
years     <- baug_muc$year
poi_muc   <- tibble(year = years, poi_count_muc = poi_count)
write_rds(poi_muc, file.path(dir_proc, "tour_poi_muc.rds"))

# 4) Bevölkerung München
pop <- read_csv2(file.path(dir_raw, "raw_pop_muc.csv"), show_col_types = FALSE) %>%
  transmute(year = as.integer(year), population = as.integer(population))
write_rds(pop, file.path(dir_proc, "pop_muc.rds"))

# 5) Mietspiegel 2025
text_page6 <- pdf_text(file.path(dir_raw, "raw_mietspiegel_muc_2025.pdf"))[6]
rent_val   <- parse_number(str_extract(text_page6, "[0-9]+,[0-9]{2}"))
rent_2025  <- tibble(year = 2025L, rent_mean_eur_m2 = rent_val)
write_rds(rent_2025, file.path(dir_proc, "rent_muc_2025.rds"))

message("02_clean.R: Einzeldaten bereinigt und gespeichert.")
