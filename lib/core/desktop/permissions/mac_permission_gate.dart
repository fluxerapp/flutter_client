import 'dart:async';

import 'package:fluxer_app/core/desktop/permissions/mac_permissions_controller.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_modal.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

Future<bool> ensureMacPermission(
  MacPermissionKind kind, {
  bool liveProbe = false,
}) async {
  final MacPermissionStatus status = await macPermissions.ensure(
    kind,
    liveProbe: liveProbe,
  );
  if (status == MacPermissionStatus.denied) {
    unawaited(showMacPermissionModal(kind));
    return false;
  }
  return status != MacPermissionStatus.notDetermined;
}
