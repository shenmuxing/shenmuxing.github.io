---
name: gitworkflow
description: Project-local Git workflow for the forked shenmuxing.github.io repository. Use inside this repository when Codex is asked to inspect Git state, pull or sync changes from remotes, update from the official upstream al-folio repository, push branches to the user's fork, prepare commits, or reason about safe GitHub Pages repository workflow.
---

# Git Workflow

## Scope

Use this skill only inside this repository. Treat it as a fork-based GitHub Pages site derived from the official al-folio project, with local customizations that must be preserved.

## Principles

- Inspect before acting. Always read `git status --short --branch` and `git remote -v` before pull, merge, rebase, commit, or push operations.
- Protect user work. Do not discard, reset, checkout over, or clean uncommitted files unless the user explicitly requests that exact operation.
- Separate remotes. Treat `origin` as the user's fork unless inspection proves otherwise. Treat `upstream` as the official source repository if configured.
- Prefer explicit branches. Avoid pushing directly to `main` unless the user asks for it or the repository's current workflow clearly expects it.
- Use non-interactive commands where practical. Avoid workflows that can leave Codex stuck in an editor or interactive rebase screen.
- Ask before rewriting remote history. Never run `git push --force`, `git push --force-with-lease`, or history-rewriting operations on shared branches without explicit approval.

## Initial Inspection

Run these before any remote-changing action:

```powershell
git status --short --branch
git remote -v
git branch --show-current
```

When sync safety matters, also inspect:

```powershell
git log --oneline --decorate --graph --max-count=20 --all
git branch -vv
```

If the remote layout is ambiguous, report what `origin` and `upstream` point to before deciding the next operation.

## Pull Or Sync From Remote

1. Inspect status and remotes.
2. If there are uncommitted changes, decide whether the requested pull can safely proceed. Prefer stopping with a concise explanation when merge/rebase would touch the same files.
3. Run `git fetch --all --prune` to update remote refs without changing the worktree.
4. Inspect what would change before integrating:

```powershell
git log --oneline --decorate HEAD..origin/main
git diff --stat HEAD..origin/main
```

Use the actual tracked branch if it is not `origin/main`.

5. Integrate only after understanding branch intent:

- For a local branch tracking the user's fork, prefer `git pull --ff-only` when possible.
- For incorporating official al-folio updates, fetch `upstream`, inspect the diff, then merge or rebase deliberately into a feature branch first when the update is non-trivial.
- For large upstream theme updates, expect conflicts in `_config.yml`, layouts, includes, SCSS, and asset pipeline files. Preserve site-specific identity, URLs, publications, posts, CV, and custom skills.

## Push Workflow

1. Inspect status and current branch.
2. Review the intended patch:

```powershell
git diff
git diff --cached
```

3. Stage only files relevant to the user's request. Do not sweep in unrelated local changes.
4. Commit with a concise message if the user asked for a commit, push, PR, or publishable Git state.
5. Before pushing, run focused verification appropriate to the change. For site behavior, invoke the project-local `website-build` skill if it is available; follow that skill's instructions for local setup, build command selection, and failure reporting.

6. Push to `origin` unless the user explicitly asks for another remote:

```powershell
git push -u origin <branch>
```

7. If working from a feature branch, suggest or create a PR according to the user's request and available GitHub tooling.

## Upstream Al-Folio Updates

When the user wants official upstream changes:

1. Verify whether `upstream` exists. If missing, do not guess the URL silently; identify the likely official URL and ask or state the assumption before adding it.
2. Fetch first, then inspect:

```powershell
git fetch upstream --prune
git log --oneline --decorate HEAD..upstream/master
git diff --stat HEAD..upstream/master
```

Use `upstream/main` if the official remote uses `main`.

3. Prefer a dedicated branch such as `sync-al-folio-YYYYMMDD`.
4. Merge upstream into that branch unless the repository history and user preference clearly favor rebasing.
5. Resolve conflicts by preserving local academic-site content over theme defaults unless the upstream change is required for compatibility or security.
6. After conflict resolution, invoke the project-local `website-build` skill if it is available, and use its prescribed local build workflow to verify the site. If the skill is not available, state that clearly and fall back to the best known Jekyll build command for the current environment.

## Communication

When reporting Git operations, include:

- Current branch and remotes involved.
- Whether the worktree was clean or had existing changes.
- Exact branch pushed, if any.
- Verification command run and result.
- Any files intentionally left unstaged because they looked unrelated.

If an operation is risky or ambiguous, pause before changing history or remote state and explain the concrete risk in terms of branches, remotes, and files.
