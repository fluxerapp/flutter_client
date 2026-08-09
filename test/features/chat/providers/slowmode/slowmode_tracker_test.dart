import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  group('SlowmodeTracker', () {
    late ProviderContainer container;
    late SlowmodeTracker tracker;

    setUp(() {
      container = ProviderContainer();
      addTearDown(container.dispose);
      tracker = container.read(slowmodeTrackerProvider.notifier);
    });

    test('remainingFor uses server cooldown when it is longer than local', () {
      tracker.updateCooldownRemaining('channel-1', 30_000);
      tracker.recordSend('channel-1');

      final Duration remaining = tracker.remainingFor('channel-1', 5);

      expect(remaining.inMilliseconds, greaterThan(25_000));
    });

    test('remainingFor uses local cooldown when it is longer than server', () {
      tracker.updateCooldownRemaining('channel-1', 1_000);
      tracker.recordSend('channel-1');

      final Duration remaining = tracker.remainingFor('channel-1', 30);

      expect(remaining.inSeconds, greaterThan(25));
    });

    test('syncFromResponse clears state when user can bypass', () {
      tracker.recordSend('channel-1');
      tracker.updateCooldownRemaining('channel-1', 30_000);

      tracker.syncFromResponse(
        'channel-1',
        const ChannelSlowmodeStateResponse(
          rateLimitPerUser: 30,
          retryAfterMs: 15_000,
          nextSendAllowedAt: null,
          canBypass: true,
        ),
      );

      expect(tracker.remainingFor('channel-1', 30), Duration.zero);
    });

    test('syncFromResponse clears state when retry_after_ms is zero', () {
      tracker.updateCooldownRemaining('channel-1', 30_000);

      tracker.syncFromResponse(
        'channel-1',
        const ChannelSlowmodeStateResponse(
          rateLimitPerUser: 30,
          retryAfterMs: 0,
          nextSendAllowedAt: null,
          canBypass: false,
        ),
      );

      expect(tracker.remainingFor('channel-1', 30), Duration.zero);
    });

    test('syncFromResponse applies server cooldown', () {
      tracker.syncFromResponse(
        'channel-1',
        const ChannelSlowmodeStateResponse(
          rateLimitPerUser: 30,
          retryAfterMs: 12_000,
          nextSendAllowedAt: null,
          canBypass: false,
        ),
      );

      expect(
        tracker.remainingFor('channel-1', 30).inMilliseconds,
        greaterThan(10_000),
      );
    });

    test('clearChannel removes both local and server cooldown state', () {
      tracker.recordSend('channel-1');
      tracker.updateCooldownRemaining('channel-1', 30_000);

      tracker.clearChannel('channel-1');

      expect(tracker.remainingFor('channel-1', 30), Duration.zero);
    });
  });
}
