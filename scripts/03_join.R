
library(tidyverse)
library(here)

# Baugenehmigungen München
baug     <- read_rds(here("data/processed/baug_muc.rds"))        %>% mutate(year = as.integer(year))
# Übernachtungen Bayern
tour_by  <- read_rds(here("data/processed/tour_by.rds"))        %>% mutate(year = as.integer(year))
# Bevölkerung München
pop      <- read_rds(here("data/processed/pop_muc.rds"))        %>% mutate(year = as.integer(year))
# POI-Zählung München
poi      <- read_rds(here("data/processed/tour_poi_muc.rds"))   %>% mutate(year = as.integer(year))
# Mietpreise 2025
rent     <- read_rds(here("data/processed/rent_muc_2025.rds"))  %>% mutate(year = as.integer(year))

master <- baug %>%
  full_join(tour_by, by = "year") %>%
  full_join(pop,     by = "year") %>%
  full_join(poi,     by = "year") %>%
  full_join(rent,    by = "year") %>%
  arrange(year)

write_rds(master, here("data/processed/master_muc.rds"))
message("03_join.R: master_muc.rds erzeugt.")
