import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_result.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';

Future<SystemPermissionOutcome> requestMicrophonePermissionOutcome() {
  return requestSystemPermission(SystemPermissionKind.microphone);
}
