#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "usage: tool/build_flavor.sh <dev|oss|android-fcm> <flutter args...>" >&2
  exit 2
}

[[ $# -ge 2 ]] || usage
PROFILE="$1"
shift

case "${PROFILE}" in
  dev | oss | android-fcm | ios-store | apns) ;;
  *) usage ;;
esac

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MIRROR="${ROOT}/build/flavors/${PROFILE}/src"
MANIFEST="${ROOT}/build/flavors/${PROFILE}/files.txt"
NEW_MANIFEST="${MANIFEST}.new"

SECRET_GLOBS=(
  "android/app/google-services.json"
  "android/key.properties"
  "android/measure.properties"
  "android/*.jks"
  "android/app/*.jks"
  "android/*.keystore"
  "android/app/*.keystore"
  "android/gradlew"
  "android/gradlew.bat"
  "android/gradle/wrapper/gradle-wrapper.jar"
  "packages/fluxer_fcm/lib/firebase_options.dart"
  "ios/Flutter/MeasureSecrets*.xcconfig"
  ".env.perf"
)

mkdir -p "${MIRROR}"

cd "${ROOT}"
{
  git ls-files -z --recurse-submodules
  git ls-files -z -o --exclude-standard
  shopt -s nullglob
  for pattern in "${SECRET_GLOBS[@]}"; do
    for file in ${pattern}; do
      if [[ -f "${file}" ]]; then
        printf '%s\0' "${file}"
      fi
    done
  done
  shopt -u nullglob
} | tr '\0' '\n' | sort -u | while IFS= read -r file; do
  if [[ -n "${file}" && -f "${file}" ]]; then
    printf '%s\n' "${file}"
  fi
done > "${NEW_MANIFEST}"

if [[ -f "${MANIFEST}" ]]; then
  comm -23 "${MANIFEST}" "${NEW_MANIFEST}" | while IFS= read -r stale; do
    rm -f "${MIRROR}/${stale}"
  done
fi

rsync -a --files-from="${NEW_MANIFEST}" "${ROOT}/" "${MIRROR}/"
mv "${NEW_MANIFEST}" "${MANIFEST}"

cd "${MIRROR}"
echo "==> Mirror: ${MIRROR}"
dart tool/configure_build.dart --profile="${PROFILE}"
flutter pub get
bash tool/pub_get_packages.sh
dart run build_runner build --delete-conflicting-outputs
flutter "$@"

echo "==> Outputs: ${MIRROR}/build"
