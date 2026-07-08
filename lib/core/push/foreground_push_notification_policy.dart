import 'package:fluxer_app/core/push/push_notification_payload.dart';

abstract final class ForegroundPushNotificationPolicy {
  ForegroundPushNotificationPolicy._();

  static bool shouldProcessAlertPush({required bool isAppForeground}) =>
      !isAppForeground;

  static bool shouldProcessPush({
    required bool isAppForeground,
    required Map<String, String> payload,
  }) {
    if (isNotificationClearPayload(payload)) {
      return true;
    }
    return shouldProcessAlertPush(isAppForeground: isAppForeground);
  }
}
