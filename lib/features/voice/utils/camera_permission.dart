import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_result.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';

/// Requests camera access for voice channel video.
Future<bool> requestCameraPermissionForVoice() async {
  final SystemPermissionOutcome outcome = await requestSystemPermission(
    SystemPermissionKind.camera,
  );
  return outcome == SystemPermissionOutcome.granted;
}

Future<SystemPermissionOutcome> requestCameraPermissionOutcome() async {
  return requestSystemPermission(SystemPermissionKind.camera);
}
