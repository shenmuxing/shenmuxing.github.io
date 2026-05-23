---
name: site-templates
description: Edit Liquid templates and reusable rendering components for this al-folio website. Use inside shenmuxing.github.io when changing _layouts, _includes, collection listing logic, navigation rendering, post/project cards, bibliography templates, or Liquid conditions for hiding template content.
---

# Site Templates

## Workflow

1. Inspect the caller and callee: for an include, read the layout/page that invokes it; for a layout, read at least one page using it.
2. Preserve al-folio conventions, Bootstrap grid classes, Liquid filters, and existing feature flags.
3. Keep template changes narrow. Prefer front matter or config switches for content visibility; edit Liquid only when shared behavior must change.
4. Avoid hard-coded personal content in shared templates. Put personal content in `_pages`, `_data`, or `_config.yml`.
5. Run the `website-build` skill after Liquid changes and browser-check each affected page.

## Common Paths

- `_layouts/*.liquid`: page, post, CV, bibliography, project, and archive shells.
- `_includes/*.liquid`: reusable UI and feature components.
- `_includes/repository/*.liquid`: GitHub repository cards and trophies.
- `_includes/cv/*.liquid`: RenderCV/JSONResume section rendering.

## Visibility Patterns

- Use `nav: false` to hide a page from top navigation.
- Use `published: false` for posts that should not build normally.
- Use `_config.yml` `exclude` for sample files that should not build but should stay in the repo as references.
- When filtering posts or collections, update every consumer: blog, homepage latest posts, search, feed, archives, and sitemap expectations.

For detailed Liquid syntax reminders, consult `.github/instructions/liquid-templates.instructions.md` only when needed.
