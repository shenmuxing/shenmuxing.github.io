# Example Posts Reference

Use this file as the routing table for the al-folio sample posts in `_posts/`. Only the files listed below are part of the example corpus. Treat any unlisted `_posts/` file as user content unless the user says it should become an example.

## General Writing and Markdown

| Need                                              | Open                                        | Look for                                               |
| ------------------------------------------------- | ------------------------------------------- | ------------------------------------------------------ |
| Basic Markdown formatting, links, headings, lists | `_posts/2015-03-15-formatting-and-links.md` | Plain post structure, Markdown syntax, link attributes |
| Math-heavy academic writing                       | `_posts/2015-10-20-math.md`                 | Inline/display MathJax, equation environments, labels  |
| Code blocks and syntax highlighting               | `_posts/2015-07-15-code.md`                 | Fenced code blocks, `{% highlight %}`, line numbers    |
| Code diffs                                        | `_posts/2024-01-27-code-diff.md`            | `code_diff: true`, `diff2html` fences                  |
| Pseudocode                                        | `_posts/2024-04-15-pseudocode.md`           | `pseudocode: true`, `pseudocode` fences                |
| Custom blockquotes                                | `_posts/2023-05-12-custom-blockquotes.md`   | al-folio callout and blockquote styles                 |
| Tabs                                              | `_posts/2024-05-01-tabs.md`                 | `tabs: true`, `{% tabs %}` Liquid blocks               |

## Navigation and Metadata Features

| Need                        | Open                                             | Look for                                            |
| --------------------------- | ------------------------------------------------ | --------------------------------------------------- |
| Beginning table of contents | `_posts/2023-03-20-table-of-contents.md`         | `toc:` front matter with `beginning: true`          |
| Sidebar table of contents   | `_posts/2023-04-25-sidebar-table-of-contents.md` | `toc:` front matter with sidebar behavior           |
| Redirect post               | `_posts/2022-02-01-redirect.md`                  | `redirect:` front matter                            |
| Citeable post metadata      | `_posts/2024-04-28-post-citation.md`             | `citation: true`                                    |
| Post bibliography           | `_posts/2023-07-12-post-bibliography.md`         | `related_publications: true`, bibliography behavior |

## Comments and External Services

| Need            | Open                                   | Look for                                         |
| --------------- | -------------------------------------- | ------------------------------------------------ |
| Giscus comments | `_posts/2022-12-10-giscus-comments.md` | `giscus_comments: true`                          |
| Disqus comments | `_posts/2015-10-20-disqus-comments.md` | `disqus_comments: true`                          |
| Twitter/X embed | `_posts/2020-09-28-twitter.md`         | tweet embed syntax and external-service category |

## Images and Media

| Need                         | Open                                   | Look for                                                       |
| ---------------------------- | -------------------------------------- | -------------------------------------------------------------- |
| Simple images and thumbnails | `_posts/2015-05-15-images.md`          | `thumbnail:`, `figure.liquid`, Bootstrap rows, `zoomable=true` |
| Advanced image components    | `_posts/2024-01-27-advanced-images.md` | `images:` front matter, Swiper, image comparison               |
| Photo galleries              | `_posts/2024-12-04-photo-gallery.md`   | `images:` front matter, PhotoSwipe, Spotlight groups           |
| Videos                       | `_posts/2023-04-24-videos.md`          | `video.liquid`, local video paths, controls/autoplay           |
| Audio                        | `_posts/2023-04-25-audios.md`          | `audio.liquid`, local audio paths                              |

## Tables, Charts, and Data Displays

| Need             | Open                               | Look for                                              |
| ---------------- | ---------------------------------- | ----------------------------------------------------- |
| Bootstrap tables | `_posts/2023-03-21-tables.md`      | `bootstrap-table` front matter, HTML table attributes |
| Chart.js         | `_posts/2024-01-26-chartjs.md`     | `chart: chartjs: true`, `chartjs` fences              |
| ECharts          | `_posts/2024-01-26-echarts.md`     | `chart: echarts: true`, `echarts` fences              |
| Vega-Lite        | `_posts/2024-01-27-vega-lite.md`   | `chart: vega_lite: true`, `vega_lite` fences          |
| Plotly           | `_posts/2025-03-26-plotly.md`      | `chart: plotly: true`, `plotly` fences                |
| GeoJSON maps     | `_posts/2024-01-26-geojson-map.md` | `geojson` fences and map front matter                 |

## Diagrams and Rich Layouts

| Need                  | Open                                    | Look for                                                        |
| --------------------- | --------------------------------------- | --------------------------------------------------------------- |
| Mermaid diagrams      | `_posts/2021-07-04-diagrams.md`         | `mermaid:` front matter, `mermaid` fences                       |
| TikZJax diagrams      | `_posts/2023-12-12-tikzjax.md`          | `tikzjax: true`, `<script type="text/tikz">`                    |
| Typograms             | `_posts/2024-04-29-typograms.md`        | `typograms: true`, `typograms` fences                           |
| Distill-style article | `_posts/2018-12-22-distill.md`          | `layout: distill`, Distill citations, footnotes, layout classes |
| Jupyter notebook post | `_posts/2023-07-04-jupyter-notebook.md` | notebook conversion/import pattern                              |

## Query Patterns

Use these commands to find local examples quickly:

```powershell
rg -n "chart:|mermaid:|tikzjax:|typograms:|tabs:|pseudocode:|citation:|related_publications:|giscus_comments:|disqus_comments:" _posts
rg -n "figure.liquid|video.liquid|audio.liquid|tabs|diff2html|chartjs|echarts|vega_lite|plotly|geojson|mermaid|typograms|pseudocode" _posts
```

When copying a pattern, copy both the front matter switch and the body syntax. Many features require both.
