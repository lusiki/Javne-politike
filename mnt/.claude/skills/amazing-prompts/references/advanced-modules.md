# Advanced Modules

Standalone modules to add to any prompt for enhanced quality control.

## Table of Contents

1. Deliberation Panel
2. Adversarial Check
3. Counterfactual Testing
4. Epistemic Status Tracking
5. Confidence Calibration
6. Metacognitive Monitoring
7. Error Pattern Watchlist
8. If Stuck Protocol
9. Temporal Awareness
10. Stakeholder Impact Scan
11. Compression Pass
12. Verification Hooks

---

## 1. Deliberation Panel

Simulate internal debate between perspectives before settling on answer.

```
[DELIBERATION PANEL]
Before generating your final answer, simulate deliberation between three perspectives:

PERSPECTIVE A (The Pragmatist)
- What is the most practical, implementable answer?
- What works given real world constraints?

PERSPECTIVE B (The Skeptic)
- What could go wrong with this approach?
- What are we missing or overlooking?

PERSPECTIVE C (The Visionary)
- What is the ideal outcome if constraints were relaxed?
- What unconventional approach might work better?

SYNTHESIS
- Which perspective should dominate for this task?
- How can insights from all three be integrated?
```

**When to use**: Complex decisions, strategic planning, multi stakeholder situations

---

## 2. Adversarial Check

Find weaknesses before finalizing output.

```
[ADVERSARIAL CHECK]
After drafting your answer, adopt the perspective of a skeptical expert:

1. What is the weakest claim in this response?
2. What counterargument would a thoughtful critic raise?
3. What edge case or exception would break this solution?
4. What am I most likely to be wrong about?

Address the most significant vulnerability before finalizing.
If you cannot address it, flag it prominently.
```

**When to use**: High stakes output, recommendations, analysis

---

## 3. Counterfactual Testing

Stress test conclusions by imagining alternatives.

```
[COUNTERFACTUAL TESTING]
After reaching your conclusion, test its robustness:

Test 1: Assumption Reversal
- If [key assumption] were false, would the conclusion still hold?
- Which assumptions is the conclusion most dependent on?

Test 2: Directional Reversal
- If the data pointed in the opposite direction, what would that imply?

Test 3: Alternative Worlds
- What would need to be true for a completely different answer to be correct?

If any counterfactual reveals fragility, acknowledge it in caveats.
```

**When to use**: Analysis tasks, predictions, strategic recommendations

---

## 4. Epistemic Status Tracking

Track the source and quality of knowledge.

```
[EPISTEMIC STATUS TRACKING]
For each major claim, tag its epistemic basis:

[EMPIRICAL] - Based on data or observation provided in the input
[DERIVED] - Logically inferred from other established claims
[CONVENTIONAL] - Standard practice or consensus view
[SPECULATIVE] - Reasonable guess without strong support
[INHERITED] - From training data, may be outdated

Weight conclusions accordingly. Empirical and Derived deserve more confidence.
```

**When to use**: Research tasks, fact checking, complex analysis

---

## 5. Confidence Calibration

Align confidence with actual probability of correctness.

```
[CONFIDENCE CALIBRATION]
For each major claim, append a confidence tag:

[HIGH CONFIDENCE] - Strong evidence or sound logic; ~90% likely correct
[MEDIUM CONFIDENCE] - Reasonable inference, alternatives exist; ~70% likely
[LOW CONFIDENCE] - Speculative or limited information; ~50% likely

Calibration standards:
- Avoid overconfidence and excessive hedging
- When in doubt, move one level toward lower confidence
- High confidence claims should rarely be wrong
```

**When to use**: Any task where accuracy matters, predictions, recommendations

---

## 6. Metacognitive Monitoring

Observe and regulate reasoning in real time.

```
[METACOGNITIVE MONITORING]
As you work, maintain awareness of your reasoning:

Self observation triggers:
- If making a logical leap → pause, fill in missing steps
- If defaulting to generic response → identify what makes this case unique
- If recognizing inapplicable training pattern → flag and verify relevance
- If response growing long without value → compress and refocus
- If uncertain but tempted to sound confident → acknowledge uncertainty

Note any course corrections and what triggered them.
```

**When to use**: Complex reasoning, novel problems, important deliverables

---

## 7. Error Pattern Watchlist

Catch common cognitive failure modes.

```
[ERROR PATTERN WATCHLIST]
Monitor for these failure modes:

- Anchoring: Over weighting first information encountered
- Confirmation Bias: Seeking evidence for initial hunch, ignoring contradictions
- Scope Creep: Answering a question not asked
- False Precision: Implying more certainty than data supports
- Category Error: Treating different types as equivalent
- Survivorship Bias: Only considering successful examples
- Availability Bias: Over weighting easily recalled examples
- Sunk Cost: Continuing flawed approach due to invested effort

If caught in any pattern, name it and correct immediately.
```

**When to use**: Any important task, especially analysis and recommendations

---

## 8. If Stuck Protocol

Handle ambiguity gracefully.

```
[IF STUCK PROTOCOL]
If you encounter ambiguity or missing information:

1. State the specific gap or ambiguity clearly
   - What exactly is unclear or missing?
   - Why does this block progress?

2. Offer reasonable assumptions
   - Assumption A: [description]
   - Assumption B: [description]
   - Assumption C: [description]

3. Select and proceed
   - Choose most conservative or likely assumption
   - Flag with [ASSUMPTION: description]
   - Continue work

4. If truly impossible
   - Explain why task cannot be completed
   - Suggest modified achievable version
   - List what information would unblock
```

**When to use**: Any task with potential ambiguity

---

## 9. Temporal Awareness

Consider time dimension of claims.

```
[TEMPORAL AWARENESS]
Consider time sensitivity:

- Is this information time sensitive? What is shelf life?
- Are there trends that might change this answer?
- Is the question about a snapshot or trajectory?
- Would this answer differ 6 months ago or 6 months from now?

Flag time dependent claims with [TIME SENSITIVE: validity window]
```

**When to use**: Current events, market analysis, technology topics

---

## 10. Stakeholder Impact Scan

Consider effects beyond immediate user.

```
[STAKEHOLDER IMPACT SCAN]
Before finalizing, consider:

- Who besides requester might be affected?
- Are there second order consequences to flag?
- Does output assume perspective that excludes alternatives?
- Would any stakeholder find this harmful or misleading?
- Are there risks the requester might not have considered?

Note concerns in caveats or adjust output.
```

**When to use**: Recommendations, policies, decisions affecting others

---

## 11. Compression Pass

Tighten output for information density.

```
[COMPRESSION PASS]
After drafting, apply tightening:

1. Remove filler phrases
   - "It is important to note that" → delete
   - "In other words" → delete
   - "Basically" → delete

2. Combine sentences making same point

3. Delete sentences not advancing core argument

4. Replace wordy phrases with precise words

Target 20% reduction without losing substance.
Note compression ratio.
```

**When to use**: Any output that would benefit from conciseness

---

## 12. Verification Hooks

Enable external validation of output.

```
[VERIFICATION HOOKS]
Identify how answer can be validated:

- What data or evidence would confirm this conclusion?
- What test or experiment could disprove it?
- What expert or source should be consulted?
- What would a red flag look like if this is wrong?

Include as VERIFICATION CHECKLIST in output.
```

**When to use**: Analysis, recommendations, claims that matter

---

## Module Combinations by Task Type

| Task Type | Recommended Modules |
|-----------|---------------------|
| Analysis | Epistemic Tracking, Counterfactual, Adversarial |
| Decisions | Deliberation Panel, Stakeholder Scan, Confidence |
| Research | Epistemic Tracking, Verification Hooks, Temporal |
| Creative | Deliberation Panel, Metacognitive |
| Technical | Error Watch, If Stuck, Verification Hooks |
| Communication | Stakeholder Scan, Compression Pass |
