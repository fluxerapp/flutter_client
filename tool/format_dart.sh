#!/usr/bin/env bash
# Format tracked Dart files, skipping generated and vendored paths.
if [ -z "${BASH_VERSION:-}" ]; then
  exec bash "$0" "$@"
fi
case ":${SHELLOPTS:-}:" in
  *:posix:*)
    exec bash "$0" "$@"
    ;;
esac
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT}"

# shellcheck source=dart_source_files.sh
source "${ROOT}/tool/dart_source_files.sh"

files="$(dart_source_files_list_tracked)"

if [[ -z "${files}" ]]; then
  echo "No Dart files to format."
  exit 0
fi

printf '%s\n' "${files}" | xargs dart format "$@"
