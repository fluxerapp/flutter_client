import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_fcm/fcm_background_display_hooks.dart';
import 'package:fluxer_fcm/fcm_background_handler_policy.dart';
import 'package:fluxer_fcm/fcm_message_mapper.dart';
import 'package:fluxer_fcm/fcm_push_message.dart';

void main() {
  tearDown(FcmBackgroundDisplayHooks.resetForTesting);

  group('shouldDisplayFcmBackgroundLocalNotification', () {
    test('displays for data-only messages', () {
      final RemoteMessage input = RemoteMessage(
        messageId: 'msg-data',
        data: <String, String>{'channel_id': '2', 'url': '/channels/@me/2/1'},
      );
      final FcmPushMessage mapped = mapRemoteMessage(input);
      expect(
        shouldDisplayFcmBackgroundLocalNotification(input, mapped),
        isTrue,
      );
    });

    test('skips hybrid messages when display hook is unset', () {
      final RemoteMessage input = RemoteMessage(
        messageId: 'msg-hybrid',
        data: <String, String>{'channel_id': '2', 'url': '/channels/@me/2/1'},
        notification: const RemoteNotification(title: 'alice', body: 'hello'),
      );
      final FcmPushMessage mapped = mapRemoteMessage(input);
      expect(
        shouldDisplayFcmBackgroundLocalNotification(input, mapped),
        isFalse,
      );
    });

    test('never displays a clear push', () {
      for (final Map<String, String> data in <Map<String, String>>[
        <String, String>{
          'type': 'notification_clear',
          'channel_id': '2',
          'url': '/channels/@me/2/1',
        },
        <String, String>{
          'action': 'clear_channel',
          'channel_id': '2',
          'url': '/channels/@me/2/1',
        },
      ]) {
        final RemoteMessage input = RemoteMessage(
          messageId: 'msg-clear',
          data: data,
        );
        final FcmPushMessage mapped = mapRemoteMessage(input);
        expect(shouldHandleFcmBackgroundNotificationClear(mapped), isTrue);
        expect(
          shouldDisplayFcmBackgroundLocalNotification(input, mapped),
          isFalse,
        );
      }
    });

    test('never displays a clear push even when the hook votes to display', () {
      FcmBackgroundDisplayHooks.shouldDisplay = (FcmPushMessage message) =>
          true;
      final RemoteMessage input = RemoteMessage(
        messageId: 'msg-clear',
        data: <String, String>{
          'type': 'notification_clear',
          'channel_id': '2',
          'url': '/channels/@me/2/1',
        },
      );
      final FcmPushMessage mapped = mapRemoteMessage(input);
      expect(
        shouldDisplayFcmBackgroundLocalNotification(input, mapped),
        isFalse,
      );
    });

    test('ordinary data-only messages are not treated as clears', () {
      final RemoteMessage input = RemoteMessage(
        messageId: 'msg-data',
        data: <String, String>{'channel_id': '2', 'url': '/channels/@me/2/1'},
      );
      final FcmPushMessage mapped = mapRemoteMessage(input);
      expect(shouldHandleFcmBackgroundNotificationClear(mapped), isFalse);
      expect(
        shouldDisplayFcmBackgroundLocalNotification(input, mapped),
        isTrue,
      );
    });

    test(
      'displays hybrid messages when display hook allows navigable payload',
      () {
        FcmBackgroundDisplayHooks.shouldDisplay = (FcmPushMessage message) {
          return message.payload['url']?.isNotEmpty == true;
        };
        final RemoteMessage input = RemoteMessage(
          messageId: 'msg-hybrid',
          data: <String, String>{'channel_id': '2', 'url': '/channels/@me/2/1'},
          notification: const RemoteNotification(title: 'alice', body: 'hello'),
        );
        final FcmPushMessage mapped = mapRemoteMessage(input);
        expect(
          shouldDisplayFcmBackgroundLocalNotification(input, mapped),
          isTrue,
        );
      },
    );
  });
}
