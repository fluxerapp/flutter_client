import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_result.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:permission_handler/permission_handler.dart';

bool _bluetoothPermissionRequested = false;

Future<void> requestVoiceBluetoothPermissionOnce({
  bool isAndroid = false,
  Future<PermissionStatus> Function()? readStatus,
  Future<PermissionStatus> Function()? request,
}) async {
  if (!(isAndroid || Platform.isAndroid) || _bluetoothPermissionRequested) {
    return;
  }
  _bluetoothPermissionRequested = true;
  try {
    final PermissionStatus status =
        await (readStatus ?? () => Permission.bluetoothConnect.status)();
    if (status.isGranted || status.isPermanentlyDenied) {
      return;
    }
    await (request ?? () => Permission.bluetoothConnect.request())();
  } on Object catch (error) {
    talker.warning('[Voice] Bluetooth permission request failed: $error');
  }
}

@visibleForTesting
void resetVoiceBluetoothPermissionRequestForTest() {
  _bluetoothPermissionRequested = false;
}

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
