---
name: site-config
description: Edit configuration and structured data for this al-folio website. Use inside shenmuxing.github.io when changing _config.yml, _data/*.yml, social links, repository listings, CV data, URL/baseurl, search, theme feature flags, collections, or sample-content exclusions.
---

# Site Config

## Workflow

1. Read the relevant `_config.yml` or `_data/*.yml` section before editing.
2. Keep `url: https://shenmuxing.github.io` paired with an empty `baseurl:` for this personal GitHub Pages site.
3. Quote YAML values containing `:`, `#`, `{}`, `[]`, `&`, or leading special characters.
4. Preserve 2-space indentation and existing al-folio structure.
5. Run a Jekyll build after config edits; YAML errors should be fixed before any visual review.

## Common Files

- `_config.yml`: site identity, collections, plugin settings, feature flags, search, exclusions.
- `_data/socials.yml`: social icons and contact links shown on the homepage.
- `_data/repositories.yml`: repository page users and repos.
- `_data/cv.yml`: RenderCV data for the CV page.
- `assets/json/resume.json`: JSONResume alternative.
- `assets/rendercv/*.yaml`: RenderCV styling, locale, and settings.

## Site-Specific Rules

- Do not leave placeholder values such as `you@example.com`, fake Einstein data, or `test@gmail.com` in public pages.
- If a page is no longer ready for public display, prefer disabling navigation or excluding it instead of deleting upstream templates.
- If bibliography ownership changes, update both `_config.yml` `scholar.first_name/last_name` and `_bibliography/papers.bib`.
- Keep `posts_in_search` aligned with publication decisions: unpublished or excluded posts should not enter search.

For detailed file-type examples, consult `.github/instructions/yaml-configuration.instructions.md` only when needed.
