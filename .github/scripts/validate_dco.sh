#!/usr/bin/env bash
set -euo pipefail

PR_NUMBER="${PR_NUMBER:?PR_NUMBER is required}"
GITHUB_REPOSITORY="${GITHUB_REPOSITORY:?GITHUB_REPOSITORY is required}"

pr_json=$(gh api "repos/${GITHUB_REPOSITORY}/pulls/${PR_NUMBER}")
pr_author_login=$(jq -r '.user.login // ""' <<< "$pr_json")
pr_author_type=$(jq -r '.user.type // ""' <<< "$pr_json")

if [[ "$pr_author_type" == "Bot" ]]; then
  echo "Skipping DCO check for bot-authored pull request: ${pr_author_login}"
  exit 0
fi

commits_json=$(
  gh api "repos/${GITHUB_REPOSITORY}/pulls/${PR_NUMBER}/commits?per_page=100" \
    --paginate \
    --jq '.[]' |
    jq -s '.'
)

failures=$(
  jq -r '
    def signoffs:
      [
        (.commit.message // "" | split("\n")[] |
          try capture("(?i)^Signed-off-by:\\s*(?<name>.+)\\s+<(?<email>[^<>]+)>\\s*$") catch empty)
      ];

    def matching_signoff($signoff; $name; $email):
      ($name != null and $email != null and
       $signoff.name == $name and
       ($signoff.email | ascii_downcase) == ($email | ascii_downcase));

    .[]
    | select((.author.type // "") != "Bot")
    | . as $commit
    | ($commit | signoffs) as $signoffs
    | if ($signoffs | length) == 0 then
        "\($commit.sha[0:7]) \($commit.commit.message | split("\n")[0]) — sign-off not found"
      elif any($signoffs[]; matching_signoff(.; $commit.commit.author.name; $commit.commit.author.email) or matching_signoff(.; $commit.commit.committer.name; $commit.commit.committer.email)) then
        empty
      else
        "\($commit.sha[0:7]) \($commit.commit.message | split("\n")[0]) — sign-off does not match author or committer"
      end
  ' <<< "$commits_json"
)

if [[ -n "$failures" ]]; then
  echo "::error::The following non-bot commit(s) are missing a valid DCO sign-off:"
  while IFS= read -r failure; do
    echo "::error::${failure}"
  done <<< "$failures"
  echo "::error::Add a Signed-off-by trailer with git commit -s, then update the pull request."
  exit 1
fi

checked_count=$(jq '[.[] | select((.author.type // "") != "Bot")] | length' <<< "$commits_json")
echo "DCO check passed for ${checked_count} non-bot commit(s)."
