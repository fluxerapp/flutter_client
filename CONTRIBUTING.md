# Contributing to Fluxer Mobile

Thanks for your interest in contributing. Please read this before opening a pull
request.

> [!CAUTION]
> Please contact us on the Fluxer Labs community if you would like to upstream a fix. We will grant you access to create PR's.

[Join Link](https://fluxer.gg/fluxer-labs)

## Scope during beta

During the current beta we only accept contributions for **bug fixes**, and a pull
request must be for a linked, reported issue. App translations are handled through
our Weblate instance (see [Translating](#translating)). These guidelines will be
expanded after the beta.

Pull requests should target the `canary` branch. For local testing, use the
`canary` build flavor so your build matches that branch (see [Mobile builds](#mobile-builds)).

Before committing, run `bash tool/before_commit.sh` to apply `dart fix` and format
tracked Dart files (generated and vendored paths are skipped). CI uses the same
file list.

## Licensing of contributions

This project is licensed under the GNU Affero General Public License, version 3
(AGPLv3, see [`LICENSE`](./LICENSE)) **together with an App Store additional
permission** under section 7 of the AGPLv3 (see
[`LICENSE-APPSTORE-EXCEPTION`](./LICENSE-APPSTORE-EXCEPTION)).

By submitting a contribution to this repository, you agree that your contribution
is licensed under **the AGPLv3 together with the App Store additional permission in
`LICENSE-APPSTORE-EXCEPTION`**, on the same terms as the rest of the project. This
lets Fluxer distribute the app through application stores (such as the Apple App
Store and Google Play) without changing the project's public AGPLv3 licensing. You
keep the copyright in your contribution.

There is **no separate or signed Contributor License Agreement**. Agreement to the
above is given by the act of contributing, together with the DCO sign-off below.

## Developer Certificate of Origin (DCO) sign-off

Every commit must be signed off under the Developer Certificate of Origin (see the
[`DCO`](./DCO) file). The sign-off is a single line at the end of each commit
message:

```
Signed-off-by: Your Name <your.email@example.com>
```

Add it automatically with:

```
git commit -s
```

The name and email must be your real identity and match your committer details. If
you forget, amend the last commit with `git commit --amend -s`, or sign off a whole
branch with `git rebase --signoff <base>` and force-push.

> The DCO sign-off (`-s`, a `Signed-off-by` line) is **separate from** the
> cryptographic commit signing (`-S`, the GitHub "Verified" badge via GPG/SSH/S/MIME)
> that this project also requires. Please do both.

Pull requests from humans are checked automatically by the DCO workflow; a pull
request cannot be merged until every non-bot commit is signed off.

## Translating

App translations are welcome at any time.

Strings are managed on [Weblate](https://weblate.fluxer.tools/projects/flutter-client/). You can translate in the browser — no repository checkout or pull request is needed. English is the source language.

## Tech stack

- **Flutter / Dart** — cross platform UI (mobile today, desktop in progress)
- **Riverpod** — state management (with code generation)
- **go_router** — navigation and deep links
- **Drift** — local SQLite database
- **Dio** — HTTP client
- **[fluxer_dart](https://github.com/fluxerapp/dart_sdk)** — Fluxer API client (OpenAPI generated)
- **WebSockets** — real time gateway events
- **LiveKit / WebRTC** — voice and video calls
- **FCM / UnifiedPush / APNs** — push notifications (platform dependent)

## Version numbers

> [!NOTE]
> We will transition to this version method after the V1 update.

Releases use `{year}.{month}.{public release number}`, for example `2026.07.100`.

- **Year** and **month** are when the release was published.
- **Public release number** is the release counter for that month. It resets at the start of each month.
- Counters start at **100**, then **200**, **300**, and so on (not 1, 2, 3) so they are not mistaken for a day of the month.

## Build generated files

Riverpod generated files are not committed, so you need to generate them before running the project.

```text
dart run build_runner build
```

## Native markdown parser (experimental)

The `fluxer/` submodule vendors the canonical Rust markdown parser. A Dart
native-assets build hook (`packages/fluxer_markdown_native`) compiles it with
cargo during `flutter build` and bundles it into the app.

Prerequisites: [rustup](https://rustup.rs) with the stable toolchain, and
`flutter config --enable-native-assets`. For Android builds also add the
cross-compilation targets:

```text
rustup target add aarch64-linux-android armv7-linux-androideabi x86_64-linux-android
```

## Mobile builds

**Environments** are `canary`, `beta`, and `stable`. Pass compile-time defines with `--dart-define-from-file=tool/dart_defines/<environment>.json` (each file sets `APP_ENVIRONMENT`) plus `--dart-define=PUSH_PROVIDER=...` as needed.

**Application ID / bundle ID:** `beta` and `stable` use `com.fluxer`. `canary` uses `com.fluxer.canary`

**Android** uses two Gradle flavor dimensions: environment plus push (`fcm` or `unifiedpush`). The variant name combines both in camelCase (for example `stableFcm`, `betaUnifiedpush`). `PUSH_PROVIDER` must match the push dimension: `fcm` for Firebase Cloud Messaging (adds deps via `pubspec.firebase.deps.yaml`) or `unifiedpush` for UnifiedPush.

**iOS** uses schemes with the same environment names (`canary`, `beta`, `stable`). There is no push flavor dimension; push is always Apple Push Notification service, so use `PUSH_PROVIDER=apns`.

Example (Android, stable with FCM):

```text
flutter run --flavor stableFcm --dart-define-from-file=tool/dart_defines/stable.json --dart-define=PUSH_PROVIDER=fcm
```

For the same environment on iOS, swap the flavor for the scheme and set `PUSH_PROVIDER=apns`, for example `--flavor stable`, `--dart-define-from-file=tool/dart_defines/stable.json`, and `--dart-define=PUSH_PROVIDER=apns`.

```text
flutter build ios --flavor canary --dart-define-from-file=tool/dart_defines/canary.json --dart-define=PUSH_PROVIDER=apns
```

## Desktop builds

We plan to provide desktop builds in the future but they will be labled as Fluxer Lite clients. These builds will not replace the Electron verison but be a seperate version you can download.
