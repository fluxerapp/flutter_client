#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT}"

for pkg in packages/*/; do
  [[ "${pkg}" == "packages/fluxer_fcm/" ]] && continue
  [[ -f "${pkg}pubspec.yaml" ]] || continue
  flutter pub get --directory "${pkg}" "$@"
done
