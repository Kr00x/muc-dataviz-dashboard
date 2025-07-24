# tiny utilities used across scripts
read_de <- function(path, ...) readr::read_csv2(path, locale = locale(encoding = "UTF-8"), ...)
munich_ags <- "09162"

detect_year_cols <- function(df) {
  names(df)[grepl("^\\d{4}$", names(df))]
}