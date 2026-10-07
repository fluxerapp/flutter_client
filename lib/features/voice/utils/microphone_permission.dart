import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_result.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:permission_handler/permission_handler.dart';

/// Returns whether microphone access is already granted for voice.
Future<bool> hasMicrophonePermissionForVoice() async {
  final PermissionStatus status = await Permission.microphone.status;
  return status.isGranted;
}

Future<SystemPermissionOutcome> requestMicrophonePermissionOutcome() {
  return requestSystemPermission(SystemPermissionKind.microphone);
}
