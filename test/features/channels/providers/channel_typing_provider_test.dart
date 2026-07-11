import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/providers/channel_typing_provider.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';

void main() {
  ProviderContainer makeContainer() {
    final container = ProviderContainer(
      overrides: [currentUserIdProvider.overrideWithValue('me')],
    );
    addTearDown(container.dispose);
    return container;
  }

  test('isUserTypingInChannel reports remote typing for a user', () {
    final container = makeContainer();
    container.read(typingIndicatorsProvider.notifier).addTyping('A', 'u1');

    expect(container.read(isUserTypingInChannelProvider('A', 'u1')), isTrue);
    expect(container.read(isUserTypingInChannelProvider('A', 'u2')), isFalse);
    expect(container.read(isUserTypingInChannelProvider('B', 'u1')), isFalse);
  });

  test('isUserTypingInChannel ignores current user typing', () {
    final container = makeContainer();
    container.read(typingIndicatorsProvider.notifier).addTyping('A', 'me');

    expect(container.read(isUserTypingInChannelProvider('A', 'me')), isFalse);
  });

  test('memberListUserIsTyping mirrors isUserTypingInChannel', () {
    final container = makeContainer();
    container.read(typingIndicatorsProvider.notifier).addTyping('A', 'u1');

    expect(container.read(memberListUserIsTypingProvider('A', 'u1')), isTrue);
    expect(container.read(memberListUserIsTypingProvider('A', 'u2')), isFalse);
  });

  test('reports typing only for the channel a remote user types in', () {
    final container = makeContainer();
    container.read(typingIndicatorsProvider.notifier).addTyping('A', 'u1');

    expect(container.read(channelHasTypingProvider('A')), isTrue);
    expect(container.read(channelHasTypingProvider('B')), isFalse);
  });

  test('ignores typing from the current user', () {
    final container = makeContainer();
    container.read(typingIndicatorsProvider.notifier).addTyping('A', 'me');

    expect(container.read(channelHasTypingProvider('A')), isFalse);
  });

  test('keeps channels independent as typing changes', () {
    final container = makeContainer();
    container.read(typingIndicatorsProvider.notifier).addTyping('A', 'u1');
    container.read(typingIndicatorsProvider.notifier).addTyping('B', 'u2');

    expect(container.read(channelHasTypingProvider('A')), isTrue);
    expect(container.read(channelHasTypingProvider('B')), isTrue);

    container.read(typingIndicatorsProvider.notifier).removeTyping('B', 'u2');

    expect(container.read(channelHasTypingProvider('A')), isTrue);
    expect(container.read(channelHasTypingProvider('B')), isFalse);
  });

  test(
    'typingUsersInChannel lists remote typers excluding the current user',
    () {
      final container = makeContainer();
      container.read(typingIndicatorsProvider.notifier).addTyping('A', 'u1');
      container.read(typingIndicatorsProvider.notifier).addTyping('A', 'me');
      container.read(typingIndicatorsProvider.notifier).addTyping('A', 'u2');

      expect(container.read(typingUsersInChannelProvider('A')), ['u1', 'u2']);
      expect(container.read(typingUsersInChannelProvider('B')), isEmpty);
    },
  );

  test(
    'prunes a typer after the expiry window and clears channelHasTyping',
    () {
      fakeAsync((FakeAsync async) {
        final container = ProviderContainer(
          overrides: [currentUserIdProvider.overrideWithValue('me')],
        );
        container.read(typingIndicatorsProvider.notifier).addTyping('A', 'u1');
        expect(container.read(channelHasTypingProvider('A')), isTrue);

        async.elapse(const Duration(seconds: 10, milliseconds: 1));

        expect(container.read(channelHasTypingProvider('A')), isFalse);
        expect(
          container.read(typingIndicatorsProvider).containsKey('A'),
          isFalse,
        );
        container.dispose();
      });
    },
  );

  test('presentableTypingUsersInChannel excludes blocked users', () {
    final container = ProviderContainer(
      overrides: [
        currentUserIdProvider.overrideWithValue('me'),
        blockedUserIdsProvider.overrideWithValue({'u2'}),
      ],
    );
    addTearDown(container.dispose);
    container.read(typingIndicatorsProvider.notifier).addTyping('A', 'u1');
    container.read(typingIndicatorsProvider.notifier).addTyping('A', 'u2');

    expect(container.read(presentableTypingUsersInChannelProvider('A')), [
      'u1',
    ]);
  });

  test('re-typing within the window extends the expiry', () {
    fakeAsync((FakeAsync async) {
      final container = ProviderContainer(
        overrides: [currentUserIdProvider.overrideWithValue('me')],
      );
      container.read(typingIndicatorsProvider.notifier).addTyping('A', 'u1');

      async.elapse(const Duration(seconds: 6));
      container.read(typingIndicatorsProvider.notifier).addTyping('A', 'u1');
      async.elapse(const Duration(seconds: 6));

      expect(container.read(channelHasTypingProvider('A')), isTrue);

      async.elapse(const Duration(seconds: 5));

      expect(container.read(channelHasTypingProvider('A')), isFalse);
      container.dispose();
    });
  });
}
