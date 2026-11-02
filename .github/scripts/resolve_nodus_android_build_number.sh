#!/usr/bin/env bash
set -euo pipefail

preallocated="${PREALLOCATED_BUILD_NUMBER:-}"
if [ -n "$preallocated" ]; then
  if ! [[ "$preallocated" =~ ^[0-9]+$ ]]; then
    echo "::error::Invalid pre-allocated build number: ${preallocated}" >&2
    exit 1
  fi
  echo "Using pre-allocated Nodus build number ${preallocated}"
  if [[ -n "${GITHUB_OUTPUT:-}" ]]; then
    echo "build_number=${preallocated}" >> "$GITHUB_OUTPUT"
  else
    echo "$preallocated"
  fi
  exit 0
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
bash "${script_dir}/fetch_nodus_android_build_number.sh"
