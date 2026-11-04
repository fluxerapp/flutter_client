import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance/active_instance_provider.dart';
import 'package:fluxer_app/features/settings/providers/commerce/plutonium_store_provider.dart';

final storefrontCountryProvider = FutureProvider<String?>((Ref ref) async {
  try {
    return await ref
        .read(premiumStorePurchaseClientProvider)
        .storefrontCountryCode();
  } on Object {
    return null;
  }
});

final externalPurchaseLinksAllowedProvider = Provider<bool>((Ref ref) {
  if (defaultTargetPlatform != TargetPlatform.iOS) {
    return true;
  }
  if (!ref.watch(isActiveInstanceOfficialProvider)) {
    return false;
  }
  return ref.watch(storefrontCountryProvider).value == 'USA';
});
