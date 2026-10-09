import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/utils/plutonium_store_bar_mode.dart';
import 'package:fluxer_app/features/settings/utils/premium_subscription_status.dart';

PremiumSubscriptionStatus _status({
  bool isPremium = false,
  bool isVisionary = false,
  bool isGiftSubscription = false,
  bool shouldShowPremiumCard = false,
  bool inGrace = false,
  bool expired = false,
  bool showExpired = false,
  String? billingCycle = 'monthly',
}) {
  return PremiumSubscriptionStatus(
    isPremium: isPremium,
    isVisionary: isVisionary,
    hasEverPurchased: shouldShowPremiumCard,
    premiumWillCancel: false,
    billingCycle: billingCycle,
    actualPremiumUntil: null,
    isGiftSubscription: isGiftSubscription,
    gracePeriodInfo: PremiumGracePeriodInfo(
      isInGracePeriod: inGrace,
      isExpired: expired,
      showExpiredState: showExpired,
    ),
    shouldShowPremiumCard: shouldShowPremiumCard,
    shouldUseCancelQuickAction: false,
    shouldUseReactivateQuickAction: false,
  );
}

void main() {
  group('premiumStoreBarMode', () {
    test('asks to subscribe when there is no plan', () {
      expect(
        premiumStoreBarMode(status: _status(), purchasePending: false),
        PremiumStoreBarMode.subscribe,
      );
    });

    test('offers manage for an active subscription', () {
      expect(
        premiumStoreBarMode(
          status: _status(isPremium: true, shouldShowPremiumCard: true),
          purchasePending: false,
        ),
        PremiumStoreBarMode.manage,
      );
    });

    test(
      'keeps manage when a purchase is pending on an already premium account',
      () {
        expect(
          premiumStoreBarMode(
            status: _status(isPremium: true, shouldShowPremiumCard: true),
            purchasePending: true,
          ),
          PremiumStoreBarMode.manage,
        );
      },
    );

    test('shows visionary without a buy bar', () {
      expect(
        premiumStoreBarMode(
          status: _status(
            isPremium: true,
            isVisionary: true,
            shouldShowPremiumCard: true,
            billingCycle: null,
          ),
          purchasePending: true,
        ),
        PremiumStoreBarMode.visionary,
      );
    });

    test('offers the gift buy bar while a gift is active', () {
      expect(
        premiumStoreBarMode(
          status: _status(
            isPremium: true,
            isGiftSubscription: true,
            shouldShowPremiumCard: true,
            billingCycle: null,
          ),
          purchasePending: false,
        ),
        PremiumStoreBarMode.gift,
      );
    });

    test('keeps manage during grace when this device can manage it', () {
      expect(
        premiumStoreBarMode(
          status: _status(shouldShowPremiumCard: true, inGrace: true),
          purchasePending: false,
          manageOnDevice: true,
        ),
        PremiumStoreBarMode.manage,
      );
    });

    test('returns the buy bar during grace', () {
      expect(
        premiumStoreBarMode(
          status: _status(shouldShowPremiumCard: true, inGrace: true),
          purchasePending: false,
        ),
        PremiumStoreBarMode.subscribe,
      );
    });

    test('returns the buy bar after expiry', () {
      expect(
        premiumStoreBarMode(
          status: _status(
            shouldShowPremiumCard: true,
            expired: true,
            showExpired: true,
          ),
          purchasePending: false,
        ),
        PremiumStoreBarMode.subscribe,
      );
    });

    test('waits when Play finished and the account is not premium yet', () {
      expect(
        premiumStoreBarMode(status: _status(), purchasePending: true),
        PremiumStoreBarMode.waiting,
      );
    });
  });
}
