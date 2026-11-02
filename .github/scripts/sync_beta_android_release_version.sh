#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

VERSION_NAME="${VERSION_NAME:-}"
BUILD_NUMBER="${BUILD_NUMBER:-}"
BASE_BRANCH="${BASE_BRANCH:-beta}"

if [[ -z "$VERSION_NAME" || -z "$BUILD_NUMBER" ]]; then
  echo "VERSION_NAME and BUILD_NUMBER are required" >&2
  exit 1
fi
if ! [[ "$BUILD_NUMBER" =~ ^[0-9]+$ ]]; then
  echo "BUILD_NUMBER must be numeric: $BUILD_NUMBER" >&2
  exit 1
fi

python3 .github/scripts/app_version.py sync-beta-android-release \
  "$VERSION_NAME" "$BUILD_NUMBER"

git config user.name "fluxer-ci[bot]"
git config user.email "${FLUXER_CI_APP_USER_ID}+fluxer-ci[bot]@users.noreply.github.com"

git add pubspec.yaml tool/release/android_release_version.properties
changelog_path="fastlane/metadata/android/en-US/changelogs/${BUILD_NUMBER}.txt"
if [[ -f "$changelog_path" ]]; then
  git add "$changelog_path"
fi
if git diff --cached --quiet; then
  echo "Android release version already synced; nothing to commit."
  exit 0
fi

git commit -m "chore(release): sync Android version for ${VERSION_NAME} (${BUILD_NUMBER})"
git pull --rebase origin "$BASE_BRANCH"
git push origin "HEAD:$BASE_BRANCH"
