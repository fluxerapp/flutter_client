import 'package:fluxer_app/core/push/foreground_push_notification_policy.dart';

abstract final class PushNotificationDisplayConfig {
  PushNotificationDisplayConfig._();

  static bool shouldShowLocalNotification({required bool isAppForeground}) {
    return ForegroundPushNotificationPolicy.shouldProcessAlertPush(
      isAppForeground: isAppForeground,
    );
  }
}
