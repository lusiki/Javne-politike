# build-ai-exports.R --------------------------------------------------------
# AI-konzumabilni izvoz knjige (Track A, vidi notes/ai-export-spec.md).
#
# Što radi:
#   1. Iz _quarto.yml čita kanonski redoslijed poglavlja i pripadnost DIO-u.
#   2. Svako poglavlje pretvara iz .qmd u čisti tekstualni .md (skida YAML,
#      code-blokove {r}/{ojs}, OJS upravljačke ploče i PDF-blizance; zadržava
#      prozu, naslove, tablice, formule, definicije i sadržaj callout-kutija;
#      razrješuje [@citate], @crossref-ove i bilješke u čitljiv tekst).
#   3. Piše:
#        docs/ai/<poglavlje>.md      — radni konj, jedno poglavlje po datoteci
#        docs/ai/dio-1.md … dio-5.md — paketi po DIO-u
#        docs/llms-full.txt          — cijela knjiga u jednoj datoteci
#        docs/llms.txt               — karta (llmstxt.org) s poveznicama
#        data/ai-exports.json        — manifest koji čita stranica uci-s-ai.qmd
#
# Pokreni ručno kad se poglavlja promijene (kao i build-concept-graph.R):
#   "C:/Program Files/R/R-4.5.2/bin/Rscript.exe" R/build-ai-exports.R
# U CI-ju se pokreće automatski kao Quarto `pre-render` hook (vidi _quarto.yml).
# ---------------------------------------------------------------------------

suppressMessages({
  library(yaml)
  library(jsonlite)
  library(stringr)
  library(stringi)
})

# --- konfiguracija (uredi ovdje; ovo su autorske odluke) -------------------
SITE_URL   <- "https://lusiki.github.io/Javne-politike"
BOOK_TITLE <- "Sve što želite znati o državi i javnim politikama u Hrvatskoj"
BOOK_DESC  <- paste(
  "Praktični i interaktivni udžbenik o javnim financijama, teoriji javnog",
  "izbora i javnim politikama u Hrvatskoj — uloga države, alokacija,",
  "redistribucija, institucije i reforme."
)
AUTHORS    <- "Milan Deskar-Škrbić, Petra Palić, Luka Šikić"
# Licenca izvoza je autorska odluka (vidi notes/ai-export-spec.md, Open decisions).
# Zadano je konzervativno: tekst se smije koristiti za osobno učenje uz navođenje.
LICENSE_LINE <- paste0(
  "© 2026 ", AUTHORS,
  ". Tekst za osobno i obrazovno korištenje uz navođenje izvora."
)

PROJECT_ROOT <- normalizePath(".", winslash = "/")
QUARTO_YML   <- file.path(PROJECT_ROOT, "_quarto.yml")
BIB_FILE     <- file.path(PROJECT_ROOT, "references.bib")
AI_DIR       <- file.path(PROJECT_ROOT, "docs", "ai")
DATE_STR     <- format(Sys.Date())

# Cijeli posao u tryCatch-u: kao pre-render hook NIKAD ne smije srušiti render.
main <- function() {

  # --- 1. redoslijed poglavlja + DIO mapiranje iz _quarto.yml --------------
  book <- yaml::read_yaml(QUARTO_YML)$book$chapters

  chapters <- list()   # poredani popis: list(file, dio, dioLabel)
  dio_counter <- 0L
  for (entry in book) {
    if (is.character(entry)) {
      if (entry == "index.qmd") next            # naslovnica (marketing) — preskoči
      chapters[[length(chapters) + 1L]] <-
        list(file = entry, dio = 0L, dioLabel = "Uvod")
    } else if (is.list(entry) && !is.null(entry$part)) {
      dio_counter <- dio_counter + 1L
      for (ch in entry$chapters) {
        chapters[[length(chapters) + 1L]] <-
          list(file = ch, dio = dio_counter, dioLabel = entry$part)
      }
    }
  }
  chapters <- Filter(function(c) file.exists(file.path(PROJECT_ROOT, c$file)), chapters)

  # --- 2. bibliografija: ključ -> "Prezime, godina" -----------------------
  bib_map <- parse_bib(BIB_FILE)

  # --- 3. registar pojmova (def/prp/thm) za razrješavanje @crossref-ova ----
  xref_map <- collect_xref_terms(vapply(chapters, function(c) c$file, character(1)))

  # --- 4. obradi svako poglavlje ------------------------------------------
  dir.create(AI_DIR, showWarnings = FALSE, recursive = TRUE)
  for (i in seq_along(chapters)) {
    c <- chapters[[i]]
    path  <- file.path(PROJECT_ROOT, c$file)
    lines <- readLines(path, warn = FALSE, encoding = "UTF-8")
    title <- extract_title(lines, c$file)
    base  <- str_replace(basename(c$file), "\\.qmd$", "")

    body  <- strip_chapter(lines, bib_map, xref_map)
    words <- str_count(paste(body, collapse = " "), "\\S+")

    header <- chapter_header(title, base)
    md <- paste(c(header, "", body), collapse = "\n")

    write_utf8(md, file.path(AI_DIR, paste0(base, ".md")))

    chapters[[i]]$title <- title
    chapters[[i]]$base  <- base
    chapters[[i]]$md    <- md
    chapters[[i]]$words <- words
  }

  # --- 5. paketi po DIO-u (dio-1.md … dio-5.md) ---------------------------
  for (d in seq_len(dio_counter)) {
    members <- Filter(function(c) c$dio == d, chapters)
    if (length(members) == 0) next
    label <- members[[1]]$dioLabel
    head_md <- paste0(
      "# ", label, "\n\n",
      "> Iz knjige: ", BOOK_TITLE, "\n",
      "> Autori: ", AUTHORS, "\n",
      "> Paket poglavlja ovog dijela knjige za korištenje s AI-asistentima.\n",
      "> Generirano: ", DATE_STR, " · ", LICENSE_LINE, "\n"
    )
    parts <- vapply(members, function(c) c$md, character(1))
    write_utf8(paste(c(head_md, parts), collapse = "\n\n---\n\n"),
               file.path(AI_DIR, paste0("dio-", d, ".md")))
  }

  # --- 6. cijela knjiga: docs/llms-full.txt -------------------------------
  full_head <- paste0(
    "# ", BOOK_TITLE, "\n\n",
    "> ", BOOK_DESC, "\n",
    "> Autori: ", AUTHORS, "\n",
    "> Izvor: ", SITE_URL, "\n",
    "> Cjelovita tekstualna verzija knjige za korištenje s AI-asistentima.\n",
    "> Generirano: ", DATE_STR, " · ", LICENSE_LINE, "\n"
  )
  all_parts <- vapply(chapters, function(c) c$md, character(1))
  write_utf8(paste(c(full_head, all_parts), collapse = "\n\n---\n\n"),
             file.path(PROJECT_ROOT, "docs", "llms-full.txt"))

  # --- 7. karta: docs/llms.txt (llmstxt.org) ------------------------------
  write_utf8(build_llms_txt(chapters, dio_counter),
             file.path(PROJECT_ROOT, "docs", "llms.txt"))

  # --- 8. manifest za stranicu: data/ai-exports.json ----------------------
  write_manifest(chapters, dio_counter)

  # --- izvještaj (de-risk korak iz spec-a) --------------------------------
  fmt <- function(x) format(x, big.mark = ".", decimal.mark = ",")
  tw <- sum(vapply(chapters, function(c) c$words, integer(1)))
  message(sprintf("Poglavlja izvezena: %d", length(chapters)))
  message(sprintf("Ukupno riječi (bez koda): %s  (~%s tokena, gruba procjena)",
                  fmt(tw), fmt(round(tw * 1.6))))
  big <- chapters[[which.max(vapply(chapters, function(c) c$words, integer(1)))]]
  message(sprintf("Najveće poglavlje: %s — %s riječi (~%sk tokena)",
                  big$base, fmt(big$words), round(big$words * 1.6 / 1000)))
  message(sprintf("Zapisano u %s, docs/llms.txt, docs/llms-full.txt, data/ai-exports.json",
                  AI_DIR))
}

# ===========================================================================
# pomoćne funkcije
# ===========================================================================

write_utf8 <- function(text, path) {
  con <- file(path, open = "wb")
  on.exit(close(con))
  writeLines(enc2utf8(text), con, useBytes = TRUE)
}

extract_title <- function(lines, file) {
  ttl <- str_match(paste(head(lines, 25), collapse = "\n"),
                   "(?m)^title:\\s*\"([^\"]+)\"")[, 2]
  if (is.na(ttl)) ttl <- str_match(paste(head(lines, 25), collapse = "\n"),
                                   "(?m)^title:\\s*(.+?)\\s*$")[, 2]
  if (is.na(ttl)) file else str_trim(ttl)
}

chapter_header <- function(title, base) {
  paste0(
    "# ", title, "\n\n",
    "> Iz knjige: ", BOOK_TITLE, "\n",
    "> Autori: ", AUTHORS, "\n",
    "> Izvor: ", SITE_URL, "/chapters/", base, ".html\n",
    "> Tekstualna verzija poglavlja za korištenje s AI-asistentima.\n",
    "> Generirano: ", DATE_STR, " · ", LICENSE_LINE, "\n\n",
    "---"
  )
}

# --- bibliografija ---------------------------------------------------------
# Vrlo tolerantan parser: ključ -> "Prezime, godina". Ako nešto ne uspije,
# fallback je goli ključ (nikad ne ruši izvoz).
parse_bib <- function(bib_file) {
  out <- list()
  if (!file.exists(bib_file)) return(out)
  raw <- paste(readLines(bib_file, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
  entries <- str_split(raw, "(?m)^@")[[1]]
  for (e in entries) {
    key <- str_match(e, "^[A-Za-z]+\\s*\\{\\s*([^,\\s]+)\\s*,")[, 2]
    if (is.na(key)) next
    author <- str_match(e, "(?is)author\\s*=\\s*[{\"](.*?)[}\"]\\s*,?\\s*\\n")[, 2]
    year   <- str_match(e, "(?i)(?:year|date)\\s*=\\s*[{\"]?\\s*(\\d{4})")[, 2]
    surname <- NA_character_
    if (!is.na(author)) {
      first <- str_trim(str_split(author, "\\s+and\\s+")[[1]][1])
      surname <- if (str_detect(first, ",")) str_trim(str_split(first, ",")[[1]][1])
                 else str_extract(first, "\\S+$")
    }
    label <- if (!is.na(surname) && !is.na(year)) paste0(surname, ", ", year)
             else if (!is.na(surname)) surname
             else if (!is.na(year)) year
             else key
    out[[key]] <- label
  }
  out
}

# --- registar pojmova za @def-/@prp-/@thm- crossref-ove --------------------
collect_xref_terms <- function(files) {
  m <- list()
  open_re <- "^:::+\\s*\\{#(def|prp|thm|lem|cor|exm|exr)-([^}]+)\\}"
  for (f in files) {
    path <- file.path(PROJECT_ROOT, f)
    if (!file.exists(path)) next
    lines <- readLines(path, warn = FALSE, encoding = "UTF-8")
    i <- 1L; n <- length(lines)
    while (i <= n) {
      mm <- str_match(lines[i], open_re)
      if (!is.na(mm[1, 1])) {
        kind <- mm[1, 2]; slug <- mm[1, 3]
        # prvi podebljani spomen u sljedećih nekoliko redaka = prikazni pojam
        look <- paste(lines[i:min(n, i + 6L)], collapse = " ")
        term <- str_match(look, "\\*\\*([^*]+)\\*\\*")[, 2]
        if (is.na(term)) term <- slug
        m[[paste0(kind, "-", slug)]] <- str_trim(term)
      }
      i <- i + 1L
    }
  }
  m
}

# --- razrješavanje @ključeva (citati + crossref) u tekstu ------------------
XREF_WORD <- c(fig = "slika", tbl = "tablica", sec = "odjeljak",
               eq = "jednadžba", lst = "isječak")

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
  # (a) zagrade s ključevima: [@a; @b], [-@a], [vidi @a, str. 5]
  # (str_replace_all funkciji predaje SVE pogotke odjednom -> vektoriziraj)
  line <- str_replace_all(line, "\\[([^\\]]*@[^\\]]+)\\]", function(br) {
    vapply(br, function(one) {
      inner <- str_sub(one, 2, -2)
      keys <- str_match_all(inner, "-?@([A-Za-z0-9_:.\\-]+)")[[1]][, 2]
      if (length(keys) == 0) return(one)
      labs <- vapply(keys, resolve_one_key, character(1), bib_map, xref_map)
      paste0("(", paste(labs, collapse = "; "), ")")
    }, character(1), USE.NAMES = FALSE)
  })
  # (b) goli @ključ (narativno spominjanje izvan zagrada)
  line <- str_replace_all(line, "(?<![\\w@])-?@([A-Za-z0-9_:.\\-]+)", function(tok) {
    vapply(tok, function(one) {
      key <- str_replace(one, "^-?@", "")
      resolve_one_key(key, bib_map, xref_map)
    }, character(1), USE.NAMES = FALSE)
  })
  line
}

# --- čišćenje proznog retka ------------------------------------------------
clean_inline <- function(line, bib_map, xref_map) {
  line <- resolve_refs(line, bib_map, xref_map)
  # slike: ![alt](path) -> "alt" (zadrži opis, izbaci putanju)
  line <- str_replace_all(line, "!\\[([^\\]]*)\\]\\([^)]*\\)", "\\1")
  # poveznice: [tekst](http…) -> "tekst (url)"; [tekst](#…/relativno) -> "tekst"
  line <- str_replace_all(line, "\\[([^\\]]+)\\]\\((https?://[^)]+)\\)", "\\1 (\\2)")
  line <- str_replace_all(line, "\\[([^\\]]+)\\]\\([^)]*\\)", "\\1")
  # pandoc span: [tekst]{.klasa …} -> "tekst"
  line <- str_replace_all(line, "\\[([^\\]]+)\\]\\{[^}]*\\}", "\\1")
  # atributi na naslovima/elementima: "## Naslov {#sec-x}" -> "## Naslov"
  line <- str_replace(line, "\\s*\\{[#.][^}]*\\}\\s*$", "")
  str_trim(line, side = "right")
}

# --- glavni stripper: .qmd -> čisti markdown -------------------------------
strip_chapter <- function(lines, bib_map, xref_map) {
  out <- character(0)
  fnotes <- list()        # id -> tekst bilješke
  fnote_order <- character(0)
  in_yaml <- FALSE; seen_yaml <- FALSE
  in_code <- FALSE; cap_pending <- NA_character_
  div_stack <- character(0)   # "drop" (PDF-blizanac) ili "keep"

  drop_now <- function() any(div_stack == "drop")

  div_open_re  <- "^:::+\\s*\\{(.*)\\}\\s*$"
  div_close_re <- "^:::+\\s*$"
  code_fence_re<- "^```"
  cap_re       <- "^\\s*(?:#|//)\\|\\s*(?:fig|tbl)-cap:\\s*\"(.*)\"\\s*$"
  fnote_def_re <- "^\\[\\^([^\\]]+)\\]:\\s*(.*)$"

  label_for <- function(attrs) {
    if (str_detect(attrs, "callout-praksa"))   return("**Politika u praksi.**")
    if (str_detect(attrs, "callout-empirija")) return("**Empirijski dokaz.**")
    if (str_detect(attrs, "callout-vjezba"))   return("**Vježba s podacima.**")
    NA_character_
  }

  for (raw in lines) {
    ln <- raw

    # --- YAML front matter ---
    if (!seen_yaml && str_detect(ln, "^---\\s*$")) {
      in_yaml <- !in_yaml
      if (!in_yaml) seen_yaml <- TRUE
      next
    }
    if (in_yaml) next

    # --- div otvarač / zatvarač (uvijek ažuriraj stog, nikad ne ispisuj fence) ---
    mo <- str_match(ln, div_open_re)
    if (!is.na(mo[1, 1])) {
      attrs <- mo[1, 2]
      if (str_detect(attrs, "when-format=\"pdf\"")) {
        div_stack <- c(div_stack, "drop")
      } else {
        div_stack <- c(div_stack, "keep")
        if (!drop_now()) {
          lab <- label_for(attrs)
          if (!is.na(lab)) out <- c(out, "", lab)
        }
      }
      next
    }
    if (str_detect(ln, div_close_re)) {
      if (length(div_stack) > 0) div_stack <- div_stack[-length(div_stack)]
      next
    }

    # --- unutar PDF-blizanca: preskoči sve ---
    if (drop_now()) next

    # --- code fence (drži se izvan koda; hvataj caption, odbaci kod) ---
    if (str_detect(ln, code_fence_re)) {
      if (!in_code) {
        in_code <- TRUE; cap_pending <- NA_character_
      } else {
        in_code <- FALSE
        if (!is.na(cap_pending)) out <- c(out, "", paste0("*Slika. ", cap_pending, "*"))
      }
      next
    }
    if (in_code) {
      cm <- str_match(ln, cap_re)
      if (!is.na(cm[1, 1])) cap_pending <- cm[1, 2]
      next
    }

    # --- bilješka (definicija) -> sakupi, ne ispisuj na mjestu ---
    fm <- str_match(ln, fnote_def_re)
    if (!is.na(fm[1, 1])) {
      id <- fm[1, 2]
      fnotes[[id]] <- clean_inline(fm[1, 3], bib_map, xref_map)
      next
    }

    # --- obična prozna linija ---
    out <- c(out, clean_inline(ln, bib_map, xref_map))
  }

  # --- bilješke: inline [^id] -> [n], popis na kraju pod "## Bilješke" ---
  txt <- paste(out, collapse = "\n")
  markers <- str_match_all(txt, "\\[\\^([^\\]]+)\\]")[[1]][, 2]
  markers <- unique(markers)
  if (length(markers) > 0) {
    num <- setNames(seq_along(markers), markers)
    for (id in markers) {
      txt <- str_replace_all(txt, stringr::fixed(paste0("[^", id, "]")),
                             paste0("[", num[[id]], "]"))
    }
    notes <- vapply(markers, function(id) {
      body <- if (!is.null(fnotes[[id]])) fnotes[[id]] else ""
      paste0(num[[id]], ". ", body)
    }, character(1))
    txt <- paste0(txt, "\n\n## Bilješke\n\n", paste(notes, collapse = "\n"))
  }

  # počisti višak praznih redaka (najviše jedan prazan red zaredom)
  txt <- str_replace_all(txt, "\n{3,}", "\n\n")
  str_split(str_trim(txt), "\n")[[1]]
}

# --- llms.txt (karta) ------------------------------------------------------
build_llms_txt <- function(chapters, dio_counter) {
  L <- c(paste0("# ", BOOK_TITLE), "",
         paste0("> ", BOOK_DESC), "",
         paste0("Tekstualne (AI-čitljive) verzije poglavlja knjige dostupne na ",
                SITE_URL, ". Učitajte pojedino poglavlje radi najtočnijih odgovora ",
                "ili cijelu knjigu za širi pregled."), "")
  link <- function(c) paste0("- [", c$title, "](", SITE_URL, "/ai/", c$base, ".md)")
  intro <- Filter(function(c) c$dio == 0L, chapters)
  if (length(intro) > 0) {
    L <- c(L, "## Uvod", vapply(intro, link, character(1)), "")
  }
  for (d in seq_len(dio_counter)) {
    members <- Filter(function(c) c$dio == d, chapters)
    if (length(members) == 0) next
    L <- c(L, paste0("## ", members[[1]]$dioLabel),
           vapply(members, link, character(1)), "")
  }
  L <- c(L, "## Paketi i cijela knjiga",
         paste0("- [Cijela knjiga (jedna datoteka)](", SITE_URL, "/llms-full.txt)"))
  for (d in seq_len(dio_counter)) {
    members <- Filter(function(c) c$dio == d, chapters)
    if (length(members) == 0) next
    L <- c(L, paste0("- [", members[[1]]$dioLabel, " (paket)](",
                     SITE_URL, "/ai/dio-", d, ".md)"))
  }
  paste(L, collapse = "\n")
}

# --- manifest za uci-s-ai.qmd ----------------------------------------------
write_manifest <- function(chapters, dio_counter) {
  ch <- lapply(chapters, function(c) list(
    slug = c$base, title = c$title, dio = c$dio, dioLabel = c$dioLabel,
    url = paste0(SITE_URL, "/chapters/", c$base, ".html"),
    mdUrl = paste0(SITE_URL, "/ai/", c$base, ".md"),
    words = c$words, tokensApprox = round(c$words * 1.6)
  ))
  dios <- lapply(seq_len(dio_counter), function(d) {
    members <- Filter(function(x) x$dio == d, chapters)
    if (length(members) == 0) return(NULL)
    list(n = d, label = members[[1]]$dioLabel,
         mdUrl = paste0(SITE_URL, "/ai/dio-", d, ".md"))
  })
  dios <- Filter(Negate(is.null), dios)
  prompt <- paste0(
    "Ti si mentor za udžbenik „", BOOK_TITLE, "”. ",
    "Odgovaraj na hrvatskom, oslanjaj se samo na priloženi tekst, ",
    "citiraj poglavlja i reci „ne znam” ako odgovora nema u tekstu."
  )
  out <- list(
    generated = DATE_STR,
    book = list(title = BOOK_TITLE, description = BOOK_DESC, url = SITE_URL),
    prompt = prompt,
    full = list(mdUrl = paste0(SITE_URL, "/llms-full.txt"),
                mapUrl = paste0(SITE_URL, "/llms.txt")),
    dios = dios,
    chapters = ch
  )
  path <- file.path(PROJECT_ROOT, "data", "ai-exports.json")
  dir.create(dirname(path), showWarnings = FALSE, recursive = TRUE)
  write_json(out, path, auto_unbox = TRUE, pretty = TRUE)
}

# ===========================================================================
tryCatch(
  main(),
  error = function(e) {
    message("build-ai-exports.R: GREŠKA — izvoz preskočen: ", conditionMessage(e))
    # status 0: kao pre-render hook ne smije srušiti `quarto render`
  }
)
