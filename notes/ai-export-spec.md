# AI-consumable book (Track A) — task spec

## What we're building

Static artifacts + a reader-facing page that let a student feed the book (whole,
or a single chapter) into any chatbot (ChatGPT, Claude, Gemini) and ask questions.
**No backend, no API key, no running cost** — just more build output in `docs/`,
committed like the PDF.

Core idea = the `llms.txt` convention (llmstxt.org): clean plain-text versions of
the content at stable URLs, so the student's *own* AI does the work. This is
"Track A" from the 2026-06-16 brainstorm; the live chat widget / MCP server
(Track B) and build-time study aids (Track C) were deferred — see bottom.

## Key design decisions (the brainstorm's conclusions)

**1. Granularity is the whole point — ship three grain sizes.** The book is
~162k words ≈ **¼–⅓ million tokens** (Croatian tokenizes less efficiently than
English). That overflows standard ChatGPT (~128k) and standard claude.ai (200k);
only Gemini (1M) and long-context Claude swallow it whole. So:

| Artifact | URL | Size | For |
|---|---|---|---|
| Per-chapter `.md` | `/ai/05-porezi.md` | biggest chapter ~45k tok | **workhorse** — fits any bot, sharpest answers |
| Per-DIO bundle | `/ai/dio-1.md` … `dio-5.md` | ~40–90k tok | studying one part of the course |
| Whole book | `/llms-full.txt` | ~¼–⅓M tok | Gemini / long-context Claude / power users |
| Map / index | `/llms.txt` | tiny | agentic tools (Cursor, Claude w/ tools) that fetch on demand |

The **per-chapter file is the real unit** — small, reliable to fetch, fits every
bot, and is what a student actually studies.

**2. "A link" is really a reliability ladder.** Pasting a URL only ingests if the
bot has web access and chooses to fetch. Present to the reader in this order:

1. **Download → upload** the `.md` — bulletproof, works on every bot, no web access needed.
2. **One-click "open in assistant"** — prefilled-prompt deep links:
   `claude.ai/new?q=…` and `chatgpt.com/?q=…` (the prompt embeds the chapter URL +
   a Croatian tutor instruction). Gemini has no reliable public prefill param.
3. **Copy link / copy prompt** — copy buttons for the URL and a ready Croatian
   system-prompt preamble.

**3. Meet the reader where they read.** A small "🤖 Pitaj AI o ovom poglavlju"
button at the top of *every* chapter, deep-linking to that chapter's `.md` /
opening the prefilled assistant — not only on one hub page.

## Pieces

### 1. Build script — `R/build-ai-exports.R` (~120 lines)
- Read active chapters in `_quarto.yml` order (don't trust the folder — orphans exist).
- Strip: YAML front matter, ```` ```{r} ````/```` ```{ojs} ```` code blocks,
  `source("R/setup.R")`, raw HTML.
- Keep & flatten: prose, headings, figure **captions** (not images), tables,
  callout *content* (drop the `:::` fences, keep a label like "Primjer:" /
  "Empirija:"), resolve `@ref` / `#def-` crossrefs to plain text.
- Prepend a per-file header: title, authors, source URL, "generated from
  <chapter>, <date>", license line.
- Write `docs/ai/<chapter>.md`, the 5 `docs/ai/dio-N.md` bundles, `docs/llms-full.txt`
  (concat), and `docs/llms.txt` (the map: title + summary + bullet links to each chapter `.md`).
- Wire as a Quarto `post-render` hook so it's automatic in CI (preferred), or run
  manually like the concept-graph extractor.

### 2. Reader page — `uci-s-ai.qmd` (~150 lines, Croatian copy)
- New navbar item next to Alat / Podaci.
- Explains the reliability ladder (download / one-click / copy), with buttons for
  the whole book + a per-chapter picker.
- Ready Croatian tutor prompt in a copy-box, e.g.: *"Ti si mentor za udžbenik 'Sve
  što želite znati o državi i javnim politikama u Hrvatskoj'. Odgovaraj na
  hrvatskom, oslanjaj se samo na priloženi tekst, citiraj poglavlja i reci 'ne
  znam' ako odgovora nema u tekstu."*
- Honest footer: AI može pogriješiti; provjeri u tekstu; ovisi o pristupu webu.

### 3. Per-chapter button — `styles/book-include.html` (JS, ~30 lines)
- Inject "🤖 Pitaj AI o ovom poglavlju" near each chapter title. Map current page →
  its `/ai/<slug>.md` + open the prefilled assistant link. Reuse the existing
  `pruneSidebar` injection pattern already living in this file.

### 4. `robots.txt` policy decision (~10 lines)
- Allow user-initiated fetchers (`ChatGPT-User`, `Claude-Web`) so the paste-a-link
  path works.
- Optionally block training crawlers (`GPTBot`, `ClaudeBot`, `Google-Extended`) —
  separate decision, see Open decisions.

### 5. `_quarto.yml` wiring (~4 lines)
- Add `uci-s-ai.qmd` to appendices; add the `post-render` hook; ensure
  `docs/ai/**` and the `.txt` files are not gitignored.

## Effort estimate

| Piece | Time |
|---|---|
| R build script (strip + concat + llms.txt) | ~3–4 h |
| `uci-s-ai.qmd` page + prompt copy | ~2 h |
| Per-chapter button JS | ~1 h |
| robots.txt + `_quarto.yml` wiring | ~30 min |
| Review export quality on 2–3 chapters | ~1 h |

**Total: ~1 day.**

## Suggested starting point

Build the strip-and-concat script first, run it on `05-porezi` (biggest, most
callouts / figures / crossrefs — the worst case), and eyeball `docs/ai/05-porezi.md`.
If the stripped markdown reads clean, the rest is mechanical. ~30 min check that
de-risks everything.

## Open decisions (pin before building)

1. **Which assistants get one-click buttons?** Claude + ChatGPT support prefill
   (`?q=`); Gemini doesn't. Default: buttons for Claude + ChatGPT, plain download
   for the rest.
2. **Training-crawler stance.** Allow `GPTBot` / `ClaudeBot` to train on the book,
   or block them while still allowing user-initiated fetch? Co-author call.
3. **License line** stamped in each export header (CC BY?) — co-author call.
4. **Data exports** (clean CSV + data dictionary) were part of Track A, but `data/`
   is currently near-empty (only an `atlas/` subfolder). Defer until datasets land.

## Measured inputs (2026-06-16)

- 162k words across 23 active chapters; ~1.2 MB of `.qmd` (incl. code).
- Biggest: `05-porezi` 22.4k w, `02-alokacijska-funkcija` 17.8k w → ~35–45k tokens
  each (still fits any bot).
- Whole book ≈ ¼–⅓M tokens after stripping code.

## Related / deferred

- **Track B** — live "Razgovaraj s knjigom" RAG widget + MCP server. Needs hosting
  beyond GitHub Pages (Pages is static-only). Possible overlap with
  `platform-vision.md` (unverified — check before scoping).
- **Track C** — build-time AI study aids (chapter summaries, Anki flashcards,
  quizzes, generated glossary). Static output, authors review. Deferred.
- Reuses existing assets: `docs/search.json` (Quarto's full-text index, a
  ready-made corpus), stable `#def-`/`#thm-` anchors, `sitemap.xml`.
