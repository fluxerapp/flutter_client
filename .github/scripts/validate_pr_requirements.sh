#!/usr/bin/env bash
set -euo pipefail

PR_NUMBER="${PR_NUMBER:?PR_NUMBER is required}"
GITHUB_REPOSITORY="${GITHUB_REPOSITORY:?GITHUB_REPOSITORY is required}"
SKIP_LABEL="${SKIP_LABEL:-no-issue}"
PR_BODY="${PR_BODY:-}"

get_pr_body() {
  if [[ -n "$PR_BODY" ]]; then
    printf '%s' "$PR_BODY"
    return
  fi
  gh api "repos/${GITHUB_REPOSITORY}/pulls/${PR_NUMBER}" --jq '.body // ""'
}

has_skip_label() {
  gh api "repos/${GITHUB_REPOSITORY}/pulls/${PR_NUMBER}" \
    --jq ".labels[].name" | grep -qx "${SKIP_LABEL}" || return 1
}

check_linked_reference() {
  local body
  body=$(get_pr_body)
  if echo "$body" | grep -qE 'https://feedback\.fluxer\.com/p/[0-9]+'; then
    echo "feedback.fluxer.com post found in PR body."
    return 0
  fi
  return 1
}

check_signed_commits() {
  local commits_json unsigned total
  commits_json=$(gh api "repos/${GITHUB_REPOSITORY}/pulls/${PR_NUMBER}/commits" --paginate)

  unsigned=$(echo "$commits_json" | jq -r '
    .[] | select(.commit.verification.verified != true) |
    "\(.sha[0:7]) (\(.commit.verification.reason // "unknown"))"
  ')

  if [[ -n "$unsigned" ]]; then
    echo "::error::The following commits are not verified:"
    while IFS= read -r line; do
      echo "::error::$line"
    done <<< "$unsigned"
    return 1
  fi

  total=$(echo "$commits_json" | jq 'length')
  echo "All ${total} commit(s) are verified."
  return 0
}

if has_skip_label; then
  echo "Label '${SKIP_LABEL}' present, skipping the feedback post check."
else
  if ! check_linked_reference; then
    echo "::error::No feedback.fluxer.com post found. Paste the link to the post this PR resolves in the PR body. Maintainers can add the '${SKIP_LABEL}' label to bypass."
    exit 1
  fi
fi

if ! check_signed_commits; then
  exit 1
fi

echo "All PR requirement checks passed."
