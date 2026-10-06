> [!CAUTION]
> The Fluxer Flutter mobile client is still in beta so features will be missing or broken. There is currently no set release date for the app, but you can join our public beta!.
>
> Bug reports and feature requests have moved to [feedback.fluxer.com](https://feedback.fluxer.com). Sign in with your Fluxer account to post, vote and follow updates. Check the [known issues in the mobile beta](https://feedback.fluxer.com/p/1830) first.

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

This is the repo for the official Fluxer mobile / tablet app powered by Flutter (desktop is in the works also but mobile is the main focus currently).

You can follow what is planned in the [Fluxer roadmap](https://fluxer.app/blog/roadmap-2026).

# Community

For updates, support, and discussion, there is an Fluxer Labs community for all users to be able to join and give feedback.

Join here: [Join Link](https://fluxer.gg/fluxer-labs)

## Download

**Apple App Store**: Coming when V1 is finished (join the TestFlight for now).

**Google Play Store**: Join the [Early access link](https://play.google.com/store/apps/details?id=com.fluxer)

**Accrescent**: This is something we are interested in doing after V1 and they allow app submissions again.

**F-Droid**: Coming when V1 is finished.

**iOS TestFlight**: Join with the [TestFlight link](https://testflight.apple.com/join/PKZR6pK9).

**Obtainium**: This is currently the best way to install and keep the Android betas installed and updated. [Find out more here](#auto-updates-with-obtainium).

### Android (APK)

Download the latest **beta** build from [GitHub releases](https://github.com/fluxerapp/flutter_client/releases).

**Most phones (Samsung, Pixel, etc.):** install the **FCM** APK. Look for `betafcm` in the name, e.g. `app-arm64-v8a-betafcm-release.apk`. Not sure which file? Pick the one with `arm64-v8a`, or the universal `app-betafcm-release.apk`.

**Degoogled phones (GrapheneOS, no Google apps):** install the **OSS** APK (`betaoss`) and set up [UnifiedPush](https://unifiedpush.org) (e.g. ntfy).

#### Auto-updates with Obtainium

**Easiest install:** use [Obtainium](https://obtainium.imranr.dev/) to install and auto-update from GitHub. Beta releases are marked **pre-release** on GitHub, so the link must enable that option — the simple `obtainium://add/...` URL cannot do this.

Use **one** of these one-click links (FCM for most phones, OSS for degoogled). Each enables pre-releases, filters to the correct APK (`betafcm` or `betaoss`), and picks the right CPU architecture automatically:

- **Fluxer Beta (FCM):** [Add to Obtainium](https://apps.obtainium.page/redirect?r=obtainium%3A%2F%2Fapp%2F%7B%22id%22%3A%22com.fluxer%22%2C%22url%22%3A%22https%3A%2F%2Fgithub.com%2Ffluxerapp%2Fflutter_client%22%2C%22author%22%3A%22fluxerapp%22%2C%22name%22%3A%22Fluxer%20Beta%20%28FCM%29%22%2C%22additionalSettings%22%3A%22%7B%5C%22includePrereleases%5C%22%3Atrue%2C%5C%22fallbackToOlderReleases%5C%22%3Atrue%2C%5C%22apkFilterRegEx%5C%22%3A%5C%22betafcm%5C%22%2C%5C%22autoApkFilterByArch%5C%22%3Atrue%7D%22%7D)
- **Fluxer Beta (OSS):** [Add to Obtainium](https://apps.obtainium.page/redirect?r=obtainium%3A%2F%2Fapp%2F%7B%22id%22%3A%22com.fluxer%22%2C%22url%22%3A%22https%3A%2F%2Fgithub.com%2Ffluxerapp%2Fflutter_client%22%2C%22author%22%3A%22fluxerapp%22%2C%22name%22%3A%22Fluxer%20Beta%20%28OSS%29%22%2C%22additionalSettings%22%3A%22%7B%5C%22includePrereleases%5C%22%3Atrue%2C%5C%22fallbackToOlderReleases%5C%22%3Atrue%2C%5C%22apkFilterRegEx%5C%22%3A%5C%22betaoss%5C%22%2C%5C%22autoApkFilterByArch%5C%22%3Atrue%7D%22%7D)

#### Signing

Stable, beta, and canary Android release builds on GitHub are signed with this SHA-256 certificate fingerprint:
`91:E4:98:E1:B8:A6:C8:BA:99:41:5E:DB:29:78:29:6B:6C:58:BA:A5:E2:D2:A6:49:CE:C6:2D:A7:A8:29:C7:BC`

## Bug reporting

Report bugs and request features at [feedback.fluxer.com](https://feedback.fluxer.com). Sign in with your Fluxer account. GitHub Issues are closed.

## Self-hosted instances

The mobile app supports self-hosted instances now! Push notifications are currently only supported for users using the Android OSS build.

For iOS and Android FCM build we will need to set up a relay service for self-hosted instances to use. This is something we mostly have finished (on the backend side), and will allow notifications on both platforms with zero knowledge of message content being passed through the relay.

SSO (Single Sign-On) login is supported on the mobile client. For it to fully work you need to register this redirect URI with your OIDC provider:

`fluxer://auth/sso/callback`

## Contributing

See [`CONTRIBUTING.md`](./CONTRIBUTING.md) for developer setup, builds, translations, and pull request guidelines.

## License

Fluxer Mobile is licensed under the [GNU Affero General Public License v3](./LICENSE) (AGPLv3), together with an [App Store additional permission](./LICENSE-APPSTORE-EXCEPTION) under section 7 of the AGPLv3 that allows the app to be distributed through application stores (such as the Apple App Store and Google Play) without changing the project's public AGPLv3 licensing.
