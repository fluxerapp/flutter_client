import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/plutonium_store_gate.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_billing_utils.dart';

bool userSettingsShowBillingNav(WidgetRef ref) {
  return resolvePremiumBillingNavVisible(
    commerceVisible: ref.watch(shouldShowPremiumCommerceProvider),
    ossWebCheckout: isOssWebCheckoutBuild,
    storePage: isPremiumStorePageActive(),
    officialInstance: ref.watch(isActiveInstanceOfficialProvider),
  );
}

bool userSettingsShowGiftBillingNav(WidgetRef ref) {
  return userSettingsShowBillingNav(ref) && isOssWebCheckoutBuild;
}
