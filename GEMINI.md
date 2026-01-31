# Project Context: shenmuxing.github.io

## Overview
This is a personal academic website for **Jingye Zhao (Shenmuxing)**, based on the **al-folio** Jekyll theme. It is hosted on GitHub Pages.

## Tech Stack
- **Framework:** Jekyll (Ruby Static Site Generator)
- **Theme:** [al-folio](https://github.com/alshedivat/al-folio)
- **Templating:** Liquid
- **Styling:** SCSS (Bootstrap-based)
- **Scripting:** JavaScript (minimal, mostly for plugins)

## Key Configuration (`_config.yml`)
- **Title:** Jingye Zhao
- **URL:** `https://shenmuxing.github.io`
- **Features:** Light/Dark mode, Blog, Projects, Teachings, CV, Bibliography (Jekyll Scholar).
- **Plugins:** `jekyll-scholar` (BibTeX), `jekyll-jupyter-notebook`, `jekyll-imagemagick`, etc.

## Project Structure
- **`_config.yml`**: Main site configuration (metadata, navigation, feature toggles).
- **`_posts/`**: Blog posts. Naming convention: `YYYY-MM-DD-title.md`.
- **`_pages/`**: Standalone pages (e.g., `about.md`, `cv.md`, `publications.md`).
- **`_projects/`**: Project pages (Collection).
- **`_bibliography/`**: BibTeX files (e.g., `papers.bib`) for the Publications page.
- **`_data/`**: Data files for structured content:
  - `cv.yml`: Content for the CV page (fallback if `assets/json/resume.json` is missing).
  - `socials.yml`: Social media links.
  - `repositories.yml`: GitHub repositories to display.
- **`assets/`**: Images, PDFs, CSS, JS.
- **`Gemfile`**: Ruby dependencies.

## Common Tasks
- **Run Locally:** `bundle exec jekyll serve` (or `bundle exec jekyll serve --livereload`)
- **Add Post:** Create a new Markdown file in `_posts/` with appropriate front matter.
- **Add Project:** Create a new Markdown file in `_projects/` with `layout: page` and `importance` field.
- **Update CV:** Edit `_data/cv.yml` (or `assets/json/resume.json` if used).
- **Update Publications:** Edit `_bibliography/papers.bib`.
- **Selected Publications:** To display specific papers on the home page, add `selected={true}` to the entry in `_bibliography/papers.bib` and set `selected_papers: true` in `_pages/about.md`.

## Notes
- `package.json` only contains Prettier dependencies. Build process is Ruby-based.
- This is a cloned repository. Be mindful of preserving existing customizations in `_config.yml`.
- Images are processed by `jekyll-imagemagick` if enabled in config (currently `enabled: true`).
