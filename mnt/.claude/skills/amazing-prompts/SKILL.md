---
name: amazing-prompts
description: Advanced prompt engineering framework for creating high quality prompts. Use when users ask to create prompts, improve prompts, write prompts for AI models, build prompt templates, or need help with prompt engineering. Covers persona prompting, few shot learning, chain of thought reasoning, self evaluation, adversarial testing, and metacognitive monitoring techniques.
---

# Amazing Prompts Skill

Create cutting edge prompts using a comprehensive framework that integrates persona assignment, few shot examples, chain of thought reasoning, quality controls, and self evaluation mechanisms.

## Core Prompt Creation Workflow

1. **Assess complexity** to select appropriate tier
2. **Define foundation** with persona and audience
3. **Set constraints** for length, format, and boundaries
4. **Provide examples** showing ideal and poor outputs
5. **Structure reasoning** with explicit steps
6. **Add quality controls** appropriate to stakes
7. **Define output format** with clear sections

## Tier Selection Guide

| Tier | Complexity | Use Case |
|------|------------|----------|
| Minimal | Low | Quick queries, simple lookups |
| Standard | Medium | Everyday professional tasks |
| Rigorous | High | Important deliverables |
| Maximum | Critical | High stakes, research |

## Essential Components

### Foundation Block

```
[PERSONA]
Act like a [specific expert role] with [X years] of experience in [domain].
You are preparing [deliverable type] for [specific audience] who need [specific outcome].
```

### Constraints Block

```
[CONSTRAINTS]
- Maximum length: [X words/paragraphs]
- Must include: [required elements]
- Must avoid: [forbidden elements]
- Output format: [prose/bullets/JSON/table]
```

### Few Shot Examples Block

```
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
```

### Chain of Thought Block

```
[REASONING]
Think step by step:
Step 1: [first analytical task]
Step 2: [second analytical task]
Step 3: [synthesis task]
Step 4: [final output generation]
```

### Self Evaluation Block

```
[QUALITY CHECK]
Score 1 to 5: Accuracy, Relevance, Clarity, Tone, Completeness
Revise any dimension below 4.
```

## Tier Specific Templates

For complete templates at each tier, see:

- **Minimal tier**: See [references/minimal-template.md](references/minimal-template.md)
- **Standard tier**: See [references/standard-template.md](references/standard-template.md)
- **Rigorous tier**: See [references/rigorous-template.md](references/rigorous-template.md)
- **Maximum tier**: See [references/maximum-template.md](references/maximum-template.md)

## Advanced Modules

Add these modules for higher stakes tasks. See [references/advanced-modules.md](references/advanced-modules.md) for full implementations:

| Module | Purpose | When to Add |
|--------|---------|-------------|
| Deliberation Panel | Multi perspective analysis | Complex decisions |
| Adversarial Check | Find weaknesses | High stakes output |
| Counterfactual Testing | Stress test conclusions | Analysis tasks |
| Epistemic Tracking | Track claim sources | Research tasks |
| Metacognitive Monitoring | Self aware reasoning | Complex reasoning |
| Error Pattern Watch | Catch cognitive biases | Any important task |

## Output Requirements

When creating prompts for users:

1. Match template complexity to stated use case
2. Fill in all bracketed placeholders with task specific content
3. Remove modules not needed for the task
4. Provide the prompt in a code block for easy copying
5. Explain which tier was selected and why
6. Offer to adjust complexity up or down

## Quick Reference Checklist

Before finalizing any prompt, verify:

- [ ] Persona defined with role, experience, audience
- [ ] Constraints set for length, format, requirements
- [ ] Examples provided (positive and negative)
- [ ] Reasoning steps explicit and sequential
- [ ] Quality check mechanism included
- [ ] Output structure specified
- [ ] Complexity matched to task stakes
