import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/plutonium_store_gate.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_billing_utils.dart';

bool _premiumCommerceVisibleFromRef(WidgetRef ref) {
  if (!ref.watch(isActiveInstanceOfficialProvider)) {
    return false;
  }
  return ref.watch(shouldShowPremiumCommerceProvider);
}

bool userSettingsShowBillingNav(WidgetRef ref) {
  if (!_premiumCommerceVisibleFromRef(ref)) {
    return false;
  }
  return isOssWebCheckoutBuild || isPremiumStorePageActive();
}

bool userSettingsShowGiftBillingNav(WidgetRef ref) {
  return userSettingsShowBillingNav(ref) && isOssWebCheckoutBuild;
}
