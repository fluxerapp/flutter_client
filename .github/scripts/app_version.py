#!/usr/bin/env python3
"""Read and roll the pubspec calendar version {year}.{month}.{public}."""

from __future__ import annotations

import os
import re
import sys
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path

PUBSPEC_PATH = Path("pubspec.yaml")
DEFAULT_PUBLIC_RELEASE = 100
VERSION_LINE_PATTERN = re.compile(
    r"^(version:\s*)(\d+)\.(\d+)\.(\d+)(\+[^\s]+)?\s*$"
)


@dataclass(frozen=True)
class AppVersion:
    year: int
    month: int
    public_release: int
    build: str | None = None

    @property
    def name(self) -> str:
        return f"{self.year}.{self.month:02d}.{self.public_release}"

    @property
    def pubspec_value(self) -> str:
        if self.build:
            return f"{self.name}{self.build}"
        return self.name


def parse_version_value(value: str) -> AppVersion:
    name, plus, build = value.strip().partition("+")
    parts = name.split(".")
    if len(parts) != 3:
        raise ValueError(f"Version is not year.month.public: {value}")
    year, month, public_release = (int(part) for part in parts)
    return AppVersion(
        year=year,
        month=month,
        public_release=public_release,
        build=f"+{build}" if plus == "+" else None,
    )


def read_pubspec_version(path: Path = PUBSPEC_PATH) -> AppVersion:
    for raw_line in path.read_text(encoding="utf-8").splitlines():
        match = VERSION_LINE_PATTERN.match(raw_line)
        if match is not None:
            return AppVersion(
                year=int(match.group(2)),
                month=int(match.group(3)),
                public_release=int(match.group(4)),
                build=match.group(5),
            )
    raise ValueError(f"Could not find version in {path}")


def write_pubspec_version(version: AppVersion, path: Path = PUBSPEC_PATH) -> None:
    lines = path.read_text(encoding="utf-8").splitlines(keepends=True)
    replaced = False
    for index, raw_line in enumerate(lines):
        stripped = raw_line.rstrip("\r\n")
        newline = raw_line[len(stripped) :]
        match = VERSION_LINE_PATTERN.match(stripped)
        if match is None:
            continue
        lines[index] = f"{match.group(1)}{version.pubspec_value}{newline}"
        replaced = True
        break
    if not replaced:
        raise ValueError(f"Could not find version in {path}")
    path.write_text("".join(lines), encoding="utf-8")


def calendar_version_for(now: datetime, current: AppVersion) -> AppVersion:
    if (current.year, current.month) >= (now.year, now.month):
        return current
    return AppVersion(
        year=now.year,
        month=now.month,
        public_release=DEFAULT_PUBLIC_RELEASE,
        build=current.build,
    )


def _pubspec_version_value(path: Path) -> str:
    for raw_line in path.read_text(encoding="utf-8").splitlines():
        match = VERSION_LINE_PATTERN.match(raw_line)
        if match is not None:
            build = match.group(5) or ""
            return f"{match.group(2)}.{match.group(3)}.{match.group(4)}{build}"
    raise ValueError(f"Could not find version in {path}")


def roll_pubspec_calendar(now: datetime | None = None, path: Path = PUBSPEC_PATH) -> tuple[bool, AppVersion]:
    if now is None:
        now = datetime.now(timezone.utc)
    current = read_pubspec_version(path)
    next_version = calendar_version_for(now, current)
    if _pubspec_version_value(path) == next_version.pubspec_value:
        return False, next_version
    write_pubspec_version(next_version, path)
    return True, next_version


def _write_github_output(*, changed: bool, version: AppVersion) -> None:
    github_output = os.environ.get("GITHUB_OUTPUT", "").strip()
    if github_output == "":
        return
    with open(github_output, "a", encoding="utf-8") as handle:
        handle.write(f"changed={'true' if changed else 'false'}\n")
        handle.write(f"version={version.name}\n")


def _cli() -> int:
    if len(sys.argv) != 2 or sys.argv[1] != "roll":
        print("usage: app_version.py roll", file=sys.stderr)
        return 2
    try:
        changed, version = roll_pubspec_calendar()
    except (OSError, ValueError) as exc:
        print(f"::error::{exc}", file=sys.stderr)
        return 1
    if changed:
        print(f"Updated pubspec version to {version.pubspec_value}")
    else:
        print(f"pubspec year.month already current: {version.name}")
    _write_github_output(changed=changed, version=version)
    return 0


if __name__ == "__main__":
    raise SystemExit(_cli())
