#!/usr/bin/env python3
"""Append direct (non-PR) commits to a beta release draft body."""

from __future__ import annotations

import json
import os
import re
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

from beta_release_metadata import build_release_patch_payload, patch_release

BETA_TAG_PATTERN = re.compile(r"^v?(\d+\.\d+\.\d+)-beta\.(\d+)$")
COMMIT_SCOPE_PATTERN = r"(?:\([^)]+\)|\{[^}]+\})?"
CONVENTIONAL_COMMIT_PATTERN = re.compile(
    rf"^(?P<type>feat|fix|chore|ci|build|style|refactor|test){COMMIT_SCOPE_PATTERN}(?P<breaking>!)?:\s*(?P<title>.+)$",
    re.IGNORECASE,
)
SECTION_HEADINGS = {
    "feature": "### Features",
    "fix": "### Fixes",
    "other": "### Other",
}
SECTION_ORDER = ("### Features", "### Fixes", "### Other")
CATEGORY_ORDER = ("feature", "fix", "other")
DETAILED_CHANGES_HEADING = "## Detailed changes"
SKIP_CHANGELOG_TYPES = frozenset({"chore", "ci", "build", "style", "refactor", "test"})
DEFAULT_EXCLUDED_AUTHORS = frozenset(
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


@dataclass(frozen=True)
class DirectCommit:
    sha: str
    title: str
    author: str
    category: str


def read_excluded_authors() -> frozenset[str]:
    raw_value = os.environ.get("EXCLUDE_CONTRIBUTORS", "").strip()
    if raw_value == "":
        return DEFAULT_EXCLUDED_AUTHORS
    extra_authors = {author.strip() for author in raw_value.split(",") if author.strip() != ""}
    return DEFAULT_EXCLUDED_AUTHORS | extra_authors


def run_gh_json(args: list[str]) -> object:
    completed = subprocess.run(
        ["gh", *args],
        check=True,
        text=True,
        capture_output=True,
    )
    return json.loads(completed.stdout)


def is_beta_prerelease_tag(tag_name: str) -> bool:
    return BETA_TAG_PATTERN.match(tag_name) is not None


def find_previous_release_tag(current_tag: str) -> str | None:
    repository = os.environ["GITHUB_REPOSITORY"]
    releases = run_gh_json(
        [
            "release",
            "list",
            "--repo",
            repository,
            "--limit",
            "50",
            "--json",
            "tagName,isDraft",
        ]
    )
    for release in releases:
        tag_name = release["tagName"]
        if release["isDraft"]:
            continue
        if tag_name == current_tag:
            continue
        if is_beta_prerelease_tag(tag_name):
            return tag_name
    return None


def fetch_commit_author_login(sha: str) -> str:
    repository = os.environ["GITHUB_REPOSITORY"]
    data = run_gh_json(["api", f"repos/{repository}/commits/{sha}"])
    author = data.get("author")
    if isinstance(author, dict):
        login = author.get("login")
        if isinstance(login, str) and login != "":
            return login
    commit = data.get("commit", {})
    author_info = commit.get("author", {})
    name = author_info.get("name")
    if isinstance(name, str) and name != "":
        return name
    return "unknown"


def list_commits_since_tag(previous_tag: str | None, commitish: str) -> list[tuple[str, str]]:
    if previous_tag is not None:
        revision_range = f"{previous_tag}..{commitish}"
    else:
        revision_range = commitish
    completed = subprocess.run(
        [
            "git",
            "log",
            revision_range,
            "--no-merges",
            "--format=%H%x1f%s",
        ],
        check=True,
        text=True,
        capture_output=True,
    )
    commits: list[tuple[str, str]] = []
    for line in completed.stdout.splitlines():
        if line.strip() == "":
            continue
        sha, subject = line.split("\x1f", 1)
        if subject.startswith("Merge "):
            continue
        commits.append((sha, subject.strip()))
    return commits


def commit_has_pull_request(sha: str) -> bool:
    repository = os.environ["GITHUB_REPOSITORY"]
    try:
        pulls = run_gh_json(
            [
                "api",
                f"repos/{repository}/commits/{sha}/pulls",
                "-H",
                "Accept: application/vnd.github+json",
            ]
        )
    except subprocess.CalledProcessError:
        return False
    return isinstance(pulls, list) and len(pulls) > 0


def categorize_commit(subject: str) -> str | None:
    match = CONVENTIONAL_COMMIT_PATTERN.match(subject)
    if match is None:
        return "other"
    commit_type = match.group("type").lower()
    if commit_type in SKIP_CHANGELOG_TYPES:
        return None
    if commit_type == "feat":
        return "feature"
    if commit_type == "fix":
        return "fix"
    return "other"


def format_commit_line(sha: str, title: str, author: str) -> str:
    repository = os.environ["GITHUB_REPOSITORY"]
    short_sha = sha[:7]
    commit_url = f"https://github.com/{repository}/commit/{sha}"
    conventional_match = CONVENTIONAL_COMMIT_PATTERN.match(title)
    if conventional_match is not None:
        display_title = conventional_match.group("title").strip()
    else:
        display_title = title
    return f"- {display_title} (@{author}) ([{short_sha}]({commit_url}))"


def collect_direct_commits(previous_tag: str | None, commitish: str) -> list[DirectCommit]:
    excluded_authors = read_excluded_authors()
    direct_commits: list[DirectCommit] = []
    for sha, subject in list_commits_since_tag(previous_tag, commitish):
        author = fetch_commit_author_login(sha)
        if author in excluded_authors:
            continue
        if commit_has_pull_request(sha):
            continue
        category = categorize_commit(subject)
        if category is None:
            continue
        direct_commits.append(
            DirectCommit(
                sha=sha,
                title=subject,
                author=author,
                category=category,
            )
        )
    return direct_commits


def find_section_insert_at(body: str, section_heading: str) -> int:
    try:
        target_index = SECTION_ORDER.index(section_heading)
    except ValueError:
        return len(body.rstrip())
    for later_heading in SECTION_ORDER[target_index + 1 :]:
        match = re.search(rf"\n{re.escape(later_heading)}\n", body)
        if match is not None:
            return match.start()
    other_match = re.search(r"\n## Other\n", body)
    if other_match is not None:
        return other_match.start()
    detailed_match = re.search(rf"{re.escape(DETAILED_CHANGES_HEADING)}\n", body)
    if detailed_match is not None:
        return len(body.rstrip())
    changes_match = re.search(r"## Changes\n", body)
    if changes_match is not None:
        return len(body.rstrip())
    return len(body.rstrip())


def append_line_to_section(body: str, section_heading: str, line: str) -> str:
    if line in body:
        return body
    section_pattern = re.compile(
        rf"({re.escape(section_heading)}\n)(.*?)(?=\n## |\Z)",
        re.DOTALL,
    )
    match = section_pattern.search(body)
    if match is not None:
        section_content = match.group(2).rstrip()
        replacement = f"{match.group(1)}{section_content}\n{line}\n"
        return body[: match.start()] + replacement + body[match.end() :]
    insert_at = find_section_insert_at(body, section_heading)
    block = f"\n{section_heading}\n{line}\n"
    return body[:insert_at] + block + body[insert_at:]


def reorder_change_sections(body: str) -> str:
    extracted_sections: list[tuple[str, str]] = []
    for heading in SECTION_ORDER:
        section_pattern = re.compile(
            rf"\n{re.escape(heading)}\n(.*?)(?=\n### |\Z)",
            re.DOTALL,
        )
        match = section_pattern.search(body)
        if match is None:
            continue
        extracted_sections.append((heading, match.group(1).rstrip()))
        body = body[: match.start()] + body[match.end() :]
    if len(extracted_sections) == 0:
        return body
    rebuilt_sections = "".join(f"\n{heading}\n{content}\n" for heading, content in extracted_sections)
    detailed_match = re.search(rf"{re.escape(DETAILED_CHANGES_HEADING)}\n", body)
    if detailed_match is not None:
        insert_at = len(body.rstrip())
        return body[:insert_at] + rebuilt_sections + body[insert_at:]
    changes_match = re.search(r"## Changes\n", body)
    if changes_match is not None:
        insert_at = len(body.rstrip())
        return body[:insert_at] + rebuilt_sections + body[insert_at:]
    return body.rstrip() + rebuilt_sections


def insert_direct_commits(body: str, direct_commits: list[DirectCommit]) -> str:
    grouped_commits: dict[str, list[DirectCommit]] = {category: [] for category in CATEGORY_ORDER}
    for commit in direct_commits:
        grouped_commits[commit.category].append(commit)
    updated_body = body
    for category in CATEGORY_ORDER:
        for commit in grouped_commits[category]:
            line = format_commit_line(commit.sha, commit.title, commit.author)
            section_heading = SECTION_HEADINGS[commit.category]
            updated_body = append_line_to_section(updated_body, section_heading, line)
    return reorder_change_sections(updated_body)


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
        print("Usage: append_release_direct_commits.py <release-body-file>", file=sys.stderr)
        return 1
    release_id = os.environ.get("RELEASE_ID", "").strip()
    if release_id == "":
        print("RELEASE_ID is required", file=sys.stderr)
        return 1
    current_tag = os.environ.get("RELEASE_TAG", "").strip()
    commitish = os.environ.get("COMMITISH", "beta").strip()
    body_path = Path(sys.argv[1])
    body = body_path.read_text(encoding="utf-8")
    previous_tag = find_previous_release_tag(current_tag) if current_tag != "" else None
    direct_commits = collect_direct_commits(previous_tag, commitish)
    if len(direct_commits) == 0:
        print("No direct commits to append")
        return 0
    updated_body = insert_direct_commits(body, direct_commits)
    body_path.write_text(updated_body, encoding="utf-8")
    patch_release_body(release_id, updated_body)
    print(f"Appended {len(direct_commits)} direct commit(s) to release draft")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
