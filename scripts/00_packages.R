
# Liste der benötigten Pakete (inkl. car für VIF)
pkgs <- c(
  "tidyverse", "janitor", "lubridate", "patchwork",
  "skimr", "ggthemes", "scales", "broom",
  "ggrepel", "here", "stringr", "pdftools",
  "rmarkdown", "car", "viridis","broom", "dynlm"
)

# Nur fehlende Pakete installieren
install.packages(
  setdiff(pkgs, rownames(installed.packages())),
  ask = FALSE
)

# Alle Pakete laden
invisible(lapply(pkgs, library, character.only = TRUE))

# Sicherstellen, dass rmarkdown verfügbar ist
library(rmarkdown)

# ggplot2-Theme
theme_set(ggthemes::theme_clean(base_family = "Source Sans Pro"))

# Globale Optionen
options(
  scipen = 10,
  dplyr.summarise.inform = FALSE,
  knitr.kable.NA = ""
)

# Kleine Hilfsfunktionen
read_de <- function(path, ...) {
  readr::read_csv2(path, locale = locale(encoding = "UTF-8"), ...)
}

munich_ags <- "09162"

detect_year_cols <- function(df) {
  names(df)[grepl("^\\d{4}$", names(df))]
}
