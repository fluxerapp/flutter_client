#!/usr/bin/env bash
set -euo pipefail

SRC="${1:?src path required}"
DST="${2:?dst path required}"

jq --indent 4 '
  .categories as $cats |
  if .shortcuts then $cats + {shortcuts: .shortcuts} else $cats end
' "$SRC" >"$DST"
