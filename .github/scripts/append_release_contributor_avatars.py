#!/usr/bin/env python3
"""Append a Contributors section with GitHub avatar icons to a release draft."""

from __future__ import annotations

import os
import re
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

from beta_release_metadata import build_release_patch_payload, patch_release

CONTRIBUTORS_HEADING = "## Contributors"
MENTION_PATTERN = re.compile(r"@([A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?(?:\[bot\])?)")
CONTRIBUTORS_SECTION_PATTERN = re.compile(
    rf"\n{re.escape(CONTRIBUTORS_HEADING)}\n.*\Z",
    re.DOTALL,
)
DEFAULT_EXCLUDED_LOGINS = frozenset(
    {
        "dependabot",
        "dependabot[bot]",
        "renovate",
        "renovate[bot]",
        "renovate-bot",
        "github-actions",
        "github-actions[bot]",
        "fluxer-automation",
        "fluxer-automation[bot]",
    }
)
AVATAR_SIZE_PX = 48


def read_excluded_logins() -> frozenset[str]:
    raw_value = os.environ.get("EXCLUDE_CONTRIBUTORS", "").strip()
    if raw_value == "":
        return DEFAULT_EXCLUDED_LOGINS
    extra_logins = {login.strip() for login in raw_value.split(",") if login.strip() != ""}
    return DEFAULT_EXCLUDED_LOGINS | extra_logins


def extract_contributor_logins(body: str, excluded_logins: frozenset[str]) -> list[str]:
    logins: set[str] = set()
    for match in MENTION_PATTERN.finditer(body):
        login = match.group(1)
        if "[bot]" in login:
            continue
        if login in excluded_logins:
            continue
        logins.add(login)
    return sorted(logins)


def build_contributors_section(logins: list[str]) -> str:
    avatar_links: list[str] = []
    for login in logins:
        profile_url = f"https://github.com/{login}"
        avatar_url = f"https://github.com/{login}.png?size={AVATAR_SIZE_PX}"
        avatar_links.append(
            f'<a href="{profile_url}" title="@{login}">'
            f'<img src="{avatar_url}" width="{AVATAR_SIZE_PX}" height="{AVATAR_SIZE_PX}" '
            f'alt="@{login}" /></a>'
        )
    icons_row = " ".join(avatar_links)
    return f"\n\n{CONTRIBUTORS_HEADING}\n\n<p align=\"left\">{icons_row}</p>\n"


def strip_contributors_section(body: str) -> str:
    return CONTRIBUTORS_SECTION_PATTERN.sub("", body).rstrip()


def patch_release_body(release_id: str, body: str) -> None:
    repository = os.environ["GITHUB_REPOSITORY"]
    payload = build_release_patch_payload(
        body=body,
        tag_name=os.environ.get("RELEASE_TAG", "").strip() or None,
        target_commitish=os.environ.get("COMMITISH", "").strip() or None,
    )
    patch_release(repository, release_id, payload)


def main() -> int:
    if len(sys.argv) != 2:
        print("Usage: append_release_contributor_avatars.py <release-body-file>", file=sys.stderr)
        return 1
    release_id = os.environ.get("RELEASE_ID", "").strip()
    if release_id == "":
        print("RELEASE_ID is required", file=sys.stderr)
        return 1
    body_path = Path(sys.argv[1])
    body = body_path.read_text(encoding="utf-8")
    excluded_logins = read_excluded_logins()
    logins = extract_contributor_logins(body, excluded_logins)
    updated_body = strip_contributors_section(body)
    if len(logins) > 0:
        updated_body += build_contributors_section(logins)
    patch_release_body(release_id, updated_body)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
