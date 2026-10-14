import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppStoreDistribution { production, testflight, development, unknown }

const MethodChannel appStoreDistributionChannel = MethodChannel(
  'fluxer_app/app_store_distribution',
);

AppStoreDistribution appStoreDistributionFromName(String? name) {
  for (final AppStoreDistribution value in AppStoreDistribution.values) {
    if (value.name == name) {
      return value;
    }
  }
  return AppStoreDistribution.unknown;
}

final appStoreDistributionProvider = FutureProvider<AppStoreDistribution>((
  Ref ref,
) async {
  if (defaultTargetPlatform != TargetPlatform.iOS) {
    return AppStoreDistribution.unknown;
  }
  try {
    return appStoreDistributionFromName(
      await appStoreDistributionChannel.invokeMethod<String>('distribution'),
    );
  } on Object {
    return AppStoreDistribution.unknown;
  }
});

const String _kSandboxPurchasesKey = 'developer_sandbox_store_purchases';

final sandboxStorePurchasesProvider =
    AsyncNotifierProvider<SandboxStorePurchases, bool>(
      SandboxStorePurchases.new,
    );

class SandboxStorePurchases extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(_kSandboxPurchasesKey) ?? false;
  }

  Future<void> setEnabled({required bool value}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_kSandboxPurchasesKey, value);
    state = AsyncData<bool>(value);
  }
}
