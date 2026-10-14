import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';
import 'package:fluxer_app/core/premium/app_store_distribution.dart';
import 'package:fluxer_app/core/premium/plutonium_store_gate.dart';

enum _Build { ios, androidFcm, androidOss }

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
    _Build.ios => PushProviderKind.apple,
    _Build.androidFcm => PushProviderKind.firebaseMessaging,
    _Build.androidOss => PushProviderKind.unifiedPush,
  };
}

void main() {
  group('resolvePremiumStorePage', () {
    test('stays off for OSS', () {
      expect(
        resolvePremiumStorePage(
          ossWebCheckout: true,
          desktopOs: false,
          pushProvider: PushProviderKind.unifiedPush,
        ),
        isFalse,
      );
    });

    test('stays off on desktop', () {
      expect(
        resolvePremiumStorePage(
          ossWebCheckout: false,
          desktopOs: true,
          pushProvider: PushProviderKind.firebaseMessaging,
        ),
        isFalse,
      );
    });

    test('stays off for UnifiedPush', () {
      expect(
        resolvePremiumStorePage(
          ossWebCheckout: false,
          desktopOs: false,
          pushProvider: PushProviderKind.unifiedPush,
        ),
        isFalse,
      );
    });

    test('turns on for FCM mobile', () {
      expect(
        resolvePremiumStorePage(
          ossWebCheckout: false,
          desktopOs: false,
          pushProvider: PushProviderKind.firebaseMessaging,
        ),
        isTrue,
      );
    });

    test('turns on for APNS mobile', () {
      expect(
        resolvePremiumStorePage(
          ossWebCheckout: false,
          desktopOs: false,
          pushProvider: PushProviderKind.apple,
        ),
        isTrue,
      );
    });
  });

  group('iOS App Store distribution', () {
    const Map<AppStoreDistribution, bool> official =
        <AppStoreDistribution, bool>{
          AppStoreDistribution.production: true,
          AppStoreDistribution.testflight: false,
          AppStoreDistribution.development: false,
          AppStoreDistribution.unknown: false,
        };
    const Map<AppStoreDistribution, bool> officialWithSandboxToggle =
        <AppStoreDistribution, bool>{
          AppStoreDistribution.production: true,
          AppStoreDistribution.testflight: true,
          AppStoreDistribution.development: false,
          AppStoreDistribution.unknown: false,
        };

    bool resolve({
      required AppStoreDistribution distribution,
      required bool officialInstance,
      required bool sandboxPurchases,
    }) {
      return resolvePremiumStorePurchasesEnabled(
        isAndroid: false,
        isIOS: true,
        pushProvider: PushProviderKind.apple,
        officialInstance: officialInstance,
        appStoreDistribution: distribution,
        sandboxPurchases: sandboxPurchases,
      );
    }

    for (final AppStoreDistribution distribution
        in AppStoreDistribution.values) {
      test('${distribution.name} on official', () {
        expect(
          resolve(
            distribution: distribution,
            officialInstance: true,
            sandboxPurchases: false,
          ),
          official[distribution],
        );
      });

      test('${distribution.name} on official with the sandbox toggle', () {
        expect(
          resolve(
            distribution: distribution,
            officialInstance: true,
            sandboxPurchases: true,
          ),
          officialWithSandboxToggle[distribution],
        );
      });

      for (final bool sandboxPurchases in <bool>[false, true]) {
        test(
          '${distribution.name} on self-hosted, toggle $sandboxPurchases',
          () {
            expect(
              resolve(
                distribution: distribution,
                officialInstance: false,
                sandboxPurchases: sandboxPurchases,
              ),
              isFalse,
            );
          },
        );
      }
    }

    test('Android ignores the App Store distribution', () {
      for (final AppStoreDistribution distribution
          in AppStoreDistribution.values) {
        expect(
          resolvePremiumStorePurchasesEnabled(
            isAndroid: true,
            isIOS: false,
            pushProvider: PushProviderKind.firebaseMessaging,
            officialInstance: true,
            appStoreDistribution: distribution,
            sandboxPurchases: false,
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
        final bool ossWebCheckout =
            pushProvider == PushProviderKind.unifiedPush;
        final bool official = cell.instance == _Instance.official;
        final bool inAppPurchase = resolvePremiumStorePurchasesEnabled(
          isAndroid: cell.build != _Build.ios,
          isIOS: cell.build == _Build.ios,
          pushProvider: pushProvider,
          officialInstance: official,
          appStoreDistribution: AppStoreDistribution.production,
          sandboxPurchases: false,
        );
        final bool commerceVisible = resolvePremiumCommerceVisible(
          selfHosted: !official,
          ossWebCheckout: ossWebCheckout,
          selfHostedCheckoutAvailable: cell.instance == _Instance.selfHosted,
        );
        final bool billingNav = resolvePremiumBillingNavVisible(
          commerceVisible: commerceVisible,
          ossWebCheckout: ossWebCheckout,
          storePage: resolvePremiumStorePage(
            ossWebCheckout: ossWebCheckout,
            desktopOs: false,
            pushProvider: pushProvider,
          ),
          officialInstance: official,
        );

        expect(inAppPurchase, cell.inAppPurchase);
        expect(billingNav && ossWebCheckout, cell.webCheckout);
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
            officialInstance: true,
            appStoreDistribution: AppStoreDistribution.production,
            sandboxPurchases: true,
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
          ossWebCheckout: false,
          storePage: true,
          officialInstance: false,
        ),
        isFalse,
      );
    });
  });
}
