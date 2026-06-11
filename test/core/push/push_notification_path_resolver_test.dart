import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/push_notification_path_resolver.dart';
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

    test('prefers url when present', () {
      final String? path = resolvePushNotificationPath(<String, String>{
        'url': '/channels/@me/dm-1/msg-9',
        'channel_id': 'ignored',
      });
      expect(path, '/channels/@me/dm-1/msg-9');
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
