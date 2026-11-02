#!/usr/bin/env bash
set -euo pipefail

dist_slug="${1:?distribution slug}"
apk_dir="${2:?apk directory}"

if [[ -z "${NODUS_CI_TOKEN:-}" ]]; then
  echo "::error::NODUS_CI_TOKEN must be set"
  exit 1
fi

NODUS_APP="${NODUS_APP:-fluxer}"
NODUS_BASE_URL="${NODUS_BASE_URL:-https://nodus.ae1.dev}"

: "${NODUS_RUN_ID:?}"
: "${NODUS_RUN_URL:?}"
: "${NODUS_VERSION:?}"
: "${NODUS_PACKAGE_ID:?}"
: "${NODUS_AUTHOR:?}"
: "${NODUS_APK_FILTER:?}"

if [[ ! -d "$apk_dir" ]]; then
  echo "::error::APK directory not found: ${apk_dir}" >&2
  exit 1
fi

shopt -s nullglob
mapfile -d '' files < <(find "$apk_dir" -name '*.apk' -print0)
if ((${#files[@]} == 0)); then
  echo "::error::No APKs under ${apk_dir}" >&2
  exit 1
fi

query=$(python3 - <<'PY'
import os
import urllib.parse

params = {
    "runId": os.environ["NODUS_RUN_ID"],
    "runUrl": os.environ["NODUS_RUN_URL"],
    "version": os.environ["NODUS_VERSION"],
    "packageId": os.environ["NODUS_PACKAGE_ID"],
    "author": os.environ["NODUS_AUTHOR"],
    "apkFilter": os.environ["NODUS_APK_FILTER"],
}
name = os.environ.get("NODUS_DIST_NAME", "").strip()
if name:
    params["name"] = name
print(urllib.parse.urlencode(params))
PY
)

for apk in "${files[@]}"; do
  URL="${NODUS_BASE_URL}/v1/apps/${NODUS_APP}/distributions/${dist_slug}/files?${query}"
  echo "Uploading $(basename "$apk") to Nodus distribution ${dist_slug}"
  curl -fS -X POST \
    --max-time 1800 \
    -H "Authorization: Bearer ${NODUS_CI_TOKEN}" \
    -F "file=@${apk}" \
    "$URL"
done
