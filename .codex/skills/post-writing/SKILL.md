---
name: post-writing
description: Write, revise, publish, hide, and maintain blog posts for this repository's al-folio Jekyll academic website. Use only inside shenmuxing.github.io when the user asks to create a new post, edit an existing _posts Markdown file, choose front matter, manage publication visibility, add images/assets for a post, verify blog rendering, or explain how posts appear in the site.
---

# Post Writing

## Scope

Use this skill only for this repository. Treat the site as an al-folio Jekyll academic website whose blog content lives in `_posts/` and is rendered through `_pages/blog.md`, `_layouts/post.liquid`, and related includes.

## Workflow

1. Inspect the target post or related templates before editing. Check `_config.yml`, `_pages/blog.md`, `_includes/latest_posts.liquid`, and `_layouts/post.liquid` when visibility, listing, URLs, or rendering behavior matters.
2. For new posts, create `_posts/YYYY-MM-DD-slug.md` with Jekyll front matter. Prefer lowercase hyphenated slugs and keep the date explicit.
3. Before using special post features, consult the example corpus. Read `references/example-posts.md` to choose the relevant sample, then open only the needed `_posts/...md` example file.
4. Use the repo's existing front matter patterns. Include at least `layout`, `title`, `date`, `description`, `tags`, and `categories` when they are relevant.
5. If the user wants a post not to build or appear, use `published: false`. If the user only wants it excluded from search engines, use `sitemap: false`. If they want drafts, place content under `_drafts/` and explain that drafts require `--drafts`.
6. Keep content academic, concise, and compatible with Liquid/kramdown. Avoid introducing unsupported plugins or custom syntax unless the repository already uses it.
7. Put post-specific images under `assets/img/` unless the user gives another location. Use relative URLs through Liquid when possible, for example `{{ '/assets/img/name.png' | relative_url }}`.
8. After edits, run a focused verification. Prefer `bundle exec jekyll build` for build correctness; use `bundle exec jekyll serve` only when the user needs local preview.

## Example Corpus

Only treat posts explicitly listed in `references/example-posts.md` as local al-folio examples for this skill. Treat all other `_posts/` files as user content unless the user says otherwise.

Use `references/example-posts.md` as the routing table. It maps tasks such as math, code, images, charts, TOC, comments, bibliography, citations, tabs, diagrams, media, and redirects to the exact sample post to inspect. Do not bulk-read all examples; load the smallest relevant example and copy the local pattern.

## Front Matter Patterns

Use this baseline for normal posts:

```yaml
---
layout: post
title: "Post Title"
date: 2026-05-08 12:00:00
description: "One sentence summary for blog lists and previews."
tags: [tag-one, tag-two]
categories: [category-name]
---
```

Use these optional fields when needed:

```yaml
published: false
sitemap: false
featured: true
toc:
  beginning: true
giscus_comments: true
related_posts: false
thumbnail: /assets/img/example.webp
redirect: https://example.com
```

## Publication Options

Use these options when deciding whether a post should be public, preview-only, hidden, or excluded from indexes:

| Goal                                | Use                                                                       | Effect                                                                                                         |
| ----------------------------------- | ------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| Publish normally                    | Put a dated file in `_posts/` without `published: false`                  | Builds a post page, appears in `site.posts`, blog lists, latest posts, feed/search/sitemap depending on config |
| Keep as an unpublished draft        | Put the file in `_drafts/`                                                | Does not build normally; appears only with `bundle exec jekyll serve --drafts` or build commands using drafts  |
| Keep in `_posts/` but do not build  | Add `published: false`                                                    | Skipped by normal Jekyll builds and removed from `site.posts`; visible only with `--unpublished`               |
| Schedule for later                  | Use a future date in the filename/front matter                            | Normally skipped until that date unless future posts are enabled                                               |
| Build page but exclude from sitemap | Add `sitemap: false`                                                      | Page still exists and can appear in lists/search unless other logic filters it                                 |
| Build page but hide from blog lists | Add a custom field such as `hidden: true` and edit templates to filter it | Not supported automatically in this repo; requires changes wherever `site.posts` is used                       |
| Remove from local search            | Set `posts_in_search: false` globally or customize search indexing        | Global setting affects all posts; per-post search exclusion requires template/search-index changes             |

When the user asks for "not loaded" or "not rendered," clarify whether they mean build output, blog listing, homepage latest posts, sitemap, feed, or search. Prefer `published: false` for complete exclusion from normal builds.

## Repository Notes

- `_posts/` files are collected into `site.posts` by Jekyll at build time.
- `_pages/blog.md` lists posts through `jekyll-paginate-v2`.
- `_includes/latest_posts.liquid` reads directly from `site.posts` for the about page latest posts block.
- `_config.yml` currently has `posts_in_search: true`, so built posts can enter the site's search index.
- The site permalink pattern is `/blog/:year/:title/`.

For deeper local behavior, read `references/post-behavior.md`. For sample-post routing, read `references/example-posts.md`.
