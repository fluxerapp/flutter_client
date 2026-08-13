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
}

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
  final bool premiumWillCancel =
      actual?.premiumWillCancel ?? userPrivate?.premiumWillCancel ?? false;
  final String? billingCycle =
      actual?.premiumBillingCycle?.json ?? userPrivate?.premiumBillingCycle;
  final bool isGiftSubscription =
      billingCycle == null &&
      hasPaidPremium &&
      !isVisionary &&
      premiumUntil != null;

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
  final bool isPremium = effectiveIsPremium;

  final bool shouldShowPremiumCard =
      hasPaidPremium || isInGracePeriod || showExpiredState;
  final bool shouldUseCancelQuickAction =
      hasPaidPremium &&
      !isVisionary &&
      !isInGracePeriod &&
      !isFullyExpired &&
      !premiumWillCancel &&
      !isGiftSubscription;
  final bool shouldUseReactivateQuickAction =
      hasPaidPremium &&
      premiumWillCancel &&
      !isVisionary &&
      !isInGracePeriod &&
      !isFullyExpired &&
      !isGiftSubscription;
  final bool shouldUseChangePlanQuickAction =
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
  );
}
