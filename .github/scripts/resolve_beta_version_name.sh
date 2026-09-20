#!/usr/bin/env bash
set -euo pipefail

GITHUB_REPOSITORY="${GITHUB_REPOSITORY:?GITHUB_REPOSITORY is required}"
GITHUB_OUTPUT="${GITHUB_OUTPUT:?GITHUB_OUTPUT is required}"

TAG_PATTERN='^v?([0-9]+\.[0-9]+\.[0-9]+)-beta\.([0-9]+)$'
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BETA_RELEASE_METADATA_PY="$SCRIPT_DIR/beta_release_metadata.py"

normalize_beta_number() {
  local beta_number="$1"
  local normalized
  if ! normalized=$(python3 "$BETA_RELEASE_METADATA_PY" normalize-beta-number "$beta_number"); then
    echo "::error::Failed to normalize beta number: $beta_number" >&2
    return 1
  fi
  printf '%s' "$normalized"
}

is_beta_prerelease_tag() {
  local tag="$1"
  [[ "$tag" =~ $TAG_PATTERN ]]
}

strip_tag_prefix() {
  local tag="$1"
  if [[ "$tag" == v* ]]; then
    printf '%s' "${tag#v}"
  else
    printf '%s' "$tag"
  fi
}

normalize_beta_version_name() {
  local version_name="$1"
  if ! is_beta_prerelease_tag "$version_name"; then
    echo "::error::Version name does not match beta prerelease pattern: $version_name" >&2
    return 1
  fi
  local base="${BASH_REMATCH[1]}"
  local beta_number="${BASH_REMATCH[2]}"
  beta_number=$(normalize_beta_number "$beta_number")
  printf '%s-beta.%s' "$base" "$beta_number"
}

increment_beta_tag() {
  local tag="$1"
  if ! is_beta_prerelease_tag "$tag"; then
    echo "::error::Tag does not match beta prerelease pattern: $tag" >&2
    return 1
  fi
  local base="${BASH_REMATCH[1]}"
  local beta_number="${BASH_REMATCH[2]}"
  local next_beta_number=$((beta_number + 1))
  next_beta_number=$(normalize_beta_number "$next_beta_number")
  printf '%s-beta.%s' "$base" "$next_beta_number"
}

read_pubspec_base_version() {
  local version_line
  version_line=$(grep -E '^version:[[:space:]]*' pubspec.yaml | head -1)
  if [ -z "$version_line" ]; then
    echo "::error::Could not find version in pubspec.yaml" >&2
    return 1
  fi
  printf '%s' "$version_line" | sed -E 's/^version:[[:space:]]*//' | cut -d'+' -f1
}

resolve_from_draft_release() {
  local tag version_name
  while IFS= read -r tag; do
    if is_beta_prerelease_tag "$tag"; then
      version_name=$(strip_tag_prefix "$tag")
      normalize_beta_version_name "$version_name"
      return 0
    fi
  done <<< "$1"
  return 1
}

resolve_from_latest_published_prerelease() {
  local tag
  while IFS= read -r tag; do
    if is_beta_prerelease_tag "$tag"; then
      increment_beta_tag "$tag"
      return 0
    fi
  done <<< "$1"
  return 1
}

resolve_from_pubspec() {
  local base_version beta_number
  base_version=$(read_pubspec_base_version)
  beta_number=$(normalize_beta_number 1)
  printf '%s-beta.%s' "$base_version" "$beta_number"
}

main() {
  if ! command -v gh >/dev/null 2>&1; then
    echo "::error::GitHub CLI (gh) is required to resolve beta version names" >&2
    exit 1
  fi
  if ! command -v python3 >/dev/null 2>&1; then
    echo "::error::Python 3 is required to resolve beta version names" >&2
    exit 1
  fi
  local draft_tags published_prerelease_tags version_name
  if ! draft_tags=$(gh release list --repo "$GITHUB_REPOSITORY" --limit 30 \
    --json tagName,isDraft \
    --jq '.[] | select(.isDraft) | .tagName'); then
    echo "::error::Failed to list draft releases" >&2
    exit 1
  fi
  if ! published_prerelease_tags=$(gh release list --repo "$GITHUB_REPOSITORY" --limit 30 \
    --json tagName,isDraft,isPrerelease \
    --jq '.[] | select(.isDraft | not) | select(.isPrerelease) | .tagName'); then
    echo "::error::Failed to list published prereleases" >&2
    exit 1
  fi
  if version_name=$(resolve_from_draft_release "$draft_tags"); then
    echo "Resolved beta version from draft release: $version_name"
  elif version_name=$(resolve_from_latest_published_prerelease "$published_prerelease_tags"); then
    echo "Resolved beta version by incrementing latest published prerelease: $version_name"
  else
    version_name=$(resolve_from_pubspec)
    echo "Resolved beta version from pubspec fallback: $version_name"
  fi
  if ! is_beta_prerelease_tag "$version_name"; then
    echo "::error::Resolved version name is invalid: $version_name" >&2
    exit 1
  fi
  local beta_number="${BASH_REMATCH[2]}"
  {
    printf 'version_name=%s\n' "$version_name"
    printf 'beta_number=%s\n' "$beta_number"
  } >> "$GITHUB_OUTPUT"
}

main
