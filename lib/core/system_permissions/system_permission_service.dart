import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/desktop/notifications/desktop_notification_permission.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_controller.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/router/shell_navigator_keys.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_result.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_status.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_modal.dart';
import 'package:fluxer_app/features/ui/system_permissions/system_permission_settings_prompt.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_macos/fluxer_macos.dart';
import 'package:permission_handler/permission_handler.dart';

Permission permissionForKind(SystemPermissionKind kind) {
  switch (kind) {
    case SystemPermissionKind.microphone:
      return Permission.microphone;
    case SystemPermissionKind.camera:
      return Permission.camera;
    case SystemPermissionKind.photos:
      return Permission.photos;
    case SystemPermissionKind.notifications:
      return Permission.notification;
  }
}

bool isSystemPermissionGranted(
  SystemPermissionKind kind,
  PermissionStatus status,
) {
  if (kind == SystemPermissionKind.notifications) {
    return status.isGranted || status.isProvisional;
  }
  return status.isGranted;
}

bool requiresSystemSettingsForKind(
  SystemPermissionKind kind,
  PermissionStatus status,
) {
  if (isSystemPermissionGranted(kind, status)) {
    return false;
  }
  return requiresSystemSettingsForStatus(status);
}

MacPermissionKind? macPermissionForKind(SystemPermissionKind kind) {
  if (!macPermissions.isSupported) {
    return null;
  }
  return switch (kind) {
    SystemPermissionKind.microphone => MacPermissionKind.microphone,
    SystemPermissionKind.camera => MacPermissionKind.camera,
    SystemPermissionKind.photos || SystemPermissionKind.notifications => null,
  };
}

bool isUngatedLinuxPermission(SystemPermissionKind kind) =>
    defaultTargetPlatform == TargetPlatform.linux &&
    (kind == SystemPermissionKind.microphone ||
        kind == SystemPermissionKind.camera);

Future<SystemPermissionOutcome> requestSystemPermission(
  SystemPermissionKind kind,
) async {
  if (kind == SystemPermissionKind.notifications && isFluxerDesktopOs) {
    return await requestDesktopNotificationPermission();
  }
  final MacPermissionKind? macKind = macPermissionForKind(kind);
  if (macKind != null) {
    return switch (await macPermissions.ensure(macKind)) {
      MacPermissionStatus.granted ||
      MacPermissionStatus.unsupported => SystemPermissionOutcome.granted,
      MacPermissionStatus.denied => SystemPermissionOutcome.requiresSettings,
      MacPermissionStatus.notDetermined => SystemPermissionOutcome.denied,
    };
  }
  if (isUngatedLinuxPermission(kind)) {
    return SystemPermissionOutcome.granted;
  }
  final Permission permission = permissionForKind(kind);
  PermissionStatus status = await permission.status;
  if (isSystemPermissionGranted(kind, status)) {
    return SystemPermissionOutcome.granted;
  }
  if (requiresSystemSettingsForKind(kind, status)) {
    return SystemPermissionOutcome.requiresSettings;
  }
  final PermissionStatus before = status;
  status = await permission.request();
  if (kDebugMode) {
    debugPrint('[SystemPermission] $kind status after request: $status');
  }
  if (isSystemPermissionGranted(kind, status)) {
    return SystemPermissionOutcome.granted;
  }
  if (requiresSystemSettingsForKind(kind, status) ||
      shouldOpenSystemSettingsAfterRequest(
        before: before,
        after: status,
        isAndroid: Platform.isAndroid,
      )) {
    return SystemPermissionOutcome.requiresSettings;
  }
  return SystemPermissionOutcome.denied;
}

BuildContext? resolveSystemPermissionContext(BuildContext? context) {
  if (context != null && context.mounted) {
    return context;
  }
  final BuildContext? rootContext = rootNavigatorKey.currentContext;
  if (rootContext != null && rootContext.mounted) {
    return rootContext;
  }
  return null;
}

Future<bool> ensureSystemPermission(
  BuildContext? context,
  SystemPermissionKind kind,
) async {
  final BuildContext? modalContext = resolveSystemPermissionContext(context);
  final SystemPermissionOutcome outcome = await requestSystemPermission(kind);
  switch (outcome) {
    case SystemPermissionOutcome.granted:
      return true;
    case SystemPermissionOutcome.requiresSettings:
      final MacPermissionKind? macKind = macPermissionForKind(kind);
      if (macKind != null) {
        await showMacPermissionModal(
          macKind,
          context: modalContext != null && modalContext.mounted
              ? modalContext
              : null,
        );
        return false;
      }
      if (modalContext != null && modalContext.mounted) {
        await SystemPermissionSettingsPrompt.show(modalContext, kind: kind);
      }
      return false;
    case SystemPermissionOutcome.denied:
      return false;
  }
}
