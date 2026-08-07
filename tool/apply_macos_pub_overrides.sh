#!/usr/bin/env bash
# Writes pubspec_overrides.yaml for macOS app builds from pubspec.yaml overrides.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PUBSPEC="${ROOT}/pubspec.yaml"
OUTPUT="${ROOT}/pubspec_overrides.yaml"
STUB_PATH="packages/unifiedpush_linux_stub"

if [[ ! -f "${PUBSPEC}" ]]; then
  echo "pubspec.yaml not found at ${PUBSPEC}" >&2
  exit 1
fi

OVERRIDES_BODY="$(awk '
  /^dependency_overrides:/ { in_section = 1; next }
  in_section && /^[^ #]/ { exit }
  in_section && /^  unifiedpush_linux:/ { skip = 1; next }
  in_section && skip {
    if (/^  [^ ]/) {
      skip = 0
      print
      next
    }
    next
  }
  in_section { print }
' "${PUBSPEC}")"

if [[ -z "${OVERRIDES_BODY}" ]]; then
  echo "pubspec.yaml has no dependency_overrides section" >&2
  exit 1
fi

{
  echo "dependency_overrides:"
  printf '%s\n' "${OVERRIDES_BODY}"
  echo "  unifiedpush_linux:"
  echo "    path: ${STUB_PATH}"
} > "${OUTPUT}"

echo "Wrote ${OUTPUT}"
