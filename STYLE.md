# Editorial style guide — Javne politike u Hrvatskoj

Rules distilled from chapter rewrites. Applied to every `.qmd` in `chapters/` going forward.
This file is meant to grow. Add a new rule whenever a new editorial decision surfaces.

## Goal

Every chapter must read like a printed manuscript — continuous prose where one argument
flows into the next. No structural scaffolding that signals "this was assembled, not written."
If a sentence reads like a slide bullet, summary box, or signpost, it gets rewritten.

---

## Hard rules

### 1. No colons in prose

Colons (`:`) used to introduce lists, definitions, programmatic statements ("X glasi:",
"polazi od ideje:"), or quoted material break the rhythm of running prose. Eliminate all
of them. Restructure into new sentences, relative clauses, or indirect formulations.

- **Before**: "Pravo pitanje glasi: kakva država, za koje probleme..."
- **After**: "Pravo se pitanje uvijek tiče toga kakva država, za koje probleme..."

- **Before**: "U tom se dijelu objašnjavaju tri temeljne funkcije države: alokacijska, distribucijska i stabilizacijska."
- **After**: "U tom okviru izrastaju tri njezine temeljne funkcije. Alokacijska funkcija..."

Exceptions kept: colons in YAML frontmatter (`title:`, `format:`), inside code blocks,
and in URLs.

### 2. No mid-sentence em-dashes as list introducers

Em-dashes (`—`) used to introduce a list or appositive enumeration read as a tic.
Restructure with `koji uključuje`, a relative clause, or a new sentence.

- **Before**: "Ovaj dio bavi se procesom njihova oblikovanja — definiranjem problema, izborom instrumenata..."
- **After**: "Ovaj dio bavi se procesom njihova oblikovanja koji uključuje definiranje problema, izbor instrumenata..."

Em-dashes in chapter titles as separators are fine ("Uvod — Zašto bismo otvorili ovu knjigu?").
The rule targets mid-sentence appositive dashes only.

### 3. No mechanical repetition of formulae

Repeated frame-sentences like "Glavna poruka X dijela glasi:" or "U ovom poglavlju ćemo se
baviti..." appear in machine-generated prose, never in good writing. Every transition into
a takeaway must be specific to the substance of the preceding paragraph, not a slot filler.

Transitions used so far (don't reuse mechanically — these are examples of *variety*):
- "Iz tih razmatranja proizlazi prvi važan uvid."
- "Iz toga slijedi sljedeća lekcija."
- "Time se otvara šira slika."
- "Praksa pritom otkriva isto što je teorija prethodno najavila."
- "Tu se zatvara luk knjige."

If three adjacent sections all open or close with similar phrasing, at least two of them
are wrong.

### 4. No meta-structural callouts in flowing chapters

Avoid:
- `::: {.pullquote}` blocks dropped into running prose to highlight a "key idea."
  Integrate the idea as a sentence in the surrounding paragraph.
- Sub-headers (`###`) that mechanically signpost the part/section title from `_quarto.yml`.
  The sidebar already shows structure — duplicating it in prose is noise.
- Section headings whose first sentence restates the heading verbatim (e.g. heading
  "Kako je knjiga organizirana" followed by "Knjiga je organizirana..."). Delete one or
  fold both into prose.

**Kept** — the pedagogical callouts defined in CLAUDE.md (`{.callout-praksa}`,
`{.callout-empirija}`, `{.callout-vjezba}`). They have a specific instructional purpose
distinct from prose flow.

### 5. Minimal use of "Drugim riječima,"

The transition "Drugim riječima," signals that the writer is restating the previous
sentence in different words. Good prose either says the thing well the first time or
moves the argument forward — restatement transitions are a sign that one of those two
isn't happening. Default to deleting "Drugim riječima," and either dropping the
restatement entirely or merging the two thoughts into one cleaner sentence.

- **Before**: "...pod kojim pravilima i s kakvom odgovornošću. Drugim riječima, cilj nije ideološki odabrati stranu..."
- **After**: "...pod kojim pravilima i s kakvom odgovornošću. Cilj zato nije ideološki odabrati stranu..."

- **Before**: "Drugim riječima, knjiga ne želi čitatelju dati popis gotovih rješenja..."
- **After**: "Knjiga ne želi čitatelju dati popis gotovih rješenja..."

The same logic applies to other restatement connectives that pad rather than progress:
"Naime,", "Točnije,", "Ukratko,", "Jednostavnije rečeno,". Use at most once per chapter,
and only when the restatement genuinely sharpens something the previous sentence couldn't.

### 6. Title format

Chapter titles use em-dash as separator, not colon.

- **Before**: `title: "Uvod: Zašto bismo otvorili ovu knjigu?"`
- **After**: `title: "Uvod — Zašto bismo otvorili ovu knjigu?"`

---

## Soft conventions

### Bold for first-mention concept anchors only

Bold (`**term**`) is kept when introducing a concept that anchors a paragraph or section
(e.g. **Ekonomija**, **Politika**, **Institucije** as paragraph leads). Don't use bold for
mid-sentence emphasis — that's lecture-slide style, not manuscript style.

### Indirect questions over direct questions in argumentative prose

When a paragraph poses a question to set up the answer, prefer an indirect formulation
embedded in prose over a direct question introduced by a colon.

- **Avoid**: "Treba pitati: koji problem rješavamo, koji instrument koristimo..."
- **Prefer**: "Pitati moramo koji problem rješavamo, koji instrument koristimo..."

Direct questions in **clusters** are fine when they're the rhetorical device itself —
e.g. the closing run "Koji problem pokušavamo riješiti? Zašto taj problem ne može riješiti
samo tržište?..." in the intro. A single isolated question with a colon is the problem;
a deliberate rhetorical sequence is not.

---

## Workflow for editing a chapter

1. Open the `.qmd` file.
2. Search for `:` — restructure every occurrence in prose.
3. Search for `—` — inspect each mid-sentence use, restructure list introducers.
4. Search for "Glavna poruka", "U ovom poglavlju", "Kako je organizirano", and similar
   mechanical openers. Vary or delete.
5. Look for `:::` callouts in flowing prose. Pedagogical → keep. Decorative → integrate.
6. Re-read top to bottom. Anything that reads like a slide bullet, summary box, or
   structural announcement gets rewritten.
7. Commit with `copy(<slug>):` for pure copy editing, `style(<slug>):` for structural
   changes.

## Verification

Run `quarto preview chapters/<file>.qmd` and read the rendered HTML top to bottom.
If anything reads like it was assembled rather than written, it isn't done.

---

## Provenance

- **2026-05-29** — Initial rules distilled from rewrite of [chapters/00-uvod.qmd](chapters/00-uvod.qmd) (commit `1e1715d`).
- **2026-05-29** — Added rule 5 (minimal "Drugim riječima,") after second pass on intro removed two redundant restatement transitions.
- **2026-05-29** — Third pass on intro applied full STYLE.md sweep: removed mid-sentence bold (`**ne**`) per soft convention, deleted seven meta-frame sentences ("Iz tih razmatranja proizlazi prvi važan uvid.", "Iz toga slijedi sljedeća lekcija.", "Time se otvara šira slika.", "Praksa pritom otkriva...", "Tu se zatvara luk knjige.", "Iz tih triju perspektiva proizlazi središnja misao ove knjige.", "Temeljnu se misao knjige može sažeti u jednoj rečenici.") that announced takeaways instead of letting the prose carry them. Confirmed rule 3 applies retroactively even to varied slot fillers.
- **2026-05-29** — Applied to [chapters/01-uloga-drzave.qmd](chapters/01-uloga-drzave.qmd): 11 colon restructurings in prose, 5 "Drugim riječima" deletions, section heading shortened from "Musgraveov okvir: tri funkcije države" to "Musgraveov okvir" (rule 6), and a syllabus-style enumeration paragraph removed where it duplicated content already delivered earlier in the section.
