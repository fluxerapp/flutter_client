import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('isAutoAckEligible requires every live viewport condition', () {
    const eligibleViewport = ChatReadViewportState(
      channelId: 'channel-1',
      viewportActive: true,
      nearLoadedTail: true,
      foreground: true,
    );

    expect(
      isAutoAckEligible(
        viewport: eligibleViewport,
        channelId: 'channel-2',
        hasMoreNewerMessages: false,
      ),
      isFalse,
      reason: 'the active viewport must belong to the incoming channel',
    );
    expect(
      isAutoAckEligible(
        viewport: const ChatReadViewportState(
          channelId: 'channel-1',
          viewportActive: true,
          foreground: true,
        ),
        channelId: 'channel-1',
        hasMoreNewerMessages: false,
      ),
      isFalse,
      reason: 'geometry must be at the loaded tail',
    );
    expect(
      isAutoAckEligible(
        viewport: eligibleViewport,
        channelId: 'channel-1',
        hasMoreNewerMessages: true,
      ),
      isFalse,
      reason: 'the loaded tail must also be the live channel tail',
    );
    expect(
      isAutoAckEligible(
        viewport: const ChatReadViewportState(
          channelId: 'channel-1',
          viewportActive: true,
          nearLoadedTail: true,
        ),
        channelId: 'channel-1',
        hasMoreNewerMessages: false,
      ),
      isFalse,
      reason: 'backgrounded UI cannot auto-ack',
    );
    expect(
      isAutoAckEligible(
        viewport: const ChatReadViewportState(
          channelId: 'channel-1',
          nearLoadedTail: true,
          foreground: true,
        ),
        channelId: 'channel-1',
        hasMoreNewerMessages: false,
      ),
      isFalse,
      reason: 'a hidden or unmounted viewport cannot auto-ack',
    );
    expect(
      isAutoAckEligible(
        viewport: eligibleViewport,
        channelId: 'channel-1',
        hasMoreNewerMessages: false,
      ),
      isTrue,
    );
  });

  test('setActiveChannel resets geometry when the channel changes', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    container.read(chatReadViewportProvider.notifier)
      ..setActiveChannel('channel-1')
      ..setViewportActive(channelId: 'channel-1', isActive: true);
    await _flushMicrotasks();
    container
        .read(chatReadViewportProvider.notifier)
        .updateViewport(
          channelId: 'channel-1',
          nearLoadedTail: true,
          distanceFromBottom: 240,
          viewportHeight: 720,
        );

    container
        .read(chatReadViewportProvider.notifier)
        .setActiveChannel('channel-2');
    await _flushMicrotasks();

    final state = container.read(chatReadViewportProvider);
    expect(state.channelId, 'channel-2');
    expect(state.viewportActive, isFalse);
    expect(state.nearLoadedTail, isFalse);
    expect(state.distanceFromBottom, 0);
    expect(state.viewportHeight, 0);
  });

  test('foreground rebuild preserves channel and geometry', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    container.read(appUiForegroundProvider.notifier).setResumed(true);

    container.read(chatReadViewportProvider.notifier)
      ..setActiveChannel('channel-1')
      ..setViewportActive(channelId: 'channel-1', isActive: true);
    await _flushMicrotasks();
    container
        .read(chatReadViewportProvider.notifier)
        .updateViewport(
          channelId: 'channel-1',
          nearLoadedTail: true,
          distanceFromBottom: 64,
          viewportHeight: 640,
        );

    container.read(appUiForegroundProvider.notifier).setResumed(false);
    await _flushMicrotasks();

    final state = container.read(chatReadViewportProvider);
    expect(state.channelId, 'channel-1');
    expect(state.viewportActive, isTrue);
    expect(state.nearLoadedTail, isTrue);
    expect(state.distanceFromBottom, 64);
    expect(state.viewportHeight, 640);
    expect(state.foreground, isFalse);
    expect(state.canAutoAck, isFalse);
  });

  test(
    'viewport ownership tolerates activation order and stale teardown',
    () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(chatReadViewportProvider.notifier)
        ..setViewportActive(channelId: 'channel-2', isActive: true)
        ..setActiveChannel('channel-2');
      await _flushMicrotasks();
      expect(container.read(chatReadViewportProvider).viewportActive, isTrue);

      container
          .read(chatReadViewportProvider.notifier)
          .updateViewport(
            channelId: 'channel-1',
            nearLoadedTail: true,
            distanceFromBottom: 20,
            viewportHeight: 640,
          );
      expect(
        container.read(chatReadViewportProvider).nearLoadedTail,
        isFalse,
        reason: 'geometry from the old list must not update the new channel',
      );

      container
          .read(chatReadViewportProvider.notifier)
          .setViewportActive(channelId: 'channel-1', isActive: false);
      await _flushMicrotasks();
      expect(
        container.read(chatReadViewportProvider).viewportActive,
        isTrue,
        reason: 'teardown from the old list must not deactivate the new list',
      );

      container
          .read(chatReadViewportProvider.notifier)
          .setViewportActive(channelId: 'channel-2', isActive: false);
      await _flushMicrotasks();
      expect(container.read(chatReadViewportProvider).viewportActive, isFalse);
    },
  );
}

Future<void> _flushMicrotasks() async {
  for (var i = 0; i < 3; i++) {
    await pumpEventQueue();
  }
}
