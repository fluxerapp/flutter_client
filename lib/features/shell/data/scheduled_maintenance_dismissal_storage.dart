import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';

const int _kMaxDismissedMaintenance = 50;

abstract interface class ScheduledMaintenanceDismissalStorage {
  Future<bool> isDismissed({
    required String maintenanceId,
    required String status,
  });

  Future<void> dismiss({required String maintenanceId, required String status});
}

class LocalScheduledMaintenanceDismissalStorage
    implements ScheduledMaintenanceDismissalStorage {
  LocalScheduledMaintenanceDismissalStorage(this._store);

  final LocalSettingsStore _store;

  @override
  Future<bool> isDismissed({
    required String maintenanceId,
    required String status,
  }) async {
    final List<String> dismissed = _store.read(
      LocalSettingKeys.dismissedScheduledMaintenance,
    );
    return dismissed.contains('$maintenanceId:$status') ||
        (status == 'scheduled' && dismissed.contains(maintenanceId));
  }

  @override
  Future<void> dismiss({
    required String maintenanceId,
    required String status,
  }) async {
    final String entry = '$maintenanceId:$status';
    final List<String> dismissed = <String>[
      ..._store
          .read(LocalSettingKeys.dismissedScheduledMaintenance)
          .where((String existing) => existing != entry),
      entry,
    ];
    _store.write(
      LocalSettingKeys.dismissedScheduledMaintenance,
      dismissed.length > _kMaxDismissedMaintenance
          ? dismissed.sublist(dismissed.length - _kMaxDismissedMaintenance)
          : dismissed,
    );
  }
}

class MapScheduledMaintenanceDismissalStorage
    implements ScheduledMaintenanceDismissalStorage {
  final Map<String, String> values = <String, String>{};

  @override
  Future<bool> isDismissed({
    required String maintenanceId,
    required String status,
  }) async {
    if (values['$maintenanceId:$status'] == '1') {
      return true;
    }
    if (status == 'scheduled' && values[maintenanceId] == '1') {
      return true;
    }
    return false;
  }

  @override
  Future<void> dismiss({
    required String maintenanceId,
    required String status,
  }) async {
    values['$maintenanceId:$status'] = '1';
  }
}
