#!/bin/sh
set -eu
frameworks_dir="${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
manifest="${SRCROOT}/PrivacyManifests/EmbeddedFramework.xcprivacy"
[ -d "$frameworks_dir" ] || exit 0
for framework in "$frameworks_dir"/*.framework; do
  [ -d "$framework" ] || continue
  if [ -n "$(find "$framework" -name PrivacyInfo.xcprivacy | head -n 1)" ]; then
    continue
  fi
  cp "$manifest" "$framework/PrivacyInfo.xcprivacy"
  if [ "${CODE_SIGNING_ALLOWED:-NO}" = "YES" ] && [ -n "${EXPANDED_CODE_SIGN_IDENTITY:-}" ]; then
    codesign --force --sign "$EXPANDED_CODE_SIGN_IDENTITY" --preserve-metadata=identifier,entitlements,flags --timestamp=none "$framework"
  fi
done
