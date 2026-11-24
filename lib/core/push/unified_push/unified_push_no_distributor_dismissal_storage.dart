import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';

abstract interface class UnifiedPushNoDistributorDismissalStorage {
  Future<bool> isDismissed();

  Future<void> dismiss();
}

class LocalUnifiedPushNoDistributorDismissalStorage
    implements UnifiedPushNoDistributorDismissalStorage {
  LocalUnifiedPushNoDistributorDismissalStorage(this._store);

  final LocalSettingsStore _store;

  @override
  Future<bool> isDismissed() async =>
      _store.read<bool>(LocalSettingKeys.unifiedPushNoDistributorDismissed);

  @override
  Future<void> dismiss() async =>
      _store.write(LocalSettingKeys.unifiedPushNoDistributorDismissed, true);
}
