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
    perksDisabled: false,
    isVisionary: isVisionary,
    hasEverPurchased: shouldShowPremiumCard,
    premiumWillCancel: false,
    billingCycle: billingCycle,
    actualPremiumUntil: null,
    isGiftSubscription: isGiftSubscription,
    gracePeriodInfo: PremiumGracePeriodInfo(
      isInGracePeriod: inGrace,
      isExpired: expired,
      graceEndDate: null,
      showExpiredState: showExpired,
    ),
    shouldShowPremiumCard: shouldShowPremiumCard,
    shouldUseCancelQuickAction: false,
    shouldUseReactivateQuickAction: false,
    shouldUseChangePlanQuickAction: false,
  );
}

void main() {
  group('plutoniumStoreBarMode', () {
    test('asks to subscribe when there is no plan', () {
      expect(
        plutoniumStoreBarMode(status: _status(), purchasePending: false),
        PlutoniumStoreBarMode.subscribe,
      );
    });

    test('offers manage for an active subscription', () {
      expect(
        plutoniumStoreBarMode(
          status: _status(isPremium: true, shouldShowPremiumCard: true),
          purchasePending: false,
        ),
        PlutoniumStoreBarMode.manage,
      );
    });

    test(
      'keeps manage when a purchase is pending on an already premium account',
      () {
        expect(
          plutoniumStoreBarMode(
            status: _status(isPremium: true, shouldShowPremiumCard: true),
            purchasePending: true,
          ),
          PlutoniumStoreBarMode.manage,
        );
      },
    );

    test('shows visionary without a buy bar', () {
      expect(
        plutoniumStoreBarMode(
          status: _status(
            isPremium: true,
            isVisionary: true,
            shouldShowPremiumCard: true,
            billingCycle: null,
          ),
          purchasePending: true,
        ),
        PlutoniumStoreBarMode.visionary,
      );
    });

    test('blocks recurring purchase while a gift is active', () {
      expect(
        plutoniumStoreBarMode(
          status: _status(
            isPremium: true,
            isGiftSubscription: true,
            shouldShowPremiumCard: true,
            billingCycle: null,
          ),
          purchasePending: false,
        ),
        PlutoniumStoreBarMode.gift,
      );
    });

    test('keeps manage during grace when this device can manage it', () {
      expect(
        plutoniumStoreBarMode(
          status: _status(shouldShowPremiumCard: true, inGrace: true),
          purchasePending: false,
          manageOnDevice: true,
        ),
        PlutoniumStoreBarMode.manage,
      );
    });

    test('returns the buy bar during grace', () {
      expect(
        plutoniumStoreBarMode(
          status: _status(shouldShowPremiumCard: true, inGrace: true),
          purchasePending: false,
        ),
        PlutoniumStoreBarMode.subscribe,
      );
    });

    test('returns the buy bar after expiry', () {
      expect(
        plutoniumStoreBarMode(
          status: _status(
            shouldShowPremiumCard: true,
            expired: true,
            showExpired: true,
          ),
          purchasePending: false,
        ),
        PlutoniumStoreBarMode.subscribe,
      );
    });

    test('waits when Play finished and the account is not premium yet', () {
      expect(
        plutoniumStoreBarMode(status: _status(), purchasePending: true),
        PlutoniumStoreBarMode.waiting,
      );
    });
  });
}
