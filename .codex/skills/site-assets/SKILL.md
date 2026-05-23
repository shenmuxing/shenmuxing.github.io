---
name: site-assets
description: Maintain styling, JavaScript, images, and frontend polish for this al-folio website. Use inside shenmuxing.github.io when editing _sass, assets/js, assets/css, assets/img, theme variables, responsive behavior, dark mode, cards, typography, or frontend-design-driven visual refinements.
---

# Site Assets

## Workflow

1. Identify the rendered page and the asset path that controls it before editing.
2. Follow the global `frontend-design` skill for visible UI polish, but stay compatible with al-folio's Bootstrap and SCSS architecture.
3. Prefer SCSS variables and existing component files over inline styles.
4. Keep light and dark themes coherent; update both when changing color semantics.
5. Verify on desktop and mobile viewports after broad visual changes.

## Common Paths

- `_sass/_variables.scss`: color tokens, content width, shared dimensions.
- `_sass/_themes.scss`: light/dark CSS variables.
- `_sass/_components.scss`, `_sass/_layout.scss`, `_sass/_typography.scss`: major UI styling.
- `assets/js/*.js`: feature initialization and interaction behavior.
- `assets/img/`: profile images, project thumbnails, post media.

## Design Rules for This Site

- Keep the academic site quiet, readable, and credible.
- Avoid one-note purple gradients or generic decorative backgrounds.
- Preserve text contrast and dark-mode readability.
- Do not let cards, buttons, or navigation text overflow on mobile.
- Use real content images only when they communicate the research, project, or person; otherwise use restrained typography and layout.

For JavaScript-specific reminders, consult `.github/instructions/javascript-scripts.instructions.md` only when needed.
