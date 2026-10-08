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
          activeUserId: 'user-a',
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

    test('shows a foreground push for another account', () {
      const Map<String, String> alertPayload = <String, String>{
        'channel_id': '456',
        'message_id': 'msg-1',
        'target_user_id': 'user-b',
        'badge_count': '4',
        'url': '/channels/@me/456/msg-1',
      };
      expect(
        ForegroundPushNotificationPolicy.shouldProcessPush(
          isAppForeground: true,
          payload: alertPayload,
          activeUserId: 'user-a',
        ),
        isTrue,
      );
      expect(
        ForegroundPushNotificationPolicy.shouldProcessPush(
          isAppForeground: true,
          payload: alertPayload,
          activeUserId: 'user-b',
        ),
        isFalse,
      );
      expect(
        ForegroundPushNotificationPolicy.notificationPayloadForDisplay(
          payload: alertPayload,
          isAppForeground: true,
          activeUserId: 'user-a',
        ),
        <String, String>{
          'channel_id': '456',
          'message_id': 'msg-1',
          'target_user_id': 'user-b',
          'url': '/channels/@me/456/msg-1',
        },
      );
    });
  });

  test('thread pushes follow the same foreground rule as channels', () {
    const Map<String, String> threadPayload = <String, String>{
      'channel_id': '300',
      'parent_id': '100',
      'guild_id': '1',
    };
    expect(
      ForegroundPushNotificationPolicy.shouldProcessPush(
        isAppForeground: false,
        payload: threadPayload,
      ),
      isTrue,
    );
    expect(
      ForegroundPushNotificationPolicy.shouldProcessPush(
        isAppForeground: true,
        payload: threadPayload,
      ),
      isFalse,
    );
  });
}
