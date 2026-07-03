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
}
