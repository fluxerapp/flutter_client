#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

VERSION_NAME="${VERSION_NAME:-}"
BUILD_NUMBER="${BUILD_NUMBER:-}"
BETA_NUMBER="${BETA_NUMBER:-}"

if [[ -z "$VERSION_NAME" || -z "$BUILD_NUMBER" ]]; then
  if [[ -f tool/release/android_release_version.properties ]]; then
    . "$ROOT/tool/fdroid/read_android_release_version.sh"
  else
    echo "Set VERSION_NAME and BUILD_NUMBER, or commit tool/release/android_release_version.properties" >&2
    exit 1
  fi
fi

if [[ -z "$BETA_NUMBER" && "$VERSION_NAME" =~ -beta\.([0-9]+)$ ]]; then
  BETA_NUMBER="${BASH_REMATCH[1]}"
fi

echo "Building F-Droid-style beta OSS (versionName=$VERSION_NAME, versionCode=$BUILD_NUMBER)"

git submodule update --init --recursive

dart tool/configure_build.dart --profile=oss

if ! command -v cargo >/dev/null 2>&1; then
  echo "Rust (cargo) is required for native assets" >&2
  exit 1
fi
rustup target add aarch64-linux-android armv7-linux-androideabi x86_64-linux-android
flutter config --enable-native-assets

bash tool/apply_macos_pub_overrides.sh
flutter pub get
dart run build_runner build

BUILD_ARGS=(
  flutter build apk --release
  --flavor betaUnifiedpush
  --build-name "$VERSION_NAME"
  --build-number "$BUILD_NUMBER"
  --dart-define-from-file=tool/dart_defines/fdroid.json
  --dart-define=PUSH_PROVIDER=unifiedpush
)

if [[ -n "$BETA_NUMBER" ]]; then
  BUILD_ARGS+=(--dart-define="BETA_NUMBER=$BETA_NUMBER")
fi

if [[ -n "${SOURCE_DATE_EPOCH:-}" ]]; then
  if build_timestamp="$(date -u -d "@${SOURCE_DATE_EPOCH}" +%Y-%m-%dT%H:%M:%SZ 2>/dev/null)"; then
    :
  else
    build_timestamp="$(date -u -r "${SOURCE_DATE_EPOCH}" +%Y-%m-%dT%H:%M:%SZ)"
  fi
  BUILD_ARGS+=(--dart-define="BUILD_TIMESTAMP=${build_timestamp}")
fi

"${BUILD_ARGS[@]}"

echo "APK: build/app/outputs/flutter-apk/app-beta-unifiedpush-release.apk"
