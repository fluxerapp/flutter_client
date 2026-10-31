import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_result.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/core/talker.dart';

Future<bool> requestVoiceJoinMediaPermissionGranted(
  SystemPermissionKind kind,
) async {
  try {
    final SystemPermissionOutcome outcome = await requestSystemPermission(kind);
    return outcome == SystemPermissionOutcome.granted;
  } on Object catch (error, stackTrace) {
    talker.warning(
      '[Voice] Join permission $kind failed: $error',
      error,
      stackTrace,
    );
    return false;
  }
}
