#!/usr/bin/env bash
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

if [[ -t 1 ]]; then
  reset=$'\033[0m'
  bold=$'\033[1m'
  dim=$'\033[2m'
  red=$'\033[31m'
  green=$'\033[32m'
  cyan=$'\033[36m'
else
  reset=''
  bold=''
  dim=''
  red=''
  green=''
  cyan=''
fi

step_total=4
step_index=0

_info() {
  printf '%s%s%s\n' "${dim}" "$*" "${reset}"
}

_step() {
  local label="$1"
  shift
  step_index=$((step_index + 1))
  local start="${SECONDS}"
  printf '\n%s[%d/%d] %s%s\n' "${cyan}${bold}" "${step_index}" "${step_total}" "${label}" "${reset}"

  local status=0
  "$@" || status=$?

  local elapsed=$((SECONDS - start))
  if ((status != 0)); then
    printf '%s  ✘ %s failed after %ss (exit %d)%s\n' "${red}${bold}" "${label}" "${elapsed}" "${status}" "${reset}"
    printf '%s✘ before_commit stopped. Fix the issues above and run it again.%s\n' "${red}${bold}" "${reset}"
    exit "${status}"
  fi
  printf '%s  ✔ Done in %ss%s\n' "${green}" "${elapsed}" "${reset}"
}

_finish() {
  printf '\n%s✔ before_commit passed%s %s(%ss)%s\n' "${green}${bold}" "${reset}" "${dim}" "$((SECONDS - total_start))" "${reset}"
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

run_analyze() {
  if [[ "${BEFORE_COMMIT_SKIP_ANALYZE:-}" == 1 ]]; then
    _info "Skipped (BEFORE_COMMIT_SKIP_ANALYZE=1)."
    return 0
  fi
  bash "${ROOT}/tool/flutter_analyze.sh"
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
    _info "dart fix: ${root}"
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

printf '%sbefore_commit%s\n' "${bold}" "${reset}"

if [[ "$(git config --get core.hooksPath || true)" != ".githooks" ]]; then
  _info "Git hooks not installed. Run: bash tool/install_hooks.sh"
fi
_step "Checking build profile" dart tool/configure_build.dart --check

if ((${#dart_files[@]} == 0)); then
  if [[ "${BEFORE_COMMIT_ALL:-}" == 1 ]]; then
    _info "Scope: whole project"
    _step "Resolving package dependencies" bash "${ROOT}/tool/pub_get_packages.sh"
    _step "Applying dart fix (full project)" dart fix --apply
    _step "Formatting tracked Dart files" bash "${ROOT}/tool/format_dart.sh"
    _step "Analyzing project" run_analyze
    _finish
    exit 0
  fi

  if [[ -n "$(dart_source_files_list_tracked | head -n 1)" ]]; then
    _info "No changed Dart files. Set BEFORE_COMMIT_ALL=1 to fix and format the whole tree."
    exit 0
  fi

  _info "No Dart source files in this repo."
  exit 0
fi

_info "Scope: ${#dart_files[@]} changed Dart file(s)"

fix_label="Applying dart fix (${#dart_files[@]} files)"
if ((${#dart_files[@]} > 200)); then
  fix_label="Applying dart fix (full project; ${#dart_files[@]} files changed)"
fi

_step "Resolving package dependencies" bash "${ROOT}/tool/pub_get_packages.sh"
_step "${fix_label}" apply_dart_fix
_step "Formatting ${#dart_files[@]} Dart files" dart format "${dart_files[@]}"
_step "Analyzing project" run_analyze
_finish
