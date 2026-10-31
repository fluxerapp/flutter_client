#!/usr/bin/env bash
set -euo pipefail

flavor_token="${1:-}"
if [ -z "$flavor_token" ]; then
  echo "usage: rename_oss_apk_artifacts.sh <flavor-token>" >&2
  echo "  e.g. betaunifiedpush or canaryunifiedpush" >&2
  exit 1
fi

if [[ "$flavor_token" != *unifiedpush* ]]; then
  echo "::error::Expected a unifiedpush flavor token, got: $flavor_token" >&2
  exit 1
fi

APK_DIR="build/app/outputs/flutter-apk"
oss_token="${flavor_token/unifiedpush/oss}"

shopt -s nullglob
sources=("$APK_DIR"/*"${flavor_token}"*.apk)
if [ "${#sources[@]}" -eq 0 ]; then
  echo "::error::No APKs matched *${flavor_token}* before rename"
  exit 1
fi

for apk in "${sources[@]}"; do
  new_name=$(basename "$apk" | sed 's/unifiedpush/oss/g')
  mv -- "$apk" "$APK_DIR/$new_name"
done

leftovers=("$APK_DIR"/*unifiedpush*.apk)
if [ "${#leftovers[@]}" -gt 0 ]; then
  echo "::error::UnifiedPush APK file names remain after rename:"
  printf '  %s\n' "${leftovers[@]}"
  exit 1
fi

final=("$APK_DIR"/*"${oss_token}"*.apk)
if [ "${#final[@]}" -eq 0 ]; then
  echo "::error::No OSS APK outputs after rename (expected *${oss_token}*)"
  exit 1
fi

echo "Renamed ${#sources[@]} APK(s) to OSS names:"
printf '  %s\n' "${final[@]}"
