import 'package:shared_preferences/shared_preferences.dart';

const String kUnifiedPushNoDistributorDismissKey = 'fluxer_UnifiedPushUi_asked';

abstract interface class UnifiedPushNoDistributorDismissalStorage {
  Future<bool> isDismissed();

  Future<void> dismiss();
}

class SharedPreferencesUnifiedPushNoDistributorDismissalStorage
    implements UnifiedPushNoDistributorDismissalStorage {
  SharedPreferencesUnifiedPushNoDistributorDismissalStorage(this._preferences);

  final Future<SharedPreferences> _preferences;

  @override
  Future<bool> isDismissed() async {
    final SharedPreferences preferences = await _preferences;
    return preferences.getBool(kUnifiedPushNoDistributorDismissKey) ?? false;
  }

  @override
  Future<void> dismiss() async {
    final SharedPreferences preferences = await _preferences;
    await preferences.setBool(kUnifiedPushNoDistributorDismissKey, true);
  }
}

class MapUnifiedPushNoDistributorDismissalStorage
    implements UnifiedPushNoDistributorDismissalStorage {
  bool dismissed = false;

  @override
  Future<bool> isDismissed() async => dismissed;

  @override
  Future<void> dismiss() async {
    dismissed = true;
  }
}
