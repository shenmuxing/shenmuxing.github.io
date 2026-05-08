---
name: website-build
description: Build, serve, and validate this project-local al-folio/Jekyll website. Use when Codex needs to quickly create the site output, run a fuller production-like build, start the local preview server, check Prettier formatting, or diagnose build failures for this repository.
---

# Website Build

Use this skill from the repository root. Prefer the bundled script for repeatable checks:

```powershell
powershell -ExecutionPolicy Bypass -File .codex/skills/website-build/scripts/build-website.ps1 -Mode quick
```

## Decision Flow

1. For a fast sanity check, run `-Mode quick`.
2. For pre-commit or after broad changes, run `-Mode full`.
3. To preview in a browser, run `-Mode serve` and open `http://localhost:8080`.
4. To isolate formatting issues, run `-Mode prettier`.
5. If a build path fails before Jekyll starts, run `-Mode doctor` and read `references/build-methods.md`.

## Repository Facts

- This is an al-folio Jekyll site.
- The documented primary path is Docker Compose with service `jekyll`, serving on `http://localhost:8080`.
- Native Windows Ruby/Jekyll is not assumed. In this workspace it was not installed when the skill was created.
- Node dependencies are needed before Prettier checks. Use `npm ci` when `node_modules/` is missing.
- Production builds should use `JEKYLL_ENV=production` and then run PurgeCSS when available.

## Build Commands

Fast official Docker build:

```powershell
docker compose run --rm jekyll jekyll build
```

Local preview:

```powershell
docker compose up
```

Production-like Docker build:

```powershell
docker compose run --rm -e JEKYLL_ENV=production jekyll bash -lc "bundle exec jekyll build && purgecss -c purgecss.config.js"
```

Prettier check:

```powershell
npm ci
npx prettier . --check
```

Fallback using an existing devcontainer Jekyll image:

```powershell
docker run --rm -v ${PWD}:/workspace -w /workspace mcr.microsoft.com/devcontainers/jekyll:latest bash -lc "bundle config set path /tmp/bundle && bundle install && bundle exec jekyll build"
```

## Failure Handling

Classify failures before editing site files:

- Docker Hub pull or proxy failures are environment failures, not site failures.
- `bundle install` SSL errors against GitHub or RubyGems are environment/network failures.
- Missing `@shopify/prettier-plugin-liquid` means Node dependencies are not installed; run `npm ci`.
- Prettier warnings are formatting drift. Do not run `npx prettier . --write` unless the user asked to format or you are preparing a commit.
- Jekyll exceptions after dependencies load are site/build failures. Fix the referenced content, config, Liquid, Sass, BibTeX, or plugin issue.

## References

Read `references/build-methods.md` when you need exact tradeoffs, known blockers, or a fuller diagnostic checklist.
