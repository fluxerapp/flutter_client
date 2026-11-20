import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_api_features.dart';
import 'package:fluxer_app/core/push/notification/reply.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';
import 'package:fluxer_dart/export.dart' show MentionReplyPreferences;

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
        resolveReplyMention: (Map<String, String> payload) async => true,
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

    test('sends the resolved mention choice', () async {
      PushReplySend? sent;
      Map<String, String>? resolvedFor;
      await sendPushNotificationReply(
        payload: <String, String>{
          'channel_id': 'c',
          'message_id': 'm',
          'target_user_id': 'user-b',
          'guild_id': 'g',
          'author_id': 'author',
        },
        text: 'hi',
        lookupAccount: (String userId) async => accountB,
        post: (PushReplySend send) async {
          sent = send;
        },
        resolveReplyMention: (Map<String, String> payload) async {
          resolvedFor = payload;
          return false;
        },
      );
      expect(resolvedFor?['author_id'], 'author');
      expect(sent?.body['allowed_mentions'], <String, dynamic>{
        'replied_user': false,
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

  group('resolvePushReplyMention', () {
    const Map<String, String> guildPayload = <String, String>{
      'channel_id': 'c',
      'message_id': 'm',
      'target_user_id': 'user-b',
      'guild_id': 'g',
      'author_id': 'author',
    };

    Future<MentionReplyPreferences> Function(String, String) preferring(
      MentionReplyPreferences preference, {
      List<String>? calls,
    }) {
      return (String authorId, String guildId) async {
        calls?.add('$authorId@$guildId');
        return preference;
      };
    }

    test('does not mention authors who prefer no mention', () async {
      final List<String> calls = <String>[];
      expect(
        await resolvePushReplyMention(
          guildPayload,
          lookupPreference: preferring(
            MentionReplyPreferences.preferNoMention,
            calls: calls,
          ),
        ),
        isFalse,
      );
      expect(calls, <String>['author@g']);
    });

    test('mentions authors who prefer or do not mind a mention', () async {
      expect(
        await resolvePushReplyMention(
          guildPayload,
          lookupPreference: preferring(MentionReplyPreferences.preferMention),
        ),
        isTrue,
      );
      expect(
        await resolvePushReplyMention(
          guildPayload,
          lookupPreference: preferring(MentionReplyPreferences.noPreference),
        ),
        isTrue,
      );
    });

    test('falls back to mentioning when the lookup fails', () async {
      expect(
        await resolvePushReplyMention(
          guildPayload,
          lookupPreference: (String authorId, String guildId) =>
              Future<MentionReplyPreferences>.error(StateError('no db')),
        ),
        isTrue,
      );
    });

    test('does not mention in DMs or on own messages', () async {
      final List<String> calls = <String>[];
      expect(
        await resolvePushReplyMention(
          <String, String>{...guildPayload}..remove('guild_id'),
          lookupPreference: preferring(
            MentionReplyPreferences.preferMention,
            calls: calls,
          ),
        ),
        isFalse,
      );
      expect(
        await resolvePushReplyMention(
          <String, String>{...guildPayload, 'author_id': 'user-b'},
          lookupPreference: preferring(
            MentionReplyPreferences.preferMention,
            calls: calls,
          ),
        ),
        isFalse,
      );
      expect(calls, isEmpty);
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

  test('reply requests carry the client features header', () {
    final Map<String, String> headers = pushReplyHeaders('token');
    expect(headers[fluxerApiFeaturesHeaderName], contains('channel_threads'));
  });
}
