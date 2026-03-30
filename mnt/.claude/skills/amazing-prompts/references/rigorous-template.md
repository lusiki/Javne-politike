# Rigorous Tier Template

Use for important deliverables, client work, complex analysis.

## Template

```
[PROMPT METADATA]
Task Type: [analysis/generation/classification/extraction]
Priority: [accuracy/speed/creativity/thoroughness]

[PERSONA]
Act like a [specific expert role] with [X years] of experience in [domain].
You are preparing [deliverable type] for [specific audience] who need [specific outcome].

Your expertise includes:
- [Relevant skill 1]
- [Relevant skill 2]
- [Relevant skill 3]

[PREREQUISITE CHECK]
Before beginning:
- Confirm all necessary inputs are present. List any gaps.
- State working definitions for ambiguous terms.
- Surface implicit requirements as explicit assumptions.

[CONSTRAINTS]
- Maximum length: [X words/paragraphs]
- Must include: [required elements]
- Must avoid: [forbidden elements]
- Output format: [specify]

[GROUNDING RULES]
- Every factual claim must trace to input, source, or logical derivation
- No invented statistics or figures
- Estimates given as ranges and labeled

[EXAMPLES]
Example 1
Input: [sample]
Output: [ideal]
Why this works: [explanation]

Example 2
Input: [sample]
Output: [ideal]

Negative Example:
Input: [sample]
Bad Output: [poor]
Why this fails: [specific problems]

[DELIBERATION PANEL]
Before answering, consider three perspectives:
- Pragmatist: most practical solution given constraints
- Skeptic: what could go wrong, what are we missing
- Visionary: ideal outcome if constraints relaxed
Synthesize into balanced response.

[REASONING]
Think step by step:
Step 1: [task] → output as CHECKPOINT 1
Step 2: [task] → output as CHECKPOINT 2
Step 3: [synthesis] → show reasoning
Step 4: [final output] → polished only

[TASK]
[Your actual input here]

[IF STUCK]
If you encounter ambiguity:
1. State the gap
2. Offer reasonable assumptions
3. Proceed with most conservative, flagged as [ASSUMPTION]

[ADVERSARIAL CHECK]
Identify the weakest claim, strongest counterargument, and most likely edge case.
Address significant vulnerabilities before finalizing.

[CONFIDENCE CALIBRATION]
Tag claims as:
[HIGH CONFIDENCE] - strong support
[MEDIUM CONFIDENCE] - reasonable inference
[LOW CONFIDENCE] - speculative

[SELF EVALUATION]
Score 1 to 5: Accuracy, Relevance, Clarity, Tone, Completeness
Revise any dimension below 4.

[OUTPUT STRUCTURE]
=== SUMMARY ===
[2-3 sentence overview]

=== MAIN CONTENT ===
[primary deliverable]

=== CAVEATS ===
[limitations, assumptions, uncertainties]

=== NEXT STEPS ===
[recommended actions]
```

## When to Use

- Client facing deliverables
- Analysis that informs decisions
- Complex multi step reasoning
- Work where errors have consequences
- High stakes professional output
