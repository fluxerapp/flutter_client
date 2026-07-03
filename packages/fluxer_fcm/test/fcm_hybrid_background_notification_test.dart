import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_fcm/fcm_background_display_hooks.dart';
import 'package:fluxer_fcm/fcm_background_handler_policy.dart';
import 'package:fluxer_fcm/fcm_background_notification_display.dart';
import 'package:fluxer_fcm/fcm_message_mapper.dart';
import 'package:fluxer_fcm/fcm_push_message.dart';

void main() {
  tearDown(FcmBackgroundDisplayHooks.resetForTesting);

  group('hybrid background notification regression', () {
    test('stripped notification uses generic display without enrichment', () {
      final RemoteMessage input = RemoteMessage(
        messageId: 'bg-regression',
        data: <String, String>{
          'channel_id': 'asdfqwer',
          'message_id': 'msg-1',
          'url': '/channels/@me/asdfqwer/msg-1',
        },
      );
      final FcmPushMessage mapped = mapRemoteMessage(input);
      expect(
        shouldDisplayFcmBackgroundLocalNotification(input, mapped),
        isTrue,
      );
      expect(resolveFcmBackgroundNotificationTitle(mapped), 'Fluxer');
      expect(resolveFcmBackgroundNotificationBody(mapped), 'New message');
    });

    test('enriched data title and body produce rich local notification', () {
      final RemoteMessage input = RemoteMessage(
        messageId: 'bg-regression',
        data: <String, String>{
          'title': 'Emptiest (#asdfqwer, a s d f)',
          'body': 'Pong!',
          'channel_id': 'asdfqwer',
          'message_id': 'msg-1',
          'url': '/channels/@me/asdfqwer/msg-1',
        },
      );
      final FcmPushMessage mapped = mapRemoteMessage(input);
      FcmBackgroundDisplayHooks.shouldDisplay = (FcmPushMessage message) {
        return message.payload['url']?.isNotEmpty == true;
      };
      expect(
        shouldDisplayFcmBackgroundLocalNotification(input, mapped),
        isTrue,
      );
      expect(
        resolveFcmBackgroundNotificationTitle(mapped),
        'Emptiest (#asdfqwer, a s d f)',
      );
      expect(resolveFcmBackgroundNotificationBody(mapped), 'Pong!');
    });

    test('local tap payload includes navigation fields and message id', () {
      final RemoteMessage input = RemoteMessage(
        messageId: 'gcm-42',
        data: <String, String>{
          'title': 'Emptiest (#asdfqwer)',
          'body': 'Pong!',
          'channel_id': 'asdfqwer',
          'message_id': 'msg-1',
          'url': '/channels/@me/asdfqwer/msg-1',
        },
      );
      final FcmPushMessage mapped = mapRemoteMessage(input);
      final Map<String, String> tapPayload = buildFcmBackgroundTapPayload(
        mapped,
      );
      expect(tapPayload['url'], '/channels/@me/asdfqwer/msg-1');
      expect(tapPayload['channel_id'], 'asdfqwer');
      expect(tapPayload['message_id'], 'msg-1');
      expect(tapPayload['_local_notification_message_id'], 'gcm-42');
    });
  });
}
