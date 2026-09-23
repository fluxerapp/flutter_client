import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/push_notification_reply.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';

void main() {
  group('pushNotificationCanReply', () {
    test('message payloads can reply', () {
      expect(
        pushNotificationCanReply(<String, String>{
          'channel_id': 'c',
          'message_id': 'm',
          'target_user_id': 'user-b',
        }),
        isTrue,
      );
    });

    test('clears and incomplete payloads cannot reply', () {
      expect(
        pushNotificationCanReply(<String, String>{
          'type': 'notification_clear',
          'channel_id': 'c',
          'message_id': 'm',
        }),
        isFalse,
      );
      expect(
        pushNotificationCanReply(<String, String>{'channel_id': 'c'}),
        isFalse,
      );
    });
  });

  group('androidPushReplyActions', () {
    test('message action stays in the background', () {
      final List<AndroidNotificationAction> actions = androidPushReplyActions(
        <String, String>{'channel_id': 'c', 'message_id': 'm'},
        title: 'Reply',
        hint: 'Message',
      );
      expect(actions, hasLength(1));
      expect(actions.single.id, kPushReplyActionId);
      expect(actions.single.showsUserInterface, isFalse);
      expect(actions.single.cancelNotification, isFalse);
      expect(actions.single.inputs.single.label, 'Message');
    });

    test('clears have no reply action', () {
      expect(
        androidPushReplyActions(
          <String, String>{
            'action': 'clear_channel',
            'channel_id': 'c',
            'message_id': 'm',
          },
          title: 'Reply',
          hint: 'Message',
        ),
        isEmpty,
      );
    });
  });

  group('sendPushNotificationReply', () {
    const PushReplyAccount accountB = PushReplyAccount(
      token: 'token-b',
      apiBaseUrl: 'https://example.test/v1',
    );

    test('posts as the notification account', () async {
      String? lookedUpUser;
      PushReplySend? sent;
      final PushReplyResult result = await sendPushNotificationReply(
        payload: <String, String>{
          'channel_id': 'c',
          'message_id': 'm',
          'target_user_id': 'user-b',
        },
        text: ' hello ',
        lookupAccount: (String userId) async {
          lookedUpUser = userId;
          return accountB;
        },
        post: (PushReplySend send) async {
          sent = send;
        },
      );
      expect(result, PushReplyResult.sent);
      expect(lookedUpUser, 'user-b');
      expect(sent?.token, 'token-b');
      expect(sent?.apiBaseUrl, 'https://example.test/v1');
      expect(sent?.channelId, 'c');
      expect(sent?.body['content'], 'hello');
      expect(sent?.body['message_reference'], <String, dynamic>{
        'message_id': 'm',
      });
      expect(sent?.body['allowed_mentions'], <String, dynamic>{
        'replied_user': true,
      });
    });

    test('does not send when the text or ids are missing', () async {
      var lookups = 0;
      Future<PushReplyAccount?> lookup(String userId) async {
        lookups++;
        return accountB;
      }

      expect(
        await sendPushNotificationReply(
          payload: <String, String>{
            'channel_id': 'c',
            'message_id': 'm',
            'target_user_id': 'user-b',
          },
          text: '   ',
          lookupAccount: lookup,
        ),
        PushReplyResult.skipped,
      );
      expect(
        await sendPushNotificationReply(
          payload: <String, String>{
            'type': 'notification_clear',
            'channel_id': 'c',
            'message_id': 'm',
            'target_user_id': 'user-b',
          },
          text: 'hi',
          lookupAccount: lookup,
        ),
        PushReplyResult.skipped,
      );
      expect(
        await sendPushNotificationReply(
          payload: <String, String>{'channel_id': 'c', 'message_id': 'm'},
          text: 'hi',
          lookupAccount: lookup,
        ),
        PushReplyResult.skipped,
      );
      expect(lookups, 0);
    });

    test('fails when that account has no token', () async {
      var posted = false;
      final PushReplyResult result = await sendPushNotificationReply(
        payload: <String, String>{
          'channel_id': 'c',
          'message_id': 'm',
          'target_user_id': 'user-b',
        },
        text: 'hi',
        lookupAccount: (String userId) async => null,
        post: (PushReplySend send) async {
          posted = true;
        },
      );
      expect(result, PushReplyResult.failed);
      expect(posted, isFalse);
    });
  });

  group('lookupPushReplyAccount', () {
    test('reads token and api url from storage', () async {
      final MapAuthTokenStorage storage = MapAuthTokenStorage();
      await storage.saveToken(userId: 'user-b', token: 'token-b');
      await storage.saveApiBaseUrl(
        userId: 'user-b',
        apiBaseUrl: 'https://chat.example.com/api',
      );

      final PushReplyAccount? account = await lookupPushReplyAccount(
        'user-b',
        tokenStorage: storage,
      );

      expect(account?.token, 'token-b');
      expect(account?.apiBaseUrl, 'https://chat.example.com/api');
    });

    test('returns null when no api url is stored', () async {
      final MapAuthTokenStorage storage = MapAuthTokenStorage();
      await storage.saveToken(userId: 'user-b', token: 'token-b');

      expect(
        await lookupPushReplyAccount('user-b', tokenStorage: storage),
        isNull,
      );
    });

    test('returns null when that account has no token', () async {
      expect(
        await lookupPushReplyAccount(
          'user-b',
          tokenStorage: MapAuthTokenStorage(),
        ),
        isNull,
      );
    });
  });
}
