# Bookwright

MVP tooling for the *Javne politike* Quarto book, built in the same shape as the sciagent paper plugin. It is a small editorial team that lives beside the book repo so the work keeps moving without waiting on co-authors.

## What is here

A manager, the per chapter jobs, the whole book checker, and eight read only critics.

* `book-conductor` (manager). Tracks the status of all 20 chapters, sorts each open task into a self pile or a co-author pile, drafts bounded co-author requests, and enforces the book checkpoints.
* `book-style`. Enforces STYLE.md, with an R linter that flags the hard rules.
* `book-enrich`. Applies ENRICHMENT.md, adding one or two paragraph insertions in one of five value slots, international material only.
* `book-figure`. Checks that every figure has a prose paragraph before it (R detector) and drafts the missing intro under STYLE.md.
* `book-review`. Runs the six critic chapter panel, synthesizes with agreement scoring, revises with your confirmation.
* `book-continuity`. Whole book, read only. Counts structure against `conventions.json`, reconciles each chapter against `chapter-spine.json`, checks terminology, and dispatches the two book wide critics. Also proposes and keeps the spine.
* `agents/`. Six chapter critics (economist, skeptic, pedagogy, evidence, style, structure) plus two book wide critics (voice, arc).

## Two file types

MD files are the instructions Claude reads (every SKILL.md, every critic, the reference docs). JSON files are the lists Claude checks and the data it carries (the checklists, the schemas, and the two ledgers in `shared/`).

## The shared files

`shared/chapter-ledger.json` is the live dashboard, pre filled with your 20 chapters. Adjust each chapter's stage to match reality, then ask the conductor for status. `shared/concept-ledger.json` is the running list of defined terms. `shared/conventions.json` holds the structural bands and labels, with starting guesses to replace once `book-continuity scan` measures your real chapters. `shared/chapter-spine.json` holds, per chapter, the key aspects and key terms that the opener, the definitions, and the exercises all reconcile to; `book-continuity spine` proposes them and you ratify.

## Install (local marketplace, like sciagent)

From Claude Code, add this folder as a local marketplace and install the `bookwright` plugin. Run Claude Code from inside the book repo so the skills can see `chapters/`, `references.bib`, `STYLE.md`, and `ENRICHMENT.md`.

## Use

Open the book repo and ask in plain language.
* where does the book stand -> book-conductor reports the dashboard
* what can I do on chapter 7 without waiting -> book-conductor routes the work
* sweep chapter 7 for style -> book-style runs the linter then the pass
* check the figures in chapter 3 -> book-figure runs the detector
* enrich chapter 12 -> book-enrich proposes insertions for approval
* review chapter 7 -> book-review runs the six critic panel
* check consistency across the book -> book-continuity scans and runs the voice and arc critics
* propose the spine for chapter 3 -> book-continuity proposes key aspects and terms

## Not included yet

`book-structure`, the writer that drafts and repairs the `Vodič kroz poglavlje` opener, the `Definicija` wording, and the exercises against the spine. Until it exists, `book-continuity` and the structure critic tell you what is off and you write the fix by hand. Figures generated from data are also still out of scope.
