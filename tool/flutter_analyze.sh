#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT}"

output=""
analyze_exit=0
set +e
output="$(flutter analyze --no-fatal-warnings --no-fatal-infos 2>&1)"
analyze_exit=$?
set -e

printf '%s\n' "${output}"

if grep -qE '^[[:space:]]*error •' <<< "${output}"; then
  exit 1
fi

if ((analyze_exit != 0)); then
  if grep -qE '^[[:space:]]*(info|warning|hint) •' <<< "${output}"; then
    exit 0
  fi
  exit "${analyze_exit}"
fi

exit 0
