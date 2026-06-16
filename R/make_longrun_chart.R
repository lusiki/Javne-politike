# Long-run government spending chart, 1870–2024
# Historical benchmarks: Tanzi & Schuknecht (2000), Table I.1
# Modern panel: data/atlas/expenditure_pct_gdp.csv (Eurostat)
# Output: images/fig-longrun-spending.png

library(ggplot2)
library(dplyr)
library(tidyr)
library(scales)

R_PATH <- "C:/Program Files/R/R-4.4.1/bin/Rscript.exe"

# ── 1. Historical benchmarks (Tanzi & Schuknecht 2000, Table I.1) ─────────────
# Country average of the original 17 OECD countries at five benchmark years
hist_avg <- data.frame(
  year  = c(1870, 1913, 1920, 1937, 1960, 1980, 1990, 1996),
  spend = c(10.7, 12.7, 18.7, 22.8, 27.9, 43.1, 44.8, 45.6),
  type  = "avg17"
)

# Croatia: no reliable pre-transition data; IMF/World Bank estimates from ~1993
# We use WB GG expenditure data for HR (% of GDP), rough estimates before 2008
hr_hist <- data.frame(
  year  = c(1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002,
            2003, 2004, 2005, 2006, 2007),
  spend = c(52.0, 51.5, 50.2, 49.8, 50.6, 53.0, 49.8, 50.6, 50.0,
            48.7, 47.5, 46.5, 45.8, 44.8),
  geo   = "HR",
  type  = "hr"
)

# ── 2. Modern panel from Eurostat CSV ─────────────────────────────────────────
proj_root <- "C:/Users/lukas/Dropbox/Javne politike"
atlas <- read.csv(file.path(proj_root, "data/atlas/expenditure_pct_gdp.csv"),
                  stringsAsFactors = FALSE)

# All countries in the panel (for grey background lines)
modern_all <- atlas %>%
  filter(geo != "EU27_2020", !is.na(value)) %>%
  rename(spend = value)

# Croatia from Eurostat
hr_modern <- atlas %>%
  filter(geo == "HR", !is.na(value)) %>%
  rename(spend = value)

# Average of non-HR, non-EU27 countries from the panel
avg_modern <- atlas %>%
  filter(geo != "EU27_2020", geo != "HR", !is.na(value)) %>%
  group_by(year) %>%
  summarise(spend = mean(value, na.rm = TRUE), .groups = "drop") %>%
  mutate(type = "avg17")

# ── 3. Combine Croatia series ─────────────────────────────────────────────────
hr_full <- bind_rows(
  hr_hist %>% select(year, spend),
  hr_modern %>% select(year, spend)
) %>% arrange(year) %>% distinct(year, .keep_all = TRUE)

# ── 4. Combine average series ─────────────────────────────────────────────────
# Bridge the 1996–2008 gap with the 1996 value held flat to 2007
bridge <- data.frame(
  year  = 1997:2007,
  spend = hist_avg$spend[hist_avg$year == 1996]
)

avg_full <- bind_rows(
  hist_avg %>% select(year, spend),
  bridge,
  avg_modern %>% select(year, spend)
) %>% arrange(year)

# ── 5. Colors ─────────────────────────────────────────────────────────────────
col_avg <- "#C1121F"   # bold red for the OECD-17 average
col_hr  <- "#1B7837"   # green for Croatia
col_bg  <- "grey82"    # individual country lines

# ── 6. Plot ───────────────────────────────────────────────────────────────────
p <- ggplot() +
  # grey lines: individual countries from the modern panel
  geom_line(data = modern_all,
            aes(year, spend, group = geo),
            colour = col_bg, linewidth = 0.4, alpha = 0.7) +
  # OECD-17 average (connected across both segments)
  geom_line(data = avg_full,
            aes(year, spend),
            colour = col_avg, linewidth = 1.6) +
  # Croatia
  geom_line(data = hr_full,
            aes(year, spend),
            colour = col_hr, linewidth = 1.3) +
  geom_point(data = hr_full,
             aes(year, spend),
             colour = col_hr, size = 1.3) +
  # seam marker at end of Tanzi/Schuknecht historical benchmarks
  geom_vline(xintercept = 1996.5, linetype = "22",
             colour = "grey55", linewidth = 0.5) +
  # labels
  annotate("text", x = 1870, y = 57,
           label = "Prosjek 17 razvijenih zemalja",
           hjust = 0, colour = col_avg, size = 3.0, fontface = "bold") +
  annotate("text", x = 1994, y = 56,
           label = "Hrvatska",
           hjust = 0, colour = col_hr, size = 3.0, fontface = "bold") +
  annotate("text", x = 1997, y = 3.5,
           label = "← povijest (Tanzi & Schuknecht) | moderni panel →",
           hjust = 0, size = 2.5, colour = "grey45") +
  scale_x_continuous(
    breaks = c(1870, 1913, 1937, 1960, 1980, 2000, 2010, 2020, 2024),
    limits = c(1870, 2026)
  ) +
  scale_y_continuous(
    labels = function(x) paste0(x, " %"),
    limits = c(0, 70),
    breaks = seq(0, 70, 10)
  ) +
  labs(
    title    = "Javna potrošnja: dugi luk od 1870. do danas",
    subtitle = "Opća država, rashodi kao udio BDP-a — prosjek 17 razvijenih zemalja i Hrvatska",
    x        = NULL,
    y        = "Udio u BDP-u",
    caption  = paste0(
      "Povijesni prosjeci (1870.–1996.): Tanzi i Schuknecht (2000), Tablica I.1.\n",
      "Moderna serija (2008.–2024.): Eurostat, gov_10a_main (S13 TE, PC_GDP).\n",
      "Hrvatska: WB/IMF procjene do 2007., Eurostat 2008.–2024."
    )
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title          = element_text(face = "bold", size = 13),
    plot.title.position = "plot",
    plot.subtitle       = element_text(colour = "grey30", size = 10),
    plot.caption        = element_text(colour = "grey45", size = 7.5,
                                       hjust = 0, lineheight = 1.3),
    panel.grid.minor    = element_blank(),
    panel.grid.major.x  = element_blank(),
    axis.text           = element_text(size = 9)
  )

out <- file.path(proj_root, "images/fig-longrun-spending.png")
ggsave(out, p, width = 11, height = 6.2, dpi = 150, bg = "white")
cat("Saved:", out, "\n")
