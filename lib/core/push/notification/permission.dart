import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/desktop/notifications/desktop_notification_permission.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_result.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_status.dart';
import 'package:permission_handler/permission_handler.dart';

bool requiresPushNotificationSystemSettingsForStatus(PermissionStatus status) {
  return requiresSystemSettingsForStatus(status);
}

Future<bool> isPushNotificationPermissionGranted() async {
  if (isFluxerDesktopOs) {
    return isDesktopNotificationPermissionGranted();
  }
  final PermissionStatus status = await Permission.notification.status;
  return isSystemPermissionGranted(SystemPermissionKind.notifications, status);
}

Future<bool> requiresPushNotificationSystemSettings() async {
  if (isFluxerDesktopOs) {
    return !await isDesktopNotificationPermissionGranted();
  }
  final PermissionStatus status = await Permission.notification.status;
  return requiresPushNotificationSystemSettingsForStatus(status);
}

Future<bool>? _afterFirstSendRequestInFlight;

Future<bool> requestPushNotificationPermissionAfterFirstSend() async {
  if (defaultTargetPlatform != TargetPlatform.iOS ||
      !PushProviderGuard.isApple) {
    return false;
  }
  final Future<bool>? inFlight = _afterFirstSendRequestInFlight;
  if (inFlight != null) {
    return inFlight;
  }
  final Future<bool> run = _requestAfterFirstSendOnce();
  _afterFirstSendRequestInFlight = run;
  try {
    return await run;
  } finally {
    if (identical(_afterFirstSendRequestInFlight, run)) {
      _afterFirstSendRequestInFlight = null;
    }
  }
}

Future<bool> _requestAfterFirstSendOnce() async {
  final PermissionStatus status = await Permission.notification.status;
  if (!status.isDenied) {
    return false;
  }
  await requestSystemPermission(SystemPermissionKind.notifications);
  return true;
}

Future<bool>? _pushNotificationPermissionRequestInFlight;

Future<bool> requestPushNotificationPermission({
  bool openSystemSettingsIfBlocked = false,
}) async {
  if (openSystemSettingsIfBlocked) {
    return ensureSystemPermission(null, SystemPermissionKind.notifications);
  }
  final Future<bool>? inFlight = _pushNotificationPermissionRequestInFlight;
  if (inFlight != null) {
    return inFlight;
  }
  final Future<bool> run = _requestPushNotificationPermissionOnce();
  _pushNotificationPermissionRequestInFlight = run;
  try {
    return await run;
  } finally {
    if (identical(_pushNotificationPermissionRequestInFlight, run)) {
      _pushNotificationPermissionRequestInFlight = null;
    }
  }
}

Future<bool> _requestPushNotificationPermissionOnce() async {
  final SystemPermissionOutcome outcome = await requestSystemPermission(
    SystemPermissionKind.notifications,
  );
  return outcome == SystemPermissionOutcome.granted;
}
