#!/usr/bin/env bash
# Flush unsaved editor buffers before dart fix/format
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

if [[ "${BEFORE_COMMIT_SKIP_SAVE:-}" == 1 ]]; then
  if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    return 0
  fi
  exit 0
fi

case "$(uname -s)" in
  Darwin)
    osascript "${ROOT}/tool/save_editor_buffers.applescript" 2>/dev/null || true
    ;;
  *)
    ;;
esac

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  exit 0
fi
