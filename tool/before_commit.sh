#!/usr/bin/env bash
# Apply dart fixes and format source files before committing.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT}"

dart fix --apply
bash "${ROOT}/tool/format_dart.sh"
