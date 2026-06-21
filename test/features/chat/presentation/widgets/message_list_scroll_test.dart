import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_unread_review.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

/// Reverse chat-list harness mirroring the production wiring in
/// `message_list.dart`: a `reverse: true` `ListView.builder` wrapped in a
/// `ListViewObserver`, with a `ChatScrollObserver` driving position-keeping.
///
/// Items are chronological ascending (index 0 oldest, `last` newest); render
/// index 0 is the newest at the bottom. Fixed-height rows keep offsets
/// deterministic.
class ReverseChatHarness extends StatefulWidget {
  const ReverseChatHarness({required this.initialCount, super.key});

  final int initialCount;

  @override
  ReverseChatHarnessState createState() => ReverseChatHarnessState();
}

class ReverseChatHarnessState extends State<ReverseChatHarness> {
  static const double itemHeight = 60;
  final ScrollController scrollController = ScrollController();
  late final ListObserverController observerController;
  late final ChatScrollObserver chatObserver;
  late List<int> items;

  @override
  void initState() {
    super.initState();
    items = List<int>.generate(widget.initialCount, (int i) => i);
    observerController = ListObserverController(controller: scrollController);
    chatObserver = ChatScrollObserver(observerController)
      ..fixedPositionOffset = kMessageListReadBottomThreshold;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  /// Appends [count] newest items, mirroring `_applyChatAnchor`'s insert path:
  /// `standby` is called before the data mutation so the observer pins the
  /// viewport (or follows when at the bottom).
  void appendNewest(int count) {
    unawaited(
      chatObserver.standby(
        changeCount: count,
        isNeedObserveSwitchShrinkWrap: false,
      ),
    );
    setState(() {
      for (int i = 0; i < count; i++) {
        items.add(items.length);
      }
    });
  }

  /// Trims [count] newest items, mirroring `_applyChatAnchor`'s removal path:
  /// specified mode with the synchronous default ref-index type holds the first
  /// reference item fixed.
  void trimNewest(int count) {
    unawaited(
      chatObserver.standby(
        mode: ChatScrollObserverHandleMode.specified,
        refIndexType:
            ChatScrollObserverRefIndexType.relativeIndexStartFromDisplaying,
        refItemIndexAfterUpdate: -count,
        isNeedObserveSwitchShrinkWrap: false,
      ),
    );
    setState(() {
      items.removeRange(items.length - count, items.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScrollPhysics chatPhysics = ScrollConfiguration.of(context)
        .getScrollPhysics(context)
        .applyTo(ChatObserverClampingScrollPhysics(observer: chatObserver));
    return Center(
      child: SizedBox(
        height: 600,
        width: 400,
        child: ListViewObserver(
          controller: observerController,
          child: ListView.builder(
            controller: scrollController,
            reverse: true,
            physics: chatPhysics,
            itemCount: items.length,
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            itemBuilder: (BuildContext context, int renderIndex) {
              final int dataIndex = items.length - 1 - renderIndex;
              final int value = items[dataIndex];
              return SizedBox(
                key: ValueKey<int>(value),
                height: itemHeight,
                child: Center(child: Text('item $value')),
              );
            },
          ),
        ),
      ),
    );
  }
}

ReverseChatHarnessState _stateOf(WidgetTester tester) =>
    tester.state<ReverseChatHarnessState>(find.byType(ReverseChatHarness));

void main() {
  group('reverse chat list position-keeping', () {
    testWidgets('append while scrolled up keeps the visible item fixed', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: ReverseChatHarness(initialCount: 50)),
      );
      await tester.pumpAndSettle();
      final ReverseChatHarnessState state = _stateOf(tester);

      // Reverse list: larger pixels == scrolled up toward older messages.
      state.scrollController.jumpTo(1000);
      await tester.pumpAndSettle();
      final double pixelsBefore = state.scrollController.position.pixels;

      // Item 28 sits mid-viewport at this offset.
      final Finder anchor = find.byKey(const ValueKey<int>(28));
      expect(anchor, findsOneWidget);
      final double yBefore = tester.getTopLeft(anchor).dy;

      state.appendNewest(3);
      await tester.pumpAndSettle();

      // The visible message stays put; the appended newest pages live below it,
      // so the distance from the bottom grows by exactly their extent.
      expect(
        tester.getTopLeft(anchor).dy,
        moreOrLessEquals(yBefore, epsilon: 1),
      );
      expect(
        state.scrollController.position.pixels,
        moreOrLessEquals(
          pixelsBefore + 3 * ReverseChatHarnessState.itemHeight,
          epsilon: 1,
        ),
      );
    });

    testWidgets('append while at the bottom follows to the newest', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: ReverseChatHarness(initialCount: 50)),
      );
      await tester.pumpAndSettle();
      final ReverseChatHarnessState state = _stateOf(tester);

      // A fresh reverse list starts pinned to the bottom (newest).
      expect(
        state.scrollController.position.pixels,
        moreOrLessEquals(0, epsilon: 1),
      );

      state.appendNewest(1);
      await tester.pumpAndSettle();

      // Stays pinned to the bottom and shows the new newest message.
      expect(
        state.scrollController.position.pixels,
        lessThanOrEqualTo(kMessageListReadBottomThreshold),
      );
      expect(find.byKey(const ValueKey<int>(50)), findsOneWidget);
    });

    testWidgets(
      'trimming newest while scrolled up keeps the visible item fixed',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(home: ReverseChatHarness(initialCount: 50)),
        );
        await tester.pumpAndSettle();
        final ReverseChatHarnessState state = _stateOf(tester);

        state.scrollController.jumpTo(1000);
        await tester.pumpAndSettle();

        final Finder anchor = find.byKey(const ValueKey<int>(28));
        expect(anchor, findsOneWidget);
        final double yBefore = tester.getTopLeft(anchor).dy;

        state.trimNewest(3);
        await tester.pumpAndSettle();

        expect(
          tester.getTopLeft(anchor).dy,
          moreOrLessEquals(yBefore, epsilon: 1),
        );
      },
    );
  });
}
