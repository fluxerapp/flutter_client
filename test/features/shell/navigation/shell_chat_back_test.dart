import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/shell/navigation/shell_chat_back.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/threads/providers/thread_entered_from_parent_provider.dart';

Future<bool> _phoneThreadBackIsThread(
  WidgetTester tester, {
  required String enteredThreadId,
  required bool fromParent,
}) async {
  final ProviderContainer container = ProviderContainer(
    overrides: [
      shellLocationProvider.overrideWithValue('/channels/guild-1/thread-1'),
      channelByIdProvider('thread-1').overrideWith(
        (ref) => Stream<Channel?>.value(
          const Channel(
            id: 'thread-1',
            guildId: 'guild-1',
            name: 'thread',
            type: ChannelType.publicThread,
            parentId: 'channel-1',
          ),
        ),
      ),
    ],
  );
  addTearDown(container.dispose);
  container.listen(channelByIdProvider('thread-1'), (_, _) {});
  await container.read(channelByIdProvider('thread-1').future);
  container
      .read(threadEnteredFromParentProvider.notifier)
      .enter(enteredThreadId, fromParent: fromParent);
  late bool isThread;
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MediaQuery(
        data: const MediaQueryData(size: Size(390, 844)),
        child: Consumer(
          builder: (context, ref, _) {
            isThread = shellChatBackContext(context, ref).isThread;
            return const SizedBox.shrink();
          },
        ),
      ),
    ),
  );
  return isThread;
}

void main() {
  group('showsShellChatBackButton', () {
    testWidgets('hides for a thread-only parent when the list is concurrent', (
      tester,
    ) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1200, 800)),
          child: Builder(
            builder: (context) {
              expect(
                showsShellChatBackButton(context, isThread: false),
                isFalse,
              );
              expect(showsShellChatBackButton(context, isThread: true), isTrue);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });

    testWidgets('shows on phone-width chat without a pinned sidebar', (
      tester,
    ) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(390, 844)),
          child: Builder(
            builder: (context) {
              expect(isMobileLayout(context), isTrue);
              expect(isPinnedSidebarLayout(context), isFalse);
              expect(
                showsShellChatBackButton(context, isThread: false),
                isTrue,
              );
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });

    testWidgets('hides on pinned flat mobile when not in a thread', (
      tester,
    ) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(800, 600)),
          child: Builder(
            builder: (context) {
              expect(shellShowsConcurrentChannelList(context), isTrue);
              expect(
                showsShellChatBackButton(context, isThread: false),
                isFalse,
              );
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });
  });

  group('shouldAutoSelectDmChannel', () {
    testWidgets('is false on phone-width layout', (tester) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(390, 844)),
          child: Builder(
            builder: (context) {
              expect(shouldAutoSelectDmChannel(context), isFalse);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });

    testWidgets('is true on pinned small tablet', (tester) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(800, 600)),
          child: Builder(
            builder: (context) {
              expect(shouldAutoSelectDmChannel(context), isTrue);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });

    testWidgets('is true on desktop', (tester) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1200, 800)),
          child: Builder(
            builder: (context) {
              expect(shouldAutoSelectDmChannel(context), isTrue);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });
  });

  group('shellChatBackContext', () {
    testWidgets('phone thread entered from its parent leaves to the parent', (
      tester,
    ) async {
      expect(
        await _phoneThreadBackIsThread(
          tester,
          enteredThreadId: 'thread-1',
          fromParent: true,
        ),
        isTrue,
      );
    });

    testWidgets(
      'phone thread entered from the channel list stays on the list',
      (tester) async {
        expect(
          await _phoneThreadBackIsThread(
            tester,
            enteredThreadId: 'thread-1',
            fromParent: false,
          ),
          isFalse,
        );
      },
    );

    testWidgets('phone thread does not match another entered thread', (
      tester,
    ) async {
      expect(
        await _phoneThreadBackIsThread(
          tester,
          enteredThreadId: 'thread-2',
          fromParent: true,
        ),
        isFalse,
      );
    });
  });
}
