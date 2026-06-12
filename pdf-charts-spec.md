# PDF chart twins — porting spec

Goal: every interactive OJS chart in the book gets a static **R/ggplot2 twin** that
renders in the **PDF** build, while the OJS chart keeps rendering in **HTML**. In the
PDF, the interactive affordances — the **"Parametri simulacije"** slider panel and the
**"Što isprobati"** instructions — must be absent.

This spec is the canonical pattern, validated end-to-end on the `fig-lorenz` pilot
(chapter 03). Apply it identically to all remaining charts.

## The 23 charts

| Chapter | fig label(s) |
|---|---|
| 01-uloga-drzave | fig-edgeworth |
| 02-alokacijska-funkcija | fig-javna-dobra, fig-neg-eksternalija, fig-poz-eksternalija, fig-nepovoljan-izbor, fig-moralni-hazard, fig-monopol |
| 03-distribucijska-funkcija | fig-lorenz ✅ (pilot done) |
| 04-stabilizacijska-funkcija | fig-keynesian-cross |
| 05-javni-izbor | fig-paradoks-glasanja |
| 06-kolektivni-izbor | fig-condorcet |
| 09-birokracija | fig-niskanen |
| 13-javna-potrosnja | fig-wagner |
| 14-porezi | fig-opadajuca-korisnost, fig-porezna-incidencija, fig-mrtvi-teret-skaliranje, fig-porezni-klin, fig-ramsey-dwl, fig-dokolica-potrosnja, fig-medutemporalna-stednja, fig-laffer |
| 16-drzavni-neuspjesi | fig-test-neuspjeha |
| 19-cba-evaluacija | fig-npv-diskontna |
| 20-reforme | fig-reforma-kapacitet |

## The wrapper pattern (per chart)

Wrap the existing OJS slot (controls + plot + the `**Što isprobati.**` paragraph) in an
HTML-only div, and add a PDF-only div with the R twin:

```markdown
::: {.content-visible when-format="html"}
<existing OJS controls block(s)>
<existing OJS plot block with //| label: fig-NAME>
**Što isprobati.** (1) … (2) … (3) …
:::

::: {.content-visible when-format="pdf"}
```{r}
#| label: fig-NAME-print          # MUST differ from the OJS label (see Rule 1)
#| echo: false
#| fig-cap: "<copy the OJS fig-cap verbatim>"
#| fig-alt: "<copy/trim the OJS fig-alt>"
#| fig-width:  <inches, ~ OJS width/100>
#| fig-height: <inches, ~ OJS height/100>
source("R/setup.R")
# … ggplot2 twin reproducing the OJS at DEFAULT slider values …
```
:::
```

## Hard rules (each learned from a pilot failure)

1. **Distinct knitr label.** knitr validates all chunk labels at parse time, before
   format filtering, so two chunks labelled `fig-NAME` collide ("Duplicate chunk label").
   The R chunk MUST use `fig-NAME-print`. No chart is cross-referenced with `@fig-…`
   anywhere in the book (verified), so the distinct label breaks nothing.

2. **No web fonts in the twin.** The OS has neither Public Sans nor Newsreader installed,
   and the default R graphics device errors ("invalid font type") on a missing family.
   `R/theme_book.R` already sets the chart font to `""` (device default sans), which is
   safe and harmonises with the PDF's Latin Modern body. Do NOT set `family=` in twin code.

3. **No Unicode arrows in axis labels.** The default PDF graphics device cannot draw
   `→` (U+2192) or `↑` (U+2191) and drops them with an `mbcsToSbcs` conversion warning.
   The OJS labels use them as directional cues; strip them in the twin
   (`"Porezna stopa t (%)"`, not `"Porezna stopa t (%) →"`). Croatian diacritics
   (š, ž, č, ć, đ) render fine.

4. **Reproduce at DEFAULT slider values.** Read each `Inputs.range(..., {value: V})` and
   hardcode `V` as the twin's parameter, with a comment naming it. The twin is a snapshot
   of the chart as it first appears, not interactive.

5. **Match colours to the OJS marks, not the legacy palette.** Port the literal hex codes
   from the OJS `Plot` marks (e.g. curve `#2D5A8E`, verdigris `#4A6B5C`, oxblood `#6B1F26`,
   reference lines `#6B6357`, points `#1C1916`). These already equal the STATECRAFT tokens
   exposed in `R/theme_book.R` (`statecraft[...]`), so either source is fine.

6. **Verify the math.** Where the OJS computes a displayed number (Gini, t*, DWL, NPV…),
   the twin must reproduce the same formula and the same value at defaults. Pilot check:
   Lorenz Gini at k=2.5, t=0 → (k−1)/(k+1) = 0.43, matched. ✅

## Rendering

`pwsh -File scripts/render-pdf.ps1` — full book PDF to `pdf/Javne-politike.pdf`.
(The helper prepends the Quarto/R/TinyTeX paths, which are not on the default shell PATH.)
Rendering any single file in a book project still renders the whole book.

R deps are now installed in the renv library and captured in `renv.lock` (snapshot done).

## SVG infographics (separate sub-task, same pass)

`pdf-filters/strip-svg.lua` currently drops 4 infographic SVGs from the PDF because
`rsvg-convert` is absent. Fix by pre-converting those SVGs to high-res PNG and removing
`strip-svg.lua` from `_quarto-pdf.yml`. Charts in ch01/05/12/14 reference `.svg` infographics.
