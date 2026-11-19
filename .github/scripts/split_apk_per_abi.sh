#!/usr/bin/env bash
set -euo pipefail

fail() {
  echo "::error::$*" >&2
  exit 1
}

universal="${1:-}"
if [ -z "$universal" ] || [ ! -f "$universal" ]; then
  echo "usage: split_apk_per_abi.sh <universal-apk>" >&2
  echo "  writes app-<abi>-<flavor>-release.apk next to the universal APK" >&2
  exit 1
fi

repo_root="$(cd "$(dirname "$0")/../.." && pwd)"
key_properties="$repo_root/android/key.properties"

read_property() {
  local value
  value="$(sed -n "s/^$1=//p" "$key_properties" | head -n1 | tr -d '\r')"
  [ -n "$value" ] || fail "$1 is missing from android/key.properties"
  printf '%s' "$value"
}

if [ -f "$key_properties" ]; then
  keystore="$(read_property storeFile)"
  case "$keystore" in
    /*) ;;
    *) keystore="$repo_root/android/app/$keystore" ;;
  esac
  key_alias="$(read_property keyAlias)"
  SPLIT_APK_KS_PASS="$(read_property storePassword)"
  SPLIT_APK_KEY_PASS="$(read_property keyPassword)"
elif [ "${ALLOW_DEBUG_SIGNING:-}" = "1" ]; then
  keystore="$repo_root/android/app/debug.keystore"
  key_alias="canary"
  SPLIT_APK_KS_PASS="canary-debug"
  SPLIT_APK_KEY_PASS="canary-debug"
else
  fail "android/key.properties not found; set ALLOW_DEBUG_SIGNING=1 to sign with the debug keystore"
fi
[ -f "$keystore" ] || fail "Keystore not found: $keystore"
export SPLIT_APK_KS_PASS SPLIT_APK_KEY_PASS

sdk_root="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}}"
[ -d "$sdk_root/build-tools" ] || fail "No build-tools under $sdk_root"
build_tools_version="$(ls "$sdk_root/build-tools" | sort -V | tail -n1)"
build_tools="$sdk_root/build-tools/$build_tools_version"
if [ "$(printf '%s\n' "35.0.0" "$build_tools_version" | sort -V | head -n1)" != "35.0.0" ]; then
  fail "build-tools $build_tools_version is too old; zipalign -P 16 needs 35.0.0 or newer"
fi
zipalign="$build_tools/zipalign"
apksigner="$build_tools/apksigner"

universal_schemes="$("$apksigner" verify -v "$universal" 2>/dev/null)" \
  || fail "$universal is not signed; build it with a signing config first"
scheme_flags=()
for scheme in v1 v2 v3; do
  if grep -qE "^Verified using $scheme scheme .*: true$" <<<"$universal_schemes"; then
    scheme_flags+=("--$scheme-signing-enabled" true)
  else
    scheme_flags+=("--$scheme-signing-enabled" false)
  fi
done

apk_dir="$(cd "$(dirname "$universal")" && pwd)"
suffix="$(basename "$universal")"
suffix="${suffix#app-}"

abis=()
while IFS= read -r abi; do
  abis+=("$abi")
done < <(unzip -Z1 "$universal" | awk -F/ '$1 == "lib" && NF >= 3 && $3 != "" { print $2 }' | sort -u)

[ "${#abis[@]}" -ge 2 ] || fail "Expected a universal APK with several ABIs, found: ${abis[*]:-none}"

work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT

for abi in "${abis[@]}"; do
  drop=('META-INF/*.SF' 'META-INF/*.RSA' 'META-INF/*.DSA' 'META-INF/*.EC' 'META-INF/MANIFEST.MF')
  for other in "${abis[@]}"; do
    if [ "$other" != "$abi" ]; then
      drop+=("lib/$other/*")
    fi
  done

  stripped="$work/$abi-stripped.apk"
  aligned="$work/$abi-aligned.apk"
  out="$apk_dir/app-$abi-$suffix"

  cp "$universal" "$stripped"
  zip -q -d "$stripped" "${drop[@]}"
  "$zipalign" -P 16 -f 4 "$stripped" "$aligned"
  "$apksigner" sign \
    --ks "$keystore" \
    --ks-key-alias "$key_alias" \
    --ks-pass env:SPLIT_APK_KS_PASS \
    --key-pass env:SPLIT_APK_KEY_PASS \
    "${scheme_flags[@]}" \
    --v4-signing-enabled false \
    --out "$out" \
    "$aligned"

  "$zipalign" -c -P 16 4 "$out"
  "$apksigner" verify "$out"

  remaining="$(unzip -Z1 "$out" | awk -F/ '$1 == "lib" && NF >= 3 && $3 != "" { print $2 }' | sort -u | tr '\n' ' ')"
  [ "$remaining" = "$abi " ] || fail "$out contains unexpected ABIs: $remaining"

  echo "Wrote $(basename "$out") ($(wc -c <"$out" | awk '{ printf "%.1f MB", $1 / 1048576 }'))"
done
