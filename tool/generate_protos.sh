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

BUF_VERSION="1.75.0"
PROTO_DIR="fluxer/packages/schema/proto"
OUT_DIR="lib/core/synced_preferences/generated"
PLUGIN_SOURCE="tool/protoc_gen_dart.dart"
PLUGIN=".dart_tool/protoc_gen_dart/protoc-gen-dart"
TEMPLATE="{\"version\":\"v2\",\"clean\":true,\"plugins\":[{\"local\":\"${PLUGIN}\",\"out\":\"${OUT_DIR}\"}]}"

die() {
  echo "$*" >&2
  exit 1
}

check=false
case "${1:-}" in
  "") ;;
  --check) check=true ;;
  *)
    echo "usage: $0 [--check]" >&2
    exit 64
    ;;
esac

[[ -f "${PROTO_DIR}/buf.yaml" ]] \
  || die "${PROTO_DIR} is missing; run: git submodule update --init fluxer"
[[ -f .dart_tool/package_config.json ]] \
  || die "Dart packages are not resolved; run: flutter pub get"

run_buf() {
  if command -v buf >/dev/null 2>&1 && [[ "$(buf --version 2>/dev/null)" == "${BUF_VERSION}" ]]; then
    buf "$@"
  elif command -v npx >/dev/null 2>&1; then
    npx --yes "@bufbuild/buf@${BUF_VERSION}" "$@"
  else
    die "buf ${BUF_VERSION} is required; install it or Node.js (for npx)"
  fi
}

if [[ ! -x "${PLUGIN}" || "${PLUGIN_SOURCE}" -nt "${PLUGIN}" || pubspec.lock -nt "${PLUGIN}" ]]; then
  mkdir -p "$(dirname "${PLUGIN}")"
  dart compile exe --verbosity=error "${PLUGIN_SOURCE}" -o "${PLUGIN}"
fi

if [[ "${check}" == false ]]; then
  run_buf generate "${PROTO_DIR}" --template "${TEMPLATE}"
  exit 0
fi

tmp="$(mktemp -d)"
trap 'rm -rf "${tmp}"' EXIT
run_buf generate "${PROTO_DIR}" --template "${TEMPLATE}" -o "${tmp}"

status=0
diff -ru "${OUT_DIR}" "${tmp}/${OUT_DIR}" || status=$?
case "${status}" in
  0) echo "Generated protobuf code is up to date." ;;
  1) die "${OUT_DIR} is out of date with ${PROTO_DIR}; run: bash tool/generate_protos.sh" ;;
  *) die "diff failed with exit code ${status}" ;;
esac
