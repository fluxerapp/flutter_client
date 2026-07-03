import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_fcm/fcm_background_notification_display.dart';
import 'package:fluxer_fcm/fcm_push_message.dart';

void main() {
  group('resolveFcmBackgroundNotificationTitle', () {
    test('uses message title when present', () {
      final FcmPushMessage message = FcmPushMessage(
        id: '1',
        title: 'Emptiest (#asdfqwer)',
        body: 'Pong!',
        payload: <String, String>{},
      );
      expect(
        resolveFcmBackgroundNotificationTitle(message),
        'Emptiest (#asdfqwer)',
      );
    });

    test('falls back to Fluxer when title is absent', () {
      final FcmPushMessage message = FcmPushMessage(
        id: '1',
        title: kFcmBackgroundNotificationFallbackTitle,
        body: 'Pong!',
        payload: <String, String>{},
      );
      expect(
        resolveFcmBackgroundNotificationTitle(message),
        kFcmBackgroundNotificationFallbackTitle,
      );
    });
  });

  group('resolveFcmBackgroundNotificationBody', () {
    test('uses message body when present', () {
      final FcmPushMessage message = FcmPushMessage(
        id: '1',
        title: 'alice',
        body: 'Pong!',
        payload: <String, String>{},
      );
      expect(resolveFcmBackgroundNotificationBody(message), 'Pong!');
    });

    test('falls back to New message when body is empty', () {
      final FcmPushMessage message = FcmPushMessage(
        id: '1',
        title: 'alice',
        body: kFcmBackgroundNotificationFallbackBody,
        payload: <String, String>{},
      );
      expect(
        resolveFcmBackgroundNotificationBody(message),
        kFcmBackgroundNotificationFallbackBody,
      );
    });
  });

  group('buildFcmBackgroundTapPayload', () {
    test('embeds navigation fields and local notification message id', () {
      final FcmPushMessage message = FcmPushMessage(
        id: 'gcm-9',
        title: 'alice',
        body: 'hello',
        payload: <String, String>{
          'url': '/channels/@me/dm-1/msg-9',
          'channel_id': 'dm-1',
          'message_id': 'msg-9',
        },
      );
      final Map<String, String> payload = buildFcmBackgroundTapPayload(message);
      expect(payload['url'], '/channels/@me/dm-1/msg-9');
      expect(payload['channel_id'], 'dm-1');
      expect(payload['message_id'], 'msg-9');
      expect(payload['_local_notification_message_id'], 'gcm-9');
    });
  });
}
