import 'package:flutter_test/flutter_test.dart';
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
}
