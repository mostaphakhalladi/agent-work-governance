# Agent Work Governance

This repository is the external, versioned source of truth for cross-project agent work rules.

The canonical policy is `AGENTS.md`. On the primary development machine it is linked into `~/.codex/AGENTS.md` so Codex-compatible sessions inherit the policy across repositories.

The policy deliberately separates:
- agent behavior and visible 8-12 minute work cadence;
- technical decision discipline;
- runner/parallelization rules;
- exact-head merge discipline;
- reusable QA practices;
- side-effect/deployment boundaries;
- cross-chat continuity.

## Important limitation

Repository rules and GitHub CI cannot force the ChatGPT application itself to render a mid-turn message. The policy therefore requires long work to be split into bounded cycles that return control to the user before the 12-minute maximum.
