#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${NODUS_CI_TOKEN:-}" ]]; then
  echo "::error::NODUS_CI_TOKEN must be set"
  exit 1
fi

NODUS_APP="${NODUS_APP:-fluxer}"

NODUS_BASE_URL="${NODUS_BASE_URL:-https://nodus.ae1.dev}"
URL="${NODUS_BASE_URL}/v1/apps/${NODUS_APP}/build-numbers/android"
echo "Allocating Android build number at ${URL}"
RESPONSE=$(curl -fS -X POST "$URL" \
  -H "Authorization: Bearer ${NODUS_CI_TOKEN}")
BUILD_NUMBER=$(printf '%s' "$RESPONSE" | python3 -c '
import json
import sys

try:
    payload = json.load(sys.stdin)
except json.JSONDecodeError as exc:
    raise SystemExit(f"invalid JSON from Nodus: {exc}") from exc

value = payload.get("buildNumber")
if isinstance(value, str) and value.isdigit():
    value = int(value)
if not isinstance(value, int) or value < 0:
    raise SystemExit(f"missing or invalid buildNumber in response: {payload!r}")
print(value)
')
if [[ -z "$BUILD_NUMBER" ]]; then
  echo "::error::Invalid or missing buildNumber in response: $RESPONSE"
  exit 1
fi

if [[ -n "${GITHUB_OUTPUT:-}" ]]; then
  echo "build_number=$BUILD_NUMBER" >> "$GITHUB_OUTPUT"
else
  echo "$BUILD_NUMBER"
fi
