import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/router/shell_navigator_keys.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_result.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_status.dart';
import 'package:fluxer_app/features/ui/system_permissions/system_permission_settings_prompt.dart';
import 'package:permission_handler/permission_handler.dart';

Permission permissionForKind(SystemPermissionKind kind) {
  switch (kind) {
    case SystemPermissionKind.microphone:
      return Permission.microphone;
    case SystemPermissionKind.camera:
      return Permission.camera;
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

Future<SystemPermissionOutcome> requestSystemPermission(
  SystemPermissionKind kind,
) async {
  if (kIsWeb && kind == SystemPermissionKind.notifications) {
    return SystemPermissionOutcome.denied;
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
        isAndroid: !kIsWeb && Platform.isAndroid,
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
  final SystemPermissionOutcome outcome = await requestSystemPermission(kind);
  switch (outcome) {
    case SystemPermissionOutcome.granted:
      return true;
    case SystemPermissionOutcome.requiresSettings:
      final BuildContext? modalContext = resolveSystemPermissionContext(null);
      if (modalContext != null) {
        await SystemPermissionSettingsPrompt.show(modalContext, kind: kind);
      }
      return false;
    case SystemPermissionOutcome.denied:
      return false;
  }
}
