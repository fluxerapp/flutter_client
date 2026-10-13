#!/usr/bin/env bash

dart_source_files_filter() {
  grep -vE '\.(g|freezed|pb|pbenum|pbjson|fcm)\.dart$' \
    | grep -vE '^(dart_sdk|build|packages/fluxer_fcm)/' \
    | grep -vE '^lib/core/synced_preferences/generated/' \
    || true
}

dart_source_files_list_tracked() {
  git ls-files '*.dart' | dart_source_files_filter
}

dart_source_files_list_dirty() {
  {
    git diff --name-only HEAD -- '*.dart'
    git ls-files -o --exclude-standard '*.dart'
  } | sort -u | dart_source_files_filter
}
