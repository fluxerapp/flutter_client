import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/push_notification_ids.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
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

  group('androidNotificationReplyTarget', () {
    test('message replies identify the account without a token', () {
      final AndroidNotificationReplyTarget? target =
          androidNotificationReplyTarget(<String, String>{
            'channel_id': 'c',
            'message_id': 'm',
            'target_user_id': 'user-b',
          });
      expect(target?.channelId, 'c');
      expect(target?.messageId, 'm');
      expect(target?.userId, 'user-b');
    });

    test('clears and missing accounts are not reply targets', () {
      expect(
        androidNotificationReplyTarget(<String, String>{
          'action': 'clear_channel',
          'channel_id': 'c',
          'message_id': 'm',
          'target_user_id': 'user-b',
        }),
        isNull,
      );
      expect(
        androidNotificationReplyTarget(<String, String>{
          'channel_id': 'c',
          'message_id': 'm',
        }),
        isNull,
      );
    });
  });

  group('pushReplyDismissal', () {
    test('uses the posted id and display tag', () {
      final PushReplyDismissal? dismissal = pushReplyDismissal(
        notificationId: 42,
        payload: <String, String>{
          'channel_id': 'c',
          'message_id': 'm',
          'tag': 'channel:c:m',
        },
      );
      expect(dismissal?.id, 42);
      expect(dismissal?.tag, 'channel:c:m');
    });

    test('falls back to the message id when the response id is missing', () {
      final PushReplyDismissal? dismissal = pushReplyDismissal(
        notificationId: 0,
        payload: <String, String>{
          kLocalNotificationMessageIdKey: 'local-1',
          'channel_id': 'c',
        },
      );
      expect(dismissal?.id, pushMessageNotificationId('local-1'));
      expect(
        dismissal?.tag,
        resolvePushDisplayTag(<String, String>{
          kLocalNotificationMessageIdKey: 'local-1',
          'channel_id': 'c',
        }),
      );
    });

    test('returns null when there is nothing to dismiss', () {
      expect(
        pushReplyDismissal(
          notificationId: null,
          payload: const <String, String>{},
        ),
        isNull,
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
