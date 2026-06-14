# Frontier Expansion Plan — Javne politike u Hrvatskoj

**Status:** Planning document (not chapter content)
**Created:** 2026-05-11 · **Re-baselined:** 2026-06-13
**Audience:** Authors (Deskar-Škrbić, Palić, Šikić) and future collaborators
**Purpose:** Roadmap for extending the book toward research-frontier topics in
public economics and public choice (debates from ~2020 onward). Section titles
intended for the book are in Croatian; planning prose is in English for ease of
editing. The Croatian-facing version of the same argument is
[authors-memo.md](authors-memo.md). The *platform/format* frontier (RAG chat,
explorables, data-as-artifact, audio/EPUB) is a separate axis tracked in
[platform-vision.md](platform-vision.md) — see §8.

> **Why this was rewritten.** The 2026-05-11 version was keyed to a 16-chapter
> TOC (`01-pristupi`, `02-zasto-drzava`, `03-musgrave`…) that no longer exists.
> Since then the book was restructured into **20 chapters across 5 parts**, and
> during that restructure **two of the original five Tier-1 items were already
> absorbed** (AI-and-taxation; ex-post policy evaluation). All file paths,
> insertion points, and the old "editions" renumbering recipe were obsolete.
> This version re-baselines everything against the live
> [_quarto.yml](../_quarto.yml), records what is done / partial / open, and
> replaces the Minimum/Medium/Full editions with a **wave** plan. It also adds
> two themes raised after the restructure: **digital platforms** (§6) and
> **monetary policy** (§7).

---

## 1. Baseline — live TOC (20 chapters, 5 parts)

From [_quarto.yml](../_quarto.yml). No standalone conclusion chapter currently
exists; the book ends on ch. 20.

- **Uvod** — [00-uvod](../chapters/00-uvod.qmd)
- **DIO I — Klasična analiza javnih financija i politika**
  1. [Uloga države](../chapters/01-uloga-drzave.qmd)
  2. [Alokacijska funkcija](../chapters/02-alokacijska-funkcija.qmd) — market failures, public goods, externalities, market power
  3. [Distribucijska funkcija](../chapters/03-distribucijska-funkcija.qmd)
  4. [Stabilizacijska funkcija](../chapters/04-stabilizacijska-funkcija.qmd) — **fiscal-only at present**
- **DIO II — Javni izbor**
  5. [Javni izbor](../chapters/05-javni-izbor.qmd) — rational ignorance / rational irrationality
  5a. [Teorija igara](../chapters/05a-teorija-igara.qmd)
  6. [Kolektivni izbor](../chapters/06-kolektivni-izbor.qmd)
  7. [Stranke i izbori](../chapters/07-stranke-izbori.qmd) — median voter
  8. [Interesne skupine](../chapters/08-interesne-skupine.qmd) — Olson, lobbying
  9. [Birokracija](../chapters/09-birokracija.qmd) — Niskanen, principal-agent
- **DIO III — Nova institucionalna i konstitucionalna ekonomika**
  10. [Institucionalna ekonomika](../chapters/10-institucionalna-ekonomika.qmd)
  11. [Konstitucionalna ekonomika](../chapters/11-konstitucionalna-ekonomika.qmd) — time inconsistency, rules vs. discretion
- **DIO IV — Javne financije i javne politike u praksi**
  12. [Instrumenti](../chapters/12-instrumenti.qmd) — the policy toolkit, incl. regulation
  13. [Javna potrošnja](../chapters/13-javna-potrosnja.qmd)
  14. [Porezi](../chapters/14-porezi.qmd) — incl. *Porezi u doba umjetne inteligencije*
  15. [EU javne financije](../chapters/15-eu-javne-financije.qmd) — own-resources, fiscal rules, NextGenerationEU
- **DIO V — Kako do kvalitetnijih javnih politika?**
  16. [Državni neuspjesi](../chapters/16-drzavni-neuspjesi.qmd)
  17. [Novi javni menadžment](../chapters/17-novi-javni-menadzment.qmd)
  18. [Novo upravljanje](../chapters/18-novo-upravljanje.qmd) — networked / collaborative governance
  19. [CBA i evaluacija](../chapters/19-cba-evaluacija.qmd) — ex-ante **and** ex-post
  20. [Reforme](../chapters/20-reforme.qmd)

Each chapter also has a matching Vodič subpage in [vodic/](../vodic/) — any new
chapter inherits that obligation (see §5.1).

---

## 2. Status of the original five Tier-1 items

| # | Theme | Plan's intent | Live status | Where it landed / belongs |
|---|---|---|---|---|
| 1 | AI & the state | Threading across chapters | **Partial** | **Tax angle ✅ done & deep** — [14-porezi.qmd](../chapters/14-porezi.qmd) *Porezi u doba umjetne inteligencije* (8 subsections). Governance/voting angles **open** — see §3 Wave A |
| 2 | Climate / green public finance | New chapter | **Open — largest gap** | Only a passing clause in [15-eu-javne-financije.qmd](../chapters/15-eu-javne-financije.qmd) listing ETS/CBAM as candidate own-resources — see §3 Wave B |
| 3 | Global tax architecture (GloBE / Pillar 2) | Full subsection | **Mention only** | One sentence in [14-porezi.qmd](../chapters/14-porezi.qmd) (*Porezni sustavi u EU*, "…minimalnom oporezivanju dobiti (BEPS)") — see §3 Wave A |
| 4 | Policy evaluation (ex-post) | Expand CBA chapter | **✅ Done** | [19-cba-evaluacija.qmd](../chapters/19-cba-evaluacija.qmd) — *Evaluacija javnih politika* + *Vrste i metode evaluacije*; DiD/RDD/synthetic-control/RCT present |
| 5 | Demographics / migration / fiscal future | New capstone chapter | **Open** | No dedicated chapter; scattered pension/migration mentions — see §3 Wave C |

**Implication.** The old "+12k / +25k / +39k editions" sizing is dead. With #4
and the bulk of #1 already in, the remaining content frontier is narrower and
better defined. Plan it as **waves**, not editions.

---

## 3. Remaining content frontier — wave plan

### Wave A — small, high relevance-to-effort, no structural ripple

**A1. GloBE / Pillar 2 subsection** *(highest priority; do first)*
- **Where:** expand the one-sentence BEPS mention in
  [14-porezi.qmd](../chapters/14-porezi.qmd) → new `### Globalna porezna
  arhitektura: od BEPS-a do GloBE-a` inside *Porezni sustavi u EU i Hrvatskoj*.
- **Why first:** smallest edit, highest immediate relevance — textbook
  illustration of tax-competition vs. fiscal-coordination, with a concrete HR
  hook (10% rate for SMEs → obligation to levy a domestic top-up tax).
- **~1,200–1,800 words.** From BEPS 1.0→2.0; Pillar 1 (reallocation of taxing
  rights over the largest, mostly digital MNEs — ties to §6); Pillar 2 (15%
  global minimum effective tax, in force in the EU since 2024); HR domestic
  top-up tax. Callout `.callout-empirija`: OECD/IMF estimated revenue effect.
- **Refs:** OECD/G20 (2021, 2023); Devereux et al. (2020); Hugger et al. (2024,
  IMF WP); EU Directive 2022/2523.

**A2. AI-in-governance threading** *(finish what the tax section started)*
- *AI as public good* → `.callout-praksa` in
  [02-alokacijska-funkcija.qmd](../chapters/02-alokacijska-funkcija.qmd),
  public-goods section. Compute/training data/open weights as candidate public
  goods; rivalry via congestion, non-excludability via open weights. Refs:
  Korinek & Stiglitz (2021); Brynjolfsson (2022).
- *LLMs & rational ignorance* → `.callout-empirija` in
  [05-javni-izbor.qmd](../chapters/05-javni-izbor.qmd). How algorithmic
  information consumption changes the cost-of-information calculus. Ties to §6.
  Refs: Caplan (2007) baseline; Allcott & Gentzkow (2017); Goldstein et al.
  (2023).
- *Algorithmic principal-agent* → **split**: mechanics in
  [09-birokracija.qmd](../chapters/09-birokracija.qmd) (when the "agent" is a
  model, monitoring breaks down); accountability/governance implications in
  [18-novo-upravljanje.qmd](../chapters/18-novo-upravljanje.qmd) (this chapter
  did not exist in the old plan and is the natural home for algorithmic
  governance). Refs: Engstrom et al. (2020 ACUS); Veale & Brass (2019); EU AI
  Act (2024).

### Wave B — one chapter-scale decision: climate

**The single open decision that needs the co-authors.** Two shapes:

- **(B-chapter)** New chapter in DIO IV, between
  [14-porezi](../chapters/14-porezi.qmd) and
  [15-eu-javne-financije](../chapters/15-eu-javne-financije.qmd) (or right after
  15). ~7,500–8,500 words. Cleanest pedagogy: externalities recap → Pigouvian
  carbon tax vs. cap-and-trade → EU ETS / ETS 2 (2027) → CBAM and HR exporters
  (CEMEX, TLM, Petrokemija) → green public investment (NPOO) → climate fiscal
  risk. Strongest "frontier" signal.
- **(B-distributed)** Spread across existing chapters: externality recap in
  [02-alokacijska-funkcija](../chapters/02-alokacijska-funkcija.qmd) (negative
  externalities already live there); pricing instruments in
  [12-instrumenti](../chapters/12-instrumenti.qmd); ETS/CBAM/own-resources
  expanded in [15-eu-javne-financije](../chapters/15-eu-javne-financije.qmd)
  (already gestures at it); climate fiscal risk in
  [04-stabilizacijska](../chapters/04-stabilizacijska-funkcija.qmd) or
  [13-javna-potrosnja](../chapters/13-javna-potrosnja.qmd).

**Recommendation: B-chapter.** Climate is too cross-cutting to leave as
fragments, and it is the largest single credibility gap for a 2026 public-finance
text. The new EU chapter makes B-distributed *more* tempting than before (the
ETS/CBAM door is already ajar in ch. 15), so this is a real trade-off worth a
deliberate decision rather than a default. A carbon-price simulator here is a
prime explorable (links to [platform-vision.md](platform-vision.md) §1.1).
- **Refs:** Weitzman (2009); Nordhaus (2018 Nobel lecture); Stern (2007); IPCC
  AR6; EU ETS Directive + amendments; CBAM Regulation (EU) 2023/956; IMF Fiscal
  Monitor Oct 2023; Mazzucato (2021); NGFS scenarios.

### Wave C — co-author-led capstone: demographics

- **New chapter** (provisional ch. 21), positioned as the closing applied
  synthesis — it reuses tools from spending, taxes, distribution and reforms on
  one coherent Croatian case, and the book currently has no conclusion chapter,
  so it can double as the de facto close (or precede a future *Zaključak*).
- **~7,500–8,000 words.** Sections: demographic transition as a fiscal shock;
  emigration and the tax base; pension-system sustainability (PAYG, 1st/2nd
  pillar, NDC options); financing long-term care; immigration / pronatalism and
  its political economy.
- **Ownership:** co-authors lead. The chapter is saturated with HR-specific
  material (HZMO projections, emigration cohorts, Slavonia depopulation), which
  per [ENRICHMENT.md](../ENRICHMENT.md) is reserved for them.
- A dependency-ratio projector is a strong explorable candidate.
- **Refs:** Eurostat EUROPOP 2023; OECD Pensions at a Glance; HZMO ljetopis;
  Borjas (1995); Storesletten (2000); Alesina, Giuliano et al. (2019);
  Auerbach–Kotlikoff generational accounting.

### Tier-2/3 items — remap onto live chapters (insertions, no new chapters)

| Theme | Live home(s) | Form |
|---|---|---|
| Industrial policy / mission-oriented state | [01-uloga-drzave](../chapters/01-uloga-drzave.qmd) + [20-reforme](../chapters/20-reforme.qmd) | subsection + callout |
| Wealth & capital taxation | [14-porezi](../chapters/14-porezi.qmd) (+ inequality empirics in [03-distribucijska](../chapters/03-distribucijska-funkcija.qmd)) | subsection |
| Polarization / populism | [07-stranke-izbori](../chapters/07-stranke-izbori.qmd) + [08-interesne-skupine](../chapters/08-interesne-skupine.qmd) | subsections; deepened by §6 |
| Behavioural public economics | [06-kolektivni-izbor](../chapters/06-kolektivni-izbor.qmd); nudge-in-governance in DIO V | section + callouts |
| Defense / geopolitics spending | [02-alokacijska-funkcija](../chapters/02-alokacijska-funkcija.qmd) + [13-javna-potrosnja](../chapters/13-javna-potrosnja.qmd) | callout + subsection |
| Social impact bonds | [19-cba-evaluacija](../chapters/19-cba-evaluacija.qmd) | callout + vježba |
| CBDC / digital euro | [11-konstitucionalna-ekonomika](../chapters/11-konstitucionalna-ekonomika.qmd) | callout (ties to §7) |
| Crypto / MiCA | [14-porezi](../chapters/14-porezi.qmd) | callout |
| Pandemic fiscal lessons | [02-alokacijska-funkcija](../chapters/02-alokacijska-funkcija.qmd) + [13-javna-potrosnja](../chapters/13-javna-potrosnja.qmd) | callouts |
| r-g / debt sustainability | [04-stabilizacijska](../chapters/04-stabilizacijska-funkcija.qmd) or [20-reforme](../chapters/20-reforme.qmd) | subsection (ties to §7) |

---

## 6. NEW THEME — Digitalne platforme i tržišna moć

**Verdict: real gap, defensible, best as a cross-cutting thread (not a chapter).**
The book has market-power/monopoly theory in
[02-alokacijska-funkcija](../chapters/02-alokacijska-funkcija.qmd) but never
applies it to network effects, two-sided markets, or platform regulation — and
for a 2026, EU-framed public-policy text the omission of the **DMA/DSA**
regulatory wave is conspicuous. Platforms are not a niche tech topic here; they
sit on top of machinery the book already teaches, which is exactly why they
thread cleanly rather than needing their own chapter.

**Where it attaches (in order of fit):**

1. **Market failure** → [02-alokacijska-funkcija](../chapters/02-alokacijska-funkcija.qmd).
   New `### Mrežni učinci, dvostrana tržišta i tržišna moć platformi`
   (~1,000–1,400w). Network externalities → winner-take-all tendency;
   two-sided markets; data and attention as inputs; misinformation as an
   information-pollution negative externality. This is the anchor; everything
   else cross-references it.
2. **Regulatory response** → [12-instrumenti](../chapters/12-instrumenti.qmd)
   (regulation as a policy instrument) with the *governance* half in
   [18-novo-upravljanje](../chapters/18-novo-upravljanje.qmd) (DSA's
   co-regulatory, systemic-risk model). `.callout-praksa` on **DMA**
   (gatekeepers, contestability) and **DSA** (content moderation, transparency,
   systemic-risk audits). Strong EU anchor → on-brand for the book.
3. **Public choice / information** → [05-javni-izbor](../chapters/05-javni-izbor.qmd)
   and [07-stranke-izbori](../chapters/07-stranke-izbori.qmd). Platforms as the
   new locus of political information: algorithmic curation, echo chambers,
   microtargeting — directly extends rational ignorance (merge with the §3-A2
   LLM callout) and stresses median-voter convergence (merge with the Tier-2
   polarization subsection).
4. **Collective action** → [08-interesne-skupine](../chapters/08-interesne-skupine.qmd).
   `### Digitalno organiziranje i Olsonova logika` (~800w). Platforms lower
   organizing costs → easier mobilization of latent/diffuse groups, but also
   astroturfing and bot-amplified "fake grassroots." A genuine update to Olson.
5. **Taxation** → already covered by **A1**: Pillar 1 *is* the digital-MNE
   taxing-rights story; add a DST sentence there rather than duplicating.

**How it affects the book:** turns a classic-theory market-power section into a
live, recognizable case; gives DIO V a concrete contemporary regulatory subject;
and reinforces the AI thread (recommendation engines, generative content) and
the polarization item so the three read as one coherent "digital information
environment" spine rather than three unrelated callouts.

**Refs:** Rochet & Tirole (2003, 2006) two-sided markets; Tirole (2017);
Crémer, de Montjoye & Schweitzer (2019, EU "competition policy for the digital
era"); Furman et al. (2019); Scott Morton et al. (2019, Stigler report); EU DMA
Regulation (EU) 2022/1925; EU DSA Regulation (EU) 2022/2065; Allcott & Gentzkow
(2017); Olson (1965) baseline.

---

## 7. NEW THEME — Monetarna politika i njezina sučelja

**Verdict: defensible — and arguably plugs a current hole.** Monetary policy is
not a digression here for two structural reasons the live book already exposes:

- The **stabilization function** ([04-stabilizacijska](../chapters/04-stabilizacijska-funkcija.qmd))
  is one of Musgrave's three functions, classically split between *fiscal* and
  *monetary* policy. The live chapter is **fiscal-only** — fiscal multiplier,
  automatic stabilizers, political cycles — and says nothing about monetary
  policy, the policy mix, or the fact that **Croatia adopted the euro in 2023
  and surrendered its national monetary lever**. A stabilization chapter silent
  on the country's defining stabilization fact is the strongest argument for
  inclusion.
- The **constitutional chapter** ([11-konstitucionalna](../chapters/11-konstitucionalna-ekonomika.qmd))
  already builds *Vremenska nedosljednost* + *Pravila, vjerodostojnost i
  povjerenje* (Kydland–Prescott / Barro–Gordon) but never cashes the machinery
  out as its canonical application: **central-bank independence**. The hook is
  fully built; only the payoff is missing.

**Three insertion points, all using doorways the book already has:**

1. **Policy mix + loss of the monetary lever** → new
   `### Monetarna politika i fiskalno-monetarni splet` in
   [04-stabilizacijska](../chapters/04-stabilizacijska-funkcija.qmd)
   (~1,200–1,500w). The two arms of stabilization; assignment problem;
   optimum-currency-area logic (Mundell) and what euro adoption means — fiscal
   policy becomes Croatia's *only* national stabilization instrument, raising
   the stakes of fiscal rules (cross-ref ch. 11) and of asymmetric shocks. This
   is also the natural home for the r-g / fiscal-dominance Tier-3 item.
2. **Central-bank independence as constitutional economics** → new
   `### Neovisnost središnje banke kao rješenje vremenske nedosljednosti` in
   [11-konstitucionalna](../chapters/11-konstitucionalna-ekonomika.qmd)
   (~1,000w). Delegation as a commitment device; inflation bias; Rogoff's
   "conservative central banker"; the empirical CB-independence/inflation
   relationship; HNB's position inside the Eurosystem post-2023. CBDC/digital
   euro (Tier-3) attaches here as a `.callout-praksa` on independence in a CBDC
   world.
3. **Inflation tax / seigniorage** → `.callout-empirija` (or short subsection)
   in [14-porezi](../chapters/14-porezi.qmd) or
   [04-stabilizacijska](../chapters/04-stabilizacijska-funkcija.qmd). Inflation
   as a genuine public-finance revenue source and as a regressive implicit tax —
   the cleanest bridge from monetary policy back into public finance proper.

**Scope discipline.** The book should treat monetary policy at its *interfaces*
with public finance and public choice — stabilization mix, the constitutional
commitment problem, the inflation tax, euro adoption — **not** become a monetary
economics text (no money-demand, transmission-mechanism, or Taylor-rule
deep-dives). Framing it as "where fiscal meets monetary" keeps it firmly inside
the book's remit and avoids scope creep.

**Refs:** Kydland & Prescott (1977); Barro & Gordon (1983); Rogoff (1985);
Alesina & Summers (1993); Sargent & Wallace (1981, fiscal dominance); Mundell
(1961, OCA); Blanchard (2019, r-g); standard seigniorage/inflation-tax
treatment (Cagan; Mankiw macro).

---

## 5. Implementation notes (live structure)

### 5.1 Adding a new chapter is no longer just a file + a YAML line
A new chapter (climate, demographics) now pulls three dependencies automatically:
1. Add the `.qmd` under [chapters/](../chapters/) and register it in
   [_quarto.yml](../_quarto.yml) (chapter list **and** appendices Vodič list).
2. Author a matching **Vodič subpage** in [vodic/](../vodic/) — there are 20;
   the hub links to `vodic/NN.html`. A chapter without one breaks the guide.
3. Every chart chunk needs a **grayscale + monospace PDF twin** per the B&W
   chart convention (OJS stays colour); see the committed convention.

### 5.2 Cross-references
Use stable `#sec-…` labels on all new chapters and new sections. Prose
references to chapter *numbers* must be hand-updated if anything renumbers (e.g.
inserting a climate chapter in DIO IV shifts ch. 15→16 and cascades through
DIO V). Prefer `@sec-…` over "u poglavlju 14" in any new prose.

### 5.3 renv
The evaluation chapter (ch. 19) likely already needs `fixest` / `did` /
`rdrobust` / `Synth`; confirm they are pinned in [renv.lock](../renv.lock)
before climate (wants `eurostat`) and demographics land.

### 5.4 STYLE.md and division of labour
Run the [STYLE.md](../STYLE.md) hard-rule sweep on any new prose before commit.
Frontier *mechanics* (GloBE, carbon-pricing theory, CB-independence theory,
platform market-failure theory) are author-draftable; HR-specific *anchors*
(CEMEX/TLM CBAM exposure, HZMO projections, HNB/Eurosystem specifics) are
co-author territory per [ENRICHMENT.md](../ENRICHMENT.md).

### 5.5 Commit hygiene
Use the project's Conventional-Commits prefixes (`copy(<slug>):`,
`feat(<slug>):`, `docs(pdf):`). For a chapter insert that renumbers others, do
the `git mv` + `_quarto.yml` + cross-ref sweep in a single commit, then
re-render and check TOC + PDF.

---

## 4. Sequencing recommendation

> **Progress (2026-06-14, uncommitted on `main`).** ✅ Wave A done (A1 GloBE/Pillar 2
> subsection in ch14; A2 AI-threading callouts in ch02/ch05/ch09/ch18). ✅ §7
> monetary inserts done (ch04 promoted+expanded *Monetarna politika i
> fiskalno-monetarni splet*; ch11 *Neovisnost središnje banke* + digital-euro
> callout; ch14 *Inflacija kao porez*). Both passes were recon-verified (dual
> citation check) and run through a 4-lens adversarial review. ✅ §6 digital-platform
> thread done (ch02 anchor *Mrežni učinci, dvostrana tržišta i tržišna moć platformi*;
> ch12 DMA/DSA callout; ch08 *Digitalno organiziranje i Olsonova logika*; ch07
> deferred as it already carries affective polarization). **Still open:** Wave B
> climate, Wave C demographics, Tier-2/3 (incl. the polarization/populism item ch07
> was held for).

A realistic ordering that front-loads relevance and defers the heavy,
co-author-dependent pieces:

1. **A1 — GloBE/Pillar 2 subsection** (small, highest relevance, no ripple).
2. **A2 — AI-in-governance callouts** + the §6 digital-platform anchor in ch. 2
   (these reinforce each other → ship as one "digital information environment"
   pass).
3. **§7 monetary-policy inserts** (ch. 4 mix + ch. 11 CB independence) — fills a
   structural hole, no new chapter, high pedagogical payoff.
4. **Wave B decision → climate** (the one genuine chapter-scale call).
5. **Wave C — demographics capstone** (co-author-led, last).

Tier-2/3 callouts can be slotted opportunistically alongside whichever chapter
is open.

---

## 9. Open decisions

1. **Climate: chapter vs. distributed (§3 Wave B).** The one decision that
   blocks the largest piece of work. Needs co-author sign-off.
2. **Demographics as de facto conclusion?** The book has no *Zaključak* chapter.
   Either the demographics capstone closes the book, or a separate short
   conclusion follows it. Decide before drafting its final section.
3. **Digital platforms: thread vs. consolidate (§6).** Default is a thread
   anchored in ch. 2. If it grows past ~3,000 words across chapters, reconsider
   a short standalone "Platformska ekonomija" chapter in DIO IV.
4. **Monetary policy scope (§7).** Confirm the "interfaces only" discipline so
   it does not balloon into a monetary-economics unit.
5. **Croatian terminology glossary.** Still unresolved — settle *before*
   drafting: "sludge" (administrativno trenje?), "mission-oriented state"
   (misijska država?), "affective polarization" (afektivna polarizacija),
   "gatekeeper" (čuvar pristupa / vratar?), "two-sided market" (dvostrano
   tržište), "time inconsistency" (vremenska nedosljednost — already used in
   ch. 11, adopt as canonical). Consult HNB Bilten / Privredna kretanja.
6. **Explorables budget.** Climate (carbon-price simulator), demographics
   (dependency-ratio projector) and platforms (network-effects toy) are the
   strongest `{ojs}` candidates and the cleanest seam to
   [platform-vision.md](platform-vision.md) §1.1 — decide whether new chapters
   ship with one explorable each.

---

*End of plan. Maintain by ticking off wave items and updating the §2 status
table as drafting progresses.*
