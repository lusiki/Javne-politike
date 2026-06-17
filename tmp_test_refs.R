suppressMessages(library(stringr))

XREF_WORD <- c(fig = "slika", tbl = "tablica", sec = "odjeljak",
               eq = "jednadžba", lst = "isječak")

bib_map <- list(gibbard1973 = "Gibbard, 1973", satterthwaite1975 = "Satterthwaite, 1975",
                stigler1971 = "Stigler, 1971", europeanfiscalboard2024 = "European Fiscal Board, 2024")
xref_map <- list("prp-ramsey" = "Ramseyevo pravilo", "def-javni-izbor" = "javni izbor")

resolve_one_key <- function(key, bib_map, xref_map) {
  kind <- str_match(key, "^(fig|tbl|sec|eq|lst|def|prp|thm|lem|cor|exm|exr)-")[, 2]
  if (!is.na(kind)) {
    if (kind %in% names(XREF_WORD)) return(XREF_WORD[[kind]])
    term <- xref_map[[key]]
    if (!is.null(term)) return(term)
    return(c(def = "definicija", prp = "propozicija", thm = "teorem",
             lem = "lema", cor = "korolar", exm = "primjer",
             exr = "vježba")[[kind]])
  }
  lbl <- bib_map[[key]]
  if (!is.null(lbl)) lbl else key
}

resolve_refs <- function(line, bib_map, xref_map) {
  line <- str_replace_all(line, "\\[([^\\]]*@[^\\]]+)\\]", function(br) {
    vapply(br, function(one) {
      inner <- str_sub(one, 2, -2)
      keys <- str_match_all(inner, "-?@([A-Za-z0-9_:.\\-]+)")[[1]][, 2]
      if (length(keys) == 0) return(one)
      labs <- vapply(keys, resolve_one_key, character(1), bib_map, xref_map)
      paste0("(", paste(labs, collapse = "; "), ")")
    }, character(1), USE.NAMES = FALSE)
  })
  line <- str_replace_all(line, "(?<![\\w@])-?@([A-Za-z0-9_:.\\-]+)", function(tok) {
    vapply(tok, function(one) {
      key <- str_replace(one, "^-?@", "")
      resolve_one_key(key, bib_map, xref_map)
    }, character(1), USE.NAMES = FALSE)
  })
  line
}

tests <- c(
  "nije neutralan [@gibbard1973; @satterthwaite1975].",
  "@tbl-sustavi-glasovanja sažima ključne sustave.",
  "proizlazi Ramseyevo pravilo iz @prp-ramsey, jer ako su",
  "pravila [@europeanfiscalboard2024; @wyplosz2013].",
  "vidi @stigler1971 za detalje",
  "[-@gibbard1973] je rekao",
  "cijena je 5@10 EUR i e-mail test@example.com",
  "Stigler (@stigler1971)",
  "[vidi @stigler1971, str. 5]",
  "definicija @def-javni-izbor objašnjava",
  "marker [^wp-ch01] na kraju",
  "dva @gibbard1973 i @satterthwaite1975 u nizu"
)
for (t in tests) {
  cat("IN : ", t, "\n", sep="")
  cat("OUT: ", resolve_refs(t, bib_map, xref_map), "\n\n", sep="")
}
