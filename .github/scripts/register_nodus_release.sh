#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${NODUS_CI_TOKEN:-}" ]]; then
  echo "::error::NODUS_CI_TOKEN must be set"
  exit 1
fi

NODUS_APP="${NODUS_APP:-fluxer}"
NODUS_BASE_URL="${NODUS_BASE_URL:-https://nodus.ae1.dev}"

: "${NODUS_RUN_ID:?}"
: "${NODUS_RUN_URL:?}"
: "${NODUS_VERSION:?}"
: "${NODUS_COMMIT:?}"
: "${NODUS_REF:?}"
: "${NODUS_ANDROID_BUILD_FCM:?}"
: "${NODUS_ANDROID_BUILD_OSS:?}"

if ! [[ "$NODUS_ANDROID_BUILD_FCM" =~ ^[0-9]+$ ]]; then
  echo "::error::Invalid FCM build number: ${NODUS_ANDROID_BUILD_FCM}" >&2
  exit 1
fi
if ! [[ "$NODUS_ANDROID_BUILD_OSS" =~ ^[0-9]+$ ]]; then
  echo "::error::Invalid OSS build number: ${NODUS_ANDROID_BUILD_OSS}" >&2
  exit 1
fi

NODUS_RELEASE_JSON=$(python3 - <<'PY'
import json
import os

payload = {
    "runId": os.environ["NODUS_RUN_ID"],
    "runUrl": os.environ["NODUS_RUN_URL"],
    "version": os.environ["NODUS_VERSION"],
    "commit": os.environ["NODUS_COMMIT"],
    "ref": os.environ["NODUS_REF"],
    "builds": [
        {
            "platform": "android",
            "variant": "fcm",
            "buildNumber": int(os.environ["NODUS_ANDROID_BUILD_FCM"]),
        },
        {
            "platform": "android",
            "variant": "oss",
            "buildNumber": int(os.environ["NODUS_ANDROID_BUILD_OSS"]),
        },
    ],
}
print(json.dumps(payload))
PY
)

URL="${NODUS_BASE_URL}/v1/apps/${NODUS_APP}/releases"
echo "Registering release with Nodus"
curl -fS -X POST "$URL" \
  -H "Authorization: Bearer ${NODUS_CI_TOKEN}" \
  -H "Content-Type: application/json" \
  --data-binary "$NODUS_RELEASE_JSON"
