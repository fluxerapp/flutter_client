#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PACKAGE_CONFIG="${ROOT}/.dart_tool/package_config.json"
MAX_ATTEMPTS=5

if [[ ! -f "${PACKAGE_CONFIG}" ]]; then
  echo "::error::${PACKAGE_CONFIG} not found. Run flutter pub get first." >&2
  exit 1
fi

package_dir() {
  local uri="$1"
  local path="${uri#file://}"
  case "${path}" in
    /[A-Za-z]:/*) path="${path#/}" ;;
  esac
  if [[ "${uri}" != file://* ]]; then
    path="${ROOT}/.dart_tool/${path}"
  fi
  printf '%s\n' "${path%/}"
}

install_toolchain() {
  local dir="$1"
  local attempt
  for ((attempt = 1; attempt <= MAX_ATTEMPTS; attempt++)); do
    if (cd "${dir}" && rustup toolchain install); then
      return 0
    fi
    if ((attempt < MAX_ATTEMPTS)); then
      sleep $((attempt * 15))
    fi
  done
  echo "::error::Could not install the Rust toolchain pinned in ${dir}/rust-toolchain.toml." >&2
  return 1
}

while IFS= read -r uri; do
  uri="${uri%$'\r'}"
  dir="$(package_dir "${uri}")/rust"
  if [[ -f "${dir}/rust-toolchain.toml" ]]; then
    echo "Installing Rust toolchain for ${dir}"
    install_toolchain "${dir}"
  fi
done < <(jq -r '.packages[].rootUri' "${PACKAGE_CONFIG}")
