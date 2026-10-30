---
name: template-skill
description: >-
  A template and reference implementation for creating new Antigravity skills.
  Activate when you need an example or checklist for structuring a new skill.
---

# Template Skill

This is a starter template for authoring new skills in `zog_skills`.

## When to Use

Activate this skill whenever you need to create a new skill or review skill authoring standards.

## Skill Structure Standard

A standard skill directory contains:

```text
skills/<skill-name>/
├── SKILL.md          # [Required] Main instructions with YAML frontmatter
├── scripts/          # [Optional] Automation scripts and helpers
├── examples/         # [Optional] Code or configuration examples
└── references/       # [Optional] In-depth documentation or manuals
```

## Guidelines for Authoring

1. **Clear Trigger in Description**:
   - The frontmatter `description` determines when the agent activates the skill.
   - Describe **what** the skill does and **when** to invoke it clearly.
2. **Progressive Disclosure**:
   - Keep `SKILL.md` focused on core workflow and actionable instructions.
   - Put lengthy background knowledge or API specs in `references/` and link to them.
3. **Actionable Steps**:
   - Organize workflows with clear, sequential steps.
