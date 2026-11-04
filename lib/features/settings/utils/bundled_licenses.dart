import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

typedef BundledLicense = ({List<String> packages, String asset});

List<BundledLicense> bundledLicenses(TargetPlatform platform) {
  final bool apple =
      platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;
  final bool ios = platform == TargetPlatform.iOS;
  return <BundledLicense>[
    (packages: <String>['IBM Plex'], asset: 'assets/licenses/ibm-plex.txt'),
    (packages: <String>['Twemoji'], asset: 'assets/licenses/twemoji.txt'),
    (
      packages: <String>['Hero Patterns'],
      asset: 'assets/licenses/hero-patterns.txt',
    ),
    (packages: <String>['oneko.js'], asset: 'assets/licenses/oneko.txt'),
    (
      packages: <String>['serde', 'serde_json', 'itoa', 'memchr', 'zmij'],
      asset: 'assets/licenses/serde.txt',
    ),
    (packages: <String>['WebRTC'], asset: 'assets/licenses/webrtc.txt'),
    if (apple) ...<BundledLicense>[
      (packages: <String>['libmpv'], asset: 'assets/licenses/libmpv.txt'),
      (
        packages: <String>['Swift Collections'],
        asset: 'assets/licenses/swift-collections.txt',
      ),
    ],
    if (ios) ...<BundledLicense>[
      (
        packages: <String>['CryptoSwift'],
        asset: 'assets/licenses/cryptoswift.txt',
      ),
      (packages: <String>['KSCrash'], asset: 'assets/licenses/kscrash.txt'),
      (packages: <String>['Measure'], asset: 'assets/licenses/measure.txt'),
      (
        packages: <String>['super_native_extensions Rust crates'],
        asset: 'assets/licenses/super-native-extensions.txt',
      ),
      (
        packages: <String>['Jitsi broadcast extension'],
        asset: 'assets/licenses/jitsi-broadcast-extension.txt',
      ),
    ],
  ];
}

void registerBundledLicenses() {
  LicenseRegistry.addLicense(() async* {
    for (final BundledLicense license in bundledLicenses(
      defaultTargetPlatform,
    )) {
      yield LicenseEntryWithLineBreaks(
        license.packages,
        await rootBundle.loadString(license.asset),
      );
    }
  });
}
