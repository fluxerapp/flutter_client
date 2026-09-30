import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/premium/premium_state_response_json.dart';
import 'package:fluxer_app/features/settings/utils/premium_subscription_status.dart';
import 'package:fluxer_dart/export.dart';

UserPrivateResponse _user({
  bool premiumWillCancel = false,
  String? premiumBillingCycle = 'monthly',
  String? premiumUntil = '2030-01-15T00:00:00.000Z',
}) {
  return UserPrivateResponse(
    hasVerifiedPhone: false,
    username: 'user',
    discriminator: '0001',
    globalName: null,
    avatar: null,
    avatarColor: null,
    privacyAgreedAt: null,
    termsAgreedAt: null,
    pendingBulkMessageDeletion: null,
    flags: 0,
    unreadGiftInventoryCount: 0,
    isStaff: false,
    acls: const [],
    traits: const ['premium'],
    email: null,
    hasUnreadGiftInventory: false,
    hasEverPurchased: true,
    id: '1',
    bio: null,
    pronouns: null,
    accentColor: null,
    banner: null,
    hasDismissedPremiumOnboarding: false,
    bannerColor: null,
    mfaEnabled: false,
    nsfwAllowed: true,
    verified: true,
    premiumType: UserPremiumTypes.subscription,
    premiumSince: '2025-01-01T00:00:00.000Z',
    premiumUntil: premiumUntil,
    premiumWillCancel: premiumWillCancel,
    premiumBillingCycle: premiumBillingCycle,
    premiumLifetimeSequence: null,
    premiumGraceEndsAt: null,
    premiumDiscriminator: false,
    requiredActions: const [],
    premiumBadgeMasked: false,
    premiumBadgeTimestampHidden: false,
    premiumBadgeSequenceHidden: false,
    premiumPurchaseDisabled: false,
    premiumEnabledOverride: false,
    passwordLastChangedAt: null,
    lastVoiceActivitySharingChangeAt: null,
    premiumBadgeHidden: false,
    premiumPerksDisabled: false,
  );
}

void main() {
  test('uses user profile when premium state is missing cancel flag', () {
    final PremiumSubscriptionStatus status = computePremiumSubscriptionStatus(
      premiumState: null,
      effectiveIsPremium: true,
      userPrivate: _user(premiumWillCancel: true),
    );

    expect(status.premiumWillCancel, isTrue);
    expect(status.isGiftSubscription, isFalse);
    expect(status.shouldUseReactivateQuickAction, isTrue);
    expect(status.shouldUseCancelQuickAction, isFalse);
  });

  test('billing cycle from user profile avoids gift misclassification', () {
    final PremiumSubscriptionStatus status = computePremiumSubscriptionStatus(
      premiumState: null,
      effectiveIsPremium: true,
      userPrivate: _user(premiumBillingCycle: 'yearly'),
    );

    expect(status.billingCycle, 'yearly');
    expect(status.isGiftSubscription, isFalse);
  });

  test('store subscription is not treated as a gift', () {
    final PremiumSubscriptionStatus status = computePremiumSubscriptionStatus(
      premiumState: _premiumState(
        subscriptionProvider: 'app_store',
        store: _store(),
      ),
      effectiveIsPremium: true,
      userPrivate: _user(premiumBillingCycle: null),
    );

    expect(status.isGiftSubscription, isFalse);
    expect(status.billingCycle, 'yearly');
    expect(status.manageUrl, 'https://apps.apple.com/account/subscriptions');
    expect(status.subscriptionProvider, PremiumSubscriptionProvider.appStore);
    expect(status.allowsStripeBilling, isFalse);
    expect(status.shouldUseCancelQuickAction, isFalse);
    expect(status.shouldUseReactivateQuickAction, isFalse);
    expect(status.shouldUseChangePlanQuickAction, isFalse);
    expect(status.premiumWillCancel, isFalse);
  });

  test('store subscription that will not renew skips stripe reactivate', () {
    final PremiumSubscriptionStatus status = computePremiumSubscriptionStatus(
      premiumState: _premiumState(
        subscriptionProvider: 'google_play',
        store: _store(
          provider: 'google_play',
          willRenew: false,
          manageUrl:
              'https://play.google.com/store/account/subscriptions?sku=plutonium&package=com.fluxer',
        ),
      ),
      effectiveIsPremium: true,
      userPrivate: _user(premiumBillingCycle: null),
    );

    expect(status.premiumWillCancel, isTrue);
    expect(status.shouldUseReactivateQuickAction, isFalse);
    expect(status.allowsStripeBilling, isFalse);
  });

  test('stripe subscription keeps portal actions', () {
    final PremiumSubscriptionStatus status = computePremiumSubscriptionStatus(
      premiumState: _premiumState(
        subscriptionProvider: 'stripe',
        billingCycle: 'monthly',
        willCancel: true,
        store: _store(willRenew: false),
      ),
      effectiveIsPremium: true,
    );

    expect(status.billingCycle, 'monthly');
    expect(status.manageUrl, isNull);
    expect(status.allowsStripeBilling, isTrue);
    expect(status.shouldUseReactivateQuickAction, isTrue);
    expect(status.isGiftSubscription, isFalse);
  });
}

PremiumStateResponse _premiumState({
  required String subscriptionProvider,
  Map<String, Object?>? store,
  String? billingCycle,
  bool willCancel = false,
}) {
  return decodePremiumStateResponse(<String, dynamic>{
    'actual': <String, Object?>{
      'premium_type': 1,
      'premium_since': '2025-01-01T00:00:00.000Z',
      'premium_until': '2030-01-15T00:00:00.000Z',
      'premium_will_cancel': willCancel,
      'premium_billing_cycle': billingCycle,
      'premium_lifetime_sequence': null,
      'premium_grace_ends_at': null,
      'has_active_paid_premium': true,
      'is_visionary': false,
      'has_ever_purchased': true,
    },
    'effective': <String, Object?>{
      'is_premium': true,
      'premium_type': 1,
      'premium_since': '2025-01-01T00:00:00.000Z',
      'premium_until': '2030-01-15T00:00:00.000Z',
      'premium_will_cancel': willCancel,
      'premium_billing_cycle': billingCycle,
      'premium_lifetime_sequence': null,
      'premium_grace_ends_at': null,
      'premium_enabled_override': false,
      'premium_purchase_disabled': false,
      'premium_perks_disabled': false,
      'self_hosted': false,
      'bot': false,
    },
    'billing': <String, Object?>{
      'stripe_customer_id': null,
      'current_subscription_price': null,
      'pending_subscription_change': null,
      'list_price_switch': null,
      'subscription': null,
      'invoices': <Object?>[],
      'invoices_has_more': false,
      'payment_methods': <Object?>[],
      'refund_eligibility': <String, Object?>{
        'eligible': false,
        'cancels_subscription': false,
      },
    },
    'pricing': <String, Object?>{},
    'subscription_provider': subscriptionProvider,
    'store': ?store,
  });
}

Map<String, Object?> _store({
  String provider = 'app_store',
  bool willRenew = true,
  String manageUrl = 'https://apps.apple.com/account/subscriptions',
}) {
  return <String, Object?>{
    'provider': provider,
    'purchase_id': '1501203318237184000',
    'slot': 'yearly',
    'billing_cycle': 'yearly',
    'state': 'active',
    'expires_at': '2030-01-15T00:00:00.000Z',
    'grace_ends_at': null,
    'will_renew': willRenew,
    'manage_url': manageUrl,
    'environment': 'production',
  };
}
