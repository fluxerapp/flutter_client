import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'push_notification_permission_status_provider.g.dart';

@Riverpod(keepAlive: true)
Future<bool> pushNotificationPermissionGranted(Ref ref) async {
  if (kIsWeb) {
    return true;
  }
  final PermissionStatus status = await Permission.notification.status;
  return status.isGranted || status.isProvisional;
}
