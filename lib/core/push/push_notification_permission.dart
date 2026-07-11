import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

bool shouldOpenPushNotificationSettingsAfterRequest({
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

bool requiresPushNotificationSystemSettingsForStatus(PermissionStatus status) {
  if (status.isGranted || status.isProvisional) {
    return false;
  }
  return status.isPermanentlyDenied || status.isRestricted;
}

Future<bool> isPushNotificationPermissionGranted() async {
  if (kIsWeb) {
    return true;
  }
  final PermissionStatus status = await Permission.notification.status;
  return status.isGranted || status.isProvisional;
}

Future<bool> requiresPushNotificationSystemSettings() async {
  if (kIsWeb) {
    return false;
  }
  final PermissionStatus status = await Permission.notification.status;
  return requiresPushNotificationSystemSettingsForStatus(status);
}

Future<bool> requestPushNotificationPermission() async {
  if (kIsWeb) {
    return false;
  }
  const Permission permission = Permission.notification;
  PermissionStatus status = await permission.status;
  if (status.isGranted || status.isProvisional) {
    return true;
  }
  if (requiresPushNotificationSystemSettingsForStatus(status)) {
    await openAppSettings();
    return false;
  }
  final PermissionStatus before = status;
  status = await permission.request();
  if (kDebugMode) {
    debugPrint('[PushPermission] status after request: $status');
  }
  if (status.isGranted || status.isProvisional) {
    return true;
  }
  if (shouldOpenPushNotificationSettingsAfterRequest(
    before: before,
    after: status,
    isAndroid: !kIsWeb && Platform.isAndroid,
  )) {
    await openAppSettings();
  }
  return false;
}
