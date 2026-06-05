# Substantive enrichment guide — Javne politike u Hrvatskoj

Companion to [STYLE.md](STYLE.md). `STYLE.md` governs *how* to write.
This guide governs *what* to add when a chapter feels under-developed.

## What this document does

Defines how to thicken a chapter with 1–2 paragraph insertions that
add substantive value, rather than uniform expansion or restatement.
Use this guide whenever a chapter has content gaps and you want to
fill them without diluting the chapter.

## Hard constraint

**No Croatian-specific examples or Croatian empirics.** Croatia-anchored
content (HNB, MFin, specific reforms, election cycles, domestic data)
is reserved for the co-authors. Insertions written under this guide
stay on theoretical mechanism, international / EU evidence, cross-system
comparison, debate, and methodology.

## The five value slots

Every insertion fills **exactly one** slot. If the candidate addition
does not fit a slot, it is restatement and gets cut.

1. **Mechanism unpacking.** The chapter states an outcome but skips
   the causal chain. Add the step-by-step *how*. This is the most
   common asymmetry — results without their gears.

2. **Empirical evidence.** The claim leans on theory or intuition.
   Add the cited empirical finding from international or EU research.
   Use `callout-empirija` where naturally separable.

3. **Comparative / cross-system context.** Place the topic against
   cross-country (EU, OECD), institutional, or historical comparison
   of policy regimes. One sentence of comparison often outperforms a
   paragraph of abstract argument.

4. **Trade-off / counterview articulation.** The chapter presents one
   position or one result. Add the principled counterview, binding
   constraint, or unresolved tension. Public choice especially demands
   this — most positions are contested.

5. **Methodological / identification note.** Briefly explain *how* a
   claim is actually measured or identified — what data, what design,
   what assumption. Raises the chapter's epistemic floor.

## Asymmetry test — where to add

Scan each chapter for points where:

- A concept is introduced but never substantively unpacked
- A result is stated but the mechanism is implicit
- Theory is presented but no empirics follow
- One side of a debate is given but the other is absent
- A claim is made but its identification or measurement is opaque

Each such point is a candidate. Each gets one or two paragraphs filling
the appropriate slot. **Not generic expansion.**

## Constraints on every insertion

- 1–2 paragraphs per insertion, never more
- Croatian (hr-HR), conforming to [STYLE.md](STYLE.md) — no colons in
  prose, no mid-sentence em-dash list intros, no mechanical takeaway
  formulae, no "Drugim riječima," restatement connectives, no
  meta-callouts in flowing text
- No Croatian examples (reserved for co-authors)
- Prefer integration into existing prose; use `callout-empirija` only
  where the addition is naturally separable
- Cite via `[@key]` against [references.bib](references.bib); if a
  source is not in the bib, flag it rather than fabricate
- **Substantive test:** would a reader who already understood the
  chapter learn something new from this paragraph? If not, cut it

## Anchoring in recent landmark literature

The five slots describe *what kind* of value an insertion adds. This
section describes *what sources* it should engage with. The textbook
gains depth when it sits in dialogue with major contemporary works
on the phenomenon under discussion, not only with the classical
references already pinned in [references.bib](references.bib).

When a chapter touches a topic addressed by a recent landmark book,
the insertion should engage with that work — state its central claim,
position it against the textbook treatment, and where useful agree or
contest. This is most natural for **Slot 2 (Empirical evidence)** and
**Slot 4 (Trade-off / counterview)**, but can also surface in **Slot 3
(Comparative / cross-system)** when a book reframes a familiar
comparison.

A non-exhaustive map of which contemporary works speak to which topic
areas. The list is a starting point — co-authors will know which
titles to prioritize, replace, or add.

- **Inequality and distribution** — Piketty (2014, 2020); Saez &
  Zucman (2019); Atkinson (2015); Milanović (2016, 2019); Deaton
  (2013); Stiglitz (2012).
- **Institutions and political economy of growth** — Acemoglu &
  Robinson (2012, 2019); Rodrik (2011); Fukuyama (2014).
- **Behavioural public economics** — Thaler & Sunstein (2008);
  Thaler (2015); Banerjee & Duflo (2019); Kahneman (2011).
- **Market versus state, industrial policy** — Mazzucato (2013,
  2021); Tirole (2017).
- **Macro, fiscal policy and crises** — Reinhart & Rogoff (2009);
  Blyth (2013).
- **Democratic dysfunction and the public-choice critique** — Caplan
  (2007); Achen & Bartels (2016); Levitsky & Ziblatt (2018).
- **Markets, morals, public values** — Sandel (2012); Sen (1999).

If a book on this list (or any other contemporary landmark) is not
yet in [references.bib](references.bib), propose adding it before
drafting the insertion. Do not invent page numbers, fabricate
findings, or claim that a book argues a position you are not certain
it actually argues. If unsure, name the claim in chat and ask before
committing the citation.

## Workflow

1. **Read** the target chapter top to bottom.
2. **Mark** candidate asymmetric points per the test above.
3. **Identify** the appropriate slot (1–5) for each marked point.
4. **Draft** a 1–2 paragraph insertion per point. Bound the candidate
   set to the strongest 2–4 insertions per chapter; if a chapter has
   more candidates, rank and present the best.
5. **Present** in chat for review *before any file edit*. For each
   insertion show the slot label, the anchor point (the surrounding
   text it sits between), the draft prose, and the citation key.
   Also list one or two candidates considered but rejected, with the
   reason for rejection.
6. **Apply** after the user approves which insertions to keep.
7. **Verify** with `quarto preview chapters/<file>.qmd` — confirm the
   chapter still renders cleanly, citations resolve, callouts display
   correctly.

## Worked example — Chapter 1, commit `86f22c1`

Three insertions added to [chapters/01-uloga-drzave.qmd](chapters/01-uloga-drzave.qmd),
all Slot 1 (Mechanism unpacking).

- **Hayek-style knowledge aggregation** placed after the prices-and-
  coordination paragraph, before `### Pareto učinkovitost`. Anchor
  asymmetry: chapter said prices "use dispersed knowledge" but never
  unpacked how. No citation (Hayek 1945 not in `references.bib`).

- **Kaldor-Hicks compensation criterion** placed after the Pareto-vs-
  pravednost paragraph, before `#### Edgeworthova kutija i ugovorna
  krivulja`. Anchor asymmetry: chapter stopped at Pareto without
  offering the operational criterion that underpins all later CBA
  work in the book. Citation `@boardman2018`.

- **Mirrlees informational obstacle** placed after the Second Welfare
  Theorem critique paragraph, before "Unatoč tim ograničenjima…".
  Anchor asymmetry: chapter said "redistribution is not simple,
  information is incomplete…" as a vague list; the deep reason —
  planner observes earnings not ability — was glossed. Citation
  `@mirrlees1971`.

One candidate considered and rejected. A Slot 4 critique of the
Musgrave taxonomy after its introduction. Rejected because Part II of
the book is dedicated to exactly that public-choice critique — adding
it in Chapter 1 would pre-empt the structural payoff.

## Provenance

- **2026-06-04** — Initial guide distilled from the principle developed
  for the Chapter 1 enrichment pass (commit `86f22c1`).
- **2026-06-05** — Added section "Anchoring in recent landmark
  literature" with a topic-to-books map covering inequality,
  institutions, behavioural public economics, industrial policy,
  macro and crises, democratic dysfunction, and markets-and-morals.
