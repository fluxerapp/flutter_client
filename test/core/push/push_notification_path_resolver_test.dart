import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/push_notification_path_resolver.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/core/router/route_names.dart';

void main() {
  group('resolvePushNotificationPath', () {
    test('resolves DM channel from channel_id', () {
      final String? path = resolvePushNotificationPath(<String, String>{
        'channel_id': 'dm-1',
      });
      expect(path, RoutePaths.dmChannel('dm-1'));
    });

    test('resolves DM message from channel_id and message_id', () {
      final String? path = resolvePushNotificationPath(<String, String>{
        'channel_id': 'dm-1',
        'message_id': 'msg-9',
        'guild_id': '@me',
      });
      expect(path, RoutePaths.dmChannelMessage('dm-1', 'msg-9'));
    });

    test('treats serialized null guild_id as DM', () {
      final String? path = resolvePushNotificationPath(<String, String>{
        'channel_id': 'dm-2',
        'message_id': 'msg-3',
        'guild_id': 'null',
      });
      expect(path, RoutePaths.dmChannelMessage('dm-2', 'msg-3'));
    });

    test('prefers url when present', () {
      final String? path = resolvePushNotificationPath(<String, String>{
        'url': '/channels/@me/dm-1/msg-9',
        'channel_id': 'ignored',
      });
      expect(path, '/channels/@me/dm-1/msg-9');
    });

    test('resolves absolute https DM url', () {
      final String? path = resolvePushNotificationPath(<String, String>{
        'url': 'https://web.fluxer.app/channels/@me/dm-1/msg-9',
      });
      expect(path, '/channels/@me/dm-1/msg-9');
    });

    test('resolves guild channel from navigate field after normalization', () {
      final Map<String, String> payload =
          normalizePushTapPayload(<String, String>{
            'navigate': '/channels/guild-1/chan-1/msg-1',
            'channel_id': 'chan-1',
            'message_id': 'msg-1',
            'guild_id': 'guild-1',
          });
      final String? path = resolvePushNotificationPath(payload);
      expect(
        path,
        RoutePaths.guildChannelMessage('guild-1', 'chan-1', 'msg-1'),
      );
    });

    test('resolves guild channel from ids', () {
      final String? path = resolvePushNotificationPath(<String, String>{
        'guild_id': 'guild-1',
        'channel_id': 'chan-1',
        'message_id': 'msg-1',
      });
      expect(
        path,
        RoutePaths.guildChannelMessage('guild-1', 'chan-1', 'msg-1'),
      );
    });

    test('returns null when channel_id is missing', () {
      final String? path = resolvePushNotificationPath(<String, String>{
        'message_id': 'msg-1',
      });
      expect(path, isNull);
    });
  });
}
