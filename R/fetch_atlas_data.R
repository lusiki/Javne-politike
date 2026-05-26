# Fetch Eurostat indicators for the Podaci (Atlas) dashboard.
# Idempotent: skips existing files unless ATLAS_REFRESH=1.
# Run with:  ATLAS_REFRESH=1 Rscript R/fetch_atlas_data.R

out_dir <- "data/atlas"
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)
refresh <- identical(Sys.getenv("ATLAS_REFRESH"), "1")

base <- "https://ec.europa.eu/eurostat/api/dissemination/sdmx/2.1/data"
geos <- "HR+EU27_2020+DE+SI+HU+AT+IT+PL+CZ+SK+RO+BG+FR+ES+NL+SE+DK"

fetch <- function(name, path) {
  dest <- file.path(out_dir, name)
  if (file.exists(dest) && !refresh) {
    message("skip (exists): ", dest); return(invisible())
  }
  url <- paste0(base, "/", path, "&format=SDMX-CSV")
  message("fetch: ", name)
  df <- read.csv(url, stringsAsFactors = FALSE, check.names = FALSE)
  keep <- c("unit", "sector", "na_item", "geo", "TIME_PERIOD", "OBS_VALUE")
  keep <- intersect(c(keep, "cofog99"), names(df))
  df <- df[, keep, drop = FALSE]
  names(df)[names(df) == "TIME_PERIOD"] <- "year"
  names(df)[names(df) == "OBS_VALUE"]   <- "value"
  write.csv(df, dest, row.names = FALSE)
}

# 1) Total expenditure, % GDP, general government — time series
fetch(
  "expenditure_pct_gdp.csv",
  sprintf("gov_10a_main/A.PC_GDP.S13.TE.%s?startPeriod=2008", geos)
)

# 2) Total revenue, % GDP — time series
fetch(
  "revenue_pct_gdp.csv",
  sprintf("gov_10a_main/A.PC_GDP.S13.TR.%s?startPeriod=2008", geos)
)

# 3) Tax components (% GDP). Sum D2 (production), D5 (income), D91 (capital),
#    D61 (social contributions) gives total taxes & SSC.
fetch(
  "taxes_pct_gdp.csv",
  sprintf("gov_10a_main/A.PC_GDP.S13.D2REC+D5REC+D91REC+D61REC.%s?startPeriod=2008", geos)
)

# 4) Functional structure of expenditure (COFOG), % GDP, latest available
fetch(
  "cofog_pct_gdp.csv",
  paste0(
    "gov_10a_exp/A.PC_GDP.S13.",
    "GF01+GF02+GF03+GF04+GF05+GF06+GF07+GF08+GF09+GF10.TE.",
    "HR+EU27_2020?startPeriod=2020"
  )
)

message("done. files in ", out_dir, ":")
print(list.files(out_dir))
