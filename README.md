> [!CAUTION]
> The Fluxer Flutter mobile client is still in beta so features will be missing or broken. Currently the only way to report issues is on the Fluxer Mobile community (Plutonium members only), this will change in the future.
>
> Note there is currently no set release date for the app.

<p align="center">
  <img src="./docs/media/logo-graphic.png" alt="Fluxer graphic logo" width="400">
</p>

<p align="center">
  <a href="https://fluxer.app/donate">
    <img src="https://img.shields.io/badge/Donate-fluxer.app%2Fdonate-brightgreen" alt="Donate" /></a>
  <a href="https://docs.fluxer.app">
    <img src="https://img.shields.io/badge/Docs-docs.fluxer.app-blue" alt="Documentation" /></a>
  <a href="./LICENSE">
    <img src="https://img.shields.io/badge/License-AGPLv3-purple" alt="AGPLv3 License" /></a>
  <a href="https://github.com/fluxerapp/flutter_client/actions/workflows/dart-analyze.yml">
    <img src="https://github.com/fluxerapp/flutter_client/actions/workflows/dart-analyze.yml/badge.svg" alt="Dart analyze" /></a>
  <a href="https://weblate.fluxer.tools/engage/flutter-client/"><img src="https://weblate.fluxer.tools/widget/flutter-client/svg-badge.svg" alt="Translation status"></a>
</p>

# Fluxer Flutter Client

This is the repo for the official Fluxer mobile app powered by Flutter (desktop is in the works also but mobile is the main focus currently).

You can follow more about the V1 development and what features are planned/implemented in this [Roadmap issue](https://github.com/fluxerapp/flutter_client/issues/184).

# Community

> [!NOTE]
> Currently the community is locked to Fluxer Plutonium members only. This limit will be lifted after the beta period (the link below will not work yet).

For updates, support, and discussion, [join the Fluxer Mobile community on Fluxer](https://fluxer.gg/fluxer-mobile).

## Download

**Apple App Store**: Coming when V1 is finished.

**Google Play Store**: Coming when V1 is finished.

**F-Droid**: Coming when V1 is finished.

**iOS Testflight**: Coming soon :eyes:

### Android (APK)

> [!NOTE]
> Unless you are using a degoogled operating system, you should use the FCM client. If you don't know if your OS is degoogled, it likely is not.

**Quick pick (most users):** download the **beta FCM** APK from [GitHub releases](https://github.com/fluxerapp/flutter_client/releases) — e.g. `app-arm64-v8a-betafcm-release.apk` on a phone from the last few years.

#### 1. Pick a push variant

| If your phone… | Install | Notifications use… |
|---|---|---|
| Has Google Play Services (typical Samsung/Pixel/etc.) | **FCM** build | Google Firebase Cloud Messaging |
| Is degoogled / has no Google apps | **OSS** build | [UnifiedPush](https://unifiedpush.org) (you must install a distributor app such as ntfy) |

Majority of users will use the **FCM** version.

You cannot switch push variants in-app: FCM and OSS are separate APKs for the same release channel and will replace each other if installed.

#### 2. Pick a release channel

- **Beta** — recommended during the beta period; pre-release builds for testing.
- **Stable** — production builds; will appear on GitHub releases when V1 launches (same timing as Play Store / F-Droid entries above).

#### Version numbers

Releases use `{year}.{month}.{public release number}`, for example `2026.07.100`.

- **Year** and **month** are when the release was published.
- **Public release number** is the release counter for that month. It resets at the start of each month.
- Counters start at **100**, then **200**, **300**, and so on (not 1, 2, 3) so they are not mistaken for a day of the month.

#### 3. Pick the APK file on GitHub

On a release page, assets follow this naming pattern:

- Per-CPU (smaller, preferred): `app-<abi>-<channel><variant>-release.apk`
- Universal (works on all CPUs, larger): `app-<channel><variant>-release.apk`

Where:

- `<channel>` is `beta` (or `stable` when available)
- `<variant>` is `fcm` or `oss`
- `<abi>` is usually `arm64-v8a` for modern phones; use the universal APK if unsure

**Examples for most users:**

- `app-arm64-v8a-betafcm-release.apk`
- `app-betafcm-release.apk` (universal fallback)

**OSS example (degoogled phones):**

- `app-arm64-v8a-betaoss-release.apk`

#### Auto-updates with Obtainium

[Obtainium](https://obtainium.imranr.dev/) can install and auto-update from GitHub. Beta releases are marked **pre-release** on GitHub, so the link must enable that option — the simple `obtainium://add/...` URL cannot do this.

Use **one** of these one-click links (matching your push variant from step 1). Each enables pre-releases, filters to the correct APK (`betafcm` or `betaoss`), and picks the right CPU architecture automatically:

- **Fluxer Beta (FCM):** [Add to Obtainium](https://apps.obtainium.page/redirect?r=obtainium%3A%2F%2Fapp%2F%7B%22id%22%3A%22com.fluxer%22%2C%22url%22%3A%22https%3A%2F%2Fgithub.com%2Ffluxerapp%2Fflutter_client%22%2C%22author%22%3A%22fluxerapp%22%2C%22name%22%3A%22Fluxer%20Beta%20%28FCM%29%22%2C%22additionalSettings%22%3A%22%7B%5C%22includePrereleases%5C%22%3Atrue%2C%5C%22fallbackToOlderReleases%5C%22%3Atrue%2C%5C%22apkFilterRegEx%5C%22%3A%5C%22betafcm%5C%22%2C%5C%22autoApkFilterByArch%5C%22%3Atrue%7D%22%7D)
- **Fluxer Beta (OSS):** [Add to Obtainium](https://apps.obtainium.page/redirect?r=obtainium%3A%2F%2Fapp%2F%7B%22id%22%3A%22com.fluxer%22%2C%22url%22%3A%22https%3A%2F%2Fgithub.com%2Ffluxerapp%2Fflutter_client%22%2C%22author%22%3A%22fluxerapp%22%2C%22name%22%3A%22Fluxer%20Beta%20%28OSS%29%22%2C%22additionalSettings%22%3A%22%7B%5C%22includePrereleases%5C%22%3Atrue%2C%5C%22fallbackToOlderReleases%5C%22%3Atrue%2C%5C%22apkFilterRegEx%5C%22%3A%5C%22betaoss%5C%22%2C%5C%22autoApkFilterByArch%5C%22%3Atrue%7D%22%7D)

#### Signing

Stable, beta, and canary Android release builds on GitHub are signed with this SHA-256 certificate fingerprint:
`91:E4:98:E1:B8:A6:C8:BA:99:41:5E:DB:29:78:29:6B:6C:58:BA:A5:E2:D2:A6:49:CE:C6:2D:A7:A8:29:C7:BC`

## Bug reporting

> [!WARNING]
> During the beta period the only place to report bugs will be in the Fluxer Mobile community (they are mirrored to Github still). Once the beta period finishes you will be able to report issues on Github and the community.

# Self hosted instances

The mobile app supports self hosted instances now! Push notifications are currently only supported for users using the Android OSS build.

For iOS and Android FCM build we will need to setup a relay service for self hosted instances to use. This is something that will be worked on in the future.

SSO (Single Sign-On) login is supported for self-hosted instances that have configured an OIDC/OAuth2 provider. When connecting to an instance with SSO enabled, the app will display the appropriate login options based on the server's configuration. If SSO is enforced, only the SSO login flow will be available. If SSO is optional, both SSO and email/password login can be used.

For mobile SSO, register this redirect URI with your OIDC provider:

`fluxer://auth/sso/callback`

## Contributing

During the current beta, we are only accepting contributions for bug fixes. To submit a PR, it must be for a linked reported issue.

After the beta period, we will be updating these guidelines.

Pull requests should target the `canary` branch. For local testing, use the `canary` build flavor so your build matches that branch (see Mobile builds below).

### Contribution licensing and sign-off

By contributing you agree your contribution is licensed under the AGPLv3 together with the App Store additional permission (see [`LICENSE-APPSTORE-EXCEPTION`](./LICENSE-APPSTORE-EXCEPTION)), and you sign off each commit under the [Developer Certificate of Origin](./DCO) with `git commit -s`. There is no signed CLA. See [`CONTRIBUTING.md`](./CONTRIBUTING.md) for details; this is checked automatically on every pull request.

### Translating

App translations are welcome at any time.

Strings are managed on [Weblate](https://weblate.fluxer.tools/projects/flutter-client/). You can translate in the browser — no repository checkout or pull request is needed. English is the source language.

### Tech stack

- **Flutter / Dart** — cross platform UI (mobile today, desktop in progress)
- **Riverpod** — state management (with code generation)
- **go_router** — navigation and deep links
- **Drift** — local SQLite database
- **Dio** — HTTP client
- **[fluxer_dart](https://github.com/fluxerapp/dart_sdk)** — Fluxer API client (OpenAPI generated)
- **WebSockets** — real time gateway events
- **LiveKit / WebRTC** — voice and video calls
- **FCM / UnifiedPush / APNs** — push notifications (platform dependent)

### Build generated files

Riverpod generated files are not committed, so you need to generate them before running the project.

```text
dart run build_runner build
```

### Mobile builds

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

### Desktop builds

Coming soon!

### API

The Flutter client uses the [dart_sdk](https://github.com/fluxerapp/dart_sdk) to send requests to the Fluxer API which is generated from the OpenApi spec.

## License

Fluxer Mobile is licensed under the [GNU Affero General Public License v3](./LICENSE) (AGPLv3), together with an [App Store additional permission](./LICENSE-APPSTORE-EXCEPTION) under section 7 of the AGPLv3 that allows the app to be distributed through application stores (such as the Apple App Store and Google Play) without changing the project's public AGPLv3 licensing.
