#!/usr/bin/env bash
# Apply dart fixes and format source files before committing.
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
total_start="${SECONDS}"

# shellcheck source=dart_source_files.sh
source "${ROOT}/tool/dart_source_files.sh"

_log() {
  printf 'before_commit: %s\n' "$*"
}

_step() {
  local label="$1"
  shift
  local start="${SECONDS}"
  _log "${label}"
  "$@"
  _log "${label} done ($((SECONDS - start))s)"
}

save_editor_buffers() {
  # shellcheck source=save_editor_buffers.sh
  source "${ROOT}/tool/save_editor_buffers.sh"
}

dart_fix_root_for() {
  local file="$1"
  case "${file}" in
    packages/*/*)
      printf '%s\n' "${file}" | cut -d/ -f1-2
      ;;
    lib/*)
      printf 'lib\n'
      ;;
    test/*)
      printf 'test\n'
      ;;
    tool/*)
      printf 'tool\n'
      ;;
    integration_test/*)
      printf 'integration_test\n'
      ;;
    *)
      dirname "${file}"
      ;;
  esac
}

apply_dart_fix() {
  local count="${#dart_files[@]}"
  if ((count == 0)); then
    return 0
  fi
  if ((count > 200)); then
    dart fix --apply
    return 0
  fi
  if ((count == 1)); then
    dart fix --apply "${dart_files[0]}"
    return 0
  fi

  local file root
  local roots=()
  for file in "${dart_files[@]}"; do
    roots+=("$(dart_fix_root_for "${file}")")
  done

  local unique
  unique="$(printf '%s\n' "${roots[@]}" | sort -u)"
  local root_count=0
  while IFS= read -r root; do
    [[ -n "${root}" ]] || continue
    root_count=$((root_count + 1))
  done <<< "${unique}"

  if ((root_count > 15)); then
    dart fix --apply
    return 0
  fi

  while IFS= read -r root; do
    [[ -n "${root}" ]] || continue
    dart fix --apply "${root}"
  done <<< "${unique}"
}

dart_files=()
while IFS= read -r line; do
  [[ -n "${line}" ]] || continue
  dart_files+=("${line}")
done < <(dart_source_files_list_dirty)

if [[ "${BEFORE_COMMIT_ALL:-}" == 1 ]]; then
  dart_files=()
fi

if ((${#dart_files[@]} == 0)); then
  if [[ "${BEFORE_COMMIT_ALL:-}" == 1 ]]; then
    _step "Saving editor buffers" save_editor_buffers
    _step "Resolving package dependencies" bash "${ROOT}/tool/pub_get_packages.sh"
    _step "Applying dart fix (full project)" dart fix --apply
    _step "Formatting tracked Dart files" bash "${ROOT}/tool/format_dart.sh"
    _log "All steps finished ($((SECONDS - total_start))s total)."
    exit 0
  fi

  if [[ -n "$(dart_source_files_list_tracked | head -n 1)" ]]; then
    _log "No changed Dart files (set BEFORE_COMMIT_ALL=1 to fix/format the whole tree)."
    exit 0
  fi

  _log "No Dart source files in this repo."
  exit 0
fi

_step "Saving editor buffers" save_editor_buffers
_step "Resolving package dependencies" bash "${ROOT}/tool/pub_get_packages.sh"

fix_label="Applying dart fix (${#dart_files[@]} files)"
if ((${#dart_files[@]} > 200)); then
  fix_label="Applying dart fix (full project; ${#dart_files[@]} files changed)"
fi
_step "${fix_label}" apply_dart_fix

_step "Formatting ${#dart_files[@]} Dart files" dart format "${dart_files[@]}"

_log "All steps finished ($((SECONDS - total_start))s total)."
