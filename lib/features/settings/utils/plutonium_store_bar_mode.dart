import 'package:fluxer_app/features/settings/utils/premium_subscription_status.dart';

enum PremiumStoreBarMode { subscribe, manage, visionary, gift, waiting }

PremiumStoreBarMode premiumStoreBarMode({
  required PremiumSubscriptionStatus status,
  required bool purchasePending,
  bool manageOnDevice = false,
}) {
  if (status.isVisionary) {
    return PremiumStoreBarMode.visionary;
  }
  if (purchasePending && !status.isPremium) {
    return PremiumStoreBarMode.waiting;
  }
  if (status.isGiftSubscription) {
    return PremiumStoreBarMode.gift;
  }
  final bool graceOrExpired =
      status.gracePeriodInfo.isInGracePeriod ||
      status.gracePeriodInfo.isExpired ||
      status.gracePeriodInfo.showExpiredState;
  if (graceOrExpired && !manageOnDevice) {
    return PremiumStoreBarMode.subscribe;
  }
  if (status.shouldShowPremiumCard) {
    return PremiumStoreBarMode.manage;
  }
  return PremiumStoreBarMode.subscribe;
}
