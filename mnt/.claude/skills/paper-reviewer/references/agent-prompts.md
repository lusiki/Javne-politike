# Agent Prompts Reference

Detailed instructions for each of the six review dimensions. Read the relevant section before performing each review pass.

## Table of Contents

1. [Dimension 1: Spelling, Grammar and Style](#dimension-1)
2. [Dimension 2: Internal Consistency and Cross References](#dimension-2)
3. [Dimension 3: Unsupported Claims and Identification Integrity](#dimension-3)
4. [Dimension 4: Mathematics, Equations and Notation](#dimension-4)
5. [Dimension 5: Tables, Figures and Documentation](#dimension-5)
6. [Dimension 6: Contribution Evaluation](#dimension-6)

---

<a id="dimension-1"></a>
## Dimension 1: Spelling, Grammar and Style

Adopt the perspective of a copy editor at a top social science journal. Read all manuscript text and perform a thorough review. For LaTeX files, ignore commands (anything starting with \) unless they cause formatting problems. Focus on prose.

### What to check

**Spelling errors.** Pay special attention to proper nouns (author names, place names, dataset names), technical terms, and commonly confused pairs (affect/effect, principal/principle, complement/compliment, discreet/discrete, causal/casual).

**Grammar errors.** Subject verb agreement, tense consistency (present tense for established findings and general claims, past tense for what was done in this paper and for citing prior work), article usage (a/an/the), dangling modifiers, comma splices, run on sentences, sentence fragments. Watch for tense drift within a single paragraph.

**Awkward or convoluted phrasing.** Sentences that require rereading. Nominalizations that obscure agency ("the implementation of the policy" versus "the government implemented the policy"). Suggest clearer alternatives.

**Style violations.** Flag every instance of:

- Filler hedges that add nothing: "interestingly", "importantly", "notably", "it is worth noting", "it is important to note", "needless to say", "obviously", "clearly". Delete these and let the finding speak for itself.
- Tautologies: "very unique", "absolutely essential", "completely eliminate", "past history", "future prospects".
- "Significant" used to mean large or important (reserve for statistical significance in empirical work).
- "This paper contributes to the literature by..." Show the contribution through the work, do not announce it.
- Passive voice where active is natural and attribution matters ("it is shown that" becomes "we show that"). Passive voice is fine when the agent is genuinely irrelevant or unknown.
- Inconsistent first person ("we find" in some places, "the paper argues" in others). Pick one convention and maintain it.
- Nominalization chains: "the facilitation of the implementation of the intervention" should become something readable.

**Field specific style:**
- Economics: check for "impact" used loosely (reserve for contexts with identified causal effects), "utilize" where "use" suffices, "negative" vs "adverse" conflation.
- Communicology: check for jargon without definition on first use (e.g., "parasocial interaction", "cultivation", "framing effects" used before being defined for a general audience), measurement language precision ("reliability" vs "validity" vs "internal consistency").

**Typographic consistency.** Hyphenation (long run vs long-run, high income vs high-income applied correctly for attributive vs predicative), em dash vs en dash vs hyphen, spacing around punctuation, consistent use of serial comma or its consistent absence.

**Number formatting.** Numbers below 10 spelled out in running prose (unless used with a unit of measurement). Percentages consistent (15% vs 15 percent). Decimal places consistent for similar quantities.

### Output format

```
## Dimension 1: Spelling, Grammar and Style

### Critical Issues (must fix before submission)
[numbered list: Location | Problematic text -> Suggested correction | Reason]

### Minor Issues
[numbered list: same format]

### Style Patterns to Fix Throughout
[list recurring style problems with one example each and a global fix instruction]
```

---

<a id="dimension-2"></a>
## Dimension 2: Internal Consistency and Cross References

Adopt the perspective of a technical reviewer checking whether the paper is internally coherent. Read all manuscript text, tables, and figures.

### What to check

**Numerical consistency.** Every time a specific number appears in running text (coefficients, percentages, sample sizes, years, effect sizes), verify it matches the referenced table or figure. Flag discrepancies such as "text says 1.3% but Table 2 Column 3 shows 1.2%."

**Abstract vs body consistency.** Numbers, findings, and claims in the abstract must exactly match the main text and tables. The abstract is the most read part of any paper. Even small mismatches erode credibility.

**Introduction vs results consistency.** When the introduction previews results ("we find X"), verify that the results section delivers exactly that claim with the same direction, magnitude, and qualification.

**Cross reference correctness.** For every "as shown in Figure X", "Table Y shows", "see Appendix A", verify the referenced element exists and actually shows what is claimed. For LaTeX, check that \ref{} labels resolve correctly.

**Terminology consistency.** Identify every key term introduced in the paper and flag any inconsistency in usage or definition. A term defined one way in Section 2 should not shift meaning by Section 5. Check whether the paper uses both "effect" and "impact" interchangeably when one has a specific technical meaning. Check whether variable names shift across sections (e.g., "income" in the text vs "earnings" in the table).

**Sample description consistency.** The stated sample (years, number of observations, inclusion criteria, exclusion criteria) must remain consistent across abstract, data section, table notes, and appendix.

**Model specification consistency.** Do the controls, fixed effects, or covariates included in each specification match what the tables show and what the text claims? For communicology: do SEM model specifications match the verbal descriptions and path diagrams?

**Magnitude consistency.** When the same finding is described in multiple places (abstract, introduction, results, conclusion), are the direction and magnitude stated consistently? Watch for rounding differences that look like contradictions.

**Literature citations.** For each in text citation of an external finding (e.g., "Smith (2020) finds X"), verify that the cited author and year appear in the reference list. Flag any citation where the author year pair has no matching bibliography entry. Flag suspiciously strong characterizations of cited work that do not match what such a paper would plausibly show.

### Output format

```
## Dimension 2: Internal Consistency and Cross References

### Critical Inconsistencies
[numbered list: Location 1 vs Location 2 | What conflicts | Severity: CRITICAL]

### Cross Reference Errors
[numbered list: Reference in text | Target element | Issue]

### Terminology Drift
[numbered list: Term | How it varies | Recommended standardization]

### Minor Inconsistencies
[numbered list: same format as Critical]
```

---

<a id="dimension-3"></a>
## Dimension 3: Unsupported Claims and Identification Integrity

Adopt the perspective of a skeptical methodologist who enforces "claim discipline," the principle that claims must never exceed what the research design allows. Read all manuscript text.

### What to check

**Causal language without causal identification.** Flag every instance of "causes", "leads to", "drives", "determines", "because of", "due to", "results in", "produces", "generates" applied to main findings, unless the paper provides genuine causal identification for that specific claim. Distinguish between: (a) causal language where only correlation is shown, (b) mechanisms described as established facts when they are hypotheses.

For economics: genuine causal identification means IV, RDD, DiD, RCT, structural estimation, or a compelling natural experiment with clearly defended exclusion restrictions.

For communicology: causal identification is rarer and often impossible with survey or content analysis designs. Experimental manipulation is the gold standard. Flag any observational study using causal language. Also flag longitudinal designs that claim causation based on temporal ordering alone (precedence is necessary but not sufficient). Structural equation models do not by themselves establish causation regardless of the direction of arrows.

**Generalization beyond the sample.** Claims that extend findings beyond the data's scope. Examples: claiming broad policy implications from a single country, claiming generalizability to all age groups from a college student sample (a chronic issue in communicology), claiming current relevance for historical results without caveats. Flag any WEIRD (Western, educated, industrialized, rich, democratic) sample generalized without caveat.

**Mechanism claims stated as facts.** When the paper offers an explanation for why a result holds, check whether the mechanism is treated as established or appropriately framed as a hypothesis. Flag every instance where a proposed mechanism is asserted rather than argued. Mediation analyses with cross sectional data deserve special skepticism.

**Unsupported robustness claims.** "Our results are robust to X" must be backed by a displayed robustness check. Flag any claimed robustness that is not demonstrated in a table or figure.

**Missing necessary caveats.** Think of the most obvious threats to internal validity for the specific research design: selection, reverse causality, measurement error, omitted variables, demand characteristics (in experiments), social desirability bias (in surveys), coder reliability (in content analysis). Flag wherever these are not discussed.

**Literature overclaiming.** "No prior study has examined X" or "We are the first to show Y" are strong claims. Flag any that seem likely false given the breadth of the relevant literature.

**Statistical vs practical significance conflation.** Flag where statistical significance is reported but economic or substantive significance is not discussed. A statistically significant but trivially small effect should not be presented as if it matters for theory or policy.

**Effect size reporting.** For communicology papers, flag any key result reported only as a p value without an accompanying effect size measure.

**Hedging failures in both directions.** Overconfident: claims stated too strongly for the evidence. Underconfident: strong results hedged so heavily that the contribution is obscured.

### Output format

```
## Dimension 3: Unsupported Claims and Identification Integrity

### Causal Overclaiming (must address)
[numbered list: Section/paragraph | Problematic text | Why it overclaims | Fix: weaken language OR add evidence]

### Generalization Issues
[numbered list: same format]

### Missing Caveats
[numbered list: Topic | Where it should be addressed | Suggested text]

### Minor Language Issues
[numbered list: same format]
```

---

<a id="dimension-4"></a>
## Dimension 4: Mathematics, Equations and Notation

Adopt the perspective of a mathematical social scientist reviewing all formal content. Read all manuscript text, focusing on equations, mathematical definitions, formal derivations, and statistical model specifications.

### What to check

**Mathematical correctness.** Do derivations follow logically from stated assumptions? Are there algebraic or arithmetic errors? In regression specifications, do the subscripts, superscripts, and terms match the verbal description?

**Notation consistency.** Is the same symbol used for the same quantity throughout? List all symbols defined in the paper and flag any reuse for a different quantity. Are subscripts consistent (i always an individual, t always time, g always a group)? Are vectors and matrices distinguished from scalars where relevant?

**Undefined or ambiguous notation.** Is every symbol defined at or before first use? Flag any symbol used without definition.

**Equation numbering and references.** Are all equations referenced in text actually numbered? Are there numbered equations never referenced (consider removing)? Are equation references correct?

**Regression or model specification consistency.** Does the written specification match: (a) the verbal description, (b) the column headers in results tables, (c) the description of controls or fixed effects or covariates? Are all control variables mentioned in text included in the equation?

For communicology: check SEM and CFA specifications. Are all latent variables, observed indicators, error terms, and covariance paths specified? Do the degrees of freedom reported match what the model implies? Are model fit indices (CFI, TLI, RMSEA, SRMR) all reported and do they match the thresholds cited?

**Return, growth rate, and scaling definitions.** Are annualization formulas correct? Are percentage vs percentage point distinctions maintained? Are log approximations flagged when used? Are standardized vs unstandardized coefficients clearly labeled?

**Statistical notation.** Are standard error, t statistic, and confidence interval formulas correct? Is clustering notation correct and consistent with how the paper describes inference? For communicology: are degrees of freedom reported for F and t tests?

**LaTeX math formatting.** Missing \left and \right for large brackets. Improper use of * for multiplication (use \cdot or \times). Text in math mode not wrapped in \text{}. Alignment issues in multi line equations.

### Output format

```
## Dimension 4: Mathematics, Equations and Notation

### Mathematical Errors
[numbered list: Equation/Location | Error description | Correction]

### Notation Inconsistencies
[numbered list: Symbol | Used for X in location, used for Y in location | Resolution]

### Undefined Notation
[numbered list: Symbol | First used at location | Where to add definition]

### Model Specification Issues
[numbered list: Table/Specification | Discrepancy between equation, text, and table]

### LaTeX Math Formatting
[numbered list: Location | Issue | Fix]
```

---

<a id="dimension-5"></a>
## Dimension 5: Tables, Figures and Documentation

Adopt the perspective of a journal production editor. Read all manuscript text, tables, and figures. Every table and figure must be complete, self contained, and correctly described.

### For every table, check:

**Title and caption.** Does it accurately and fully describe what the table contains? Can a reader understand the table without reading the body text?

**Column headers.** Are they clear, unambiguous, and complete? Do they state the dependent variable and key specification differences?

**Notes completeness.** Every table needs notes covering:
- Sample definition (observations included, time period, restrictions)
- Dependent variable definition and units
- Controls included (or "No controls" or "Controls as in Table X")
- Fixed effects included (economics) or covariates controlled (communicology)
- How standard errors are computed (clustered at what level, robust, bootstrapped)
- Significance star definitions (*** p<0.01, ** p<0.05, * p<0.10)
- Whether the table reports standard errors, t statistics, confidence intervals, or something else
- For communicology: model fit indices for SEM/CFA, reliability coefficients for scales

**Standard errors.** Reported in every column? Clearly identified as standard errors rather than t stats or confidence intervals?

**Observations.** N reported in every column? If columns use different samples, is this clear?

**Cross referencing.** Every table referenced at least once in main text? Any tables defined but never cited?

**Formatting consistency.** All tables use consistent notation for fixed effects indicators, consistent decimal places, consistent significance stars.

### For every figure, check:

**Title and caption.** Does it describe what is shown? Self contained?

**Axis labels.** Both axes labeled? Units included?

**Legend.** If multiple series or colors, is there a legend?

**Confidence intervals.** Binscatter, coefficient, and event study plots must show confidence intervals. For communicology: SEM path diagrams should show standardized coefficients and significance indicators on each path.

**Notes completeness.** Every figure needs notes covering:
- Sample used
- What is plotted (raw data, residuals, predicted values)
- For binscatters: number of bins, whether controls are absorbed, what the dots represent
- For coefficient or forest plots: what the point estimates and intervals represent
- Data source

**Cross referencing.** Every figure referenced in main text? Any figures defined but never cited?

**Cross paper consistency.** Figure and table styles (fonts, line widths, colors) consistent throughout? Formatting conventions applied consistently?

### Output format

```
## Dimension 5: Tables, Figures and Documentation

### Tables with Missing or Incomplete Notes
[organized by table number: Table X | Missing element | Suggested addition]

### Figures with Missing or Incomplete Notes
[organized by figure number: Figure X | Missing element | Suggested addition]

### Cross Reference Issues
[list: Element | Issue]

### Formatting Inconsistencies
[list: Issue | Where it occurs | Standardization recommendation]
```

---

<a id="dimension-6"></a>
## Dimension 6: Contribution Evaluation (Simulated Referee Report)

Adopt the persona of a demanding associate editor at TARGET_JOURNAL. If TARGET_JOURNAL is a specific journal, apply that journal's scope, style preferences, methodological bar, preferred framing, and audience expectations. If TARGET_JOURNAL is "top field", apply high general standards for a leading field journal without a specific persona.

You have read thousands of papers and have extremely high standards. You are deciding whether this paper deserves to be sent to referees or desk rejected. Be exacting, specific, and rigorous, but not hostile.

### Part 1: Central Contribution

State in one sentence what the paper claims to contribute. Then evaluate:
- Is this finding genuinely new, or a replication in a new setting?
- What is the closest prior paper? What does this paper add beyond it?
- Does the paper answer a question that the profession needs answered, or that reasonable scholars disagree about?
- Does this finding change how scholars think about the topic?
- Rate the contribution: Transformative | Significant | Incremental | Insufficient for target journal
- Justify the rating in two to three sentences.

### Part 2: Identification and Credibility

- What variation or design does the paper use to identify its main result?
- Is this variation plausibly exogenous (economics) or is the design internally valid (communicology)?
- Does the paper adequately address threats, or paper over them?
- Is the main finding causal, correlational, or descriptive? Does the paper claim the right thing?
- What would a skeptical seminar audience say?
- What would make the identification or design convincing to the target journal audience?

For communicology: evaluate measurement validity (are the constructs measured well?), manipulation checks (for experiments), and ecological validity alongside internal validity.

### Part 3: Analyses Required and Suggested

**Required** (3 to 5 analyses whose absence is a blocker):
- Robustness checks not performed
- Alternative explanations not ruled out
- Placebo, falsification, or manipulation check tests that are missing
For each: state the analysis, why its absence undermines credibility, and what a positive result would do.

**Suggested** (3 to 5 that would substantially strengthen the paper):
- Mechanism tests
- Subgroup or heterogeneity analyses
- Extensions that broaden the contribution
For each: describe the analysis precisely, explain why it matters, and assess feasibility given the data described.

### Part 4: Literature Positioning

- Does the paper cite the right papers? Obvious omissions?
- Does it adequately distinguish itself from closely related work?
- Is it over citing minor papers and under citing major ones?
- Is the introduction framing the most compelling way to position the paper, or is there a better angle?

### Part 5: Journal Fit and Recommendation

- If a specific journal: is this a strong fit given scope, methods, and contribution level? Identify fit risks.
- If top field: which specific journals are the best realistic targets, and why?
- Preliminary recommendation: Send to referees | Revise before sending | Desk reject
- What would it take, concretely, to reach the target journal's bar?
- Best realistic alternative outlet if not accepted at the target?

### Part 6: Pointed Questions to the Authors

Write 4 to 7 specific, pointed questions that you would send as a referee. These should target the paper's weakest points. Frame them exactly as a referee would in a report.

### Output format

```
## Dimension 6: Contribution Evaluation

### Part 1: Central Contribution
[assessment and rating]

### Part 2: Identification and Credibility
[assessment]

### Part 3: Analyses Required and Suggested
**Required:**
[numbered list of 3 to 5 items]

**Suggested:**
[numbered list of 3 to 5 items]

### Part 4: Literature Positioning
[assessment]

### Part 5: Journal Fit and Recommendation
[recommendation and path to improvement]

### Part 6: Questions to the Authors
[numbered list of 4 to 7 questions]
```
