#!/usr/bin/env bash
set -euo pipefail

PROPERTIES="${1:-tool/release/android_release_version.properties}"
if [[ ! -f "$PROPERTIES" ]]; then
  echo "Missing $PROPERTIES" >&2
  exit 1
fi

unset VERSION_NAME BUILD_NUMBER

while IFS='=' read -r key value; do
  key="${key//$'\r'/}"
  value="${value//$'\r'/}"
  [[ -z "$key" || "$key" =~ ^# ]] && continue
  case "$key" in
    versionName) VERSION_NAME="$value" ;;
    versionCode) BUILD_NUMBER="$value" ;;
  esac
done <"$PROPERTIES"

if [[ -z "${VERSION_NAME:-}" || -z "${BUILD_NUMBER:-}" ]]; then
  echo "versionName and versionCode required in $PROPERTIES" >&2
  exit 1
fi

export VERSION_NAME BUILD_NUMBER
