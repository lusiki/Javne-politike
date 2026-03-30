# Shared setup for all book chapters
# Source this at the top of each chapter:
#   source("R/setup.R")

# Load common packages
suppressPackageStartupMessages({
  library(ggplot2)
  library(dplyr)
  library(tidyr)
})

# Load custom theme and set as default
source("R/theme_book.R")
theme_set(theme_pubfin())

# Common knitr options
knitr::opts_chunk$set(
  fig.align = "center",
  out.width = "100%",
  dpi = 300
)
