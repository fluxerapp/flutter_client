import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/push/android/local_notifications.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_result.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _macOSNotificationSettingsUri = Uri.parse(
  'x-apple.systempreferences:com.apple.Notifications-Settings.extension',
);

Future<bool> isDesktopNotificationPermissionGranted() async {
  if (defaultTargetPlatform != TargetPlatform.macOS) {
    return true;
  }
  try {
    return await LocalPushNotifications().checkMacOSPermission() ?? false;
  } on Object {
    return false;
  }
}

Future<SystemPermissionOutcome> requestDesktopNotificationPermission() async {
  if (defaultTargetPlatform != TargetPlatform.macOS) {
    return SystemPermissionOutcome.granted;
  }
  if (await isDesktopNotificationPermissionGranted()) {
    return SystemPermissionOutcome.granted;
  }
  try {
    final bool? granted = await LocalPushNotifications()
        .requestMacOSPermission();
    return (granted ?? false)
        ? SystemPermissionOutcome.granted
        : SystemPermissionOutcome.requiresSettings;
  } on Object {
    return SystemPermissionOutcome.denied;
  }
}

Future<bool> openDesktopNotificationSettings() async {
  if (defaultTargetPlatform != TargetPlatform.macOS) {
    return false;
  }
  try {
    return await launchUrl(_macOSNotificationSettingsUri);
  } on Object {
    return false;
  }
}
