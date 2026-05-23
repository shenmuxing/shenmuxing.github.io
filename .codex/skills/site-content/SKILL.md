---
name: site-content
description: Maintain non-post Markdown content for this al-folio academic website. Use inside shenmuxing.github.io when editing _pages, _projects, _news, _books, _teachings, navigation visibility, page front matter, or removing public sample/template content from the live site.
---

# Site Content

## Workflow

1. Inspect the target file and any listing template that renders it before editing.
2. Preserve the personal academic-site identity: Jingye Zhao, SJTU, reinforcement learning theory, and the root GitHub Pages URL.
3. Keep public pages in English. Do not publish al-folio sample copy, fake people, fake project entries, placeholder addresses, or test calendars.
4. Prefer hiding unfinished template pages with front matter (`nav: false`) or `_config.yml` `exclude` entries over deleting upstream examples.
5. After content changes, run the project `website-build` skill and browser-check affected pages.

## Content Map

- `_pages/about.md`: homepage biography and visible homepage sections.
- `_pages/*.md`: standalone navigation pages; check `nav` and `nav_order`.
- `_projects/*.md`: project cards and project detail pages.
- `_news/*.md`: homepage announcements and news page items.
- `_teachings/*.md`: course entries rendered through teaching includes.
- `_books/*.md`: bookshelf entries, usually non-public unless explicitly enabled.

## Front Matter

Use repository patterns and keep YAML valid:

```yaml
---
layout: page
title: concise-title
permalink: /path/
description: One sentence used in listings and metadata.
nav: true
nav_order: 3
---
```

Use `nav: false` when a page should build but not appear in the top navigation. Use `_config.yml` `exclude` when a template/sample file should not build at all.

## Template Cleanup

Treat these as template/sample surfaces unless the user explicitly wants them public:

- `_pages/dropdown.md`, `_pages/profiles.md`, `_pages/about_einstein.md`
- `_projects/[0-9]_project.md`
- `_news/announcement_*.md`
- sample copy containing Einstein, generic project text, test calendars, or placeholder contact data

For Markdown-specific syntax examples, use the `post-writing` skill and its `references/example-posts.md` routing table.
