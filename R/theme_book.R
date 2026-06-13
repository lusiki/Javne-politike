# Custom ggplot2 theme for the book — STATECRAFT palette
# Source this file in any chapter to get consistent styling
# Usage: source("R/theme_book.R") or it will be sourced automatically via R/setup.R
#
# Palette + fonts reconciled to STATECRAFT (see _brand.yml, styles/custom.scss).
# These static charts are the PDF twins of the book's interactive OJS charts,
# so their colors and type must match the on-screen versions: body cream,
# ink near-black, verdigris primary, info-blue for curves, ochre archival.

library(ggplot2)

# PDF charts are rendered black-and-white in a monospace family. Every R chunk
# in the book is a *-print twin shown only in the PDF (the colour versions are
# the OJS/HTML charts), so this never affects the on-screen colour charts. All
# text/label geoms default to the generic "mono" family (device-safe everywhere).
update_geom_defaults("text",  list(family = "mono"))
update_geom_defaults("label", list(family = "mono"))

# STATECRAFT tokens (source of truth: _brand.yml)
statecraft <- c(
  paper      = "#F2EDE3",  # warm cream background (never pure white)
  paper_soft = "#EAE3D4",
  ink        = "#1C1916",  # near-black with brown undertone
  ink_soft   = "#3A332D",  # secondary text / chart body
  ink_mute   = "#6B6357",  # captions / gridlines / reference lines
  verdigris  = "#4A6B5C",  # PRIMARY accent
  verdigris_deep = "#3A5648",
  oxblood    = "#6B1F26",  # emphasis only
  ochre      = "#C8985E",  # archival accent
  ochre_deep = "#9A6F38",
  info       = "#2D5A8E"   # the blue used by the OJS curves
)

# Public color palette for charts. Legacy names (navy/gold/...) are retained as
# aliases so existing chapter code keeps working, now mapped onto STATECRAFT.
pubfin_colors <- c(
  navy     = unname(statecraft["ink"]),        # was #1B2A4A
  gold     = unname(statecraft["ochre"]),       # was #C8942D
  green    = unname(statecraft["verdigris"]),   # was #2F855A
  red      = unname(statecraft["oxblood"]),     # was #C53030
  slate    = unname(statecraft["ink_mute"]),    # was #4A5568
  orange   = unname(statecraft["ochre_deep"]),  # was #DD6B20
  blue     = unname(statecraft["info"]),        # was #2B6CB0
  dark_red = unname(statecraft["oxblood"])       # was #9B2C2C
)

# Font used in charts. The OJS (HTML) charts render in Public Sans via the
# browser, but that font is not installed on the OS, and the PDF body uses
# Latin Modern (see _quarto-pdf.yml). Forcing a web font here either errors on
# the Windows graphics device or clashes with the PDF's Latin Modern type, so
# the twins use the device's default sans family ("") — safe everywhere and
# typographically consistent with the rendered PDF.
.pubfin_font <- "mono"

# Black-and-white frame for the PDF chart twins: white background, near-black
# text, light-gray gridlines, monospace family. The geom colours themselves are
# grayscale hex set in each chart body.
theme_pubfin <- function(base_size = 12) {
  theme_minimal(base_size = base_size) +
    theme(
      text = element_text(family = .pubfin_font, color = "#1A1A1A"),
      plot.background  = element_rect(fill = "white", color = NA),
      panel.background = element_rect(fill = "white", color = NA),
      plot.title = element_text(
        face = "bold", size = rel(1.2), hjust = 0, color = "#000000"
      ),
      plot.subtitle = element_text(
        color = "#595959", size = rel(0.9), margin = margin(b = 10)
      ),
      plot.caption = element_text(
        color = "#595959", size = rel(0.75), hjust = 1
      ),
      panel.grid.minor = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.major.y = element_line(
        color = "#E0E0E0", linewidth = 0.4
      ),
      axis.title = element_text(size = rel(0.85), color = "#1A1A1A"),
      axis.text  = element_text(color = "#595959"),
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
