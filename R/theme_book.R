# Custom ggplot2 theme for the book
# Source this file in any chapter to get consistent styling
# Usage: source("R/theme_book.R") or it will be sourced automatically via R/setup.R

library(ggplot2)

# Color palette
pubfin_colors <- c(
  navy      = "#1B2A4A",
  gold      = "#C8942D",
  green     = "#2F855A",
  red       = "#C53030",
  slate     = "#4A5568",
  orange    = "#DD6B20",
  blue      = "#2B6CB0",
  dark_red  = "#9B2C2C"
)

theme_pubfin <- function(base_size = 12) {
  theme_minimal(base_size = base_size) +
    theme(
      text = element_text(family = "Source Sans 3"),
      plot.title = element_text(
        face = "bold", size = rel(1.2), hjust = 0, color = "#1B2A4A"
      ),
      plot.subtitle = element_text(
        color = "#4A5568", size = rel(0.9), margin = margin(b = 10)
      ),
      plot.caption = element_text(
        color = "#718096", size = rel(0.75), hjust = 1
      ),
      panel.grid.minor = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.major.y = element_line(
        color = "#E2E8F0", linewidth = 0.4
      ),
      axis.title = element_text(size = rel(0.85), color = "#4A5568"),
      axis.text = element_text(color = "#718096"),
      legend.position = "top",
      legend.title = element_text(face = "bold", size = rel(0.85)),
      plot.margin = margin(10, 10, 10, 10)
    )
}

scale_fill_pubfin <- function(...) {
  scale_fill_manual(values = unname(pubfin_colors), ...)
}

scale_color_pubfin <- function(...) {
  scale_color_manual(values = unname(pubfin_colors), ...)
}
