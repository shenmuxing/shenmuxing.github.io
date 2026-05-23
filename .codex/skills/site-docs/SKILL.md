---
name: site-docs
description: Maintain repository documentation, agent instructions, and template guidance for this al-folio website. Use inside shenmuxing.github.io when editing README, AGENTS.md, GEMINI.md, CLAUDE.md, CUSTOMIZE.md, INSTALL.md, TROUBLESHOOTING.md, .github/agents, .github/instructions, or deciding whether guidance should live in a project skill instead of public docs.
---

# Site Docs

## Workflow

1. Decide whether the guidance is for public site users, repository contributors, or Codex agents.
2. Put Codex-operational procedures in `.codex/skills/<skill-name>/SKILL.md`, not in public docs.
3. Keep `AGENTS.md` as a short routing file that points agents to the relevant skill or existing docs.
4. Keep public docs in English and aligned with al-folio's documented Docker-first workflow.
5. Avoid duplicating long runbooks. Reference the canonical skill or document instead.

## Where Guidance Belongs

- `.codex/skills/*/SKILL.md`: reusable agent workflows for this repo.
- `AGENTS.md`: brief entrypoint and routing for coding agents.
- `.github/agents/*.agent.md`: GitHub Copilot-specific agent prompts.
- `.github/instructions/*.instructions.md`: file-type instructions for GitHub Copilot.
- `CUSTOMIZE.md`, `INSTALL.md`, `TROUBLESHOOTING.md`: public al-folio user documentation.
- `GEMINI.md`, `CLAUDE.md`: model-specific local context files.

## Template Material Rule

When a document mainly tells agents how to perform repeatable repo work, classify it into the nearest `.codex/skills` category and leave only a concise pointer in the public-facing or model-specific file.
