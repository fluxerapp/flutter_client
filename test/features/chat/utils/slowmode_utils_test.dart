import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/messages/forward_destinations_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:fluxer_app/features/chat/utils/slowmode_utils.dart';

void main() {
  group('slowmode_utils', () {
    late ProviderContainer container;
    late SlowmodeTracker tracker;

    setUp(() {
      container = ProviderContainer();
      addTearDown(container.dispose);
      tracker = container.read(slowmodeTrackerProvider.notifier);
    });

    test('isForwardDestinationCoolingDown returns true when cooling', () {
      tracker.updateCooldownRemaining('channel-1', 30_000);
      const ForwardDestination destination = ForwardDestination(
        channelId: 'channel-1',
        displayName: 'general',
        kind: ForwardDestinationKind.guildText,
        guildName: 'Guild',
        slowmodeEnabled: true,
        rateLimitPerUser: 30,
      );

      expect(
        isForwardDestinationCoolingDown(
          destination: destination,
          tracker: tracker,
        ),
        isTrue,
      );
    });

    test(
      'isForwardDestinationCoolingDown returns false when slowmode disabled',
      () {
        tracker.updateCooldownRemaining('channel-1', 30_000);
        const ForwardDestination destination = ForwardDestination(
          channelId: 'channel-1',
          displayName: 'general',
          kind: ForwardDestinationKind.guildText,
          guildName: 'Guild',
          rateLimitPerUser: 30,
        );

        expect(
          isForwardDestinationCoolingDown(
            destination: destination,
            tracker: tracker,
          ),
          isFalse,
        );
      },
    );

    test(
      'isAnySelectedDestinationCoolingDown returns true for cooling selection',
      () {
        tracker.updateCooldownRemaining('channel-1', 30_000);
        const destinations = <ForwardDestination>[
          ForwardDestination(
            channelId: 'channel-1',
            displayName: 'general',
            kind: ForwardDestinationKind.guildText,
            guildName: 'Guild',
            slowmodeEnabled: true,
            rateLimitPerUser: 30,
          ),
        ];

        expect(
          isAnySelectedDestinationCoolingDown(
            tracker: tracker,
            destinations: destinations,
            selectedChannelIds: <String>{'channel-1'},
          ),
          isTrue,
        );
      },
    );

    test('isAnySelectedDestinationCoolingDown ignores unselected channels', () {
      tracker.updateCooldownRemaining('channel-1', 30_000);
      const destinations = <ForwardDestination>[
        ForwardDestination(
          channelId: 'channel-1',
          displayName: 'general',
          kind: ForwardDestinationKind.guildText,
          guildName: 'Guild',
          slowmodeEnabled: true,
          rateLimitPerUser: 30,
        ),
      ];

      expect(
        isAnySelectedDestinationCoolingDown(
          tracker: tracker,
          destinations: destinations,
          selectedChannelIds: <String>{},
        ),
        isFalse,
      );
    });

    test('applySlowmodeRateLimitError updates tracker on slowmode error', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/channels/1/messages'),
        response: Response<dynamic>(
          requestOptions: RequestOptions(path: '/channels/1/messages'),
          data: <String, dynamic>{
            'code': 'SLOWMODE_RATE_LIMITED',
            'retry_after': 12,
          },
        ),
      );

      applySlowmodeRateLimitError(
        tracker: tracker,
        channelId: 'channel-1',
        error: error,
      );

      expect(
        tracker.remainingFor('channel-1', 30).inMilliseconds,
        greaterThan(10_000),
      );
    });
  });
}
