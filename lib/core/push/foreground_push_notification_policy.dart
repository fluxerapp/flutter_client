import 'package:fluxer_app/core/push/push_notification_payload.dart';

abstract final class ForegroundPushNotificationPolicy {
  ForegroundPushNotificationPolicy._();

  static bool shouldProcessAlertPush({required bool isAppForeground}) =>
      !isAppForeground;

  static bool targetsOtherAccount({
    required Map<String, String> payload,
    required String? activeUserId,
  }) {
    final String? targetUserId = _nonEmpty(payload['target_user_id']);
    final String? active = _nonEmpty(activeUserId);
    if (targetUserId == null || active == null) {
      return false;
    }
    return targetUserId != active;
  }

  static bool shouldProcessPush({
    required bool isAppForeground,
    required Map<String, String> payload,
    String? activeUserId,
  }) {
    if (isNotificationClearPayload(payload)) {
      return true;
    }
    if (!isAppForeground) {
      return true;
    }
    return targetsOtherAccount(payload: payload, activeUserId: activeUserId);
  }

  static Map<String, String> notificationPayloadForDisplay({
    required Map<String, String> payload,
    required bool isAppForeground,
    required String? activeUserId,
  }) {
    if (!isAppForeground ||
        !targetsOtherAccount(payload: payload, activeUserId: activeUserId) ||
        !payload.containsKey('badge_count')) {
      return payload;
    }
    return Map<String, String>.from(payload)..remove('badge_count');
  }

  static String? _nonEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return value;
  }
}
