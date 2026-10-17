import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/navigation/shell_chat_back.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';

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
}
