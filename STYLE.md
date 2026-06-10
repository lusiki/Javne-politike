# Editorial style guide — Javne politike u Hrvatskoj

Rules distilled from chapter rewrites and from the 2026-06 whole-book evaluation.
This file is the single source of truth for prose style. It is meant to grow: add a rule
whenever a new editorial decision surfaces, following the lifecycle at the bottom.

**Scope.** Binding for every `.qmd` in `chapters/`. The appendix pages (`vodic.qmd`,
`resursi.qmd`, `alat.qmd`, `podaci.qmd`, `references.qmd`) follow the typography and
citation conventions (S4, S5) but not the structural-element formats. `index.qmd`
(landing page) is marketing register and exempt. All chapter prose is Croatian (hr-HR).

---

## The test

Every chapter must read like a printed manuscript — continuous prose where one argument
flows into the next. No structural scaffolding that signals "this was assembled, not
written." If a sentence reads like a slide bullet, summary box, or signpost, it gets
rewritten. When in doubt, read the passage aloud: if a lecturer would not say it to a
room, it does not belong on the page.

---

## Quick card

Hard rules at a glance. Details below; IDs are stable and never renumbered.

| ID | Rule |
|----|------|
| H1 | No colons in prose |
| H2 | No mid-sentence em dashes as list introducers or appositives |
| H3 | No mechanical transition formulae or takeaway announcements |
| H4 | No meta-structural callouts; no bullet/numbered lists in running prose |
| H5 | Restatement connectives at most once per chapter (whole family combined) |
| H6 | Titles and headings: em dash separator, nominal register |
| H7 | Every number, study, or named finding carries a `[@key]` in the same sentence |
| H8 | Bold only for first-mention concept anchors and definition terms |

---

## Voice

The book speaks as one author. The reference register is the one chapters 06–11 and
15–19 share: a seasoned lecturer writing, not talking — confident, analytical, warm but
impersonal.

- **Person.** Authorial *mi* ("pokazali smo", "vraćamo se na"). The reader is addressed
  directly only in exercises (imperatives in `callout-vjezba`) and in deliberate
  rhetorical question clusters. No reader possessives ("naš novac") in titles or prose.
- **Tense.** Present for theory and models, past for historical episodes and studies.
- **Distance.** No chatty asides, no exclamation marks, no irony markers. Humour, where
  it appears, is dry and embedded in the argument.
- **Sentence rhythm.** Vary sentence length. Three consecutive sentences sharing the
  same syntactic opener read as a list in disguise (see S3).

---

## Prose zones

Where the rules apply. "Prose" means every string a reader sees rendered.

| Zone | H1 colon | H2 em dash | Other rules |
|------|----------|------------|-------------|
| Paragraph prose | banned | banned mid-sentence | all apply |
| Headings | banned | **allowed** as separator | H6 |
| Chapter titles (YAML `title:`) | banned inside the title text | **allowed** as separator | H6 |
| Figure/image captions and alt text | banned | allowed as title-style separator at the start; banned mid-sentence | H7, H8 |
| Table cells | banned | banned | — |
| Table caption text | banned (the leading `: ` caption *marker* is Quarto syntax, exempt) | allowed as separator | see Tables |
| Callout bodies (`praksa`, `empirija`, `vjezba`) | banned | banned | all apply; see Callouts |
| Vodič / Sažetak panels | banned | banned | see formats below |
| YAML (other fields), code blocks, OJS, URLs, math | exempt | exempt | exempt |

---

## Hard rules

### H1 — No colons in prose

Colons used to introduce lists, definitions, programmatic statements ("X glasi:",
"polazi od ideje:"), or quoted material break the rhythm of running prose. Eliminate
all of them in every prose zone. Restructure into new sentences, relative clauses, or
indirect formulations (see Repair patterns).

- **Before**: "Pravo pitanje glasi: kakva država, za koje probleme..."
- **After**: "Pravo se pitanje uvijek tiče toga kakva država, za koje probleme..."

- **Before**: "U tom se dijelu objašnjavaju tri temeljne funkcije države: alokacijska, distribucijska i stabilizacijska."
- **After**: "U tom okviru izrastaju tri njezine temeljne funkcije. Alokacijska funkcija..."

Exempt: YAML frontmatter, code blocks, URLs, math, and the leading `: ` table-caption
marker (Quarto syntax — but the caption *text* after it must be colon-free).

### H2 — No mid-sentence em dashes as list introducers or appositives

Em dashes (`—`) used to introduce a list or appositive enumeration read as a tic.
Restructure with `koji uključuje`, a relative clause, or a new sentence.

- **Before**: "Ovaj dio bavi se procesom njihova oblikovanja — definiranjem problema, izborom instrumenata..."
- **After**: "Ovaj dio bavi se procesom njihova oblikovanja koji uključuje definiranje problema, izbor instrumenata..."

Allowed: em dash as a *separator in title position* — chapter titles
("Uvod — Zašto bismo otvorili ovu knjigu?"), section headings
("Pravila i odluke — dvije razine političkog odlučivanja"), and the lead-in of a figure
caption. The rule targets mid-sentence dashes inside running sentences, including table
cells and caption sentences.

### H3 — No mechanical transition formulae

Repeated frame sentences ("Glavna poruka X dijela glasi...", "U ovom poglavlju ćemo se
baviti...", "U nastavku ćemo...") appear in machine-generated prose, never in good
writing. The principle: **a transition must carry content — it names the substance it
hands over, never merely announces that an insight is coming.** A transition that would
fit equally well in any chapter is a slot filler and gets cut.

- **Bad**: "Iz tih razmatranja proizlazi prvi važan uvid." (fits anywhere, says nothing)
- **Good**: "Ako tržište zakazuje zbog raspršenog znanja, država koja to znanje nema zakazat će na istom mjestu." (only fits here)

Varied slot fillers are still slot fillers: rule 3 applies even when each instance uses
different words (confirmed retroactively, see Provenance 2026-05-29). If three adjacent
sections open or close with structurally similar phrasing, at least two are wrong.

### H4 — No meta-structural callouts; no lists in running prose

Avoid:

- `::: {.pullquote}` blocks dropped into prose to highlight a "key idea." Integrate the
  idea as a sentence in the surrounding paragraph.
- Sub-headers that mechanically signpost the part/section title from `_quarto.yml`. The
  sidebar already shows structure.
- Section headings whose first sentence restates the heading verbatim. Delete one or
  fold both into prose.
- **Bullet or numbered lists in running prose.** They are the strongest slide tell.
  Fold enumerations into sentences ("tri su razloga. Prvi...") or, if the material is
  genuinely tabular, use a table with caption and source.

Numbered lists are sanctioned only inside the Vodič panel, `callout-vjezba` steps, and
`Što isprobati` chart-guidance blocks (see Structural elements).

**Kept** — the pedagogical callouts (`{.callout-praksa}`, `{.callout-empirija}`,
`{.callout-vjezba}`) and the Vodič/Sažetak panels. They have a defined instructional
purpose and their own format rules below.

### H5 — Restatement connectives at most once per chapter

"Drugim riječima," signals that the writer is restating the previous sentence. Good
prose either says the thing well the first time or moves forward. Default to deleting
the connective and either dropping the restatement or merging the two thoughts.

- **Before**: "...pod kojim pravilima i s kakvom odgovornošću. Drugim riječima, cilj nije ideološki odabrati stranu..."
- **After**: "...pod kojim pravilima i s kakvom odgovornošću. Cilj zato nije ideološki odabrati stranu..."

The family: "Drugim riječima,", "Naime,", "Točnije,", "Ukratko,", "Jednostavnije
rečeno,", and the escalator "Štoviše,". **The budget is one occurrence per chapter for
the whole family combined**, and only when the restatement genuinely sharpens something
the previous sentence could not.

### H6 — Titles and headings

- Em dash as separator, never a colon: `title: "Uvod — Zašto bismo otvorili ovu knjigu?"`.
- Titles are **nominal phrases**. The em dash subtitle may be a question; a standalone
  interrogative title is avoided, and direct reader possessives ("Kako država troši
  *naš* novac?") are not used.
- Headings never hard-code numbering ("2.1. Javna dobra" — Quarto numbers them).
- A heading's first sentence must not restate the heading (H4).

### H7 — Evidence anchoring

Every specific number, percentage, named study, or empirical finding carries a `[@key]`
citation **in the same sentence**. A magnitude remembered but unsourced is either
softened into an order-of-magnitude statement attributed to a literature, or cut.

- If the source is not in `references.bib`, flag it for addition — never cite from
  memory, never invent a key, finding, or page number.
- Bib-key hygiene: the year in the key matches the publication year of the edition
  cited (a 1991 book is not `key1985`; the 2022 Green Book is not `key2026`).
- A theoretical work is never cited for an empirical claim it does not contain.

### H8 — Bold discipline

Bold is kept for exactly two jobs: the **first-mention concept anchor** (a term being
introduced, once) and the bolded term inside a definition div. Never for mid-sentence
emphasis ("raste **približno 4 puta**"), never as a pseudo-heading inside a paragraph
("**Razvoj moderne države** započinje..."). If a bold phrase functions as a label,
promote it to a real heading or unbold it. Sanctioned exception: the literal lead-in
**Što isprobati.** in chart-guidance blocks, one per block.

---

## Soft conventions

### S1 — Indirect questions over direct questions

When a paragraph poses a question to set up the answer, prefer an indirect formulation
embedded in prose ("Pitati moramo koji problem rješavamo...") over a direct question.
Direct questions in **clusters** are fine when the rhetorical sequence is itself the
device (the closing run of the intro). A single isolated question is the problem.

### S2 — English parentheticals

A term of art gets its English original at most once, at first mention, italicised —
"(engl. *rent-seeking*)" — and only when the literature genuinely lives under the
English name. After that, the Croatian term exclusively. One Croatian name per concept,
book-wide; the registry is `bookwright_plugin/bookwright/shared/concept-ledger.json`.
More than three English parentheticals in a chapter is a register failure (ch05 at one
point had nineteen).

### S3 — Definition cadence

No glossary stacking: three consecutive sentences that each open with the term they
define ("Racionalni izbor podrazumijeva... Individualizam polazi od... Analiza troškova
i koristi omogućuje...") read as a bulleted list with the bullets removed. Weave the
definitions into the argument, or give the load-bearing term a `#def-` div and let the
prose use it.

### S4 — Typography and numbers

- Croatian quotation marks „ovako", italics for foreign-language terms and titled works
  (*Green Book*).
- Decimal comma (7,3 %), a space before % (write `7,3 %`).
- In running argument, numbers one through nine in words, unless data, units, or
  formulas are involved.
- Ranges in prose are worded ("od 15 do 20 %", "između 2010. i 2015."), not dashed.
- No exclamation marks; ellipses only inside quoted material.

### S5 — Citations in prose

- `[@key]` sits at the end of the claim's sentence, before the full stop. Multiple keys
  in one bracket, chronological: `[@tullock1967; @krueger1974]`.
- Narrative attribution ("Kako pokazuje Krueger [@krueger1974]") is for landmark works
  whose author matters to the argument — use sparingly, not as default.
- No footnotes for sourcing; margin citations render automatically.

### S6 — Cross-references between chapters

- The standard formula is textual: "u poglavlju o birokraciji", "kako smo pokazali u
  poglavlju o alokacijskoj funkciji". Name the topic, not the number (numbers shift).
- One forward announcement ("najava") per concept, in the chapter that motivates it;
  the receiving chapter owns the full development (the canonical homes are recorded in
  the concept ledger).
- When a chapter ends up referenced more than twice, add a `{#sec-...}` id to its title
  and switch those references to `@sec-` links in a dedicated pass.

---

## Structural elements

The sanctioned non-prose elements and their formats. Everything not listed here is
prose and follows the rules above.

### Vodič kroz poglavlje

The opener panel, immediately after the title. Four to six **numbered questions** —
genuine intellectual provocations, not topic labels ("Zašto tržišnom gospodarstvu uopće
treba država?" not "Uloga države"). Each question maps to one of the chapter's key
aspects (spine); no question is restated verbatim as a section heading later. Every
chapter has one; only `00-uvod` is exempt.

### Sažetak

The closing panel. **One paragraph, three to six sentences**, in chapter voice. It
synthesises the chapter's *move* — what was established, what tension remains, what it
hands to the next chapter. No new citations, no new concepts, no lists, and it must not
reuse the opening's sentences (a Sažetak that paraphrases the Vodič has failed).

### Pedagogical callouts

- `callout-praksa` — one concrete, named case in continuous prose, at most two
  paragraphs. The example carries its own weight: no meta sentence announcing the
  theory it confirms ("Primjer potvrđuje Stiglerov uvid...").
- `callout-empirija` — a finding with its magnitude and mandatory `[@key]` (H7 applies
  with no exceptions here).
- `callout-vjezba` — imperative voice, names the deliverable and the data source.
  Numbered steps allowed. Every substantive chapter needs at least one (see
  `conventions.json` bands).

### Definitions

Quarto def divs, in the actual book pattern — the term bolded inside the defining
sentence, no label prefix:

```markdown
::: {#def-pareto-ucinkovitost}
Alokacija je **Pareto učinkovita** ako nije moguće poboljšati položaj jedne osobe,
a da se pritom ne pogorša položaj barem jedne druge osobe.
:::
```

One or two sentences, genus + differentia, no colon. The surrounding prose uses the
term immediately before or after the div, so the definition lands inside an argument,
not beside it. Which terms earn a div is a spine decision, not a style one.

### Figures and interactive (OJS) charts

Every figure — static image, `#fig-` div, labelled chunk, or OJS chart — is preceded by
**one prose paragraph in chapter voice that says what the figure shows and why it
matters at this point in the argument**. The caption does not satisfy this; a heading
directly above a figure is a violation.

Interactive charts may additionally carry one guidance block *after* the chart: the
bold lead **Što isprobati.** followed by numbered experiments. The block obeys H1 and
H2 (no colons, no mid-sentence em dashes), contains no other bold, and sequences from
the obvious case to the counterintuitive one. Separate "Kako čitati graf" passages are
not used — orientation belongs in the intro paragraph.

Captions are sentence-case, end with a full stop, and may use an em dash only as a
title-style separator at the start.

### Tables

Quarto caption syntax with a source, every time:

```markdown
: Usporedba sustava glasovanja. Izrada autora prema @mueller1989. {#tbl-sustavi}
```

No hard-coded numbering inside the caption text ("Tablica 1. ..." — Quarto numbers).
The source formula is "Izrada autora." / "Izrada autora prema @key." / "Prilagođeno
prema @key." — never a bare dangling "Izvor:". Table cells are prose zones (H1, H2).

---

## Repair patterns

The standard restructurings, so sweeps converge instead of improvising:

- **Colon before a list** → split into a lead sentence plus a sentence per item, or a
  relative clause with `koji uključuje / obuhvaća`.
- **Colon before a definition** → make the definiens a clause ("Pareto učinkovitost
  znači da...") or move it to a `#def-` div.
- **Colon before a quotation** → introduce with `kako piše X,` or fold the quote into
  the sentence.
- **Em dash enumeration** → `koji uključuje...` or a new sentence.
- **Slot-filler transition** → replace with a sentence naming the actual substance
  being handed over; if nothing is handed over, delete.
- **Restatement connective** → delete the connective; merge the two sentences if the
  second adds anything, otherwise cut it.
- Never repair by deleting meaning. If the restructure loses a claim, the restructure
  is wrong.

---

## Linting

The mechanical detector lives at
`bookwright_plugin/bookwright/skills/book-style/scripts/style_lint.R`:

```bash
Rscript bookwright_plugin/bookwright/skills/book-style/scripts/style_lint.R chapters/<file>.qmd
```

Mapping: "colon in prose" → H1, "mid-sentence em dash" → H2, "mechanical opener /
restatement" → H3/H5, "colon in chapter title" → H6. The linter is zone-blind, so judge
every hit against the Prose zones table. Known false-positive classes:

1. Table caption marker lines (`: Caption text {#tbl-...}`) — syntax, not a prose colon
   (but check the caption *text* itself).
2. Table alignment rows (`| :--- |`).
3. Em dash as separator in headings and caption lead-ins (allowed by H2/H6).

H4 (lists, pullquotes), H7 (evidence), H8 (bold), and all soft conventions are
reader-checked; the linter cannot see them. Figure intros have their own detector
(`book-figure/scripts/figure_intro_check.R`).

---

## Workflow for editing a chapter

1. Read this file — it grows, and the newest rules are the ones the chapter most
   likely violates.
2. Run the linter; triage hits against the Prose zones table.
3. Fix H1/H2/H6 hits with the Repair patterns. Search "Glavna poruka", "U ovom
   poglavlju", "U nastavku" and the H5 family; vary or delete.
4. Check the structural elements against their formats: Vodič questions, Sažetak,
   callouts, definition divs, figure intro paragraphs, table captions and sources.
5. Sweep for H7: every number and named finding has its `[@key]` in-sentence; verify
   suspicious keys against `references.bib`.
6. Re-read top to bottom for the things no detector catches: slide cadence, glossary
   stacking (S3), register drift, bold abuse (H8).
7. Verify the render and commit (`copy(<slug>):` for prose, `style(<slug>):` for
   structural changes).

## Verification

Run `quarto preview chapters/<file>.qmd` and read the rendered HTML top to bottom. Run
the figure-intro detector if the chapter has figures. Read one paragraph aloud from the
beginning, middle, and end: if any of them sounds assembled rather than written, the
chapter is not done.

---

## Rule lifecycle

- IDs are permanent. New rules append (H9, S7, ...); nothing is renumbered, so commit
  messages, lint output, and ledger notes can cite rules stably.
- A soft convention is promoted to hard when it has been violated in at least two
  chapters **and** the fix produced a before/after pair worth recording.
- Every rule addition, promotion, or scope change gets a Provenance entry with the date
  and the triggering chapter.
- If a rule and actual book practice diverge, the divergence is resolved explicitly —
  either the chapters are swept or the rule is amended. Silent drift is the failure mode.

---

## Provenance

- **2026-05-29** — Initial rules distilled from rewrite of [chapters/00-uvod.qmd](chapters/00-uvod.qmd) (commit `1e1715d`).
- **2026-05-29** — Added rule 5 (minimal "Drugim riječima,") after second pass on intro removed two redundant restatement transitions.
- **2026-05-29** — Third pass on intro applied full STYLE.md sweep: removed mid-sentence bold (`**ne**`) per soft convention, deleted seven meta-frame sentences ("Iz tih razmatranja proizlazi prvi važan uvid.", "Iz toga slijedi sljedeća lekcija.", "Time se otvara šira slika.", "Praksa pritom otkriva...", "Tu se zatvara luk knjige.", "Iz tih triju perspektiva proizlazi središnja misao ove knjige.", "Temeljnu se misao knjige može sažeti u jednoj rečenici.") that announced takeaways instead of letting the prose carry them. Confirmed rule 3 applies retroactively even to varied slot fillers.
- **2026-05-29** — Applied to [chapters/01-uloga-drzave.qmd](chapters/01-uloga-drzave.qmd): 11 colon restructurings in prose, 5 "Drugim riječima" deletions, section heading shortened from "Musgraveov okvir: tri funkcije države" to "Musgraveov okvir" (rule 6), and a syllabus-style enumeration paragraph removed where it duplicated content already delivered earlier in the section.
- **2026-06-10** — Major revision (v2) after the whole-book Bookwright evaluation of 2026-06-09/10. Added: scope statement; Voice section; Prose zones table; stable rule IDs (H1–H8, S1–S6); H7 evidence anchoring (uncited figures found in ch08/11/14, miscited claims in ch01/05); H8 bold discipline promoted from soft convention (pseudo-headings and mid-sentence bold in ch14); list ban folded into H4; "Štoviše," added to the H5 family with a per-chapter budget across the family (ch05 had five); H6 extended with title register (question titles in ch05/13); S2 English parentheticals (nineteen in ch05); S3 definition cadence (ch05); S4 typography; S5 citation placement; S6 cross-reference formula; format specifications for Vodič, Sažetak, callouts, definition divs, figure intros, chart-guidance blocks ("Što isprobati." sanctioned, "Kako čitati graf" folded into intro paragraphs), and table captions (no hard-coded numbering, no bare "Izvor:"); Repair patterns; Linting section with rule mapping and known false-positive classes; rule lifecycle. Replaced rule 3's menu of transition examples with the content-bearing principle, because the listed examples had themselves been deleted as violations on 2026-05-29.
