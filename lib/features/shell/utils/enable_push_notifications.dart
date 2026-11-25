import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/push/apns/apns_mobile_device_registration.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_settings.dart';
import 'package:fluxer_app/features/shell/providers/nagbar/push_notification_permission_status_provider.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> enablePushNotifications(
  BuildContext context, {
  required bool requiresSystemSettings,
}) async {
  if (requiresSystemSettings) {
    await openSystemPermissionSettings(SystemPermissionKind.notifications);
    return;
  }
  final ProviderContainer container = ProviderScope.containerOf(
    context,
    listen: false,
  );
  await ensureSystemPermission(context, SystemPermissionKind.notifications);
  container
    ..invalidate(pushNotificationPermissionGrantedProvider)
    ..invalidate(pushNotificationRequiresSystemSettingsProvider);
  unawaited(
    container.read(apnsMobileDeviceRegistrationProvider.notifier).sync(),
  );
}
