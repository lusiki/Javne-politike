files <- list.files("chapters", pattern = "[.]qmd$", full.names = TRUE)
for (f in files) {
  lines <- readLines(f, warn = FALSE, encoding = "UTF-8")
  in_code <- FALSE
  for (i in seq_along(lines)) {
    ln <- lines[i]
    if (grepl("^```", ln)) { in_code <- !in_code; next }
    if (in_code && grepl("^:::", ln)) cat(sprintf("%s:%d (::: in code): %s\n", f, i, ln))
    if (in_code && grepl("^---[[:space:]]*$", ln)) cat(sprintf("%s:%d (--- in code)\n", f, i))
  }
}
cat("done\n")
