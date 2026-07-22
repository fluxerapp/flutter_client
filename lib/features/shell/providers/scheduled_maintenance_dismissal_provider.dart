import 'package:fluxer_app/features/shell/data/scheduled_maintenance_dismissal_storage.dart';
import 'package:fluxer_app/features/shell/data/service_status_client.dart';
import 'package:fluxer_app/features/shell/domain/service_status_maintenance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'scheduled_maintenance_dismissal_provider.g.dart';

@Riverpod(keepAlive: true)
ScheduledMaintenanceDismissalStorage scheduledMaintenanceDismissalStorage(
  Ref ref,
) {
  return SharedPreferencesScheduledMaintenanceDismissalStorage(
    SharedPreferences.getInstance(),
  );
}

@Riverpod(keepAlive: true)
class ScheduledMaintenanceDismissalRead
    extends _$ScheduledMaintenanceDismissalRead {
  @override
  int build() => 0;

  Future<bool> isDismissed(ServiceStatusMaintenance maintenance) {
    final ScheduledMaintenanceDismissalStorage storage = ref.read(
      scheduledMaintenanceDismissalStorageProvider,
    );
    return storage.isDismissed(
      maintenanceId: maintenance.id,
      status: maintenanceStatusStorageValue(maintenance),
    );
  }

  Future<void> dismiss(ServiceStatusMaintenance maintenance) async {
    final ScheduledMaintenanceDismissalStorage storage = ref.read(
      scheduledMaintenanceDismissalStorageProvider,
    );
    await storage.dismiss(
      maintenanceId: maintenance.id,
      status: maintenanceStatusStorageValue(maintenance),
    );
    state = state + 1;
  }
}
