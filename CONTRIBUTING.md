# Contributing to Fluxer Mobile

Thanks for your interest in contributing. Please read this before opening a pull
request.

> [!CAUTION]
> Please contact us on the Fluxer Labs community if you would like to upstream a fix. We will grant you access to create PR's.

[Join Link](https://fluxer.gg/fluxer-labs)

## Scope during beta

During the current beta we only accept contributions for **bug fixes**, and a pull
request must be for a bug reported on [feedback.fluxer.com](https://feedback.fluxer.com). App translations are handled through
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

## Where things live

`lib/` is split up like this:

- **`lib/features/<feature>/`** — one part of the app (chat, guilds, settings, and so on). Widgets live in `presentation/` (pages, widgets, sheets, modals). Add `domain/`, `providers/`, `data/`, `services/`, or `utils/` only if that feature already has them.
- **`lib/core/`** — API, database, gateway, router, push, theme, and permissions.
- **`lib/shared/`** — helpers used by more than one feature.
- **`lib/features/ui/`** — shared widgets (buttons, inputs, sheets, modals, toasts). Check here before adding a new Material widget.
- **`lib/l10n/fluxer_en.arb`** — English strings. Other languages stay on Weblate (see [Translating](#translating)).

`dart_sdk/` and `fluxer/` are git submodules. Leave them alone in a pull
request to this repo.

## Writing UI and code

- Import widgets from `package:fluxer_app/material_ui.dart` (not `package:flutter/material.dart`). Use package imports (`package:fluxer_app/...`).
- Colors, text, spacing, and motion are on `BuildContext`: `context.colors`, `context.textStyles`, `context.layout`, and `context.motion`. `context.motion` is already reduced when reduced motion is on.
- Buttons, sheets, modals, and inputs live in `lib/features/ui/` (`FluxerButton` and the rest). Icons are Phosphor (`phosphor_flutter`).
- Strings go in `lib/l10n/fluxer_en.arb` and are read with `FluxerLocalizations.of(context)`.
- State uses Riverpod with `@riverpod`. Widgets that read providers are `ConsumerWidget` or `ConsumerStatefulWidget`. `*.g.dart` files are not committed (see [Build generated files](#build-generated-files)).
- Keep comments short (endless it's somthing conplex). Skip one when the code is already clear.

## Version numbers

Releases use `{year}.{month}.{public release number}`, for example `2026.07.100`.

- **Year** and **month** are when the release was published.
- **Public release number** is the release counter for that month. It resets at the start of each month.
- Counters start at **100**, then **200**, **300**, and so on (not 1, 2, 3) so they are not mistaken for a day of the month.

Beta builds use `{year}.{month}.{public release number}-beta.{n}`. The beta counter starts at 1 and resets when year, month, or the public release number changes.

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

**Android** uses two Gradle flavor dimensions: environment plus push (`fcm` or `unifiedpush`). The variant name combines both in camelCase (for example `stableFcm`, `betaUnifiedpush`). `PUSH_PROVIDER` must match the push dimension: `fcm` for Firebase Cloud Messaging or `unifiedpush` for UnifiedPush.

**Build profiles** pick which optional packages get linked:

- `dev` (also `ios-store`, `apns`): billing. This is what's committed to git.
- `oss`: nothing. UnifiedPush and F-Droid.
- `android-fcm`: FCM and billing. Google Play.

Firebase lives in `packages/fluxer_fcm`, and `in_app_purchase` lives in `packages/fluxer_billing`. `tool/configure_build.dart` adds or removes them in the `# BEGIN optional modules` block of `pubspec.yaml`, and writes the gitignored files that switch between the stub and real implementations.

After cloning:

```text
bash tool/install_hooks.sh
dart tool/configure_build.dart
flutter pub get
```

The pre-commit hook blocks commits that contain a non-dev `pubspec.yaml`, `pubspec.lock` or plugin registrant. CI runs the same check.

For everyday work on canary, use `tool/dev.sh` and pick a push provider:

```text
tool/dev.sh unifiedpush        # flutter run
tool/dev.sh fcm                # flutter run
tool/dev.sh apns               # flutter run
tool/dev.sh unifiedpush apk    # build an APK
tool/dev.sh apns ios           # build for iOS
```

Extra arguments go straight to Flutter. `tool/dev.sh fcm apk --release`. `run` switches your checkout to the right profile and switches it back to dev when you quit. `apk` builds in a copy under `build/flavors/<profile>/src`, so your checkout isn't touched.

For other environments, use `tool/build_flavor.sh <profile> <flutter args>` or `dart tool/configure_build.dart --profile=<profile>` directly. `--status` shows the current profile.

**iOS** uses schemes named after the environments (`canary`, `beta`, `stable`) and always builds with `PUSH_PROVIDER=apns`. It uses the `dev` profile, so it builds straight from the checkout:

```text
flutter build ios --flavor canary --dart-define-from-file=tool/dart_defines/canary.json --dart-define=PUSH_PROVIDER=apns
```

## Desktop builds

We plan to provide desktop builds in the future but they will be labeled as Fluxer Oxygen clients. These builds will not replace the Electron version but be a separate version you can download.

## Community app icon designs

We have been adding alternate app icon designs for users to use on their devices. We would like to open this up with a community-designed icon section.

### Design rules

1. The icon must include the Fluxer logo in some way so users can identify the app, but it doesn't have to match exactly (it just needs to be recognizable; be creative!).
2. Icons can't use any copyrighted work (for example, logos or IP from other companies).
3. No explicit imagery or suggestive content.
4. AI-generated icons are not allowed.

### How to submit

Post your design to [feedback.fluxer.com](https://feedback.fluxer.com) with the tag #mobile-icons.

The post must include

- A title for you would like the icon to be called in the app.
- How you would like to be credited Fluxer handle + discriminator (or social media handle/link).

If your design gets enough upvotes (not set requirement), we will review it and, if accepted, add it to the app.

If your design is accepted we will need a vector format of your design so it can be adapted to both platforms.

### Extra info

You can see how an icon should will appear on each platform with this [tool](https://deuss.dev/projects/mobile-icon-preview).

If you want to design a special Luqid Glass icon for iOS you can use Apples Icon Composer (only on macOS).
