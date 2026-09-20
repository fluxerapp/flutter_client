#!/usr/bin/env python3
"""Helpers for beta release draft tag and title metadata."""

from __future__ import annotations

import json
import re
import subprocess
from functools import lru_cache
from pathlib import Path

BETA_TAG_PATTERN = re.compile(r"^v?(\d+\.\d+\.\d+)-beta\.(\d+)$")
FORBIDDEN_BETA_NUMBERS_FILE = Path(__file__).resolve().parent / "forbidden_beta_numbers.txt"


@lru_cache(maxsize=1)
def load_forbidden_beta_numbers() -> frozenset[int]:
    if not FORBIDDEN_BETA_NUMBERS_FILE.is_file():
        raise FileNotFoundError(
            f"Missing forbidden beta numbers file: {FORBIDDEN_BETA_NUMBERS_FILE}"
        )
    forbidden: set[int] = set()
    for line in FORBIDDEN_BETA_NUMBERS_FILE.read_text(encoding="utf-8").splitlines():
        stripped = line.split("#", maxsplit=1)[0].strip()
        if stripped == "":
            continue
        forbidden.add(int(stripped))
    return frozenset(forbidden)


def is_forbidden_beta_number(beta_number: int) -> bool:
    return beta_number in load_forbidden_beta_numbers()


def next_allowed_beta_number(beta_number: int) -> int:
    while is_forbidden_beta_number(beta_number):
        beta_number += 1
    return beta_number


def normalize_beta_number(beta_number: int) -> int:
    if beta_number <= 0:
        beta_number = 1
    return next_allowed_beta_number(beta_number)


def sanitize_beta_tag_name(tag_name: str) -> str:
    match = BETA_TAG_PATTERN.match(tag_name)
    if match is None:
        raise ValueError(f"Tag does not match beta prerelease pattern: {tag_name}")
    base = match.group(1)
    beta_number = normalize_beta_number(int(match.group(2)))
    prefix = "v" if tag_name.startswith("v") else ""
    return f"{prefix}{base}-beta.{beta_number}"


def format_beta_release_title(tag_name: str) -> str:
    match = BETA_TAG_PATTERN.match(tag_name)
    if match is None:
        raise ValueError(f"Tag does not match beta prerelease pattern: {tag_name}")
    return f"V{match.group(1)} Beta {match.group(2)}"


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
        payload["name"] = format_beta_release_title(tag_name)
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


def _cli() -> int:
    import sys

    if len(sys.argv) != 3 or sys.argv[1] != "normalize-beta-number":
        print(
            "usage: beta_release_metadata.py normalize-beta-number <n>",
            file=sys.stderr,
        )
        return 2
    try:
        print(normalize_beta_number(int(sys.argv[2])))
    except (FileNotFoundError, ValueError) as exc:
        print(f"::error::{exc}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(_cli())
