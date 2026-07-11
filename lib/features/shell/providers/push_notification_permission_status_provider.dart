import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/push/push_notification_permission.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'push_notification_permission_status_provider.g.dart';

@riverpod
Future<bool> pushNotificationPermissionGranted(Ref ref) {
  ref.watch(appUiForegroundProvider);
  return isPushNotificationPermissionGranted();
}

@riverpod
Future<bool> pushNotificationRequiresSystemSettings(Ref ref) {
  ref.watch(appUiForegroundProvider);
  return requiresPushNotificationSystemSettings();
}
