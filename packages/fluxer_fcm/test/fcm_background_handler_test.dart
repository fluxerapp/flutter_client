import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_fcm/fcm_background_display_hooks.dart';
import 'package:fluxer_fcm/fcm_background_handler_policy.dart';
import 'package:fluxer_fcm/fcm_message_mapper.dart';
import 'package:fluxer_fcm/fcm_push_message.dart';

void main() {
  tearDown(FcmBackgroundDisplayHooks.resetForTesting);

  group('fcm background handler policy', () {
    test('maps data-only messages for local display', () {
      final RemoteMessage input = RemoteMessage(
        messageId: 'bg-data',
        data: <String, String>{
          'title': 'alice',
          'body': 'hello',
          'channel_id': 'dm-1',
          'message_id': 'msg-9',
          'url': '/channels/@me/dm-1/msg-9',
        },
      );
      final FcmPushMessage mapped = mapRemoteMessage(input);
      expect(
        shouldDisplayFcmBackgroundLocalNotification(input, mapped),
        isTrue,
      );
      expect(mapped.payload['url'], '/channels/@me/dm-1/msg-9');
      expect(mapped.payload['channel_id'], 'dm-1');
    });

    test('shows hybrid messages when display hook marks payload navigable', () {
      FcmBackgroundDisplayHooks.shouldDisplay = (FcmPushMessage message) {
        return message.payload.containsKey('url');
      };
      final RemoteMessage input = RemoteMessage(
        messageId: 'bg-hybrid',
        data: <String, String>{
          'channel_id': 'dm-1',
          'message_id': 'msg-9',
          'url': '/channels/@me/dm-1/msg-9',
        },
        notification: const RemoteNotification(title: 'alice', body: 'hello'),
      );
      final FcmPushMessage mapped = mapRemoteMessage(input);
      expect(
        shouldDisplayFcmBackgroundLocalNotification(input, mapped),
        isTrue,
      );
      expect(mapped.payload['url'], '/channels/@me/dm-1/msg-9');
    });
  });
}
