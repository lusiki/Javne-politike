# CLAUDE.md — Javne politike u Hrvatskoj

## Project overview

A Quarto book on Croatian public policy and public choice theory, co-authored by Milan Deskar-Škrbić, Petra Palić, and Luka Šikić. Published at [lusiki.github.io/Javne-politike](https://lusiki.github.io/Javne-politike/).

**All prose must be written in Croatian (hr-HR).** Do not draft chapter content in English.

## Tech stack

- Quarto book (`type: book`), HTML output to `docs/`
- R + renv for code execution (lockfile: `renv.lock`)
- SCSS theming via `styles/custom.scss` and `_brand.yml`
- Pre-render hook: `R/build-ai-exports.R` runs on every `quarto render`, generating
  `docs/ai/*.md`, `docs/llms.txt`, `docs/llms-full.txt`, and `data/ai-exports.json`
- Deployed to GitHub Pages via GitHub Actions on every push to `main`

## Navbar / site structure

Eight tabs in the pinned navbar (defined in `_quarto.yml` `book.navbar.left`). The
last tab, **Nastava**, is a dropdown menu grouping the three teaching pages:

| Tab | Source file |
|-----|-------------|
| Knjiga | `chapters/00-uvod.qmd` (entry point to the chapter sidebar) |
| Vodič | `vodic.qmd` |
| Pojmovnik | `pojmovnik.qmd` |
| Resursi | `resursi.qmd` |
| Alat | `alat.qmd` |
| Podaci | `podaci.qmd` |
| Uči uz AI | `uci-s-ai.qmd` |
| Nastava (dropdown) | `predavanja.qmd` (Predavanja) · `silabus.qmd` (Silabus) · `raspored.qmd` (Tjedni raspored) |

## Build commands

```bash
quarto preview          # live preview in browser
quarto render           # full render to docs/
quarto render --profile pdf   # render PDF via _quarto-pdf.yml
```

## File layout

```
chapters/             active .qmd chapter files (canonical list: _quarto.yml)
vodic/                vodič subpages — one mental-map page per chapter (01–21 plus 06a — 22 subpages;
                      hidden from sidebar via pruneSidebar in book-include.html)
predavanja/           reveal.js lecture decks (underscore-prefixed .qmd source + committed .html,
                      statecraft.scss) — served as resources, see Nastava ▸ Predavanja tab
styles/               custom.scss, _dark.scss, _atlas.scss, _vodic.scss, _nastava.scss, styles.css, book-include.html
R/                    setup.R (sourced in each chapter), theme_book.R (ggplot2 theme),
                      build-ai-exports.R (pre-render hook → docs/ai/, docs/llms*.txt, data/ai-exports.json),
                      build-concept-graph.R (manual → data/concept-graph.json),
                      fetch_atlas_data.R (manual → data/atlas/*.csv)
scripts/              render-pdf.ps1, render-prirucnik-pdf.ps1, svg-to-png.R (operator-run helpers)
data/                 datasets used by chapters (atlas/*.csv, concept-graph.json, ai-exports.json)
images/               static brand/visual assets (infographics/, prirucnik/ frontispieces)
pdf-filters/          Lua filters applied during PDF render (strip-ojs.lua, swap-svg-png.lua)
pdf/                  rendered PDF output — two files: Javne-politike.pdf (full book, via --profile pdf)
                      and Prirucnik.pdf (standalone A5 citizen guide, via scripts/render-prirucnik-pdf.ps1)
docs/                 HTML build output — do NOT hand-edit, regenerated on render
_freeze/              Quarto execution cache — do NOT hand-edit
renv/, renv.lock      R package library + lockfile (pinned versions)
notes/                specs and audit reports (vodic-specifikacija.md, ai-export-spec.md,
                      izvjestaj-*.md reports, platform-vision.md, frontier-expansion.md, etc.)
bookwright_plugin/    editorial-team tooling (manager + critics agents); self-contained, not a build dep
index.qmd             landing page (hero, cover-card, collapsible TOC)
references.qmd        appendix: bibliography page
vodic.qmd             vodič hub — visual "slikovnica" of the book (spec: notes/vodic-specifikacija.md)
pojmovnik.qmd         appendix: interactive glossary (concept graph from data/concept-graph.json)
prirucnik.qmd         appendix: citizen guide (standalone A5 PDF via scripts/render-prirucnik-pdf.ps1)
resursi.qmd           appendix: resource list
alat.qmd              appendix: tools
podaci.qmd            appendix: datasets reference (Atlas data from data/atlas/)
uci-s-ai.qmd          appendix: "Uči uz AI" — AI-assisted study page (reads data/ai-exports.json)
predavanja.qmd        Nastava ▸ Predavanja: lecture-deck hub (vd-hub cards → predavanja/ HTML decks)
silabus.qmd           Nastava ▸ Silabus: course syllabus (Javne politike, studij sociologije,
                      nositeljica Petra Palić); book's 5 dijelova → weekly plan; styled via _nastava.scss
raspored.qmd          Nastava ▸ Tjedni raspored: weekly schedule (status badges, links to chapters)
404.qmd               custom 404 page (Quarto special-cased, keep)
references.bib        BibTeX bibliography for all citations
STYLE.md              editorial style guide (see Content conventions § Editorial style)
ENRICHMENT.md         guide for substantive paragraph insertions into chapters
_quarto.yml           master config — chapter order, theme, HTML format options
_quarto-pdf.yml       PDF profile config — `quarto render --profile pdf`
_brand.yml            typography and color tokens
cover.png             book cover image
ph3.jpg               OG/Twitter share image (referenced in _quarto.yml open-graph + twitter-card)
robots.txt            crawl directives (copied to docs/ as a build resource)
```

## Active chapters

The canonical chapter list is defined in `_quarto.yml`. The `chapters/` folder
currently contains exactly the 23 canonical active `.qmd` files (00-uvod through
21-reforme, plus 06a-teorija-igara) — there are no orphan source files. Stale
artifacts from earlier numbering survive only as gitignored `*_cache/` and
`*_files/` dirs (Quarto-regenerable, not source), not as `.qmd`.

Current structure (from `_quarto.yml`) — 21 numbered chapters (plus `06a`) in 5 parts + intro:

- **Uvod** (ch. 0): Zašto bismo otvorili ovu knjigu? (`00-uvod`)
- **DIO I — Klasična analiza javnih financija i politika** (ch. 1–5):
  Uloga države, Alokacijska funkcija, Distribucijska funkcija, Stabilizacijska funkcija,
  Porezi (teorija oporezivanja — `05-porezi`)
- **DIO II — Javni izbor – što, kako i zašto?** (ch. 6, 6a, 7–10):
  Javni izbor, Teorija igara (`06a`), Kolektivni izbor, Stranke i izbori, Interesne skupine, Birokracija
- **DIO III — Nova institucionalna i konstitucionalna ekonomika** (ch. 11–12):
  Institucionalna ekonomika, Konstitucionalna ekonomika
- **DIO IV — Javne financije i javne politike u praksi** (ch. 13–16):
  Instrumenti, Javna potrošnja, Porezni sustavi u praksi (`15-porezi-praksa`), Javne financije EU
- **DIO V — Kako do kvalitetnijih javnih politika?** (ch. 17–21):
  Državni neuspjesi, Novi javni menadžment, Novo upravljanje, CBA i evaluacija, Reforme

The taxation material is split: the **theory** chapter (`05-porezi`) sits in DIO I as the
revenue side of the classical functions, while the **practice** chapter
(`15-porezi-praksa`) stays in DIO IV. Cross-references between them are textual
("u poglavlju o porezima"), never numeric.

## Content conventions

### Editorial style
Every chapter must follow [STYLE.md](STYLE.md) — Croatian-language editorial guide
(no colons in prose, no mid-sentence em-dashes as list introducers, no mechanical
takeaway formulae, no meta-callouts in flowing text, minimal use of restatement
connectives like "Drugim riječima,"). Run a full sweep against its hard rules
before committing any chapter prose edit.

### Substantive enrichment
Adding 1–2 paragraph insertions to thicken an under-developed chapter follows
[ENRICHMENT.md](ENRICHMENT.md) — five value slots (mechanism, empirics,
comparative, trade-off, methodology), an asymmetry test for locating insertion
points, and a hard constraint of no Croatian-specific examples (those are
reserved for the co-authors).

### Citations
Use `[@key]` syntax against `references.bib`. Margin citations are enabled.

### Pedagogical callouts
Three custom callout types used throughout the book:

```markdown
::: {.callout-praksa}
"Politika u praksi" — real-world policy example
:::

::: {.callout-empirija}
"Empirijski dokaz" — empirical finding or data point
:::

::: {.callout-vjezba}
"Vježba s podacima" — student exercise
:::
```

### Theorem environments
Croatian labels are configured. Use Quarto's native theorem syntax:

```markdown
::: {#prp-naziv}
**Propozicija.** ...
:::

::: {#thm-naziv}
**Teorem.** ...
:::
```

Definition divs use `#def-` ids. The term is bolded inside the defining sentence — no label prefix:

```markdown
::: {#def-naziv}
Pojam je **naziv** ako...
:::
```

### R code in chapters
Source `R/setup.R` at the top of each chapter to load packages and the book ggplot2 theme:

```r
source("R/setup.R")
```

Use `pubfin_colors`, `scale_fill_pubfin()`, and `scale_color_pubfin()` for charts.
Brand colors come from the STATECRAFT palette (see Theming below): the `pubfin_colors`
keys `navy` and `gold` now resolve to ink `#1C1916` and ochre `#C8985E` — use
`scale_*_pubfin()` rather than hardcoding hex values.

### OJS / Observable
Interactive charts use OJS blocks (`{ojs}`). These execute in the browser, not via R.

## Theming

STATECRAFT palette (`_brand.yml`, `styles/custom.scss`):

- **Background**: paper `#F2EDE3` (warm cream — never pure white)
- **Body text**: ink `#1C1916` (near-black with brown undertone)
- **Primary accent**: verdigris `#4A6B5C` (links, buttons, active states)
- **Emphasis**: oxblood `#6B1F26` (callout borders, destructive actions only)
- **Archival accent**: ochre `#C8985E` (timeline accent)
- **Body font**: Newsreader (serif) — prose body is serif; `custom.scss` sets `body{font-family:Newsreader}` and wins over `_brand.yml`
- **UI / sans register**: Public Sans (sidenotes, callout labels, chips, buttons)
- **Display/headings**: Newsreader (serif)
- **Monospace**: IBM Plex Mono

SCSS variable mapping (legacy `$brand-*` names map to STATECRAFT tokens):
- `$brand-navy` → ink `#1C1916`; `$brand-gold` / `$brand-burgundy` → verdigris `#4A6B5C`; `$brand-cream` → paper `#F2EDE3`

Dark mode styles in `styles/_dark.scss`. Do not change font families without updating both `_brand.yml` and `styles/custom.scss`.

## R / renv

R package versions are pinned in `renv.lock`. To restore the environment:

```r
renv::restore()
```

Quarto uses `freeze: auto` — chunks only re-execute when their source changes.
Do not delete `_freeze/` unless you want a full re-render of all R code.

## Deployment

Pushing to `main` triggers `.github/workflows/publish.yml`, which:
1. Renders the full book with `quarto render`
2. Uploads `docs/` to GitHub Pages

### PDF rebuild workflow

Two PDFs are maintained in `pdf/` and mirrored into `docs/pdf/`:

**Full book (`Javne-politike.pdf`)** — canonical local method:

1. `quarto render --profile pdf` → writes `pdf/Javne-politike.pdf`
2. `cp pdf/Javne-politike.pdf docs/pdf/Javne-politike.pdf`
3. Commit both files with `docs(pdf):` prefix and push

**Citizen guide (`Prirucnik.pdf`)** — standalone A5 PDF:

1. Run `scripts/render-prirucnik-pdf.ps1` (PowerShell)
2. Commit `pdf/Prirucnik.pdf` and `docs/pdf/Prirucnik.pdf` with `docs(pdf):` prefix

The CI workflow also attempts the full-book PDF render with `continue-on-error: true`.
If CI's render succeeds, it overwrites the committed PDF in the deploy artifact.
If CI's render fails (common — TinyTeX in CI sometimes misses LaTeX packages or
fonts), the committed PDF is served as-is. So the deployed PDF is always at
least as fresh as the last `docs(pdf):` commit on `main`.

## Commit conventions

Project uses Conventional Commits–style prefixes:

- `copy(<slug>):` — prose/copy edit (chapter rewrites, landing copy)
- `style(<slug>):` — SCSS / layout / visual change
- `feat(<slug>):` — new feature or component
- `fix(<slug>):` — bug fix
- `ci:` — GitHub Actions workflow change
- `docs(<slug>):` — generated artifact rebuild (e.g. `docs(pdf):` for a fresh PDF)
- `build:` — render output

The slug is the chapter file basename without numeric prefix (e.g. `copy(uvod):`,
`copy(ch1):`, or `copy(uloga-drzave):`). Use `landing` for `index.qmd`.

## Branching convention

Experimental features use the `experiment/*` prefix (e.g. `experiment/wave-1-pedagogy`).
When an experiment is ready, cherry-pick or checkout specific files into `main` — do not
rely on `git merge` blindly, as branch histories can diverge unexpectedly.

## Do NOT

- Hand-edit files in `docs/` or `_freeze/` — they are build artifacts
- Break the chapter order in `_quarto.yml`
- Write prose in English
- Commit `index_cache/`, `index_files/`, `tmp/`, or `.Rhistory`
- Commit root-level `tmp_*.R` or `tmp_*.py` scratch files (add to `.gitignore` and
  delete instead; `tmp/` dir is already gitignored for this reason)
