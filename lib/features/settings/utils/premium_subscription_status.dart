import 'package:fluxer_dart/export.dart';

class PremiumGracePeriodInfo {
  const PremiumGracePeriodInfo({
    required this.isInGracePeriod,
    required this.isExpired,
    required this.graceEndDate,
    required this.showExpiredState,
  });

  final bool isInGracePeriod;
  final bool isExpired;
  final DateTime? graceEndDate;
  final bool showExpiredState;
}

class PremiumSubscriptionStatus {
  const PremiumSubscriptionStatus({
    required this.isPremium,
    required this.perksDisabled,
    required this.isVisionary,
    required this.hasEverPurchased,
    required this.premiumWillCancel,
    required this.billingCycle,
    required this.actualPremiumUntil,
    required this.isGiftSubscription,
    required this.gracePeriodInfo,
    required this.shouldShowPremiumCard,
    required this.shouldUseCancelQuickAction,
    required this.shouldUseReactivateQuickAction,
    required this.shouldUseChangePlanQuickAction,
    this.isGiftGrace = false,
    this.canStartSubscription = false,
    this.subscriptionProvider,
    this.manageUrl,
    this.allowsStripeBilling = true,
  });

  final bool isPremium;
  final bool perksDisabled;
  final bool isVisionary;
  final bool hasEverPurchased;
  final bool premiumWillCancel;
  final String? billingCycle;
  final DateTime? actualPremiumUntil;
  final bool isGiftSubscription;
  final PremiumGracePeriodInfo gracePeriodInfo;
  final bool shouldShowPremiumCard;
  final bool shouldUseCancelQuickAction;
  final bool shouldUseReactivateQuickAction;
  final bool shouldUseChangePlanQuickAction;
  final bool isGiftGrace;
  final bool canStartSubscription;
  final PremiumSubscriptionProvider? subscriptionProvider;
  final String? manageUrl;
  final bool allowsStripeBilling;
}

const Set<String> _blockingStripeSubscriptionStatuses = {
  'active',
  'trialing',
  'past_due',
  'unpaid',
  'incomplete',
  'paused',
};

DateTime? _parseOptionalDate(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return DateTime.tryParse(value);
}

PremiumSubscriptionStatus computePremiumSubscriptionStatus({
  required PremiumStateResponse? premiumState,
  required bool effectiveIsPremium,
  UserPrivateResponse? userPrivate,
}) {
  final PremiumStateResponseActual? actual = premiumState?.actual;
  final PremiumStateResponseEffective? effective = premiumState?.effective;

  final UserPremiumTypes? premiumType =
      actual?.premiumType ?? userPrivate?.premiumType;
  final DateTime? premiumUntil =
      _parseOptionalDate(actual?.premiumUntil) ??
      _parseOptionalDate(effective?.premiumUntil) ??
      _parseOptionalDate(userPrivate?.premiumUntil);
  final DateTime? premiumGraceEndsAt = _parseOptionalDate(
    actual?.premiumGraceEndsAt ?? userPrivate?.premiumGraceEndsAt,
  );
  final bool perksDisabled =
      effective?.premiumPerksDisabled ??
      userPrivate?.premiumPerksDisabled ??
      false;
  final bool hasPaidPremium =
      premiumType != null && premiumType != UserPremiumTypes.none;
  final bool isVisionary =
      premiumType == UserPremiumTypes.lifetime ||
      (actual?.isVisionary ?? false);
  final bool hasEverPurchased =
      actual?.hasEverPurchased ?? userPrivate?.hasEverPurchased ?? false;
  final PremiumSubscriptionProvider? subscriptionProvider =
      premiumState?.subscriptionProvider;
  final bool storeOwnsSubscription =
      subscriptionProvider == PremiumSubscriptionProvider.appStore ||
      subscriptionProvider == PremiumSubscriptionProvider.googlePlay;
  final PremiumStoreSubscriptionState? store = storeOwnsSubscription
      ? premiumState?.store
      : null;
  final bool allowsStripeBilling =
      subscriptionProvider == null ||
      subscriptionProvider == PremiumSubscriptionProvider.stripe;
  final bool premiumWillCancel = store != null
      ? !store.willRenew
      : (actual?.premiumWillCancel ?? userPrivate?.premiumWillCancel ?? false);
  final String? billingCycle =
      actual?.premiumBillingCycle?.json ??
      store?.billingCycle.json ??
      userPrivate?.premiumBillingCycle;
  final String? manageUrl = store == null || store.manageUrl.isEmpty
      ? null
      : store.manageUrl;

  PremiumGracePeriodInfo gracePeriodInfo;
  if (isVisionary) {
    gracePeriodInfo = const PremiumGracePeriodInfo(
      isInGracePeriod: false,
      isExpired: false,
      graceEndDate: null,
      showExpiredState: false,
    );
  } else {
    final DateTime? explicitGraceEnd = premiumGraceEndsAt;
    final DateTime? graceEndDate =
        explicitGraceEnd ?? premiumUntil?.add(const Duration(days: 3));
    if (graceEndDate == null) {
      gracePeriodInfo = const PremiumGracePeriodInfo(
        isInGracePeriod: false,
        isExpired: false,
        graceEndDate: null,
        showExpiredState: false,
      );
    } else {
      final DateTime now = DateTime.now();
      final DateTime anchorDate = premiumUntil ?? graceEndDate;
      final DateTime expiredStateEndDate = anchorDate.add(
        const Duration(days: 30),
      );
      final bool isInGracePeriod =
          (premiumUntil == null || now.isAfter(premiumUntil)) &&
          !now.isAfter(graceEndDate);
      final bool isExpired = now.isAfter(graceEndDate);
      final bool showExpiredState =
          isExpired && !now.isAfter(expiredStateEndDate);
      gracePeriodInfo = PremiumGracePeriodInfo(
        isInGracePeriod: isInGracePeriod,
        isExpired: isExpired,
        graceEndDate: graceEndDate,
        showExpiredState: showExpiredState,
      );
    }
  }

  final bool isFullyExpired = gracePeriodInfo.isExpired;
  final bool isInGracePeriod = gracePeriodInfo.isInGracePeriod;
  final bool showExpiredState = gracePeriodInfo.showExpiredState;
  final PremiumBillingSubscriptionResponse? stripeSubscription =
      premiumState?.billing.subscription;
  final bool stripeSubscriptionBlocks = _blockingStripeSubscriptionStatuses
      .contains(stripeSubscription?.status);
  final bool premiumWithoutBillingCycle =
      billingCycle == null &&
      hasPaidPremium &&
      !isVisionary &&
      premiumUntil != null;
  final bool isGiftSubscription =
      premiumWithoutBillingCycle && !isInGracePeriod && !isFullyExpired;
  final DateTime? stripePeriodEnd = _parseOptionalDate(
    stripeSubscription?.currentPeriodEnd,
  );
  final bool isGiftGrace =
      premiumWithoutBillingCycle &&
      isInGracePeriod &&
      allowsStripeBilling &&
      !stripeSubscriptionBlocks &&
      (stripePeriodEnd == null ||
          stripePeriodEnd
              .add(const Duration(minutes: 1))
              .isBefore(premiumUntil));
  final bool canStartSubscription =
      premiumState != null &&
      !isVisionary &&
      allowsStripeBilling &&
      !stripeSubscriptionBlocks;
  final bool isPremium = effectiveIsPremium;

  final bool shouldShowPremiumCard =
      hasPaidPremium || isInGracePeriod || showExpiredState;
  final bool shouldUseCancelQuickAction =
      allowsStripeBilling &&
      hasPaidPremium &&
      !isVisionary &&
      !isInGracePeriod &&
      !isFullyExpired &&
      !premiumWillCancel &&
      !isGiftSubscription;
  final bool shouldUseReactivateQuickAction =
      allowsStripeBilling &&
      hasPaidPremium &&
      premiumWillCancel &&
      !isVisionary &&
      !isInGracePeriod &&
      !isFullyExpired &&
      !isGiftSubscription;
  final bool shouldUseChangePlanQuickAction =
      allowsStripeBilling &&
      hasPaidPremium &&
      !isVisionary &&
      !isInGracePeriod &&
      !isFullyExpired &&
      !premiumWillCancel &&
      !isGiftSubscription &&
      (billingCycle == 'monthly' || billingCycle == 'yearly');

  return PremiumSubscriptionStatus(
    isPremium: isPremium,
    perksDisabled: perksDisabled,
    isVisionary: isVisionary,
    hasEverPurchased: hasEverPurchased,
    premiumWillCancel: premiumWillCancel,
    billingCycle: billingCycle,
    actualPremiumUntil: premiumUntil,
    isGiftSubscription: isGiftSubscription,
    gracePeriodInfo: gracePeriodInfo,
    shouldShowPremiumCard: shouldShowPremiumCard,
    shouldUseCancelQuickAction: shouldUseCancelQuickAction,
    shouldUseReactivateQuickAction: shouldUseReactivateQuickAction,
    shouldUseChangePlanQuickAction: shouldUseChangePlanQuickAction,
    isGiftGrace: isGiftGrace,
    canStartSubscription: canStartSubscription,
    subscriptionProvider: subscriptionProvider,
    manageUrl: manageUrl,
    allowsStripeBilling: allowsStripeBilling,
  );
}
