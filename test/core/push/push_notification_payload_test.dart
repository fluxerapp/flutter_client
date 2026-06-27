import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';

void main() {
  group('isNotificationClearPayload', () {
    test('detects clear packets from root payload fields', () {
      expect(
        isNotificationClearPayload(const <String, String>{
          'type': 'notification_clear',
        }),
        isTrue,
      );
      expect(
        isNotificationClearPayload(const <String, String>{
          'action': 'clear_channel',
        }),
        isTrue,
      );
      expect(
        isNotificationClearPayload(const <String, String>{'channel_id': '123'}),
        isFalse,
      );
    });
  });

  group('resolvePushChannelId', () {
    test('reads channel_id directly', () {
      expect(
        resolvePushChannelId(const <String, String>{'channel_id': '456'}),
        '456',
      );
    });

    test('derives channel id from channel tag', () {
      expect(
        resolvePushChannelId(const <String, String>{'tag': 'channel:456:789'}),
        '456',
      );
    });

    test('derives channel id from DM message url', () {
      expect(
        resolvePushChannelId(const <String, String>{
          'url': '/channels/@me/dm-1/msg-9',
        }),
        'dm-1',
      );
    });

    test('derives channel id from guild message navigate field', () {
      expect(
        resolvePushChannelId(const <String, String>{
          'navigate': '/channels/guild-1/chan-1/msg-1',
        }),
        'chan-1',
      );
    });

    test('derives channel id from absolute https url', () {
      expect(
        resolvePushChannelId(const <String, String>{
          'url': 'https://web.fluxer.app/channels/@me/dm-2/msg-3',
        }),
        'dm-2',
      );
    });
  });

  group('resolvePushNotificationTag', () {
    test('prefers explicit tag fields', () {
      expect(
        resolvePushNotificationTag(const <String, String>{
          'tag': 'channel:1:2',
          'notification_tag': 'channel:1',
        }),
        'channel:1:2',
      );
    });

    test('falls back to channel tag from channel_id', () {
      expect(
        resolvePushNotificationTag(const <String, String>{'channel_id': '99'}),
        'channel:99',
      );
    });

    test('falls back to channel tag from url when channel_id is missing', () {
      expect(
        resolvePushNotificationTag(const <String, String>{
          'url': '/channels/@me/dm-9/msg-1',
        }),
        'channel:dm-9',
      );
    });
  });

  group('resolvePushGroupTag', () {
    test('uses notification_tag for Android grouping', () {
      expect(
        resolvePushGroupTag(const <String, String>{
          'tag': 'channel:10:20',
          'notification_tag': 'channel:10',
        }),
        'channel:10',
      );
    });

    test('derives group tag from url when newer fields are missing', () {
      expect(
        resolvePushGroupTag(const <String, String>{
          'url': '/channels/guild-1/chan-5/msg-1',
        }),
        'channel:chan-5',
      );
    });
  });

  group('resolvePushDisplayTag', () {
    test('uses per-message tag when present', () {
      expect(
        resolvePushDisplayTag(const <String, String>{
          'tag': 'channel:1:2',
          'channel_id': '1',
        }),
        'channel:1:2',
      );
    });

    test('falls back to channel tag when message tag is missing', () {
      expect(
        resolvePushDisplayTag(const <String, String>{'channel_id': '77'}),
        'channel:77',
      );
    });
  });

  group('enrichPushPayload', () {
    test('backfills channel_id and notification_tag from url', () {
      final Map<String, String> enriched = enrichPushPayload(
        const <String, String>{'url': '/channels/@me/dm-3/msg-4'},
      );
      expect(enriched['channel_id'], 'dm-3');
      expect(enriched['notification_tag'], 'channel:dm-3');
    });
  });

  group('isDmPushPayload', () {
    test('detects DMs from missing, @me, and null guild_id', () {
      expect(isDmPushPayload(const <String, String>{}), isTrue);
      expect(
        isDmPushPayload(const <String, String>{'guild_id': '@me'}),
        isTrue,
      );
      expect(
        isDmPushPayload(const <String, String>{'guild_id': 'null'}),
        isTrue,
      );
      expect(
        isDmPushPayload(const <String, String>{'guild_id': 'guild-1'}),
        isFalse,
      );
    });
  });

  group('normalizePushTapPayload', () {
    test('unwraps nested data json for navigation fields', () {
      final Map<String, String> normalized =
          normalizePushTapPayload(<String, String>{
            'data':
                '{"channel_id":"dm-1","message_id":"msg-1","guild_id":"null",'
                '"url":"/channels/@me/dm-1/msg-1"}',
          });
      expect(normalized['channel_id'], 'dm-1');
      expect(normalized['message_id'], 'msg-1');
      expect(normalized['url'], '/channels/@me/dm-1/msg-1');
      expect(normalized['notification_tag'], 'channel:dm-1');
      expect(normalized.containsKey('data'), isFalse);
    });

    test('maps navigate to url when url is missing', () {
      final Map<String, String> normalized = normalizePushTapPayload(
        <String, String>{'navigate': '/channels/10/20/30', 'channel_id': '20'},
      );
      expect(normalized['url'], '/channels/10/20/30');
      expect(normalized.containsKey('navigate'), isFalse);
    });
  });
}
