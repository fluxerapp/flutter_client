#!/usr/bin/env bash
# Run an integration perf test on a physical Android device and print its frame timings.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT}"

if [ "$#" -lt 1 ]; then
  echo "usage: tool/perf_drive.sh <target-under-integration_test/perf> [device-serial]" >&2
  exit 2
fi

TARGET="$1"

if [ -f "${ROOT}/.env.perf" ]; then
  # shellcheck disable=SC1091
  source "${ROOT}/.env.perf"
fi

if [ "$#" -ge 2 ]; then
  DEVICE="$2"
else
  DEVICE="$(adb devices | awk '$2 == "device" { print $1; exit }')"
  if [ -z "${DEVICE}" ]; then
    echo "error: no Android device in state 'device'; connect one, authorize the adb prompt, or pass a serial" >&2
    exit 1
  fi
  echo "Using device ${DEVICE}"
fi

# Screen sleep stalls the driven app mid-scroll, so keep the device awake.
if [ "${PERF_KEEP_AWAKE:-1}" != "0" ]; then
  adb -s "$DEVICE" shell settings put global stay_on_while_plugged_in 7 || true
  adb -s "$DEVICE" shell svc power stayon true || true
  adb -s "$DEVICE" shell input keyevent KEYCODE_WAKEUP || true
fi

DART_DEFINES=(
  --dart-define-from-file=tool/dart_defines/canary.json
  --dart-define=PUSH_PROVIDER=unifiedpush
)
if [ -n "${TEST_LAB_EMAIL:-}" ]; then
  DART_DEFINES+=(--dart-define=TEST_LAB_EMAIL="$TEST_LAB_EMAIL")
fi
if [ -n "${TEST_LAB_PASSWORD:-}" ]; then
  DART_DEFINES+=(--dart-define=TEST_LAB_PASSWORD="$TEST_LAB_PASSWORD")
fi
if [ -n "${TEST_LAB_GUILD_ID:-}" ]; then
  DART_DEFINES+=(--dart-define=TEST_LAB_GUILD_ID="$TEST_LAB_GUILD_ID")
fi
if [ -n "${TEST_LAB_CHANNEL_ID:-}" ]; then
  DART_DEFINES+=(--dart-define=TEST_LAB_CHANNEL_ID="$TEST_LAB_CHANNEL_ID")
fi
if [ -n "${PERF_STREAMS:-}" ]; then
  DART_DEFINES+=(--dart-define=PERF_STREAMS="$PERF_STREAMS")
fi
if [ -n "${PERF_FLING_COUNT:-}" ]; then
  DART_DEFINES+=(--dart-define=PERF_FLING_COUNT="$PERF_FLING_COUNT")
fi
if [ -n "${PERF_WIDGET_EVENTS:-}" ]; then
  DART_DEFINES+=(--dart-define=PERF_WIDGET_EVENTS="$PERF_WIDGET_EVENTS")
fi
if [ -n "${PERF_SEMANTICS:-}" ]; then
  DART_DEFINES+=(--dart-define=PERF_SEMANTICS="$PERF_SEMANTICS")
fi

# flutter drive's teardown uninstalls the app (drive_service.dart:286), which
# wipes the session between runs. Keeping it running skips that teardown.
KEEP_APP=(--keep-app-running)
if [ "${PERF_KEEP_INSTALL:-1}" = "0" ]; then
  KEEP_APP=(--no-keep-app-running)
fi

flutter drive \
  --profile \
  --no-dds \
  -d "$DEVICE" \
  --flavor canaryUnifiedpush \
  "${DART_DEFINES[@]}" \
  "${KEEP_APP[@]}" \
  --driver=test_driver/perf_driver.dart \
  --target="integration_test/perf/${TARGET}"

shopt -s nullglob
SUMMARIES=(build/perf/*.timeline_summary.json)
shopt -u nullglob

if [ "${#SUMMARIES[@]}" -eq 0 ]; then
  if [ -n "${PERF_STREAMS:-}" ] && [[ "${PERF_STREAMS}" != *Embedder* ]]; then
    shopt -s nullglob
    TIMELINES=(build/perf/*.timeline.json)
    shopt -u nullglob
    echo "no summaries: PERF_STREAMS lacks Embedder, raw timelines only"
    for timeline in "${TIMELINES[@]}"; do
      echo "  ${timeline}"
    done
    exit 0
  fi
  echo "error: no summaries written to build/perf; did the test call traceAction with a reportKey?" >&2
  exit 1
fi

for summary in "${SUMMARIES[@]}"; do
  echo
  echo "${summary}"
  if command -v jq >/dev/null 2>&1; then
    jq -r '
      "  frame_count:                  \(.frame_count)",
      "  build avg / p90 / p99 ms:     \(.average_frame_build_time_millis) / \(.["90th_percentile_frame_build_time_millis"]) / \(.["99th_percentile_frame_build_time_millis"])",
      "  raster avg / p90 / p99 ms:    \(.average_frame_rasterizer_time_millis) / \(.["90th_percentile_frame_rasterizer_time_millis"]) / \(.["99th_percentile_frame_rasterizer_time_millis"])",
      "  missed build budget count:    \(.missed_frame_build_budget_count)",
      "  missed raster budget count:   \(.missed_frame_rasterizer_budget_count)"
    ' "${summary}"
  else
    echo "  install jq to print the frame timing summary"
  fi
done
