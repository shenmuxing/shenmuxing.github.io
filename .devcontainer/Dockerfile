FROM mcr.microsoft.com/devcontainers/jekyll

# Fix "GPG error: ... NO_PUBKEY" for Yarn by removing the broken repository file.
# The base image has an outdated or broken key for the Yarn repository.
# Since we don't strictly need this specific Yarn repo (nodejs is usually enough or installed otherwise),
# removing it allows apt-get update to succeed for other features.
RUN rm -f /etc/apt/sources.list.d/yarn.list
