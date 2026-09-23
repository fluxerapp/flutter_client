#!/usr/bin/env python3
"""Helpers for beta release draft tag and title metadata."""

from __future__ import annotations

import json
import os
import re
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

from app_version import read_pubspec_version

BETA_TAG_PATTERN = re.compile(r"^v?(\d+\.\d+\.\d+)-beta\.(\d+)$")


def normalize_beta_number(beta_number: int) -> int:
    if beta_number <= 0:
        return 1
    return beta_number


def canonical_release_base(version: str) -> str | None:
    parts = version.split(".")
    if len(parts) != 3:
        return None
    try:
        year, month, public_release = (int(part) for part in parts)
    except ValueError:
        return None
    return f"{year}.{month:02d}.{public_release}"


def parse_beta_tag(tag_name: str) -> tuple[str, int] | None:
    match = BETA_TAG_PATTERN.match(tag_name)
    if match is None:
        return None
    base = canonical_release_base(match.group(1))
    if base is None:
        return None
    return base, int(match.group(2))


def _max_matching_beta_number(tags: list[str], base_version: str) -> int | None:
    wanted = canonical_release_base(base_version) or base_version
    numbers = [
        parsed[1]
        for tag in tags
        for parsed in (parse_beta_tag(tag),)
        if parsed is not None and parsed[0] == wanted
    ]
    if not numbers:
        return None
    return max(numbers)


def sanitize_beta_tag_name(tag_name: str) -> str:
    parsed = parse_beta_tag(tag_name)
    if parsed is None:
        raise ValueError(f"Tag does not match beta prerelease pattern: {tag_name}")
    base, beta_number = parsed
    prefix = "v" if tag_name.startswith("v") else ""
    return f"{prefix}{base}-beta.{normalize_beta_number(beta_number)}"


def format_beta_release_title(tag_name: str) -> str:
    parsed = parse_beta_tag(tag_name)
    if parsed is None:
        raise ValueError(f"Tag does not match beta prerelease pattern: {tag_name}")
    base, beta_number = parsed
    return f"{base} Beta {beta_number}"


def resolve_beta_version_name(
    base_version: str,
    draft_tags: list[str],
    published_prerelease_tags: list[str],
) -> tuple[str, int]:
    base = canonical_release_base(base_version) or base_version
    draft_number = _max_matching_beta_number(draft_tags, base)
    published_number = _max_matching_beta_number(published_prerelease_tags, base)
    if published_number is not None:
        next_number = normalize_beta_number(published_number + 1)
        if draft_number is None or draft_number < next_number:
            return f"{base}-beta.{next_number}", next_number
    if draft_number is not None:
        beta_number = normalize_beta_number(draft_number)
        return f"{base}-beta.{beta_number}", beta_number
    beta_number = normalize_beta_number(1)
    return f"{base}-beta.{beta_number}", beta_number


def list_release_tags(*, drafts: bool, prereleases: bool | None = None) -> list[str]:
    completed = subprocess.run(
        [
            "gh",
            "release",
            "list",
            "--repo",
            os.environ["GITHUB_REPOSITORY"],
            "--limit",
            "100",
            "--json",
            "tagName,isDraft,isPrerelease",
        ],
        check=True,
        text=True,
        capture_output=True,
    )
    tags: list[str] = []
    for release in json.loads(completed.stdout):
        is_draft = bool(release.get("isDraft"))
        if drafts:
            if not is_draft:
                continue
        elif is_draft:
            continue
        if prereleases is True and not release.get("isPrerelease"):
            continue
        tag_name = release.get("tagName")
        if isinstance(tag_name, str) and tag_name != "":
            tags.append(tag_name)
    return tags


def build_release_patch_payload(
    *,
    body: str | None = None,
    tag_name: str | None = None,
    release_name: str | None = None,
    target_commitish: str | None = None,
) -> dict[str, str]:
    payload: dict[str, str] = {}
    if body is not None:
        payload["body"] = body
    if tag_name is not None and tag_name != "":
        payload["tag_name"] = tag_name
    if release_name is not None and release_name != "":
        payload["name"] = release_name
    elif tag_name is not None and tag_name != "":
        try:
            payload["name"] = format_beta_release_title(tag_name)
        except ValueError:
            pass
    if target_commitish is not None and target_commitish != "":
        payload["target_commitish"] = target_commitish
    return payload


def patch_release(repository: str, release_id: str, payload: dict[str, str]) -> None:
    subprocess.run(
        [
            "gh",
            "api",
            "--method",
            "PATCH",
            f"repos/{repository}/releases/{release_id}",
            "--input",
            "-",
        ],
        input=json.dumps(payload),
        text=True,
        check=True,
    )


def resolve_beta_version_from_github(base_version: str | None = None) -> tuple[str, int]:
    if base_version is None:
        base_version = read_pubspec_version(Path("pubspec.yaml")).name
    draft_tags = list_release_tags(drafts=True)
    published_prerelease_tags = list_release_tags(drafts=False, prereleases=True)
    version_name, beta_number = resolve_beta_version_name(
        base_version,
        draft_tags,
        published_prerelease_tags,
    )
    draft_number = _max_matching_beta_number(draft_tags, base_version)
    published_number = _max_matching_beta_number(
        published_prerelease_tags, base_version
    )
    if published_number is not None and (
        draft_number is None or draft_number < published_number + 1
    ):
        print(
            "Resolved beta version by incrementing latest published prerelease: "
            f"{version_name}"
        )
    elif draft_number is not None:
        print(f"Resolved beta version from draft release: {version_name}")
    else:
        print(f"Resolved beta version from pubspec fallback: {version_name}")
    return version_name, beta_number


def _write_github_output(*, version_name: str, beta_number: int, tag_name: str | None = None) -> None:
    github_output = os.environ.get("GITHUB_OUTPUT", "").strip()
    if github_output == "":
        return
    with open(github_output, "a", encoding="utf-8") as handle:
        handle.write(f"version_name={version_name}\n")
        handle.write(f"beta_number={beta_number}\n")
        if tag_name is not None:
            handle.write(f"tag_name={tag_name}\n")


def _cli() -> int:
    if len(sys.argv) < 2:
        print(
            "usage: beta_release_metadata.py resolve-beta-version | "
            "normalize-beta-number <n>",
            file=sys.stderr,
        )
        return 2
    command = sys.argv[1]
    try:
        if command == "normalize-beta-number":
            if len(sys.argv) != 3:
                print(
                    "usage: beta_release_metadata.py normalize-beta-number <n>",
                    file=sys.stderr,
                )
                return 2
            print(normalize_beta_number(int(sys.argv[2])))
            return 0
        if command == "resolve-beta-version":
            if "GITHUB_REPOSITORY" not in os.environ:
                print("GITHUB_REPOSITORY is required", file=sys.stderr)
                return 1
            version_name, beta_number = resolve_beta_version_from_github()
            _write_github_output(version_name=version_name, beta_number=beta_number)
            return 0
    except (OSError, ValueError, KeyError, subprocess.CalledProcessError) as exc:
        print(f"::error::{exc}", file=sys.stderr)
        return 1
    print(
        "usage: beta_release_metadata.py resolve-beta-version | "
        "normalize-beta-number <n>",
        file=sys.stderr,
    )
    return 2


if __name__ == "__main__":
    raise SystemExit(_cli())
