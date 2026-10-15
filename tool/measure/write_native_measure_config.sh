#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

MEASURE_CHANNELS=(canary beta stable)

read_measure_property() {
  local file="$1"
  local key="$2"
  if [[ ! -f "$file" ]]; then
    return 0
  fi
  local line
  line="$(grep -E "^${key}=" "$file" 2>/dev/null | tail -n 1 || true)"
  if [[ -n "$line" ]]; then
    printf '%s' "${line#*=}"
  fi
}

channel_upper() {
  printf '%s' "$1" | tr '[:lower:]' '[:upper:]'
}

ios_measure_secrets_channel() {
  local channel="$1"
  if [[ "$channel" == "beta" ]]; then
    printf '%s' stable
  else
    printf '%s' "$channel"
  fi
}

resolve_android_key() {
  local channel="$1"
  if [[ "$channel" == "beta" ]]; then
    resolve_android_key stable
    return 0
  fi
  local upper
  upper="$(channel_upper "$channel")"
  local env_name="MEASURE_ANDROID_API_KEY_${upper}"
  local value="${!env_name:-}"
  if [[ -n "$value" ]]; then
    printf '%s' "$value"
    return 0
  fi
  if [[ -n "${MEASURE_ANDROID_API_KEY:-}" && "${MEASURE_RELEASE_CHANNEL:-stable}" == "$channel" ]]; then
    printf '%s' "$MEASURE_ANDROID_API_KEY"
    return 0
  fi
  if [[ -n "${MEASURE_ANDROID_API_KEY:-}" && "$channel" == "stable" && -z "${MEASURE_RELEASE_CHANNEL:-}" ]]; then
    printf '%s' "$MEASURE_ANDROID_API_KEY"
    return 0
  fi
  local legacy
  legacy="$(read_measure_property "$MEASURE_PROPERTIES" "measure.apiKey")"
  if [[ -n "$legacy" && "$channel" == "stable" ]]; then
    printf '%s' "$legacy"
    return 0
  fi
  local from_file
  from_file="$(read_measure_property "$MEASURE_PROPERTIES" "measure.apiKey.${channel}")"
  if [[ -n "$from_file" ]]; then
    printf '%s' "$from_file"
    return 0
  fi
  printf '%s' ""
}

resolve_ios_key() {
  local channel="$1"
  if [[ "$channel" == "beta" ]]; then
    resolve_ios_key stable
    return 0
  fi
  local upper
  upper="$(channel_upper "$channel")"
  local env_name="MEASURE_IOS_API_KEY_${upper}"
  local value="${!env_name:-}"
  if [[ -n "$value" ]]; then
    printf '%s' "$value"
    return 0
  fi
  if [[ -n "${MEASURE_IOS_API_KEY:-}" && "${MEASURE_RELEASE_CHANNEL:-stable}" == "$channel" ]]; then
    printf '%s' "$MEASURE_IOS_API_KEY"
    return 0
  fi
  if [[ -n "${MEASURE_IOS_API_KEY:-}" && "$channel" == "stable" && -z "${MEASURE_RELEASE_CHANNEL:-}" ]]; then
    printf '%s' "$MEASURE_IOS_API_KEY"
    return 0
  fi
  local legacy
  legacy="$(read_measure_property "$MEASURE_PROPERTIES" "measure.ios.apiKey")"
  if [[ -n "$legacy" && "$channel" == "stable" ]]; then
    printf '%s' "$legacy"
    return 0
  fi
  local from_file
  from_file="$(read_measure_property "$MEASURE_PROPERTIES" "measure.ios.apiKey.${channel}")"
  if [[ -n "$from_file" ]]; then
    printf '%s' "$from_file"
    return 0
  fi
  printf '%s' ""
}

resolve_api_url() {
  if [[ -n "${MEASURE_API_URL:-}" ]]; then
    printf '%s' "$MEASURE_API_URL"
    return 0
  fi
  read_measure_property "$MEASURE_PROPERTIES" "measure.apiUrl"
}

write_ios_secrets_xcconfig() {
  local channel="$1"
  local api_key="$2"
  local api_url="$3"
  local path="$ROOT/ios/Flutter/MeasureSecrets.${channel}.xcconfig"
  local xcconfig_api_url
  xcconfig_api_url="$(printf '%s' "$api_url" | sed 's#//#/$()/#g')"
  cat >"$path" <<EOF
MEASURE_API_KEY=$api_key
MEASURE_API_URL=$xcconfig_api_url
EOF
  echo "Wrote ios/Flutter/MeasureSecrets.${channel}.xcconfig"
}

MEASURE_PROPERTIES="$ROOT/android/measure.properties"
API_URL="$(resolve_api_url)"

android_any=0
ios_any=0
for channel in "${MEASURE_CHANNELS[@]}"; do
  android_key="$(resolve_android_key "$channel")"
  ios_key="$(resolve_ios_key "$channel")"
  if [[ -n "$android_key" ]]; then
    android_any=1
  fi
  if [[ -n "$ios_key" ]]; then
    ios_any=1
  fi
done

if [[ "$android_any" -eq 1 || "$ios_any" -eq 1 ]]; then
  if [[ -z "$API_URL" ]]; then
    echo "::error::MEASURE_API_URL must be set when writing Measure credentials"
    exit 1
  fi
fi

if [[ "$android_any" -eq 1 ]]; then
  merged_api_url="$API_URL"
  if [[ -z "$merged_api_url" ]]; then
    merged_api_url="$(read_measure_property "$MEASURE_PROPERTIES" "measure.apiUrl")"
  fi
  {
    echo "measure.apiUrl=$merged_api_url"
    for channel in "${MEASURE_CHANNELS[@]}"; do
      android_key="$(resolve_android_key "$channel")"
      if [[ -z "$android_key" ]]; then
        android_key="$(read_measure_property "$MEASURE_PROPERTIES" "measure.apiKey.${channel}")"
      fi
      if [[ -n "$android_key" ]]; then
        echo "measure.apiKey.${channel}=$android_key"
      fi
    done
    for channel in "${MEASURE_CHANNELS[@]}"; do
      ios_key="$(resolve_ios_key "$channel")"
      if [[ -z "$ios_key" ]]; then
        property_channel="$(ios_measure_secrets_channel "$channel")"
        ios_key="$(read_measure_property "$MEASURE_PROPERTIES" "measure.ios.apiKey.${property_channel}")"
      fi
      if [[ -n "$ios_key" ]]; then
        echo "measure.ios.apiKey.${channel}=$ios_key"
      fi
    done
  } >"$MEASURE_PROPERTIES"
  echo "Wrote android/measure.properties"
else
  echo "No Measure Android keys resolved; skipping android/measure.properties"
fi

ios_written=0
for channel in "${MEASURE_CHANNELS[@]}"; do
  ios_key="$(resolve_ios_key "$channel")"
  if [[ -n "$ios_key" ]]; then
    secrets_channel="$(ios_measure_secrets_channel "$channel")"
    write_ios_secrets_xcconfig "$secrets_channel" "$ios_key" "$API_URL"
    ios_written=1
  fi
done

if [[ "$ios_written" -eq 0 ]]; then
  echo "No Measure iOS keys resolved; skipping ios/Flutter/MeasureSecrets.*.xcconfig"
fi

release_channel="${MEASURE_RELEASE_CHANNEL:-}"
if [[ -n "$release_channel" ]]; then
  ios_key="$(resolve_ios_key "$release_channel")"
  if [[ -n "$ios_key" ]]; then
    secrets_channel="$(ios_measure_secrets_channel "$release_channel")"
    write_ios_secrets_xcconfig "$secrets_channel" "$ios_key" "$API_URL"
    cp "$ROOT/ios/Flutter/MeasureSecrets.${secrets_channel}.xcconfig" \
      "$ROOT/ios/Flutter/MeasureSecrets.xcconfig"
    echo "Wrote ios/Flutter/MeasureSecrets.xcconfig from ${secrets_channel} channel"
  fi
fi
