# Build Methods Reference

## Primary Sources Consulted

- `AGENTS.md`: project instructions and pre-commit checklist.
- `.github/copilot-instructions.md`: canonical tech stack, build commands, CI expectations, and common pitfalls.
- `INSTALL.md`: Docker and native Ruby setup.
- `TROUBLESHOOTING.md`: build, Docker, port, YAML, and bibliography diagnostics.
- `.github/instructions/*.instructions.md`: file-type-specific validation guidance.
- `docker-compose.yml`, `docker-compose-slim.yml`, `Dockerfile`, `Gemfile`, `package.json`.

## Recommended Order

1. Run `npm ci` if `node_modules/` is missing.
2. Run `npx prettier . --check` for formatting-only validation.
3. Run `docker compose run --rm jekyll jekyll build` for a fast Jekyll build through the official al-folio image.
4. Run `docker compose up` to serve and manually inspect `http://localhost:8080`.
5. Run a production-like build with `JEKYLL_ENV=production` and PurgeCSS before publishing.

## Verified State When Created

- Docker and Docker Compose were installed.
- Windows host Ruby, Bundler, and Jekyll commands were unavailable.
- `npm ci` succeeded.
- `npx prettier . --check` ran after `npm ci` but reported formatting issues in many files.
- `docker compose run --rm jekyll jekyll build` failed before Jekyll started because Docker could not reach Docker Hub through proxy `172.18.0.1:20171`.
- `docker compose up --no-build --abort-on-container-exit` also failed while pulling the configured image for the same Docker Hub connectivity reason.
- `mcr.microsoft.com/devcontainers/jekyll:latest` existed locally and could run Ruby/Bundler, but `bundle install` failed on SSL/network access to GitHub and RubyGems.

Treat these as environment observations, not permanent facts. Re-run `-Mode doctor` when the environment changes.

## Method Details

### Docker Compose

Use this first when Docker Hub is reachable:

```powershell
docker compose pull
docker compose run --rm jekyll jekyll build
docker compose up
```

Pros: matches project documentation and includes ImageMagick, nbconvert, and Jekyll dependencies.

Common blocker: the compose file has both `image:` and `build:`. If the image is unavailable locally, Compose may attempt a pull/build and fail on network issues before testing the site.

### Slim Docker Compose

Use when image size matters or the normal image is unavailable:

```powershell
docker compose -f docker-compose-slim.yml up
```

Pros: no local `build:` stanza in `docker-compose-slim.yml`.

Common blocker: still requires pulling `amirpourmand/al-folio:slim` if not already cached.

### Native Ruby

Use only when Ruby, Bundler, ImageMagick, and nbconvert are installed on the host:

```powershell
bundle install
bundle exec jekyll build
bundle exec jekyll serve --port 4000
```

Pros: good for detailed local debugging.

Common blocker on this Windows workspace: Ruby/Bundler/Jekyll may not be installed.

### Devcontainer Fallback

Use only as a fallback when an existing Jekyll-capable container image is already cached:

```powershell
docker run --rm -v ${PWD}:/workspace -w /workspace mcr.microsoft.com/devcontainers/jekyll:latest bash -lc "bundle config set path /tmp/bundle && bundle install && bundle exec jekyll build"
```

Pros: can test without installing Ruby on Windows.

Common blockers: still needs GitHub/RubyGems network access unless dependencies are cached; Ruby version may differ from CI.

### Formatting

Use after Node dependencies are installed:

```powershell
npm ci
npx prettier . --check
```

Use write mode only when formatting changes are intended:

```powershell
npx prettier . --write
```

## Interpreting Failures

- `Cannot find package '@shopify/prettier-plugin-liquid'`: run `npm ci`.
- `Code style issues found`: formatting drift; not a Jekyll build failure.
- `failed to do request ... registry-1.docker.io`: Docker registry/proxy failure.
- `SSL_connect ... github.com` or `rubygems.org`: dependency network failure.
- YAML parse errors: inspect `_config.yml` and `_data/*.yml`; quote strings containing special characters.
- `Zero vectors cannot be normalized`: a related-posts/content issue; add meaningful post content or disable related posts.
- Missing CSS/JS after deploy: check `_config.yml` `url` and `baseurl` pairing.
