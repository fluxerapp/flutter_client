import 'package:permission_handler/permission_handler.dart';

bool requiresSystemSettingsForStatus(PermissionStatus status) {
  if (status.isGranted || status.isProvisional) {
    return false;
  }
  return status.isPermanentlyDenied || status.isRestricted;
}

bool shouldOpenSystemSettingsAfterRequest({
  required PermissionStatus before,
  required PermissionStatus after,
  required bool isAndroid,
}) {
  if (after.isGranted || after.isProvisional) {
    return false;
  }
  if (after.isPermanentlyDenied || after.isRestricted) {
    return true;
  }
  if (!isAndroid && after.isDenied && before.isDenied) {
    return true;
  }
  return false;
}
