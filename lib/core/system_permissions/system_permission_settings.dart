import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/desktop/notifications/desktop_notification_permission.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_controller.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_macos/fluxer_macos.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

Uri? windowsPrivacySettingsUri(SystemPermissionKind kind) => switch (kind) {
  SystemPermissionKind.microphone => Uri.parse(
    'ms-settings:privacy-microphone',
  ),
  SystemPermissionKind.camera => Uri.parse('ms-settings:privacy-webcam'),
  SystemPermissionKind.photos || SystemPermissionKind.notifications => null,
};

Future<void> openSystemPermissionSettings(SystemPermissionKind kind) async {
  if (kind == SystemPermissionKind.notifications &&
      await openDesktopNotificationSettings()) {
    return;
  }
  if (macPermissions.isSupported) {
    switch (kind) {
      case SystemPermissionKind.microphone:
        await macPermissions.openSettings(MacPermissionKind.microphone);
      case SystemPermissionKind.camera:
        await macPermissions.openSettings(MacPermissionKind.camera);
      case SystemPermissionKind.photos:
        await macPermissions.openPrivacyPane(MacPrivacyPane.photos);
      case SystemPermissionKind.notifications:
        break;
    }
    return;
  }
  if (defaultTargetPlatform == TargetPlatform.windows) {
    final Uri? uri = windowsPrivacySettingsUri(kind);
    if (uri == null) {
      return;
    }
    try {
      await launchUrl(uri);
    } on Object catch (error, stackTrace) {
      talker.warning(
        '[SystemPermission] Opening Windows settings failed',
        error,
        stackTrace,
      );
    }
    return;
  }
  if (defaultTargetPlatform == TargetPlatform.linux) {
    return;
  }
  await openAppSettings();
}
