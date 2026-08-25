import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:test/test.dart';

void main() {
  group('ActiveCalls', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('updateCall resets pendingRingUserIds from ringing payload', () {
      container.read(activeCallsProvider.notifier)
        ..createCall('channel-1', ringing: <String>['user-1', 'user-2'])
        ..updateCall('channel-1', ringing: <String>['user-2']);

      final CallState? call = container.read(activeCallsProvider)['channel-1'];
      expect(call?.pendingRingUserIds, {'user-2'});
      expect(call?.ringing, ['user-2']);
    });

    test('updateCall with empty ringing clears pendingRingUserIds', () {
      container.read(activeCallsProvider.notifier)
        ..createCall('channel-1', ringing: <String>['user-1'])
        ..updateCall('channel-1', ringing: <String>[]);

      final CallState? call = container.read(activeCallsProvider)['channel-1'];
      expect(call?.pendingRingUserIds, isEmpty);
      expect(call?.ringing, isEmpty);
    });

    test('updateCall without ringing keeps existing pendingRingUserIds', () {
      container.read(activeCallsProvider.notifier)
        ..createCall('channel-1', ringing: <String>['user-1'])
        ..updateCall('channel-1', region: 'us-east');

      final CallState? call = container.read(activeCallsProvider)['channel-1'];
      expect(call?.pendingRingUserIds, {'user-1'});
      expect(call?.region, 'us-east');
    });

    test('removeUserFromPendingRing clears one user', () {
      container.read(activeCallsProvider.notifier)
        ..createCall('channel-1', ringing: <String>['user-1', 'user-2'])
        ..removeUserFromPendingRing(channelId: 'channel-1', userId: 'user-1');

      final CallState? call = container.read(activeCallsProvider)['channel-1'];
      expect(call?.pendingRingUserIds, {'user-2'});
    });

    test('isChannelPendingRingForUser reflects pending set', () {
      final ActiveCalls notifier = container.read(activeCallsProvider.notifier)
        ..createCall('channel-1', ringing: <String>['user-1']);

      expect(
        notifier.isChannelPendingRingForUser(
          channelId: 'channel-1',
          userId: 'user-1',
        ),
        isTrue,
      );
      expect(
        notifier.isChannelPendingRingForUser(
          channelId: 'channel-1',
          userId: 'user-2',
        ),
        isFalse,
      );
    });
  });
}
