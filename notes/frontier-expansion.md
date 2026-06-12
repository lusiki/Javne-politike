# Frontier Expansion Plan — Javne politike u Hrvatskoj

**Status:** Planning document (not chapter content)
**Created:** 2026-05-11
**Audience:** Authors (Deskar-Škrbić, Palić, Šikić) and future collaborators
**Purpose:** Roadmap for extending the book toward research-frontier topics that
have emerged in public economics and public-choice debates from roughly 2020
onward. Three sizing options are described, ranked by author commitment.
Section titles intended to appear in the book are given in Croatian; the
planning prose itself is in English for ease of editing.

---

## 1. Baseline — current TOC (16 chapters)

From [_quarto.yml](_quarto.yml):

- **DIO I: DRŽAVA, JAVNE POLITIKE I TEMELJNI PRISTUPI ANALIZI**
  1. [Pozitivistički i normativni pristup](chapters/01-pristupi.qmd)
  2. [Zašto država postoji? Tržišni neuspjesi](chapters/02-zasto-drzava.qmd)
  3. [Uloga države prema Musgraveu](chapters/03-musgrave.qmd)
  4. [Nova institucionalna ekonomika](chapters/04-institucije.qmd)
  5. [Konstitucionalna ekonomika](chapters/05-konstitucionalna.qmd)
- **DIO II: JAVNI IZBOR**
  6. [Što je teorija javnog izbora](chapters/06-javni-izbor.qmd)
  7. [Tko odlučuje kad svi odlučujemo?](chapters/07-kako-odlucujemo.qmd)
  8. [Glasovanje bez garancije](chapters/08-glasovanje.qmd) *(u pripremi)*
  9. [Stranke, kandidati i političko tržište](chapters/09-stranke-kandidati.qmd) *(u pripremi)*
  10. [Birokrati u akciji](chapters/10-birokrati.qmd) *(u pripremi)*
  11. [Interesne skupine](chapters/11-interesne-skupine.qmd) *(u pripremi)*
- **DIO III: JAVNE FINANCIJE I JAVNE POLITIKE U PRAKSI**
  12. [Kako država troši naš novac?](chapters/12-drzavna-potrosnja.qmd)
  13. [Porezi](chapters/13-porezi.qmd)
  14. [Kako se donose pametne odluke (CBA)](chapters/14-odluke-cba.qmd)
  15. [Reforme](chapters/15-odluke-reforme.qmd)
- **Za kraj**
  16. [Zaključak](chapters/16-zakljucak.qmd) *(u pripremi)*

---

## 2. Editions at a glance

| Property | Minimum | Medium | Full |
|---|---|---|---|
| Net new chapters | +1 | +2 | +2 |
| Major chapter expansions | 1 (ch. 13) | 2 (ch. 13, ch. 14→15) | 3+ |
| New subsections | ~3 | ~6 | ~12 |
| New callouts | ~3 | ~8 | ~15 |
| Word delta | +12 000 | +25 000 | +35–40 000 |
| Frontier coverage | Local relevance | Global + local frontier | Comprehensive |
| Tier-1 items included | #1, #3, #5 | All 5 | All 5 |
| Tier-2 items included | — | — | All 5 |
| Tier-3 items included | — | — | All 5 |

The Tier numbering refers to the priority ranking established in the brainstorm.
See §3.2, §4.2–4.4, §5.2–5.3 below for what each Tier item means in practice.

---

## 3. EDITION 1 — MINIMUM (+~12 000 words)

**What it adds:** AI threading across existing chapters, Pillar 2 / GloBE update
in the tax chapter, one new Croatia-focused chapter on demographics.

**Why this set:** Lowest-effort frontier signal with maximum Croatian relevance.
Preserves all current chapters and order; only inserts one new chapter before
the conclusion. Suitable if author bandwidth is constrained.

### 3.1 New TOC

DIO I–II unchanged. DIO III: 12, 13 (expanded), 14, 15, 16 NEW (Demografija),
17 Zaključak.

**Files to add:**
- `chapters/16-demografija.qmd` (new)

**Files to rename:**
- `chapters/16-zakljucak.qmd` → `chapters/17-zakljucak.qmd`

Update [_quarto.yml](_quarto.yml) accordingly.

### 3.2 Insertions in existing chapters

#### 3.2.1 [02-zasto-drzava.qmd](chapters/02-zasto-drzava.qmd) — sidebar on AI as public good
- **Location:** Within the existing `Javna dobra` section, after the standard
  defense/lighthouse examples.
- **Format:** `.callout-praksa` titled "Frontijerni AI modeli i nova klasa javnih dobara"
- **Length:** ~250 words
- **Content sketch:** Compute infrastructure, training data, and frontier model
  weights as candidate public goods; rivalrousness via congestion;
  non-excludability via open weights. Private capture vs. public provision (EU
  AI Act, US AI Safety Institute, public compute initiatives).
- **Key references:** Acemoglu & Restrepo (2020); Korinek & Stiglitz (2021);
  Brynjolfsson (2022) "Turing Trap".

#### 3.2.2 [06-javni-izbor.qmd](chapters/06-javni-izbor.qmd) — callout on LLMs and rational ignorance
- **Location:** Within the `Racionalno nepoznavanje` / `Racionalna iracionalnost`
  discussion.
- **Format:** `.callout-empirija`
- **Length:** ~300 words
- **Content sketch:** How LLM-mediated information consumption changes the
  cost-of-information calculus underlying rational ignorance. Algorithmic
  curation, echo chambers, recent empirical work on AI-generated political
  content.
- **Key references:** Caplan (2007) baseline; Chen & Shapiro (2022); Goldstein
  et al. (2023) on AI-generated propaganda; Kalla & Broockman (2018) on
  persuasion effects.

#### 3.2.3 [10-birokrati.qmd](chapters/10-birokrati.qmd) — callout on algorithmic agents
- **Location:** Within the principal-agent / Niskanen material.
- **Format:** `.callout-praksa`
- **Length:** ~350 words
- **Content sketch:** Algorithmic decision-making in public administration as a
  new principal-agent layer. When the "agent" is a model, traditional
  monitoring mechanisms (audits, performance contracts) break down;
  accountability gap. EU AI Act high-risk classifications; due-process
  requirements.
- **HR anchor:** Porezna uprava risk-scoring; HZZO algorithmic referrals (if
  documented); e-Građani decision pathways.
- **Key references:** Engstrom et al. (2020 ACUS report); Veale & Brass (2019);
  Coglianese & Lehr (2019); EU AI Act (2024).

#### 3.2.4 [13-porezi.qmd](chapters/13-porezi.qmd) — new subsection on AI/automation taxation
- **Location:** New `### Oporezivanje u doba automatizacije i UI`, inserted
  after the `Lafferova krivulja` section, before the international comparisons.
- **Length:** ~1 500 words
- **Sub-structure:**
  - Tax base erosion as labour share declines (~400w)
  - Robot tax debate: efficiency case and counter-case (~500w)
  - Shifting toward consumption, wealth, and rent-based bases (~300w)
  - AI in tax administration: audit selection, compliance scoring (~300w)
- **Suggested callout:** `.callout-vjezba` — simulate the revenue effect of a
  5pp shift in tax burden from labour to consumption under different elasticity
  assumptions, using HR labour-share data.
- **Key references:** Acemoglu, Manera & Restrepo (2020); Gasteiger & Prettner
  (2022); Costinot & Werning (2023); OECD Tax Administration 3.0 (2020).

#### 3.2.5 [13-porezi.qmd](chapters/13-porezi.qmd) — new subsection on Pillar 1 / Pillar 2
- **Location:** Replace the existing one-sentence "BEPS inicijative" mention
  with a full `### Globalna porezna arhitektura: od BEPS-a do GloBE-a`. Goes
  near the end of the chapter, before the HR-specific section.
- **Length:** ~2 000 words
- **Sub-structure:**
  - From BEPS 1.0 to BEPS 2.0 (~400w)
  - Pillar 1 — reallocation of taxing rights for large MNEs (~500w)
  - Pillar 2 — GloBE rules, 15% global minimum effective tax (~700w)
  - Digital Services Taxes as interim measures (~200w)
  - HR implications: porez na dobit 10%/18%, domestic top-up tax (~200w)
- **Suggested callout:** `.callout-empirija` — estimated revenue effect of
  Pillar 2 for HR (OECD impact assessment; PwC HR analyses).
- **Key references:** OECD/G20 (2021, 2023); Devereux et al. (2020); Hugger et
  al. (2024, IMF WP); EU Directive 2022/2523.

### 3.3 NEW chapter 16: `chapters/16-demografija.qmd`

**Title:** Demografija, migracije i fiskalna budućnost Hrvatske
**Target length:** ~7 500–8 000 words
**Position:** After ch. 15 Reforme, before Zaključak.
**Rationale:** Pulls together threads from chapters 12 (spending), 13
(taxation), and 15 (reforms) and applies them to Croatia's defining
medium-term fiscal challenge. Acts as a synthetic case study and a bridge to
the conclusion.

**Sections:**

1. `## Demografska tranzicija kao fiskalni šok` (~1 500w)
   - Stylised facts: HR fertility, life expectancy, dependency ratio trajectory
     1990→2050
   - Mechanism: dependency ratio dynamics and tax-base shrinkage
   - Comparative: HR vs. CEE peers, EU averages
   - Callout: `.callout-empirija` — Eurostat EUROPOP projections for HR
     through 2070

2. `## Emigracija i porezna baza` (~1 500w)
   - Croatian emigration waves: 1990s, post-2013 EU accession
   - Selection effects: prime-age, educated, formal-sector workers
   - Effects on labour income tax base and social contributions
   - Regional asymmetry: Slavonija depopulation
   - Callout: `.callout-praksa` — fiscal impact of one cohort of emigrant
     labour over a working lifetime

3. `## Održivost mirovinskog sustava` (~2 000w)
   - HR PAYG architecture: prvi stup, drugi stup (15/5 split)
   - Replacement-rate trajectory under current rules
   - 2024+ reforms: ranija mirovina kazne, mirovinske formule
   - Options: NDC (notional defined contribution), parametric reforms,
     retirement-age indexing
   - Public choice angle: pensioner voting bloc, intergenerational
     redistribution
   - Callout: `.callout-vjezba` — HZMO projection data, compute sustainability
     under three scenarios

4. `## Financiranje dugotrajne skrbi` (~1 500w)
   - Informal-care default in HR; gender distribution of unpaid care
   - Models: insurance (DE), tax-financed (NL/SE), means-tested (UK)
   - Costing under HR aging trajectory
   - Callout: `.callout-praksa` — DE Pflegeversicherung as institutional
     template

5. `## Imigracija, pronatalitet i politička ekonomija demografskih politika` (~1 500w)
   - HR labour-migration permit surge 2020+
   - Fiscal arithmetic of immigration: short vs. long horizon
   - Pronatalist policy: HU/PL evidence, HR municipal incentives, evidence on
     effectiveness
   - Public choice: concentrated electoral benefits, low cost-effectiveness
   - Callout: `.callout-empirija` — meta-analysis evidence on pronatalist
     cost-per-additional-birth

**Key references to add to `references.bib`:**
- Eurostat EUROPOP demographic projections
- HZMO actuarial reports
- OECD Pensions at a Glance (HR profile)
- Storesletten (2000); Borjas (1995) — migration fiscal effects
- Alesina, Giuliano et al. (2019) — fertility and pronatalist policy
- Auerbach & Kotlikoff generational accounting framework

**Data sources for chunks and exercises:**
- DZS census 2001, 2011, 2021
- Eurostat NUTS-2 demographic series
- HZMO Mirovinski statistički ljetopis
- World Bank ASPIRE social protection database

---

## 4. EDITION 2 — MEDIUM (+~25 000 words)

**What it adds on top of Minimum:**
- New climate chapter (between current 13 and 14)
- Major expansion of the CBA chapter into "Odluke i evaluacija"

**Why this set:** Strongest "frontier" claim per word. Climate is the largest
single gap in the current book given EU policy salience; the evaluation
expansion responds to the empirical-methods revolution in applied public
economics.

### 4.1 New TOC

- DIO I (1–5): unchanged, with sidebar inserts from Minimum
- DIO II (6–11): unchanged, with callout from Minimum
- **DIO III (12–16):**
  12. Kako država troši naš novac? (unchanged)
  13. Porezi (expanded as in Minimum)
  14. **NEW**: Zelene javne financije i klimatska politika
  15. Kako se donose pametne odluke (CBA + evaluation expansion — was ch. 14)
  16. Reforme (was ch. 15)
- **Za kraj:**
  17. **NEW**: Demografija, migracije i fiskalna budućnost Hrvatske (was ch. 16
      in Minimum)
  18. Zaključak

**Files to add:**
- `chapters/14-klima.qmd`
- `chapters/17-demografija.qmd`

**Files to rename:**
- `chapters/14-odluke-cba.qmd` → `chapters/15-odluke-cba.qmd`
- `chapters/15-odluke-reforme.qmd` → `chapters/16-odluke-reforme.qmd`
- `chapters/16-zakljucak.qmd` → `chapters/18-zakljucak.qmd`

Update [_quarto.yml](_quarto.yml); verify all `@sec-...` cross-references in
renamed chapters.

### 4.2 NEW chapter 14: `chapters/14-klima.qmd`

**Title:** Zelene javne financije i klimatska politika
**Target length:** ~7 500–8 500 words
**Position:** Between current ch. 13 (Porezi) and CBA chapter.
**Rationale:** Builds directly on externalities (ch. 2), tax instruments
(ch. 13), and feeds into CBA (ch. 15) and reforms (ch. 16).

**Sections:**

1. `## Eksternalije ponovno: zašto je klima poseban slučaj` (~1 500w)
   - Recap of ch. 2 externalities, extended to global commons
   - Time horizon, irreversibility, tail risk
   - Coasean bargaining failure for diffuse global externalities
   - Discount rate debate (Stern vs. Nordhaus)
   - Callout: `.callout-empirija` — DICE/PAGE estimates of social cost of
     carbon

2. `## Cijena ugljika: porez vs. trgovanje emisijama` (~2 000w)
   - Pigouvian taxation: theory and Pigou club
   - Cap-and-trade: theory and EU ETS architecture
   - EU ETS evolution: phases I–IV, allowance allocation, Market Stability
     Reserve
   - EU ETS 2 (2027): buildings and road transport
   - National carbon taxes (SE, FR experience)
   - Hybrid systems and price corridors
   - Callout: `.callout-praksa` — EU ETS impact on INA/HEP costs, pass-through
     to consumers

3. `## CBAM i međunarodne posljedice` (~1 500w)
   - Carbon leakage problem
   - CBAM mechanism: scope, phasing, certificates
   - WTO / trade-law considerations
   - Effects on HR exporters: cement (CEMEX HR), aluminium (TLM), fertilizers
     (Petrokemija), steel
   - Callout: `.callout-vjezba` — estimate CBAM cost impact for one HR exporter
     under different ETS price scenarios

4. `## Zelena javna ulaganja i industrijska politika` (~1 500w)
   - NextGenerationEU green pillar
   - NPOO komponente C1, C5 (zelena tranzicija)
   - Mission-oriented framework (Mazzucato) for green investment
   - Crowding-in vs. crowding-out
   - IRA, EU Green Deal Industrial Plan
   - Callout: `.callout-empirija` — NPOO green-pillar allocation and
     disbursement

5. `## Klimatski fiskalni rizici` (~1 000w)
   - Physical risk: damages, contingent liabilities
   - Transition risk: stranded assets, sovereign exposure
   - Climate stress tests (ECB, NGFS)
   - HR exposure: tourism, agriculture (Slavonija droughts), real estate
     (coastal)
   - Callout: `.callout-praksa` — HNB / ECB climate stress test results for HR
     banks

**Key references:**
- Weitzman (2009) "fat tails"; Nordhaus (2018 Nobel lecture); Stern (2007)
- IPCC AR6
- EU ETS Directive (2003/87/EC and amendments); CBAM Regulation (EU) 2023/956
- IMF Fiscal Monitor October 2023 (climate)
- Mazzucato (2021) — mission economy
- NGFS scenarios

### 4.3 EXPANSION of chapter 15 (was 14): `chapters/15-odluke-cba.qmd`

**New title:** Kako se donose pametne odluke: od CBA do evaluacije politika
**Net addition:** ~5 500 words on top of existing material; chapter roughly
doubles in length.

**New sections to add after existing CBA content:**

6. `## Od CBA prema evaluaciji: ex-ante vs. ex-post` (~1 000w)
   - CBA is ex-ante: predicted effects. Evaluation is ex-post: realised
     effects.
   - Why ex-post matters: model risk, behavioural response, Goodhart effects
   - Policy cycle integration: design → CBA → pilot → evaluation → scale or kill
   - Callout: `.callout-empirija` — share of public investments globally that
     get rigorous ex-post evaluation (low)

7. `## Kvazi-eksperimentalne metode` (~2 000w)
   - Difference-in-differences: classical and staggered-treatment versions
   - Regression discontinuity (sharp / fuzzy)
   - Instrumental variables
   - Synthetic control
   - Each with one canonical study and one HR-applicable example
   - Callout: `.callout-vjezba` — use HR HZZ active-labour-market measures as a
     natural experiment; sketch a DiD design

8. `## RCT-ovi u javnim politikama` (~1 500w)
   - 2019 Nobel: Banerjee, Duflo, Kremer
   - Field experiments in tax compliance (HMRC), labour market (Sianesi),
     education
   - When RCTs are feasible vs. not; ethical and political constraints
   - Behavioural Insights Team model
   - Callout: `.callout-praksa` — HMRC reminder-letter trial as template; HR
     Porezna uprava possible applications

9. `## Institucionalizacija evaluacije` (~1 000w)
   - "What Works" centres (UK), J-PAL, IPA
   - Pre-registration of policy evaluations
   - Open government data and replication
   - HR institutional gap: lack of dedicated evaluation infrastructure
   - NPOO milestone evaluation obligations as forcing function
   - Callout: `.callout-praksa` — proposal sketch for a HR evaluation clearing
     house

**Key references:**
- Card (1990); Card & Krueger (1994); Angrist & Pischke (2009, 2014)
- Imbens & Wooldridge (2009)
- Banerjee & Duflo (2011, 2019)
- Hallsworth et al. (2017) — tax nudges
- Roth, Sant'Anna, Bilinski & Poe (2023) — DiD methods review
- de Chaisemartin & D'Haultfœuille (2020, 2024)
- HM Treasury Magenta Book (UK evaluation guidance)

### 4.4 New chapter 17: Demografija

Content identical to §3.3, but renumbered to ch. 17 in this edition.

---

## 5. EDITION 3 — FULL (+~35 000–40 000 words)

**What it adds on top of Medium:**
- Tier-2 items: industrial policy (ch. 3 + ch. 16), defense (ch. 2 + ch. 12),
  wealth taxation (ch. 13), polarization / populism (ch. 9, 11, 16),
  behavioural public economics (ch. 7)
- Tier-3 items: CBDCs (ch. 5), crypto / MiCA (ch. 13), pandemic lessons (ch. 2,
  12), r-g and debt sustainability (ch. 12 or 16), SIBs (ch. 15)

**Why this set:** Comprehensive frontier coverage. Suitable as a 2nd-edition
target rather than a 1st-edition target.

### 5.1 New TOC

Same chapter structure as Medium (16 + 2 = 18 chapters); all additions are
subsections and callouts inside existing chapters.

### 5.2 Tier-2 additions

#### 5.2.1 New industrial policy
- **In [03-musgrave.qmd](chapters/03-musgrave.qmd):** new `### Suvremena kritika:
  misijska država` (~1 000w). After the classical functions, introduce
  Mazzucato / Rodrik productivism, the state as direction-setter rather than
  market-fixer.
- **In ch. 16 (Reforme):** new `### Industrijska politika kao reforma`
  (~1 200w). IRA, CHIPS, EU Chips Act, NextGenerationEU. NPOO komponenta C1.1,
  HBOR mandate evolution.
- **Key references:** Mazzucato (2013, 2021); Rodrik (2014, 2022); Aghion et
  al. (2021); Juhász, Lane & Rodrik (2023) on industrial-policy revival.

#### 5.2.2 Defense and geopolitics
- **In [02-zasto-drzava.qmd](chapters/02-zasto-drzava.qmd):** `.callout-praksa`
  (~400w) updating defense as a classic public good for post-2022 reality.
- **In [12-drzavna-potrosnja.qmd](chapters/12-drzavna-potrosnja.qmd):** new
  `### Obrambeni izdaci i geopolitički preokret` (~800w). NATO 2%+ as floor,
  EU defense bond debates, HR procurement (Rafale, F-16 trajectory).
- **Key references:** SIPRI yearbook; Hartley & Sandler (1995) handbook;
  Becker (2024) on Russia–Ukraine fiscal effects.

#### 5.2.3 Wealth and capital taxation
- **In [13-porezi.qmd](chapters/13-porezi.qmd):** new subsection `### Bogatstvo,
  nasljeđe i optimalno oporezivanje kapitala` (~1 800w). After the existing
  tax-system typology.
- Piketty / Saez / Zucman empirics; NO / ES / CH wealth-tax evidence;
  Chamley–Judd revisited (Straub-Werning, Saez-Stantcheva); inheritance
  taxation; HR property-tax gap.
- **Callout:** `.callout-empirija` (~300w) — top-income shares for HR
  (EUROMOD-based or Bartolj / Nestić estimates).
- **Key references:** Piketty (2014); Saez & Zucman (2019); Scheuer & Slemrod
  (2021); Advani, Chamberlain & Summers (2020 UK wealth tax commission);
  Straub & Werning (2020).

#### 5.2.4 Polarization, populism, democratic backsliding
- **In [09-stranke-kandidati.qmd](chapters/09-stranke-kandidati.qmd):** new
  `### Polarizacija i slom konvergencije` (~1 200w). Affective polarization
  (Iyengar et al.), social-media mechanisms, why median-voter convergence fails
  empirically.
- **In [11-interesne-skupine.qmd](chapters/11-interesne-skupine.qmd):** new
  `### Populizam: ekonomski i kulturni okidači` (~1 000w). Rodrik framework;
  Guriev & Papaioannou survey.
- **In ch. 16 (Reforme):** expand the existing Mađarska callout to a
  `.callout-empirija` (~400w) covering V-Dem trends and Bermeo's
  gradual-backsliding model.
- **HR anchor:** HDZ–SDP historical convergence vs. Možemo / DP polarization;
  Eurobarometer trust series.
- **Key references:** Iyengar et al. (2019); Rodrik (2018, 2021); Guriev &
  Papaioannou (2022); Bermeo (2016); Levitsky & Ziblatt (2018); V-Dem dataset.

#### 5.2.5 Behavioural public economics
- **In [07-kako-odlucujemo.qmd](chapters/07-kako-odlucujemo.qmd):** new section
  `## Bihevioralni okvir javnih politika` (~1 800w). After the Arrow material.
  Subsections:
  - `### Default-opcije i mirovine` (Madrian–Shea, Chetty)
  - `### Sludge i administrativni teret` (Sunstein)
  - `### Nudge u poreznoj usklađenosti` (Hallsworth / HMRC)
- **HR anchor:** e-Građani as sludge reduction; auto-enrolment in drugi stup;
  Porezna's reminder experiments (if documented).
- **Key references:** Madrian & Shea (2001); Chetty et al. (2014); Sunstein
  (2020); Hallsworth et al. (2017); Thaler & Sunstein (2008, 2021 updated
  edition).

### 5.3 Tier-3 additions

#### 5.3.1 CBDCs / digital euro
- **In [05-konstitucionalna.qmd](chapters/05-konstitucionalna.qmd):**
  `.callout-praksa` (~400w) on central-bank independence in a CBDC world.
- HR anchor: digital euro pilot, HNB role post-euro adoption.

#### 5.3.2 Crypto, MiCA, DeFi
- **In [13-porezi.qmd](chapters/13-porezi.qmd):** `.callout-praksa` (~400w).
  MiCA in force 2024, DAC8 reporting, HR 10% capital-gains treatment after
  2-year holding.

#### 5.3.3 Pandemic fiscal lessons
- **In [02-zasto-drzava.qmd](chapters/02-zasto-drzava.qmd):** `.callout-praksa`
  (~350w). Pandemic preparedness as global public good; mRNA platforms.
- **In [12-drzavna-potrosnja.qmd](chapters/12-drzavna-potrosnja.qmd):**
  `.callout-empirija` (~400w). COVID furlough as natural experiment; HZZ mjera
  za očuvanje radnih mjesta uptake and cost.

#### 5.3.4 Sovereign debt sustainability (r-g)
- **In [12-drzavna-potrosnja.qmd](chapters/12-drzavna-potrosnja.qmd) or in ch.
  16 (Reforme):** new `### r-g i održivost duga` (~1 000w). Blanchard 2019,
  post-pandemic shift, implications for fiscal rules. HR public-debt
  trajectory 2014→2025, euro-adoption impact on borrowing costs.
- **Key references:** Blanchard (2019, 2023); Mauro & Zhou (2021); EU
  fiscal-rules reform 2024.

#### 5.3.5 Social impact bonds
- **In ch. 15 (CBA + evaluation):** `.callout-praksa` (~400w) on outcomes-based
  contracting; `.callout-vjezba` — design a SIB for an HR social problem (e.g.
  long-term unemployment, recidivism).
- **Key references:** Fraser et al. (2018); GO Lab (Oxford) case database.

---

## 6. Implementation notes

### 6.1 Renumbering and file moves

When adding new chapters (Editions 1 and 2), do the renames in a single commit:
1. `git mv` the affected `.qmd` files to new numbered names.
2. Update [_quarto.yml](_quarto.yml) chapter list.
3. Search-and-replace cross-references: `@sec-...` labels survive renames, but
   any prose references to chapter numbers (e.g. "u poglavlju 14") must be
   updated.
4. Re-render the book and check the TOC and PDF.

### 6.2 Cross-reference labels

Adopt stable `#sec-...` labels in all new chapters and on any new sections in
existing chapters. This insulates the prose from chapter-number changes
between editions.

### 6.3 references.bib additions (consolidated)

Group by topic. Below is the minimum set for Medium edition; Full edition adds
roughly 30 more entries.

**AI and automation:**
- Acemoglu & Restrepo (2020) "Robots and Jobs," JPE
- Acemoglu, Manera & Restrepo (2020) "Does the US Tax Code Favor Automation?"
  BPEA
- Korinek & Stiglitz (2021) "AI and Its Implications for Income Distribution"
- Costinot & Werning (2023) "Robots, Trade, and Luddism," RES

**Global tax architecture:**
- OECD / G20 (2021) "Statement on a Two-Pillar Solution"
- OECD (2023) "GloBE Rules: Commentary"
- Hugger, González Cabral, Bucci, Gesualdo & O'Reilly (2024) IMF WP on
  Pillar 2

**Climate:**
- Weitzman (2009) "On Modeling and Interpreting the Economics of Catastrophic
  Climate Change"
- Nordhaus (2018) Nobel lecture
- IPCC AR6 Synthesis Report
- IMF Fiscal Monitor October 2023 (climate)
- CBAM Regulation (EU) 2023/956

**Evaluation methods:**
- Angrist & Pischke (2009) "Mostly Harmless Econometrics"
- Banerjee & Duflo (2019) "Good Economics for Hard Times"
- Roth, Sant'Anna, Bilinski & Poe (2023) "What's Trending in DiD?" J.
  Econometrics
- HM Treasury Magenta Book

**Demographics / pensions:**
- Eurostat EUROPOP 2023
- OECD Pensions at a Glance 2023
- HZMO Mirovinski statistički ljetopis (annual)
- Borjas (1995) "Economic Benefits from Immigration"

### 6.4 Data sources for new callouts and exercises

- **EUROSTAT:** demographic projections (EUROPOP), tax revenue (gov_10a_taxag),
  ETS allowance prices
- **DZS:** census 2011, 2021; vital statistics
- **HZMO:** pension statistics, replacement rates
- **HNB:** fiscal data, banking sector climate stress tests
- **Eurobarometer:** trust series for HR
- **V-Dem:** democracy indicators
- **EU ETS registry:** allowance prices, allocations
- **NPOO portal:** disbursement data
- **EUROMOD:** HR microsimulation for distributional analysis

### 6.5 SCSS / theming

No theming changes needed. New callouts use the existing `.callout-praksa`,
`.callout-empirija`, `.callout-vjezba` classes already styled in
[styles/custom.scss](styles/custom.scss).

### 6.6 R package dependencies

Climate, evaluation, and demographics chapters benefit from:
- `fixest` (panel estimators, DiD)
- `did` (Callaway–Sant'Anna)
- `rdrobust` (RDD)
- `Synth` (synthetic control)
- `eurostat` (data access)

Add to `renv.lock` if not already present.

---

## 7. Open decisions

1. **Conclusion chapter scope.** Whether to expand
   [16-zakljucak.qmd](chapters/16-zakljucak.qmd) (currently placeholder) to
   integrate frontier themes, or leave it as a tight Part-recap. The new
   demographics chapter as a bridge largely covers the integrative role.

2. **Climate as new chapter vs. distributed.** Plan above assumes a new chapter
   (Option A from the initial brainstorm). The Option B distributed version
   remains available if the Medium edition feels too long.

3. **Terminology.** Croatian translations needed for:
   - "Sludge" → administrativno trenje? administrativno opterećenje?
   - "Mission-oriented state" → misijska država vs. država s misijom?
   - "Affective polarization" → afektivna polarizacija (standard) or emocionalna
     polarizacija?
   - "Friend-shoring" → no settled HR term; possibly "preusmjeravanje
     proizvodnje prema saveznicima"
   Establish a glossary early; consult HNB Bilten / Privredna kretanja
   terminology.

4. **OJS interactivity.** The climate chapter (carbon-price simulator), the
   demographics chapter (dependency-ratio projector), and the evaluation
   chapter (DiD synthetic-data demo) are all strong candidates for `{ojs}`
   interactive blocks. Budget development time accordingly.

5. **Edition release strategy.** Whether to ship Minimum as v1.0, Medium as
   v2.0, Full as v3.0, or compress to v1.0 = Medium and v2.0 = Full. The
   former is safer; the latter signals frontier ambition immediately.

---

*End of plan. Maintain by updating per-edition word counts as drafting
progresses and ticking off implementation items.*
