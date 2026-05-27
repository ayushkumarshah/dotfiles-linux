# CLAUDE.md

## About Me

- **Name:** Ayush Kumar Shah
- **Role:** IC Research Scientist (ML Engineer)
- **Team:** Applied AI Engineering (AAI Eng) — Agent Data & Optimization (ADO) *(effective 2026-06-01)*
- **Manager:** Hui Bai (landing); Srinath Reddy (interim until 2026-06-01)
- **Prior team (until 2026-05-31):** Media Foundation Video: Visual Quality (manager: Shankar Regunathan)
- **Primary repo:** fbsource (`/data/users/shahayush/fbsource`)

## Tech Stack

- **Languages:** Python, Hack/PHP
- **ML frameworks:** PyTorch, FBLearner/Flow, Feature Store, Mitra, Fluent2, torchtnt
- **Focus areas:** Model development, data pipelines, model serving, experimentation

## Coding Preferences

- Always use type annotations for function signatures and class attributes
- Write docstrings for public functions and classes
- Use explicit error handling with specific exception types
- Follow PEP 8 for Python code
- Prefer clear, readable code over clever one-liners
- When outputting markdown tables or formatted content I want to copy, provide the raw markdown in a code fence. Default to raw/copyable format.

## Common Project Paths

- `fbcode/mitra/projects/video_enhancement_edsr/` — Video enhancement (EDSR) model training via Mitra
- `fbcode/videoinfra/video_ml/uvq_pytorch/` — UVQ (Universal Video Quality) PyTorch models
- `fbcode/videoinfra/video_ml/` — Video ML models (HDR QA, neural video codecs, temporal consistency, etc.)
- `fbcode/videoinfra/video_super_res/` — Video super resolution
- `fbcode/fblearner/flow/projects/fluent2/domains/videos/video_encoding/` — Fluent2 video encoding domain

## Verification Commands

```
arc lint -a             # Lint + autofix (MUST run before every jf submit)
arc lint -e extra       # Comprehensive linters (CLANGTIDY, RUSTFIX, FIXIT, etc.)
buck2 build <target>    # Build a Buck2 target
buck2 test <target>     # Run tests for a Buck2 target
mitra train             # Launch Mitra training job
mitra eval              # Launch Mitra evaluation job
autodeps <BUCK file>    # Fix Buck dependency issues (e.g., autodeps mitra/projects/video_enhancement_edsr/BUCK)
```

### Critical: Lint Before Submitting Diffs

ALWAYS run `arc lint -a` on changed files before running `jf submit`. The following linters commonly catch issues in Phabricator CI that block diffs:

| Linter | What it catches | Auto-fixable? |
|--------|----------------|---------------|
| BLACK | Python formatting | Yes (`arc lint -a`) |
| AUTODEPS2 | Missing/incorrect Buck deps | Yes (`arc lint -a` or `autodeps`) |
| FLAKE8 | Undefined names (F821), unused imports | No — fix manually |
| PYRE | Type errors (missing annotations, wrong types) | No — fix manually |

## Boundaries

| NEVER | ASK FIRST |
|-------|-----------|
| Create files without asking | Schema/config changes |
| Use `Any` type or `# pyre-unsafe` | Public API changes |
| Refactor adjacent code | Deleting code with tests |
| Submit diffs without `arc lint -a` | Changes to BUCK files |
| Add broad .gitignore wildcards or nested .gitignore files without confirmation | |

## Commit Format

```
[project_name] Verb phrase

Summary:
Why this change is needed
What this change does

Test Plan:
<verification output>
```

## Conventions

- New Python files must use `# pyre-strict`
- When working in fbsource, use Buck2 for builds and tests
- Prefer `sl` (Sapling) for source control operations
- Use `jf submit` for submitting diffs to Phabricator
- Always run `arc lint -a` before submitting diffs to avoid CI lint failures
- When I say "type errors", also check for lint and formatting issues — I may use these terms interchangeably. Always clarify what was actually found vs what was requested.

## Production Change Rules

- Before JustKnob changes: verify the knob type (boolean vs gradual rollout) and all code paths reading it
- Before Hive table operations: verify namespace, partition constraints, and command length limits BEFORE attempting batch operations
- Before diff submission: run `arc lint -a` AND Pyre type checking on each diff independently
- When splitting diffs into stacks: verify each diff passes lint independently before moving to the next

## Tool Selection

| Task | Use | Avoid |
|------|-----|-------|
| Broad full-repo code search | `tbgs`/`tbgr` (BigGrep) via Bash | Grep, Glob, `find`/`grep`/`rg` in Bash |
| Scoped/directory code search | `search_files` MCP tool | Grep, Glob, `find`/`grep`/`rg` in Bash |
| Search including local changes | `search_files` MCP tool | BigGrep (only sees indexed snapshot) |
| Filename search | `tbgf` (BigGrep) or `search_files` FILENAME mode | `find` in Bash |
| Codebase exploration | `meta:code_search` agent | Explore agent |
| Internal docs/wikis/runbooks | `meta:knowledge_search` agent | WebFetch on internal URLs |
| Symbol navigation | LSP | search_files for precise lookups |
| Heavy autonomous work | Task(general-purpose) | Loading Skills into main context |
| 3+ URLs / knowledge lookups | Parallel meta:knowledge_search subagents (haiku) | Sequential fetches |
| Diff details | `get_phabricator_diff_details` | knowledge_filtered_search for known diff IDs |
| Read Google Docs content | `mcp__google_docs__google_docs` with `action: get_document_body`, `document_id: <id>`, `include_formatting: true`. Fallback: `/google-docs-fast-reader` skill | WebFetch or knowledge_load on doc URLs |
| Read Google Slides content | `/google-slides-presentation` skill | WebFetch or knowledge_load on slides URLs |

## Google Docs Reading

To read a Google Doc, use the MCP tool to get the structured document body:

```
mcp__google_docs__google_docs
  action: get_document_body
  document_id: <doc_id extracted from doc_url>
  include_formatting: true
```

This returns JSON with `segments`, each having `text` and `formatting` fields:
- `headingLevel`: "HEADING_1", "HEADING_2", "HEADING_3", "TITLE"
- `inList`: true/false, `listNestingLevel`: 0, 1, 2...
- `bold`, `italic`, `underline`, `link`

## Clipboard

To copy text to the user's system clipboard:
```bash
echo -n "text to copy" | ~/bin/xclip -selection clipboard
```
Requires `ek` daemon to be running. Use when the user asks to copy output to their clipboard.

## Rules

- Delegate-first: 3+ heavy operations -> spawn agent teams or parallel subagents, whichever is faster and relevant
- Agent model: When spawning agents via the Agent tool, ALWAYS pass `model` explicitly per the Task Parameters table. Never rely on default inheritance — the `[1m]` context window suffix is dropped during spawning.
- Background by default: ALL Task() calls use `run_in_background: true`
- Verify before claiming done: run verification, read output, confirm success
- Lint before submit: always `arc lint -a` before `jf submit`
- No guessing paths: verify paths exist before referencing them
- Progress updates: When exploring or running commands, summarize findings every 3-5 steps. Never run more than 5 bash commands in sequence without reporting what was found and what the next plan is.
- Fail fast on infra: If an approach fails on infrastructure tasks (Hive, configerator, JustKnobs, mounts), STOP. Present what failed and why, list alternative approaches with prerequisites, and ask before trying the next one. Do not silently cycle through approaches.
- Environment checks: At session start for tasks involving Google Drive, PARA workspace, or mounted filesystems, verify the mount is active before proceeding. If a mount or path fails, stop and report rather than writing to a broken mount (which causes data loss).
- For published/submitted diffs that need maintenance (rebasing, fixing CI/lint, addressing reviewer comments), use the `/diff-autopilot` skill instead of manual fixes.
- Hooks reminder: Autoformat and auto-fix-lint hooks are enabled. If code changes are not being auto-formatted or auto-linted after edits, check that hooks are firing correctly before manually running lint. Do not duplicate work that hooks should handle.

## Task Parameters
| Parameter | Value | When |
|-----------|-------|------|
| `model` | `"haiku"` | Cheap lookups: meta-knowledge, simple searches, file reads |
| `model` | `"sonnet"` | Standard agents: researcher, test-runner, explorer |
| `model` | `"opus[1m]"` | Complex reasoning: coder, architect, code-reviewer |
| `mode` | `"bypassPermissions"` | Autonomous agents that shouldn't block on prompts |
| `mode` | `"plan"` | Agents that should present a plan before executing |
| `run_in_background` | `true` | Long-running agents — continue interacting while they work |

## PARA Workspace

Also read `~/gdrive/WORKSPACE.md` for project context, active projects, slash commands, and session continuity instructions.
