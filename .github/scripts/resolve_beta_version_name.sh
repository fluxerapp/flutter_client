#!/usr/bin/env bash
set -euo pipefail

GITHUB_REPOSITORY="${GITHUB_REPOSITORY:?GITHUB_REPOSITORY is required}"
GITHUB_OUTPUT="${GITHUB_OUTPUT:?GITHUB_OUTPUT is required}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v gh >/dev/null 2>&1; then
  echo "::error::GitHub CLI (gh) is required to resolve beta version names" >&2
  exit 1
fi
if ! command -v python3 >/dev/null 2>&1; then
  echo "::error::Python 3 is required to resolve beta version names" >&2
  exit 1
fi

python3 "$SCRIPT_DIR/beta_release_metadata.py" resolve-beta-version
