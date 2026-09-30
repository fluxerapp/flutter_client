import 'package:fluxer_app/features/settings/utils/premium_subscription_status.dart';

enum PlutoniumStoreBarMode { subscribe, manage, visionary, gift, waiting }

PlutoniumStoreBarMode plutoniumStoreBarMode({
  required PremiumSubscriptionStatus status,
  required bool purchasePending,
  bool manageOnDevice = false,
}) {
  if (status.isVisionary) {
    return PlutoniumStoreBarMode.visionary;
  }
  if (purchasePending && !status.isPremium) {
    return PlutoniumStoreBarMode.waiting;
  }
  final bool graceOrExpired =
      status.gracePeriodInfo.isInGracePeriod ||
      status.gracePeriodInfo.isExpired ||
      status.gracePeriodInfo.showExpiredState;
  if (status.isGiftSubscription && !graceOrExpired) {
    return PlutoniumStoreBarMode.gift;
  }
  if (graceOrExpired && !manageOnDevice) {
    return PlutoniumStoreBarMode.subscribe;
  }
  if (status.shouldShowPremiumCard && !status.isGiftSubscription) {
    return PlutoniumStoreBarMode.manage;
  }
  return PlutoniumStoreBarMode.subscribe;
}
