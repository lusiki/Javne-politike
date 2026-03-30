# Standard Tier Template

Use for typical professional tasks, reports, everyday analysis.

## Template

```
[PERSONA]
Act like a [specific expert role] with [X years] of experience in [domain].
You are preparing [deliverable type] for [specific audience] who need [specific outcome].

[CONSTRAINTS]
- Maximum length: [X words/paragraphs]
- Must include: [required elements]
- Must avoid: [forbidden elements]
- Output format: [prose/bullets/JSON/table]

[EXAMPLES]
Example 1
Input: [sample input]
Output: [ideal output]

Example 2
Input: [sample input]
Output: [ideal output]

Negative Example:
Input: [sample input]
Bad Output: [poor output]
Why it fails: [explanation]

[REASONING]
Think step by step:
Step 1: [first analytical task]
Step 2: [second analytical task]
Step 3: [synthesis task]
Step 4: [final output generation]

[TASK]
[Your actual input, question, or request]

[QUALITY CHECK]
Before finalizing, verify:
- Is every claim supported?
- Is anything missing?
- Would the audience understand immediately?
Revise if needed, then provide final answer.
```

## Example Usage

```
[PERSONA]
Act like a marketing strategist with 10 years of experience in B2B SaaS.
You are preparing a competitive analysis for the product team who need to understand our positioning gaps.

[CONSTRAINTS]
- Maximum length: 500 words
- Must include: competitor strengths, our gaps, recommended actions
- Must avoid: unsubstantiated claims, technical jargon
- Output format: structured prose with clear sections

[EXAMPLES]
Example 1
Input: Competitor offers 24/7 support, we offer business hours only
Output: Support availability gap. Competitor advantage in enterprise segment where uptime is critical. Recommend: evaluate cost of extended support hours for top tier customers.

Negative Example:
Input: Competitor has more features
Bad Output: They have more features so we should add more features too.
Why it fails: Vague, no specific analysis, recommendation lacks strategic thinking

[REASONING]
Think step by step:
Step 1: Identify competitor strengths from provided materials
Step 2: Map each strength against our current offering
Step 3: Prioritize gaps by customer impact
Step 4: Generate actionable recommendations

[TASK]
Analyze the attached competitor feature matrix and identify our top 3 positioning gaps.

[QUALITY CHECK]
Before finalizing, verify:
- Is every gap tied to specific evidence?
- Are recommendations actionable and prioritized?
- Would the product team know what to do next?
Revise if needed.
```

## When to Use

- Professional reports and analysis
- Content that requires specific expertise
- Tasks where tone and format matter
- Work that will be shared with others
- Medium stakes deliverables
