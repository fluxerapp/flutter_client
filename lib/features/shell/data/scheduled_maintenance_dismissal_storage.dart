import 'package:shared_preferences/shared_preferences.dart';

const String kScheduledMaintenanceDismissKeyPrefix =
    'fluxer_scheduled_maintenance_dismissed:';

abstract interface class ScheduledMaintenanceDismissalStorage {
  Future<bool> isDismissed({
    required String maintenanceId,
    required String status,
  });

  Future<void> dismiss({required String maintenanceId, required String status});
}

class SharedPreferencesScheduledMaintenanceDismissalStorage
    implements ScheduledMaintenanceDismissalStorage {
  SharedPreferencesScheduledMaintenanceDismissalStorage(this._preferences);

  final Future<SharedPreferences> _preferences;

  String _dismissKey(String maintenanceId, String status) {
    return '$kScheduledMaintenanceDismissKeyPrefix$maintenanceId:$status';
  }

  String _legacyDismissKey(String maintenanceId) {
    return '$kScheduledMaintenanceDismissKeyPrefix$maintenanceId';
  }

  @override
  Future<bool> isDismissed({
    required String maintenanceId,
    required String status,
  }) async {
    final SharedPreferences preferences = await _preferences;
    if (preferences.getString(_dismissKey(maintenanceId, status)) == '1') {
      return true;
    }
    if (status == 'scheduled' &&
        preferences.getString(_legacyDismissKey(maintenanceId)) == '1') {
      return true;
    }
    return false;
  }

  @override
  Future<void> dismiss({
    required String maintenanceId,
    required String status,
  }) async {
    final SharedPreferences preferences = await _preferences;
    await preferences.setString(_dismissKey(maintenanceId, status), '1');
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
