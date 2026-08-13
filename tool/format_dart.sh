#!/usr/bin/env bash
# Format tracked Dart files, skipping generated and vendored paths.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT}"

files="$(
  git ls-files '*.dart' \
    | grep -vE '\.(g|freezed|pb|pbenum|pbjson|fcm)\.dart$' \
    | grep -vE '^(dart_sdk|build|cloudflare_turnstile|packages/fluxer_fcm)/' \
    | grep -vE '^lib/core/synced_preferences/generated/' \
    || true
)"

if [[ -z "${files}" ]]; then
  echo "No Dart files to format."
  exit 0
fi

printf '%s\n' "${files}" | xargs dart format "$@"
