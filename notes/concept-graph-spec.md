# Pojmovnik / Mreža pojmova — task spec

## What we're building

An interactive concept-graph page (`pojmovnik.qmd`) added to the book nav.
Force-directed graph of ~85 `#def-` concepts, colored by DIO, sized by cross-chapter
reference count. Text filter highlights a node's neighborhood; clicking a node shows
the definition preview + link to the exact `#def-` anchor in the chapter.

Inspired by the Karpathy LLM-wiki pattern (https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
but implemented fully statically in OJS — no LLM at runtime.

## Three pieces

### 1. R extractor — `R/build-concept-graph.R` (~50 lines)
- Parse all 23 chapters for `{#def-SLUG}` divs
- Record: slug, chapter file, DIO number, first sentence of definition
- Detect edges: slug mentioned in prose of a chapter other than its home chapter
- Output: `data/concept-graph.json` (nodes + edges)
- Run manually whenever chapters change

### 2. Graph page — `pojmovnik.qmd` (~200 lines OJS)
- `page-layout: full`, same pattern as `vodic.qmd`
- Observable Plot + D3 force simulation
- Node size = cross-chapter reference count; color = DIO (I–V)
- Text filter input → dim non-neighbors, highlight neighbors
- Click node → side panel: definition snippet + "Otvori poglavlje →" link to `#def-` anchor
- Same STATECRAFT palette as the rest of the book

### 3. `_quarto.yml` wiring (~3 lines)
Add `pojmovnik.qmd` as appendix alongside `resursi.qmd` / `vodic.qmd`.

## Effort estimate

| Piece | Time |
|---|---|
| R extractor | ~1 h |
| OJS graph page | ~3–4 h |
| Edge quality review | ~1 h |
| _quarto.yml wiring | 10 min |

**Total: ~half a day.**

## Suggested starting point

Build the R extractor first and inspect `data/concept-graph.json` before writing
any OJS. If cross-chapter co-occurrence edges are too sparse, switch to a curated
manual link list in the JSON. That check takes ~30 min and de-risks the rest.

## Concept inventory (as of 2026-06-16)

85 `#def-` divs across 23 chapters. Key hub concepts (appear in prose of many chapters):
- `eksternalija`, `javno-dobro`, `trzisni-neuspjeh` (DIO I)
- `principal-agent`, `javni-izbor`, `lov-na-rentu` (DIO II)
- `institucije`, `transakcijski-troskovi` (DIO III)
- `pareto-ucinkovitost`, `mrtvi-teret` (cross-DIO)

## DIO color mapping (for graph)

| DIO | Chapters | Color suggestion |
|-----|----------|-----------------|
| I   | 01–05    | navy `#1B2A4A`  |
| II  | 06–10    | verdigris `#4A6B5C` |
| III | 11–12    | ochre `#C8985E` |
| IV  | 13–16    | slate `#4A5568` |
| V   | 17–21    | oxblood `#6B1F26` |
