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
chapters/       active .qmd chapter files (canonical list: _quarto.yml)
styles/         custom.scss, _dark.scss, styles.css, book-include.html
R/              setup.R (sourced in each chapter), theme_book.R (ggplot2 theme)
data/           datasets used by chapters
images/         static brand/cover assets
pdf/            rendered PDF output (not auto-rebuilt by CI)
docs/           HTML build output — do NOT hand-edit, regenerated on render
_freeze/        Quarto execution cache — do NOT hand-edit
references.bib  BibTeX bibliography for all citations
_quarto.yml     master config — chapter order, theme, format options
_brand.yml      typography and color tokens
```

## Active chapters

The canonical chapter list is defined in `_quarto.yml`. Many `.qmd` files in
`chapters/` are orphans from earlier numbering revisions — do not assume every
file in that folder is part of the book.

Current structure (from `_quarto.yml`):

- **DIO I** (ch. 1–5): Pristupi, Zašto država, Musgrave, Institucije, Konstitucionalna
- **DIO II** (ch. 6–11): Javni izbor, Kako odlučujemo, Glasovanje, Stranke, Birokrati, Interesne skupine
- **DIO III** (ch. 12–15): Državna potrošnja, Porezi, CBA odluke, Reforme
- **Zaključak** (ch. 16)

## Content conventions

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
::: {#def-naziv}
**Definicija.** ...
:::

::: {#prp-naziv}
**Propozicija.** ...
:::

::: {#thm-naziv}
**Teorem.** ...
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

- **Body font**: Geist (sans-serif)
- **Display/headings**: Newsreader (serif)
- **Monospace**: Geist Mono
- Brand SCSS variables live in `styles/custom.scss`; color tokens in `_brand.yml`
- Dark mode styles in `styles/_dark.scss`
- Do not change font families without updating both `_brand.yml` and `styles/custom.scss`

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

The PDF in `pdf/` is NOT auto-rebuilt by CI — it must be rendered and committed manually.

## Branching convention

Experimental features use the `experiment/*` prefix (e.g. `experiment/wave-1-pedagogy`).
When an experiment is ready, cherry-pick or checkout specific files into `main` — do not
rely on `git merge` blindly, as branch histories can diverge unexpectedly.

## Do NOT

- Hand-edit files in `docs/` or `_freeze/` — they are build artifacts
- Break the chapter order in `_quarto.yml`
- Write prose in English
- Commit `index_cache/`, `index_files/`, `tmp/`, or `.Rhistory`
