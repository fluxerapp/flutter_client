#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
target="$root/assets/certificates/root_certificates.pem"
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT

curl -fsSL https://curl.se/ca/cacert.pem -o "$work/cacert.pem"
expected="$(curl -fsSL https://curl.se/ca/cacert.pem.sha256 | awk '{print $1}')"
actual="$(shasum -a 256 "$work/cacert.pem" | awk '{print $1}')"
if [[ "$expected" != "$actual" ]]; then
  echo "cacert.pem checksum mismatch: expected $expected, got $actual" >&2
  exit 1
fi

mkdir -p "$(dirname "$target")"
awk '/-----BEGIN CERTIFICATE-----/{keep=1} keep{print} /-----END CERTIFICATE-----/{keep=0}' \
  "$work/cacert.pem" > "$target"
echo "Wrote $(grep -c 'BEGIN CERTIFICATE' "$target") root certificates to $target"
