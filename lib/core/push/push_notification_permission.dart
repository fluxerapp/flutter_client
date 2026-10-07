import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_result.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_status.dart';
import 'package:permission_handler/permission_handler.dart';

bool requiresPushNotificationSystemSettingsForStatus(PermissionStatus status) {
  return requiresSystemSettingsForStatus(status);
}

Future<bool> isPushNotificationPermissionGranted() async {
  final PermissionStatus status = await Permission.notification.status;
  return isSystemPermissionGranted(SystemPermissionKind.notifications, status);
}

Future<bool> requiresPushNotificationSystemSettings() async {
  final PermissionStatus status = await Permission.notification.status;
  return requiresPushNotificationSystemSettingsForStatus(status);
}

Future<bool> requestPushNotificationPermission({
  bool openSystemSettingsIfBlocked = false,
}) async {
  if (openSystemSettingsIfBlocked) {
    return ensureSystemPermission(null, SystemPermissionKind.notifications);
  }
  final SystemPermissionOutcome outcome = await requestSystemPermission(
    SystemPermissionKind.notifications,
  );
  return outcome == SystemPermissionOutcome.granted;
}
