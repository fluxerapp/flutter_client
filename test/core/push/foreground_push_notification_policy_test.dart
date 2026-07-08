import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/foreground_push_notification_policy.dart';

void main() {
  group('ForegroundPushNotificationPolicy', () {
    test('discards alert pushes while app is foreground', () {
      expect(
        ForegroundPushNotificationPolicy.shouldProcessAlertPush(
          isAppForeground: true,
        ),
        isFalse,
      );
      expect(
        ForegroundPushNotificationPolicy.shouldProcessAlertPush(
          isAppForeground: false,
        ),
        isTrue,
      );
    });

    test('always processes clear payloads regardless of foreground', () {
      const Map<String, String> clearPayload = <String, String>{
        'type': 'notification_clear',
        'channel_id': '456',
      };
      expect(
        ForegroundPushNotificationPolicy.shouldProcessPush(
          isAppForeground: true,
          payload: clearPayload,
        ),
        isTrue,
      );
      expect(
        ForegroundPushNotificationPolicy.shouldProcessPush(
          isAppForeground: false,
          payload: clearPayload,
        ),
        isTrue,
      );
    });

    test('discards non-clear pushes while foreground', () {
      const Map<String, String> alertPayload = <String, String>{
        'channel_id': '456',
        'message_id': 'msg-1',
      };
      expect(
        ForegroundPushNotificationPolicy.shouldProcessPush(
          isAppForeground: true,
          payload: alertPayload,
        ),
        isFalse,
      );
      expect(
        ForegroundPushNotificationPolicy.shouldProcessPush(
          isAppForeground: false,
          payload: alertPayload,
        ),
        isTrue,
      );
    });
  });
}
