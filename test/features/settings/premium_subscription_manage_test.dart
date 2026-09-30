import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:fluxer_app/features/settings/utils/premium_subscription_manage.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  const String appleUrl = 'https://apps.apple.com/account/subscriptions';
  const String playUrl =
      'https://play.google.com/store/account/subscriptions?sku=plutonium&package=com.fluxer';

  group('premiumManageAction', () {
    test('ios store page only manages an app store subscription', () {
      expect(
        premiumManageAction(
          surface: PremiumManageSurface.store,
          provider: PremiumSubscriptionProvider.googlePlay,
          manageUrl: playUrl,
          currentStore: PlutoniumBillingStore.appStore,
        ),
        isNull,
      );
      expect(
        premiumManageAction(
          surface: PremiumManageSurface.store,
          provider: PremiumSubscriptionProvider.stripe,
          manageUrl: null,
          currentStore: PlutoniumBillingStore.appStore,
        ),
        isNull,
      );
      expect(
        premiumManageAction(
          surface: PremiumManageSurface.store,
          provider: PremiumSubscriptionProvider.appStore,
          manageUrl: appleUrl,
          currentStore: PlutoniumBillingStore.appStore,
        )?.url,
        appleUrl,
      );
    });

    test('android store page only manages a play subscription', () {
      expect(
        premiumManageAction(
          surface: PremiumManageSurface.store,
          provider: PremiumSubscriptionProvider.appStore,
          manageUrl: appleUrl,
          currentStore: PlutoniumBillingStore.googlePlay,
        ),
        isNull,
      );
      expect(
        premiumManageAction(
          surface: PremiumManageSurface.store,
          provider: PremiumSubscriptionProvider.stripe,
          manageUrl: null,
          currentStore: PlutoniumBillingStore.googlePlay,
        ),
        isNull,
      );
      final PremiumManageAction? play = premiumManageAction(
        surface: PremiumManageSurface.store,
        provider: PremiumSubscriptionProvider.googlePlay,
        manageUrl: playUrl,
        currentStore: PlutoniumBillingStore.googlePlay,
      );
      expect(play?.kind, PremiumManageKind.storeUrl);
      expect(play?.url, playUrl);
    });

    test('billing settings open the portal or the store url', () {
      expect(
        premiumManageAction(
          surface: PremiumManageSurface.billing,
          provider: PremiumSubscriptionProvider.stripe,
          manageUrl: appleUrl,
        )?.kind,
        PremiumManageKind.customerPortal,
      );
      expect(
        premiumManageAction(
          surface: PremiumManageSurface.billing,
          provider: null,
          manageUrl: null,
        )?.kind,
        PremiumManageKind.customerPortal,
      );
      expect(
        premiumManageAction(
          surface: PremiumManageSurface.billing,
          provider: PremiumSubscriptionProvider.appStore,
          manageUrl: appleUrl,
        )?.url,
        appleUrl,
      );
      expect(
        premiumManageAction(
          surface: PremiumManageSurface.billing,
          provider: PremiumSubscriptionProvider.googlePlay,
          manageUrl: playUrl,
        )?.url,
        playUrl,
      );
    });
  });

  group('plutoniumStorePurchaseBlockedByOtherPlatform', () {
    test('hides the other store and stripe', () {
      expect(
        plutoniumStorePurchaseBlockedByOtherPlatform(
          reason: StorePurchaseBlockedReason.existingSubscription,
          blockingProvider: StoreBlockingProvider.googlePlay,
          currentStore: PlutoniumBillingStore.appStore,
        ),
        isTrue,
      );
      expect(
        plutoniumStorePurchaseBlockedByOtherPlatform(
          reason: StorePurchaseBlockedReason.existingSubscription,
          blockingProvider: StoreBlockingProvider.stripe,
          currentStore: PlutoniumBillingStore.googlePlay,
        ),
        isTrue,
      );
      expect(
        plutoniumStorePurchaseBlockedByOtherPlatform(
          reason: StorePurchaseBlockedReason.existingSubscription,
          blockingProvider: StoreBlockingProvider.appStore,
          currentStore: PlutoniumBillingStore.appStore,
        ),
        isFalse,
      );
    });
  });
}
