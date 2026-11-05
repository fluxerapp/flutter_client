import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/plutonium_store_gate.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/providers/instance/active_instance_provider.dart';
import 'package:fluxer_app/features/settings/utils/commerce/user_settings_billing_utils.dart';

final premiumBillingNavVisibleProvider = Provider<bool>((Ref ref) {
  return resolvePremiumBillingNavVisible(
    commerceVisible: ref.watch(shouldShowPremiumCommerceProvider),
    webCheckout: isWebCheckoutBuild,
    storePage: isPremiumStorePageActive(),
    officialInstance: ref.watch(isActiveInstanceOfficialProvider),
  );
});

final premiumGiftBillingNavVisibleProvider = Provider<bool>((Ref ref) {
  return ref.watch(premiumBillingNavVisibleProvider) && isWebCheckoutBuild;
});

bool userSettingsShowBillingNav(WidgetRef ref) {
  return ref.watch(premiumBillingNavVisibleProvider);
}

bool userSettingsShowGiftBillingNav(WidgetRef ref) {
  return ref.watch(premiumGiftBillingNavVisibleProvider);
}
