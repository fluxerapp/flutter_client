#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "usage: tool/dev.sh <unifiedpush|fcm|apns> [run|apk|ios] [flutter args...]" >&2
  exit 2
}

[[ $# -ge 1 ]] || usage
PROVIDER="$1"
ACTION="${2:-run}"
shift
[[ $# -ge 1 ]] && shift

case "${PROVIDER}" in
  unifiedpush) PROFILE=oss FLAVOR=canaryUnifiedpush ;;
  fcm) PROFILE=android-fcm FLAVOR=canaryFcm ;;
  apns) PROFILE=dev FLAVOR=canary ;;
  *) usage ;;
esac

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT}"

ARGS=(
  --flavor "${FLAVOR}"
  --dart-define-from-file=tool/dart_defines/canary.json
  --dart-define=PUSH_PROVIDER="${PROVIDER}"
  "$@"
)

restore_dev() {
  dart tool/configure_build.dart --profile=dev
  flutter pub get
}

case "${ACTION}" in
  run)
    if [[ "${PROFILE}" != dev ]]; then
      trap restore_dev EXIT
    fi
    dart tool/configure_build.dart --profile="${PROFILE}"
    flutter pub get
    flutter run "${ARGS[@]}"
    ;;
  apk)
    exec bash tool/build_flavor.sh "${PROFILE}" build apk "${ARGS[@]}"
    ;;
  ios)
    [[ "${PROVIDER}" == apns ]] || usage
    flutter build ios "${ARGS[@]}"
    ;;
  *) usage ;;
esac
