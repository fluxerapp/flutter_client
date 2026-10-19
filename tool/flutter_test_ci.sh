#!/usr/bin/env bash
set -euo pipefail

log="$(mktemp)"
trap 'rm -f "$log"' EXIT

runner=(flutter test --reporter compact)
if [ "${1:-}" = "--dart" ]; then
  shift
  runner=(dart test --reporter compact)
fi

status=0
if ! "${runner[@]}" "$@" >"$log" 2>&1; then
  status=1
fi

if [ "$status" -ne 0 ]; then
  echo "Failed tests ([E]):"
  grep '\[E\]' "$log" || cat "$log"
else
  cat "$log"
fi

exit "$status"
