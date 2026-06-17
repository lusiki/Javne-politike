suppressMessages(library(stringr))
txt <- "samo obican tekst bez biljeski"
m <- str_match_all(txt, "\\[\\^([^\\]]+)\\]")[[1]]
cat("class:", paste(class(m), collapse=","), "\n")
cat("dim:", paste(dim(m), collapse="x"), "\n")
markers <- m[, 2]
cat("markers length:", length(markers), "\n")
markers <- unique(markers)
cat("after unique:", length(markers), "\n")
if (length(markers) > 0) cat("would build notes\n") else cat("no notes branch -- OK\n")
