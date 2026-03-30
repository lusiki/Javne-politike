# Maximum Tier Template

Use for mission critical output, research, legal or financial work.

## Template

```
================================================================================
                         MASTER PROMPT TEMPLATE
================================================================================

[PROMPT METADATA]
Version: 3.0
Task Type: [analysis/generation/classification/extraction/reasoning]
Priority Optimization: [accuracy/speed/creativity/thoroughness]
Diversity Control: [conservative/balanced/exploratory]

--------------------------------------------------------------------------------
                              PHASE 1: FOUNDATION
--------------------------------------------------------------------------------

[PERSONA]
Act like a [specific expert role] with [X years] of experience in [domain].
You are preparing [deliverable type] for [specific audience] who need [specific outcome].

Your expertise includes:
- [Relevant skill 1]
- [Relevant skill 2]
- [Relevant skill 3]

[PREREQUISITE CHECK]
Before beginning work, verify:

1. Input Completeness
   - Do I have all necessary input data?
   - If not, list exactly what is missing

2. Term Clarity
   - Do I understand all key terms?
   - For ambiguous terms, state working definition

3. Implicit Requirements
   - Are there unstated requirements to surface?
   - State all assumptions explicitly

4. Success Criteria
   - What does successful output look like?
   - How will quality be measured?

Proceed only after confirming or flagging gaps.

--------------------------------------------------------------------------------
                              PHASE 2: CONSTRAINTS
--------------------------------------------------------------------------------

[HARD CONSTRAINTS]
- Maximum length: [X words/paragraphs]
- Required elements: [list]
- Forbidden elements: [list]
- Output format: [prose/bullets/JSON/table/code]
- Tone: [formal/conversational/technical]

[GROUNDING RULES]
- Every factual claim must trace to: provided input, cited source, or explicit derivation
- Never invent statistics, quotes, or figures
- Estimates as ranges, labeled explicitly
- Distinguish data from inference

[DOMAIN HEURISTICS]
- Heuristic 1: [field specific rule]
- Heuristic 2: [field specific rule]
- Heuristic 3: [field specific rule]

[CONTEXT PRIORITY]
If input is lengthy, prioritize:
1. [Highest priority element]
2. [Second priority]
3. [Third priority]

--------------------------------------------------------------------------------
                              PHASE 3: EXAMPLES
--------------------------------------------------------------------------------

[FEW SHOT EXAMPLES]

EXAMPLE 1 (Ideal)
Input: [sample input]
Output: [ideal output]
Why this works: [explanation]

EXAMPLE 2 (Ideal)
Input: [sample]
Output: [ideal]

NEGATIVE EXAMPLE
Input: [sample]
Bad Output: [poor output]
Why this fails:
- Problem 1: [specific issue]
- Problem 2: [specific issue]

--------------------------------------------------------------------------------
                           PHASE 4: STRATEGIC THINKING
--------------------------------------------------------------------------------

[ANALOGICAL REASONING]
1. Identify structurally similar problem from different domain
2. Explain what makes them analogous
3. Note what solution worked there
4. Adapt to current context
5. Flag where analogy breaks down

[DELIBERATION PANEL]
PERSPECTIVE A (Pragmatist): most practical, implementable answer
PERSPECTIVE B (Skeptic): what could go wrong, what are we missing
PERSPECTIVE C (Visionary): ideal outcome if constraints relaxed

SYNTHESIS: Which perspective dominates? How to integrate all three?

[EXPLORATION PHASE]
Strategy A: [description] - Pros/Cons
Strategy B: [description] - Pros/Cons
Strategy C: [description] - Pros/Cons

SELECTION: Choose strongest with rationale.

--------------------------------------------------------------------------------
                            PHASE 5: EXECUTION
--------------------------------------------------------------------------------

[CHAIN OF THOUGHT]
Step 1: [task] → CHECKPOINT 1
Step 2: [task] → CHECKPOINT 2
Step 3: [synthesis] → Show reasoning
Step 4: [final output] → Polished only

================================================================================
                              THE ACTUAL TASK
================================================================================

[Your actual input, question, data, or request here]

================================================================================

--------------------------------------------------------------------------------
                         PHASE 6: PROBLEM SOLVING
--------------------------------------------------------------------------------

[IF STUCK PROTOCOL]
1. State specific gap or ambiguity
2. Offer reasonable assumptions (A, B, C)
3. Proceed with most conservative, flagged as [ASSUMPTION]
4. If impossible, explain why and suggest modified version

[METACOGNITIVE MONITORING]
- If making logical leap → pause, fill in steps
- If defaulting to generic → identify what makes this unique
- If recognizing inapplicable pattern → flag and verify
- If growing long without value → compress

[ERROR PATTERN WATCHLIST]
Monitor for: anchoring, confirmation bias, scope creep, false precision, category error, survivorship bias
If caught, name and correct.

--------------------------------------------------------------------------------
                          PHASE 7: QUALITY CONTROLS
--------------------------------------------------------------------------------

[EPISTEMIC STATUS TRACKING]
Tag claims:
[EMPIRICAL] - from provided data
[DERIVED] - logically inferred
[CONVENTIONAL] - standard practice
[SPECULATIVE] - reasonable guess
[INHERITED] - from training, may be outdated

[CONFIDENCE CALIBRATION]
[HIGH CONFIDENCE] - strong support, ~90% likely correct
[MEDIUM CONFIDENCE] - reasonable inference, ~70% likely
[LOW CONFIDENCE] - speculative, ~50% likely

[TEMPORAL AWARENESS]
Flag time dependent claims with [TIME SENSITIVE: validity window]

[COUNTERFACTUAL TESTING]
- If [key assumption] were false, would conclusion hold?
- If data pointed opposite direction, what would that imply?
- What would need to be true for different answer to be correct?

[ADVERSARIAL CHECK]
- Weakest claim in response?
- Counterargument a critic would raise?
- Edge case that would break this?
Address most significant vulnerability.

[STAKEHOLDER IMPACT]
- Who besides requester is affected?
- Second order consequences?
- Excluded perspectives?
- Potential harms?

--------------------------------------------------------------------------------
                          PHASE 8: REFINEMENT
--------------------------------------------------------------------------------

[SPECIFICITY REQUIREMENTS]
- Replace "some/many" → specific quantity
- Replace "often/usually" → frequency
- Replace "soon/recently" → timeframe
- Replace abstract nouns → concrete examples

[COGNITIVE LOAD CHECK]
- Simpler solution that fits requirements?
- Complexity task does not demand?
- Less sophisticated user would understand?
- Can any section be cut?

[COMPRESSION PASS]
1. Remove filler phrases
2. Combine redundant sentences
3. Delete non essential content
4. Replace wordy phrases with precise words
Target 20% reduction.

[SELF EVALUATION RUBRIC]
Score 1 to 5:
- Accuracy: claims supported?
- Relevance: everything serves goal?
- Clarity: audience understands immediately?
- Tone: matches persona and audience?
- Completeness: all required elements present?
- Actionability: user can act on this?

Revise any below 4.

--------------------------------------------------------------------------------
                          PHASE 9: FINAL OUTPUT
--------------------------------------------------------------------------------

[OUTPUT STRUCTURE]

=== SUMMARY ===
[2-4 sentence overview, most important takeaway first]

=== MAIN CONTENT ===
[Primary deliverable with inline confidence tags]

=== CAVEATS ===
[Limitations, assumptions flagged as ASSUMPTION, time sensitive items, uncertainties]

=== VERIFICATION CHECKLIST ===
[How to validate: confirming evidence, disproving test, expert to consult, red flags]

=== NEXT STEPS ===
[Recommended actions, prioritized, with timeframes]

[AUDIENCE VARIANTS]

EXECUTIVE SUMMARY (3 sentences max):
[Bottom line for decision makers]

TECHNICAL APPENDIX:
[Methodology details for specialists]

ONE SENTENCE VERSION:
[Single sentence capture]

--------------------------------------------------------------------------------
                          PHASE 10: META
--------------------------------------------------------------------------------

[FINAL EVALUATION OUTPUT]
{
  "quality_scores": {
    "accuracy": [1-5],
    "relevance": [1-5],
    "clarity": [1-5],
    "tone": [1-5],
    "completeness": [1-5],
    "actionability": [1-5]
  },
  "epistemic_distribution": {
    "empirical": [count],
    "derived": [count],
    "conventional": [count],
    "speculative": [count]
  },
  "confidence_distribution": {
    "high": [count],
    "medium": [count],
    "low": [count]
  },
  "assumptions_made": [],
  "time_sensitive_claims": [],
  "error_patterns_caught": [],
  "vulnerabilities_identified": [],
  "compression_ratio": "[X]%",
  "dominant_perspective": "[pragmatist/skeptic/visionary]",
  "revisions_made": ""
}

[PROMPT FEEDBACK]
=== PROMPT IMPROVEMENT NOTES ===
1. What additional info would help?
2. What instruction was unclear?
3. What constraint was too tight or loose?
4. What step to add or remove?

================================================================================
                              END OF TEMPLATE
================================================================================
```

## When to Use

- Mission critical output
- Research and analysis
- Legal or financial work
- Work where errors have serious consequences
- Complex multi step reasoning requiring full audit trail
- Situations requiring explicit uncertainty quantification
