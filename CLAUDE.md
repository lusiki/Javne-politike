# CLAUDE.md — Javne politike u Hrvatskoj

## Project overview

A Quarto book on Croatian public policy and public choice theory, co-authored by Milan Deskar-Škrbić, Petra Palić, and Luka Šikić. Published at [lusiki.github.io/Javne-politike](https://lusiki.github.io/Javne-politike/).

**All prose must be written in Croatian (hr-HR).** Do not draft chapter content in English.

## Tech stack

- Quarto book (`type: book`), HTML output to `docs/`
- R + renv for code execution (lockfile: `renv.lock`)
- SCSS theming via `styles/custom.scss` and `_brand.yml`
- Deployed to GitHub Pages via GitHub Actions on every push to `main`

## Build commands

```bash
quarto preview          # live preview in browser
quarto render           # full render to docs/
quarto render --profile pdf   # render PDF via _quarto-pdf.yml
```

## File layout

```
chapters/             active .qmd chapter files (canonical list: _quarto.yml)
styles/               custom.scss, _dark.scss, styles.css, book-include.html
R/                    setup.R (sourced in each chapter), theme_book.R (ggplot2 theme)
data/                 datasets used by chapters
images/               static brand/visual assets
pdf-filters/          Lua filters applied during PDF render (strip-ojs.lua)
pdf/                  rendered PDF output — see PDF rebuild workflow below
docs/                 HTML build output — do NOT hand-edit, regenerated on render
_freeze/              Quarto execution cache — do NOT hand-edit
renv/, renv.lock      R package library + lockfile (pinned versions)
index.qmd             landing page (hero, cover-card, collapsible TOC)
references.qmd        appendix: bibliography page
vodic.qmd             appendix: companion guide ("Država, tržište i institucije")
resursi.qmd           appendix: resource list
alat.qmd              appendix: tools
podaci.qmd            appendix: datasets reference
references.bib        BibTeX bibliography for all citations
STYLE.md              editorial style guide (see Content conventions § Editorial style)
_quarto.yml           master config — chapter order, theme, HTML format options
_quarto-pdf.yml       PDF profile config — `quarto render --profile pdf`
_brand.yml            typography and color tokens
cover.png             book cover image
```

Root-level `.qmd` files not listed above (`intro.qmd`, `summary.qmd`) are orphans
from earlier numbering revisions — same caveat as the chapters/ orphans below.

## Active chapters

The canonical chapter list is defined in `_quarto.yml`. Many `.qmd` files in
`chapters/` are orphans from earlier numbering revisions — do not assume every
file in that folder is part of the book.

Current structure (from `_quarto.yml`) — 20 chapters in 5 parts + intro:

- **Uvod** (ch. 0): Zašto bismo otvorili ovu knjigu? (`00-uvod`)
- **DIO I — Klasična analiza javnih financija i politika** (ch. 1–4):
  Uloga države, Alokacijska funkcija, Distribucijska funkcija, Stabilizacijska funkcija
- **DIO II — Javni izbor – što, kako i zašto?** (ch. 5–9):
  Javni izbor, Kolektivni izbor, Stranke i izbori, Interesne skupine, Birokracija
- **DIO III — Nova institucionalna i konstitucionalna ekonomika** (ch. 10–11):
  Institucionalna ekonomika, Konstitucionalna ekonomika
- **DIO IV — Javne financije i javne politike u praksi** (ch. 12–14):
  Instrumenti, Javna potrošnja, Porezi
- **DIO V — Kako do kvalitetnijih javnih politika?** (ch. 15–19):
  Državni neuspjesi, Novi javni menadžment, Novo upravljanje, CBA i evaluacija, Reforme

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
Brand colors: navy `#1B2A4A`, gold `#C8942D`, slate `#4A5568`.

### OJS / Observable
Interactive charts use OJS blocks (`{ojs}`). These execute in the browser, not via R.

## Theming

STATECRAFT palette (`_brand.yml`, `styles/custom.scss`):

- **Background**: paper `#F2EDE3` (warm cream — never pure white)
- **Body text**: ink `#1C1916` (near-black with brown undertone)
- **Primary accent**: verdigris `#4A6B5C` (links, buttons, active states)
- **Emphasis**: oxblood `#6B1F26` (callout borders, destructive actions only)
- **Archival accent**: ochre `#C8985E` (timeline, chapter-number watermark)
- **Body font**: Public Sans (sans-serif)
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

Canonical method is local render + commit:

1. `quarto render --profile pdf` → writes `pdf/Javne-politike.pdf`
2. `cp pdf/Javne-politike.pdf docs/pdf/Javne-politike.pdf`
3. Commit both files with `docs(pdf):` prefix and push

The CI workflow also attempts the same PDF render with `continue-on-error: true`.
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
