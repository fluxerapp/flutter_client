import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_dart/gateway_client/event_parser.dart';
import 'package:fluxer_dart/gateway_client/gateway_event.dart';

void main() {
  const parser = EventParser();

  group('parseList', () {
    test('parses USER_PINNED_DMS_UPDATE as channel id list', () {
      final event = parser.parseList('USER_PINNED_DMS_UPDATE', <dynamic>[
        'ch-1',
        'ch-2',
      ]);

      expect(event, isA<UserPinnedDmsUpdateEvent>());
      final pinnedEvent = event! as UserPinnedDmsUpdateEvent;
      expect(pinnedEvent.pinnedDmChannelIds, ['ch-1', 'ch-2']);
    });

    test('coerces numeric snowflakes to strings', () {
      final event = parser.parseList('USER_PINNED_DMS_UPDATE', <dynamic>[
        123456789012345678,
        987654321098765432,
      ]);

      expect(event, isA<UserPinnedDmsUpdateEvent>());
      final pinnedEvent = event! as UserPinnedDmsUpdateEvent;
      expect(pinnedEvent.pinnedDmChannelIds, [
        '123456789012345678',
        '987654321098765432',
      ]);
    });

    test('returns null for unknown list event types', () {
      final event = parser.parseList('UNKNOWN_LIST_EVENT', <dynamic>['value']);

      expect(event, isNull);
    });
  });
}
