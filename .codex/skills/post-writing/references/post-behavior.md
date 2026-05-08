# Post Behavior Reference

## Build and Listing

Jekyll automatically treats files in `_posts/` named `YYYY-MM-DD-title.md` as posts. In this repository:

- `_pages/blog.md` enables pagination for `collection: posts`.
- The blog list uses `paginator.posts` when pagination is enabled and `site.posts` otherwise.
- Featured posts are selected with `site.posts | where: "featured", "true"`.
- `_includes/latest_posts.liquid` uses `site.posts` for the about page's latest posts table.

## Visibility Controls

| Goal | Mechanism | Result |
| --- | --- | --- |
| Publish normally | `_posts/YYYY-MM-DD-slug.md` without `published: false` | Generates a post page and enters `site.posts`. |
| Draft locally | `_drafts/slug.md` | Not generated unless the command uses `--drafts`. |
| Disable a post in `_posts/` | `published: false` | Not generated in normal builds and not present in normal `site.posts`. |
| Preview disabled posts | Build or serve with `--unpublished` | Includes posts marked `published: false` for local checking. |
| Schedule later | Future date in filename/front matter | Usually skipped until the date unless future posts are enabled. |
| Exclude from sitemap only | `sitemap: false` | Page still builds; sitemap omits it. |
| Hide from blog/home lists only | Custom field such as `hidden: true` plus template filters | No effect until `_pages/blog.md`, `_includes/latest_posts.liquid`, and other `site.posts` consumers are updated. |
| Remove all posts from search | `_config.yml` `posts_in_search: false` | Global setting; not per-post. |

Do not treat `sitemap: false` or `hidden: true` as private publishing controls. They do not prevent direct URL access if the page is generated.

## Common Commands

```powershell
bundle exec jekyll build
bundle exec jekyll serve
bundle exec jekyll serve --drafts
```

## Editing Guardrails

- Preserve existing al-folio customizations in `_config.yml`.
- Prefer Markdown and Liquid patterns already present in `_posts/`.
- Do not remove sample posts in bulk unless the user explicitly asks.
- If changing listing behavior, update every place that reads `site.posts`, especially blog, latest posts, search, feed, archives, and sitemap expectations.
