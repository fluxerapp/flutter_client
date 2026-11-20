#!/usr/bin/env python3
"""Run F-Droid's scanner over the source tree or a built APK."""

from __future__ import annotations

import argparse
import logging
import sys
from types import SimpleNamespace

from fdroidserver import common, metadata, scanner


def _configure() -> None:
    common.options = SimpleNamespace(
        verbose=False,
        json=False,
        refresh_scanner=False,
        exit_code=False,
    )
    common.get_config()


def scan_source(path: str) -> int:
    return scanner.scan_source(path, metadata.Build())


def scan_apk(path: str) -> int:
    return scanner.scan_binary(path)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("mode", choices=("source", "apk"))
    parser.add_argument("path")
    args = parser.parse_args()

    logging.basicConfig(level=logging.WARNING, format="%(levelname)s %(message)s")
    _configure()

    problems = scan_source(args.path) if args.mode == "source" else scan_apk(args.path)
    if problems:
        print(f"::error::F-Droid scanner found {problems} problem(s) in {args.path}")
        return 1
    print(f"F-Droid scanner found no problems in {args.path}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
