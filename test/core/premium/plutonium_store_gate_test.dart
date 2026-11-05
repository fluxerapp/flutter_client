import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';
import 'package:fluxer_app/core/premium/app_store_distribution.dart';
import 'package:fluxer_app/core/premium/plutonium_store_gate.dart';

enum _Build { ios, iosMarketplace, androidFcm, androidOss }

enum _Instance { official, selfHosted, selfHostedWithoutCheckout }

class _Cell {
  const _Cell({
    required this.build,
    required this.instance,
    required this.inAppPurchase,
    required this.webCheckout,
  });

  final _Build build;
  final _Instance instance;
  final bool inAppPurchase;
  final bool webCheckout;
}

const List<_Cell> _matrix = <_Cell>[
  _Cell(
    build: _Build.ios,
    instance: _Instance.official,
    inAppPurchase: true,
    webCheckout: false,
  ),
  _Cell(
    build: _Build.ios,
    instance: _Instance.selfHosted,
    inAppPurchase: false,
    webCheckout: false,
  ),
  _Cell(
    build: _Build.ios,
    instance: _Instance.selfHostedWithoutCheckout,
    inAppPurchase: false,
    webCheckout: false,
  ),
  _Cell(
    build: _Build.iosMarketplace,
    instance: _Instance.official,
    inAppPurchase: false,
    webCheckout: true,
  ),
  _Cell(
    build: _Build.iosMarketplace,
    instance: _Instance.selfHosted,
    inAppPurchase: false,
    webCheckout: false,
  ),
  _Cell(
    build: _Build.iosMarketplace,
    instance: _Instance.selfHostedWithoutCheckout,
    inAppPurchase: false,
    webCheckout: false,
  ),
  _Cell(
    build: _Build.androidFcm,
    instance: _Instance.official,
    inAppPurchase: true,
    webCheckout: false,
  ),
  _Cell(
    build: _Build.androidFcm,
    instance: _Instance.selfHosted,
    inAppPurchase: false,
    webCheckout: false,
  ),
  _Cell(
    build: _Build.androidFcm,
    instance: _Instance.selfHostedWithoutCheckout,
    inAppPurchase: false,
    webCheckout: false,
  ),
  _Cell(
    build: _Build.androidOss,
    instance: _Instance.official,
    inAppPurchase: false,
    webCheckout: true,
  ),
  _Cell(
    build: _Build.androidOss,
    instance: _Instance.selfHosted,
    inAppPurchase: false,
    webCheckout: true,
  ),
  _Cell(
    build: _Build.androidOss,
    instance: _Instance.selfHostedWithoutCheckout,
    inAppPurchase: false,
    webCheckout: false,
  ),
];

PushProviderKind _pushProvider(_Build build) {
  return switch (build) {
    _Build.ios || _Build.iosMarketplace => PushProviderKind.apple,
    _Build.androidFcm => PushProviderKind.firebaseMessaging,
    _Build.androidOss => PushProviderKind.unifiedPush,
  };
}

void main() {
  group('resolvePremiumStorePage', () {
    test('stays off for OSS', () {
      expect(
        resolvePremiumStorePage(
          webCheckout: true,
          desktopOs: false,
          pushProvider: PushProviderKind.unifiedPush,
        ),
        isFalse,
      );
    });

    test('stays off on desktop', () {
      expect(
        resolvePremiumStorePage(
          webCheckout: false,
          desktopOs: true,
          pushProvider: PushProviderKind.firebaseMessaging,
        ),
        isFalse,
      );
    });

    test('stays off for UnifiedPush', () {
      expect(
        resolvePremiumStorePage(
          webCheckout: false,
          desktopOs: false,
          pushProvider: PushProviderKind.unifiedPush,
        ),
        isFalse,
      );
    });

    test('turns on for FCM mobile', () {
      expect(
        resolvePremiumStorePage(
          webCheckout: false,
          desktopOs: false,
          pushProvider: PushProviderKind.firebaseMessaging,
        ),
        isTrue,
      );
    });

    test('turns on for APNS mobile', () {
      expect(
        resolvePremiumStorePage(
          webCheckout: false,
          desktopOs: false,
          pushProvider: PushProviderKind.apple,
        ),
        isTrue,
      );
    });
  });

  group('iOS App Store distribution', () {
    bool resolve({
      required AppStoreDistribution distribution,
      required bool officialInstance,
      required bool stableBuild,
      required bool developerPurchases,
    }) {
      return resolvePremiumStorePurchasesEnabled(
        isAndroid: false,
        isIOS: true,
        pushProvider: PushProviderKind.apple,
        webCheckout: false,
        officialInstance: officialInstance,
        appStoreDistribution: distribution,
        stableBuild: stableBuild,
        developerPurchases: developerPurchases,
      );
    }

    for (final AppStoreDistribution distribution
        in AppStoreDistribution.values) {
      final bool storeInstall =
          distribution != AppStoreDistribution.development;

      test('${distribution.name} stable build on official', () {
        expect(
          resolve(
            distribution: distribution,
            officialInstance: true,
            stableBuild: true,
            developerPurchases: false,
          ),
          storeInstall,
        );
      });

      test('${distribution.name} beta or canary build on official', () {
        expect(
          resolve(
            distribution: distribution,
            officialInstance: true,
            stableBuild: false,
            developerPurchases: false,
          ),
          isFalse,
        );
        expect(
          resolve(
            distribution: distribution,
            officialInstance: true,
            stableBuild: false,
            developerPurchases: true,
          ),
          isTrue,
        );
      });

      test('${distribution.name} on self-hosted with every flag', () {
        for (final bool stableBuild in <bool>[false, true]) {
          for (final bool developerPurchases in <bool>[false, true]) {
            expect(
              resolve(
                distribution: distribution,
                officialInstance: false,
                stableBuild: stableBuild,
                developerPurchases: developerPurchases,
              ),
              isFalse,
            );
          }
        }
      });
    }

    test('Android ignores the App Store distribution', () {
      for (final AppStoreDistribution distribution
          in AppStoreDistribution.values) {
        expect(
          resolvePremiumStorePurchasesEnabled(
            isAndroid: true,
            isIOS: false,
            pushProvider: PushProviderKind.firebaseMessaging,
            webCheckout: false,
            officialInstance: true,
            appStoreDistribution: distribution,
            stableBuild: false,
            developerPurchases: false,
          ),
          isTrue,
        );
      }
    });
  });

  group('purchase matrix', () {
    for (final _Cell cell in _matrix) {
      test('${cell.build.name} on ${cell.instance.name}', () {
        final PushProviderKind pushProvider = _pushProvider(cell.build);
        final bool webCheckout = AppBuildConfig.resolveWebCheckout(
          pushProvider: pushProvider,
          distribution: cell.build == _Build.iosMarketplace
              ? 'ios_marketplace'
              : null,
        );
        final bool official = cell.instance == _Instance.official;
        final bool ios =
            cell.build == _Build.ios || cell.build == _Build.iosMarketplace;
        final bool inAppPurchase = resolvePremiumStorePurchasesEnabled(
          isAndroid: !ios,
          isIOS: ios,
          pushProvider: pushProvider,
          webCheckout: webCheckout,
          officialInstance: official,
          appStoreDistribution: AppStoreDistribution.production,
          stableBuild: true,
          developerPurchases: false,
        );
        final bool commerceVisible = resolvePremiumCommerceVisible(
          selfHosted: !official,
          webCheckout: webCheckout,
          selfHostedCheckoutAvailable: cell.instance == _Instance.selfHosted,
          distributionBuild: cell.build == _Build.iosMarketplace,
        );
        final bool billingNav = resolvePremiumBillingNavVisible(
          commerceVisible: commerceVisible,
          webCheckout: webCheckout,
          storePage: resolvePremiumStorePage(
            webCheckout: webCheckout,
            desktopOs: false,
            pushProvider: pushProvider,
          ),
          officialInstance: official,
        );

        expect(inAppPurchase, cell.inAppPurchase);
        expect(billingNav && webCheckout, cell.webCheckout);
        expect(commerceVisible, cell.inAppPurchase || cell.webCheckout);
        expect(billingNav, cell.inAppPurchase || cell.webCheckout);
      });
    }

    test('in-app purchase stays off on desktop platforms', () {
      for (final PushProviderKind pushProvider in PushProviderKind.values) {
        expect(
          resolvePremiumStorePurchasesEnabled(
            isAndroid: false,
            isIOS: false,
            pushProvider: pushProvider,
            webCheckout: false,
            officialInstance: true,
            appStoreDistribution: AppStoreDistribution.production,
            stableBuild: true,
            developerPurchases: true,
          ),
          isFalse,
        );
      }
    });

    test('a self-hosted instance that claims official commerce still has no '
        'store billing nav', () {
      expect(
        resolvePremiumBillingNavVisible(
          commerceVisible: true,
          webCheckout: false,
          storePage: true,
          officialInstance: false,
        ),
        isFalse,
      );
    });
  });
}
