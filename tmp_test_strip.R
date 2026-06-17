PROJECT_ROOT <- normalizePath(".", winslash = "/")
source("R/build-ai-exports.R", local = TRUE)
# Override main so sourcing doesn't run the whole pipeline:
RSCRIPT
