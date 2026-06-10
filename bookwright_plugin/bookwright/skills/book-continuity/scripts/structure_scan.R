#!/usr/bin/env Rscript

# structure_scan.R - count the structural elements of each chapter.
# Usage: Rscript structure_scan.R chapters/*.qmd
# Prints, per chapter: opener present, count of Definicija, figures, callout-praksa,
# callout-empirija, and whether a closing exercise (callout-vjezba or a Vjezbe
# heading) is present. It only counts; book-continuity reads conventions.json and
# compares the counts to the bands.

args <- commandArgs(trailingOnly = TRUE)
if (length(args) < 1) stop("Provide one or more .qmd paths, e.g. Rscript structure_scan.R chapters/*.qmd")

opener_label <- "Vodi\u010d kroz poglavlje"

count_file <- function(path) {
  if (!file.exists(path)) { cat(sprintf("skip, not found  %s\n", path)); return(invisible()) }
  lines <- readLines(path, warn = FALSE, encoding = "UTF-8")
  n <- length(lines)

  opener   <- any(grepl(paste0("^#+\\s*", opener_label), lines))
  # Detect {#def-} div convention (e.g. ::: {#def-javni-izbor}) as well as old Definicija N.N format
  defs     <- sum(grepl("(^|\\s)Definicija\\s+[0-9]+\\.[0-9]+", lines)) +
              sum(grepl("^:::+\\s*\\{[^}]*#def-", lines))
  praksa   <- sum(grepl("^:::+\\s*\\{[^}]*\\.callout-praksa", lines))
  empirija <- sum(grepl("^:::+\\s*\\{[^}]*\\.callout-empirija", lines))
  vjezbe   <- any(grepl("^:::+\\s*\\{[^}]*\\.callout-vjezba", lines)) ||
              any(grepl("^#+\\s*Vje\u017ebe", lines))

  figs <- 0L
  in_code <- FALSE; code_is_fig <- FALSE; in_yaml <- FALSE
  for (i in seq_len(n)) {
    t <- trimws(lines[[i]])
    if (i == 1 && grepl("^---$", t)) { in_yaml <- TRUE; next }
    if (in_yaml) { if (grepl("^---$", t)) in_yaml <- FALSE; next }
    if (grepl("^(```|~~~)", t)) {
      if (!in_code) { in_code <- TRUE; code_is_fig <- FALSE }
      else { if (code_is_fig) figs <- figs + 1L; in_code <- FALSE }
      next
    }
    # Detect OJS chart blocks via //| label: fig-* as well as R chunk fig labels
    if (in_code) { if (grepl("^#\\|\\s*label:\\s*fig-", t) || (grepl("^#\\|", t) && grepl("fig-[A-Za-z0-9_-]+", t))) code_is_fig <- TRUE; next }
    if (grepl("^:::+\\s*\\{[^}]*#fig-", t)) { figs <- figs + 1L; next }
    if (grepl("^!\\[", t)) { figs <- figs + 1L; next }
  }

  cat(sprintf("%-34s opener %-3s  def %d  fig %d  praksa %d  empirija %d  vjezbe %s\n",
              basename(path), if (opener) "yes" else "NO",
              defs, figs, praksa, empirija, if (vjezbe) "yes" else "NO"))
}

for (p in args) count_file(p)
