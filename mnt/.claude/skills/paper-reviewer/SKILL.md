---
name: paper-reviewer
description: Run a rigorous pre-submission review of an academic social science paper (economics, communicology, or related fields). Use whenever the user asks to review a paper, critique a manuscript, do a pre-submission check, simulate referee reports, check a paper for errors, or run any kind of quality assurance on a .tex or academic manuscript. Also trigger when the user mentions referee, reviewer, desk reject, R&R, submission check, or asks to find errors/inconsistencies in a paper. Covers spelling and style, internal consistency, causal claim discipline, math and notation, tables and figures, and a simulated referee evaluation targeting a specific journal.
---

# Pre-Submission Paper Reviewer

Run six review dimensions sequentially on an academic manuscript and produce a consolidated referee report. Designed for empirical social science, with deep support for economics and communicology (communication science). Adaptable to adjacent fields (political science, sociology, psychology, public policy).

## Quick Start

The user invokes this skill with an optional journal target and a paper (uploaded files or a path). Examples:

- "Review my paper for AER"
- "Run a pre-submission check on this manuscript, targeting JOC"
- "Check my paper for errors before I submit to QJE"
- "Review this .tex file"

## Phase 1: Parse the Request

### Identify the target journal

Check whether the user named a journal. Recognized journals (case insensitive):

**Economics:** AER, QJE, JPE, Econometrica, REStud, AEJMacro, AEJMicro, AEJPolicy, AEJApplied, JME, RED, JEEA, JEP, ResStat, EJ, JDE, JHR, JLE, JPubE, JUE, JOLE, JIE, JMon, AERInsights

**Finance:** JF, JFE, RFS, JFQA, JBF

**Communicology:** JOC (Journal of Communication), CR (Communication Research), HCR (Human Communication Research), CMonographs (Communication Monographs), JCMC (Journal of Computer Mediated Communication), MC (Mass Communication and Society), NMS (New Media and Society), Political Communication, IJPP (International Journal of Press/Politics), Journalism, SCJ (Southern Communication Journal)

**Interdisciplinary:** PNAS, Science, Nature Human Behaviour, APSR, AJPS, JOP, ASR, AJS

If no journal is named, set TARGET_JOURNAL to "top field" (apply high general standards without a specific persona).

### Locate the paper

1. Check `/mnt/user-data/uploads` for uploaded files.
2. If the user gave a path, use it.
3. For .tex papers: find the main file (the one containing `\documentclass` or `\begin{document}`), then trace `\input{}`, `\include{}`, and `\subfile{}` to build the full file list. Also glob for figure and table files in common subdirectories.
4. For .pdf or .docx papers: read the file directly.
5. Record the paper title, authors, and abstract.

## Phase 2: Run Six Review Dimensions

Work through each dimension in order. For each one, read the detailed prompt in `references/agent-prompts.md` under the matching heading and follow it closely. Produce the output in the format specified there.

The six dimensions are:

1. **Spelling, Grammar and Style** (copy editing, academic conventions, field specific style)
2. **Internal Consistency and Cross References** (numbers match, claims align, terminology stable)
3. **Unsupported Claims and Identification Integrity** (causal language, generalization, missing caveats)
4. **Mathematics, Equations and Notation** (derivations, notation consistency, specification alignment)
5. **Tables, Figures and Documentation** (self contained, complete notes, cross referencing)
6. **Contribution Evaluation** (simulated referee report for TARGET_JOURNAL)

For communicology papers, Dimensions 3 and 6 should emphasize construct validity, measurement reliability, effect size interpretation, and theoretical grounding rather than exclusively econometric identification. See the field specific adjustments noted in each agent prompt.

For Dimension 6, substitute the resolved TARGET_JOURNAL into the prompt before running it.

## Phase 3: Consolidate and Save

After completing all six dimensions, consolidate into a single report. Read `references/report-template.md` for the exact output structure.

Save the report to `/mnt/user-data/outputs/PRE_SUBMISSION_REVIEW_[YYYY-MM-DD].md` using today's date.

After saving, present the file and tell the user:

- The preliminary recommendation from Dimension 6
- The top 5 priority action items
- Issue counts by category

Keep the summary concise. The report itself contains all details.

## Triage Hierarchy for Priority Ranking

When ranking issues across dimensions for the Priority Action Items section, apply this hierarchy:

1. Identification and credibility failures (Dim 3, Dim 6 Part 2)
2. Missing required analyses (Dim 6 Part 3)
3. Internal inconsistencies (Dim 2)
4. Tables and figures documentation gaps (Dim 5)
5. Mathematical or notation errors (Dim 4)
6. Style and grammar (Dim 1)

Within each dimension, Critical outranks Major outranks Minor.

## Field Specific Notes

### Economics
- "Significant" should be reserved for statistical significance in prose.
- Causal language requires genuine identification (IV, RDD, DiD, RCT, or a compelling natural experiment).
- Tables must report standard errors, clustering level, fixed effects, and observation counts.
- Event study and binscatter plots require confidence intervals.

### Communicology
- Construct validity and measurement reliability are central concerns. Flag any latent construct measured by a single item without justification.
- Effect sizes (Cohen's d, eta squared, partial eta squared, or standardized betas) should accompany every key finding.
- Theoretical grounding matters more than in economics. A paper without a clear theoretical framework is a serious weakness.
- SEM, CFA, and path model specifications should be checked for identification (degrees of freedom, model fit indices reported).
- Mixed methods papers: check that qualitative and quantitative components are integrated, not merely juxtaposed.
- Scales borrowed from prior work should cite the original validation study and report current sample reliability.

## Reference Files

- `references/agent-prompts.md` contains the detailed review instructions for each of the six dimensions. Read the relevant section before performing each review pass.
- `references/report-template.md` contains the exact markdown structure for the final consolidated report.
