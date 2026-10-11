import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_kind.dart';

void main() {
  group('extractChannelId', () {
    test('resolves DM channel without message segment', () {
      expect(extractChannelId('/channels/@me/dm-1'), 'dm-1');
    });

    test('resolves DM channel from message jump path', () {
      expect(extractChannelId('/channels/@me/dm-1/msg-9'), 'dm-1');
    });

    test('resolves guild channel from message jump path', () {
      expect(extractChannelId('/channels/guild-1/chan-1/msg-1'), 'chan-1');
    });

    test('resolves favorites channel from message jump path', () {
      expect(extractChannelId('/channels/@favorites/fav-1/msg-2'), 'fav-1');
    });

    test('returns null for guild members route', () {
      expect(extractChannelId('/channels/guild-1/members'), isNull);
    });

    test('returns null for discover route', () {
      expect(extractChannelId('/channels/@discover'), isNull);
    });
  });

  group('classifyRoute', () {
    test('classifies discover route', () {
      expect(classifyRoute('/channels/@discover'), RouteKind.discover);
    });
  });

  group('deletedChannelExitPath', () {
    test('sends an open guild channel back to its guild root', () {
      expect(
        deletedChannelExitPath(
          location: '/channels/guild-1/chan-1',
          channelId: 'chan-1',
        ),
        '/channels/guild-1',
      );
    });

    test('sends a guild message jump back to its guild root', () {
      expect(
        deletedChannelExitPath(
          location: '/channels/guild-1/chan-1/msg-1',
          channelId: 'chan-1',
        ),
        '/channels/guild-1',
      );
    });

    test('sends an open DM back to the DM list', () {
      expect(
        deletedChannelExitPath(
          location: '/channels/@me/dm-1',
          channelId: 'dm-1',
        ),
        '/channels/@me',
      );
    });

    test('sends an open favorite back to the favorites list', () {
      expect(
        deletedChannelExitPath(
          location: '/channels/@favorites/chan-1',
          channelId: 'chan-1',
        ),
        '/channels/@favorites',
      );
    });

    test('leaves the route alone when another channel is open', () {
      expect(
        deletedChannelExitPath(
          location: '/channels/guild-1/chan-2',
          channelId: 'chan-1',
        ),
        isNull,
      );
    });

    test('leaves the route alone off a chat route', () {
      expect(
        deletedChannelExitPath(
          location: '/channels/guild-1',
          channelId: 'chan-1',
        ),
        isNull,
      );
    });
  });
}
