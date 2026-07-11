import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_pagination.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_unread_review.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:riverpod/src/framework.dart' show Override;
import 'package:scrollview_observer/scrollview_observer.dart';

import '../../../../helpers/open_test_database.dart';

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

  // Mirrors `_onScrollToBottom`'s jump.
  void jumpToBottom() =>
      scrollController.jumpTo(scrollController.position.minScrollExtent);

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

    testWidgets('jump to newest reaches the bottom in a single frame', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: ReverseChatHarness(initialCount: 50)),
      );
      await tester.pumpAndSettle();
      final ReverseChatHarnessState state = _stateOf(tester);

      // Reverse list: larger pixels == older.
      state.scrollController.jumpTo(1500);
      await tester.pumpAndSettle();
      expect(find.byKey(const ValueKey<int>(49)), findsNothing);

      // One pump: an instant jump lands immediately; animateTo would not.
      state.jumpToBottom();
      await tester.pump();

      expect(
        state.scrollController.position.pixels,
        moreOrLessEquals(0, epsilon: 1),
      );
      expect(find.byKey(const ValueKey<int>(49)), findsOneWidget);
    });
  });

  group('unread center open path', () {
    testWidgets(
      'first frame centers the NEW divider and keeps read messages chronological',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(ackIndex: 42);

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();

        final Finder unreadDivider = find.text('NEW');
        final Finder olderRead = _messageItemFor(harness.olderReadId);
        final Finder ackBoundary = _messageItemFor(harness.ackId);
        final Finder firstUnread = _messageItemFor(harness.firstUnreadId);
        expect(unreadDivider, findsOneWidget);
        expect(olderRead, findsOneWidget);
        expect(ackBoundary, findsOneWidget);
        expect(firstUnread, findsOneWidget);

        final Rect viewport = tester.getRect(_messageListScrollable());
        final double viewportCenterY = viewport.top + viewport.height * 0.5;
        final Rect unreadDividerRect = tester.getRect(unreadDivider);
        final Rect firstUnreadRect = tester.getRect(firstUnread);

        expect(
          unreadDividerRect.center.dy,
          moreOrLessEquals(viewportCenterY, epsilon: 48),
        );
        expect(
          firstUnreadRect.top,
          moreOrLessEquals(viewportCenterY, epsilon: 64),
        );
        expect(
          firstUnreadRect.top,
          lessThan(viewport.bottom - viewport.height * 0.25),
        );

        // The read side above the divider must stay chronological
        // top-to-bottom. This catches accidentally reversing the before-center
        // sliver, where the ack boundary would appear above the older message.
        final double olderTop = tester.getRect(olderRead).top;
        final double ackTop = tester.getRect(ackBoundary).top;
        final double dividerTop = unreadDividerRect.top;
        expect(olderTop, lessThan(ackTop));
        expect(ackTop, lessThan(dividerTop));

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'does not load newer on open even when the trailing edge is in range',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(ackIndex: 42);

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();

        final ScrollableState scrollable = tester.state<ScrollableState>(
          _messageListScrollable(),
        );
        final double distanceFromTrailingEdge =
            scrollable.position.maxScrollExtent - scrollable.position.pixels;
        expect(
          distanceFromTrailingEdge,
          lessThanOrEqualTo(
            messageListLoadEnterMargin(scrollable.position.viewportDimension),
          ),
        );
        expect(harness.chatViewModel._loadNewerCallCount, 0);

        await tester.pump();
        expect(harness.chatViewModel._loadNewerCallCount, 0);

        await _disposeMessageList(tester);
      },
    );

    testWidgets('a real upward drag toward newer messages loads newer', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _AroundAckMessageListHarness harness =
          await _createAroundAckMessageListHarness(
            messageCount: 60,
            ackIndex: 34,
          );

      await tester.pumpWidget(
        _messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pump();
      expect(harness.chatViewModel._loadNewerCallCount, 0);

      await tester.drag(_messageListScrollable(), const Offset(0, -900));
      await tester.pump();

      expect(
        harness.chatViewModel._loadNewerCallCount,
        greaterThanOrEqualTo(1),
      );

      await _disposeMessageList(tester);
    });

    testWidgets(
      'scroll to bottom still works after a loaded message jump signal',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createBottomMessageListHarness();

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pumpAndSettle();

        final ScrollPosition position = _messageListScrollPosition(tester);
        expect(
          position.pixels,
          moreOrLessEquals(position.minScrollExtent, epsilon: 1),
        );

        final String loadedId = harness.oldestLoadedId;
        harness.chatViewModel.scrollToMessage(loadedId);
        await _pumpMessageJump(tester);

        expect(_messageItemFor(loadedId), findsOneWidget);
        expect(
          distanceFromScrollExtentEnd(
            pixels: position.pixels,
            minScrollExtent: position.minScrollExtent,
          ),
          greaterThan(kMessageListReadBottomThreshold),
        );

        harness.chatViewModel.scrollToBottom();
        await _pumpScrollToBottom(tester);

        expect(
          position.pixels,
          moreOrLessEquals(position.minScrollExtent, epsilon: 1),
        );

        final String secondLoadedId =
            harness.messages[harness.messages.length ~/ 2].id;
        harness.chatViewModel.scrollToMessage(secondLoadedId);
        await _pumpMessageJump(tester);

        expect(_messageItemFor(secondLoadedId), findsOneWidget);
        expect(
          distanceFromScrollExtentEnd(
            pixels: position.pixels,
            minScrollExtent: position.minScrollExtent,
          ),
          greaterThan(kMessageListReadBottomThreshold),
        );

        harness.chatViewModel.scrollToBottom();
        await _pumpScrollToBottom(tester);

        expect(
          position.pixels,
          moreOrLessEquals(position.minScrollExtent, epsilon: 1),
        );

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'live-tail append while scrolled up preserves the visible anchor',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createBottomMessageListHarness();

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pumpAndSettle();

        final ScrollPosition position = _messageListScrollPosition(tester);
        expect(
          position.pixels,
          moreOrLessEquals(position.minScrollExtent, epsilon: 1),
        );

        position.jumpTo(position.maxScrollExtent * 0.5);
        await tester.pumpAndSettle();
        expect(position.pixels, greaterThan(kMessageListReadBottomThreshold));

        final String anchorId = _centerVisibleMessageItemId(tester);
        final Finder anchor = _messageItemFor(anchorId);
        expect(anchor, findsOneWidget);
        final double anchorTopBefore = tester.getRect(anchor).top;
        final double pixelsBefore = position.pixels;
        final double distanceFromOlderEdgeBefore =
            position.maxScrollExtent - position.pixels;

        harness.appendNewerMessages(count: 1);
        await tester.pump();
        await tester.pump();

        expect(anchor, findsOneWidget);
        expect(
          tester.getRect(anchor).top,
          moreOrLessEquals(anchorTopBefore, epsilon: 1),
        );
        expect(position.pixels, greaterThan(pixelsBefore));
        expect(
          position.maxScrollExtent - position.pixels,
          moreOrLessEquals(distanceFromOlderEdgeBefore, epsilon: 1),
        );
        expect(harness.chatViewModel._testState.hasMoreNewerMessages, isFalse);
        expect(harness.chatViewModel._testState.messages, hasLength(81));

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'blocked tail append absorbed by its group preserves the visible anchor',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        const String blockedAuthorId = 'blocked-author';
        final _AroundAckMessageListHarness harness =
            await _createBottomMessageListHarness(
              newestAuthorId: blockedAuthorId,
            );
        expect(harness.messages.last.authorId, blockedAuthorId);

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
            blockedUserIds: const <String>{blockedAuthorId},
          ),
        );
        await tester.pumpAndSettle();
        final ProviderContainer container = ProviderScope.containerOf(
          tester.element(find.byType(MessageList)),
        );
        expect(container.read(blockedUserIdsProvider), const <String>{
          blockedAuthorId,
        });

        final Finder collapsedGroup = find.byKey(
          ValueKey<String>('group-${harness.newestLoadedId}'),
          skipOffstage: false,
        );
        expect(collapsedGroup, findsOneWidget);

        final ScrollPosition position = _messageListScrollPosition(tester);
        position.jumpTo(position.maxScrollExtent * 0.5);
        await tester.pumpAndSettle();

        final String anchorId = _centerVisibleMessageItemId(tester);
        final Finder anchor = _messageItemFor(anchorId);
        final double anchorTopBefore = tester.getRect(anchor).top;
        final double pixelsBefore = position.pixels;

        harness.appendNewerMessages(count: 1, authorId: blockedAuthorId);
        await tester.pump();
        await tester.pump();

        expect(collapsedGroup, findsOneWidget);
        expect(
          tester.getRect(anchor).top,
          moreOrLessEquals(anchorTopBefore, epsilon: 1),
        );
        expect(position.pixels, greaterThan(pixelsBefore));
        expect(harness.chatViewModel._testState.messages, hasLength(81));

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'jump to newest replacement lands at the bottom edge after one frame',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createBottomMessageListHarness(hasMoreNewerMessages: true);

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pumpAndSettle();

        final ScrollPosition position = _messageListScrollPosition(tester);
        position.jumpTo(position.maxScrollExtent);
        await tester.pumpAndSettle();
        expect(
          position.pixels - position.minScrollExtent,
          greaterThan(kMessageListReadBottomThreshold),
        );

        harness.chatViewModel.scrollToBottom();
        await tester.pump();

        expect(
          position.pixels,
          moreOrLessEquals(position.minScrollExtent, epsilon: 1),
        );

        await _pumpScrollToBottom(tester);
        expect(
          position.pixels,
          moreOrLessEquals(position.minScrollExtent, epsilon: 1),
        );

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'unread jump to newest replacement lands at the newest trailing edge',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(
              messageCount: 70,
              ackIndex: 42,
            );

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pumpAndSettle();

        final Finder firstUnread = _messageItemFor(harness.firstUnreadId);
        expect(firstUnread, findsOneWidget);
        final Rect viewport = tester.getRect(_messageListScrollable());
        final double viewportCenterY = viewport.top + viewport.height * 0.5;
        expect(
          tester.getRect(firstUnread).center.dy,
          moreOrLessEquals(viewportCenterY, epsilon: 96),
        );

        harness.chatViewModel.scrollToBottom();
        await _pumpScrollToBottom(tester);

        final ScrollPosition position = _messageListScrollPosition(tester);
        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
        );

        final Finder newest = _messageItemFor(
          harness.latestReplacementNewestId,
        );
        expect(newest, findsOneWidget);
        final Rect newestRect = tester.getRect(newest);
        expect(newestRect.center.dy, greaterThan(viewportCenterY + 96));
        expect(firstUnread, findsNothing);

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'appending newer messages away from the trailing edge keeps the first unread fixed',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(
              messageCount: 90,
              ackIndex: 30,
            );

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pumpAndSettle();

        final Finder firstUnread = _messageItemFor(harness.firstUnreadId);
        expect(firstUnread, findsOneWidget);
        final ScrollableState scrollable = tester.state<ScrollableState>(
          _messageListScrollable(),
        );
        final double distanceFromTrailingEdge =
            scrollable.position.maxScrollExtent - scrollable.position.pixels;
        expect(
          distanceFromTrailingEdge,
          greaterThan(
            messageListLoadEnterMargin(scrollable.position.viewportDimension),
          ),
        );
        final double firstUnreadTopBefore = tester.getRect(firstUnread).top;
        final int loadNewerBefore = harness.chatViewModel._loadNewerCallCount;

        harness.appendNewerMessages(count: 3);
        await tester.pump();
        await tester.pump();

        expect(firstUnread, findsOneWidget);
        expect(
          tester.getRect(firstUnread).top,
          moreOrLessEquals(firstUnreadTopBefore, epsilon: 1),
        );
        expect(harness.chatViewModel._loadNewerCallCount, loadNewerBefore);

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'historical newer append at the loaded tail does not jump to the new tail',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(
              messageCount: 60,
              ackIndex: 42,
            );

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pumpAndSettle();

        final ScrollableState scrollable = tester.state<ScrollableState>(
          _messageListScrollable(),
        );
        scrollable.position.jumpTo(scrollable.position.maxScrollExtent);
        await tester.pumpAndSettle();

        final Finder loadedTailMessage = _messageItemFor(
          harness.newestLoadedId,
        );
        expect(loadedTailMessage, findsOneWidget);
        final Rect loadedTailRectBefore = tester.getRect(loadedTailMessage);
        final double loadedTailTopBefore = loadedTailRectBefore.top;
        final double pixelsBefore = scrollable.position.pixels;
        final double maxBefore = scrollable.position.maxScrollExtent;
        expect(pixelsBefore, moreOrLessEquals(maxBefore, epsilon: 1));

        harness.appendNewerMessages(count: 6);
        await tester.pump();
        await tester.pump();

        expect(loadedTailMessage, findsOneWidget);
        expect(
          tester.getRect(loadedTailMessage).top,
          moreOrLessEquals(loadedTailTopBefore, epsilon: 1),
        );
        expect(
          scrollable.position.pixels,
          moreOrLessEquals(pixelsBefore, epsilon: 1),
        );
        expect(
          scrollable.position.maxScrollExtent - scrollable.position.pixels,
          greaterThan(
            messageListLoadProgressDelta(scrollable.position.viewportDimension),
          ),
        );
        expect(harness.chatViewModel._loadNewerCallCount, 0);

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'prepending older messages moves the centered viewport away from the leading edge',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(
              messageCount: 60,
              ackIndex: 42,
            );

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pumpAndSettle();

        final ScrollableState scrollable = tester.state<ScrollableState>(
          _messageListScrollable(),
        );
        scrollable.position.jumpTo(scrollable.position.minScrollExtent);
        await tester.pumpAndSettle();

        final double leadingDistanceBefore =
            scrollable.position.pixels - scrollable.position.minScrollExtent;
        expect(leadingDistanceBefore, lessThanOrEqualTo(1));

        harness.prependOlderMessages(count: 5);
        await tester.pump();
        await tester.pump();

        final double leadingDistanceAfter =
            scrollable.position.pixels - scrollable.position.minScrollExtent;
        expect(
          leadingDistanceAfter,
          greaterThan(
            messageListLoadProgressDelta(scrollable.position.viewportDimension),
          ),
        );

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'short unread block falls back to a bottom-anchored open without a trailing gap',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(
              ackIndex: 48,
              hasMoreNewerMessages: false,
            );

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();

        // The open frame centers the single unread message, so the underfill
        // fallback is scheduled against this frame.
        final Finder unreadDivider = find.text('NEW');
        expect(unreadDivider, findsOneWidget);
        final Rect viewport = tester.getRect(_messageListScrollable());
        final double viewportCenterY = viewport.top + viewport.height * 0.5;
        expect(
          tester.getRect(unreadDivider).center.dy,
          moreOrLessEquals(viewportCenterY, epsilon: 48),
        );

        await tester.pump();
        await tester.pump();

        // The fallback demoted the centered anchor to the real bottom-mode
        // reverse list: newest is at the min edge, while older history remains
        // scrollable above it.
        final ScrollPosition position = _messageListScrollPosition(tester);
        expect(position.minScrollExtent, moreOrLessEquals(0, epsilon: 1));
        expect(
          position.pixels,
          moreOrLessEquals(position.minScrollExtent, epsilon: 1),
        );
        expect(
          position.maxScrollExtent,
          greaterThan(kMessageListReadBottomThreshold),
        );

        final Finder newest = _messageItemFor(harness.newestLoadedId);
        expect(newest, findsOneWidget);
        final Rect newestRect = tester.getRect(newest);
        expect(newestRect.bottom, greaterThan(viewport.bottom - 64));
        expect(newestRect.bottom, lessThanOrEqualTo(viewport.bottom + 1));

        // The NEW divider is per-tile, so the fallback keeps it rendered.
        expect(unreadDivider, findsOneWidget);

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'short unread fallback append while scrolled up preserves the visible older anchor',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(
              ackIndex: 48,
              hasMoreNewerMessages: false,
            );

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        expect(find.text('NEW'), findsOneWidget);

        await tester.pump();
        await tester.pump();

        final ScrollPosition position = _messageListScrollPosition(tester);
        expect(
          position.maxScrollExtent - position.minScrollExtent,
          greaterThan(kMessageListReadBottomThreshold),
        );

        position.jumpTo(
          (position.minScrollExtent + position.maxScrollExtent) * 0.5,
        );
        await tester.pump();
        await tester.pump();

        final String anchorId = _centerVisibleMessageItemId(tester);
        expect(anchorId, isNot(harness.newestLoadedId));
        final Finder anchor = _messageItemFor(anchorId);
        expect(anchor, findsOneWidget);
        final Rect anchorRectBefore = tester.getRect(anchor);
        final double pixelsBefore = position.pixels;
        final double distanceFromOlderEdgeBefore =
            position.maxScrollExtent - position.pixels;

        harness.appendNewerMessages(count: 1);
        await tester.pump();
        await tester.pump();

        expect(anchor, findsOneWidget);
        final Rect anchorRectAfter = tester.getRect(anchor);
        final double distanceFromOlderEdgeAfter =
            position.maxScrollExtent - position.pixels;
        final String failureContext =
            'anchor=$anchorId before=$anchorRectBefore after=$anchorRectAfter '
            'pixelsBefore=$pixelsBefore pixelsAfter=${position.pixels} '
            'olderDistanceBefore=$distanceFromOlderEdgeBefore '
            'olderDistanceAfter=$distanceFromOlderEdgeAfter';
        expect(
          anchorRectAfter.top,
          moreOrLessEquals(anchorRectBefore.top, epsilon: 1),
          reason: failureContext,
        );
        expect(position.pixels, greaterThan(pixelsBefore));
        expect(
          distanceFromOlderEdgeAfter,
          moreOrLessEquals(distanceFromOlderEdgeBefore, epsilon: 1),
          reason: failureContext,
        );
        expect(harness.chatViewModel._testState.messages, hasLength(51));

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'short unread block keeps the centered anchor when newer pages remain',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(ackIndex: 48);

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        // Extra frames so the post-frame underfill fallback has run.
        await tester.pump();
        await tester.pump();

        // Newer pagination will fill the trailing half, so the fallback must
        // keep the NEW divider centered instead of demoting the anchor.
        final Finder unreadDivider = find.text('NEW');
        expect(unreadDivider, findsOneWidget);
        final Rect viewport = tester.getRect(_messageListScrollable());
        final double viewportCenterY = viewport.top + viewport.height * 0.5;
        expect(
          tester.getRect(unreadDivider).center.dy,
          moreOrLessEquals(viewportCenterY, epsilon: 48),
        );

        // The trailing half stays reserved for the newer pages: the newest
        // loaded message is not pinned to the viewport bottom.
        final Finder newest = _messageItemFor(harness.newestLoadedId);
        expect(newest, findsOneWidget);
        expect(tester.getRect(newest).bottom, lessThan(viewport.bottom - 64));

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'empty resolved channel renders the empty state instead of the loading spinner',
      (WidgetTester tester) async {
        final db.FluxerDatabase database = openTestDatabase();
        await database.readStateDao.upsertReadState(
          const db.ReadStatesCompanion(
            channelId: Value<String>(_messageListChannelId),
            lastMessageId: Value<String?>(null),
          ),
        );
        final _InstrumentedChatViewModel chatViewModel =
            _InstrumentedChatViewModel(
              const ChatViewState(
                channelId: _messageListChannelId,
                messages: <Message>[],
                replyingTo: null,
                replyMentioning: false,
                editingMessage: null,
                messageText: '',
                scrollToBottomSignal: 0,
                isLoading: false,
                isSyncingMessages: false,
                isLoadingMore: false,
                isLoadingNewer: false,
                hasMoreMessages: false,
                hasMoreNewerMessages: false,
                errorMessage: null,
              ),
            );

        await tester.pumpWidget(
          _messageListApp(database: database, chatViewModel: chatViewModel),
        );
        await tester.pump();

        expect(find.text('No messages yet'), findsOneWidget);
        expect(find.text('Be the first to send a message!'), findsOneWidget);
        expect(find.byType(Scrollable), findsNothing);

        await _disposeMessageList(tester);
      },
    );
  });

  group('reveal round-trip visibility', () {
    testWidgets(
      'toggling visible off and on preserves list state and scroll offset',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createBottomMessageListHarness();

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
            body: const _RevealToggleHost(),
          ),
        );
        await tester.pump();

        // Scroll up into history (reverse list: larger pixels == older).
        final ScrollPosition position = _messageListScrollPosition(tester);
        expect(position.maxScrollExtent, greaterThan(600));
        position.jumpTo(600);
        await tester.pumpAndSettle();
        expect(position.pixels, moreOrLessEquals(600, epsilon: 1));

        final State<MessageList> stateBeforeHide = tester
            .state<State<MessageList>>(find.byType(MessageList));

        _revealHostState(tester).setVisible(visible: false);
        await tester.pump();

        expect(find.byType(MessageList), findsNothing);
        expect(_offstageMessageList(), findsOneWidget);
        expect(
          identical(
            tester.state<State<MessageList>>(_offstageMessageList()),
            stateBeforeHide,
          ),
          isTrue,
          reason: 'hiding the list must not dispose its State',
        );
        expect(
          _offstageMessageListPosition(tester).pixels,
          moreOrLessEquals(600, epsilon: 1),
        );

        _revealHostState(tester).setVisible(visible: true);
        await tester.pump();

        expect(
          identical(
            tester.state<State<MessageList>>(find.byType(MessageList)),
            stateBeforeHide,
          ),
          isTrue,
          reason: 'revealing the list must reuse the retained State',
        );
        expect(
          _messageListScrollPosition(tester).pixels,
          moreOrLessEquals(600, epsilon: 1),
        );

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'visible toggles drive setReadViewportActive on the view model',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createBottomMessageListHarness();

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
            body: const _RevealToggleHost(),
          ),
        );
        await tester.pump();

        expect(harness.chatViewModel._readViewportActiveCalls, <bool>[true]);

        _revealHostState(tester).setVisible(visible: false);
        await tester.pump();
        expect(harness.chatViewModel._readViewportActiveCalls, <bool>[
          true,
          false,
        ]);

        _revealHostState(tester).setVisible(visible: true);
        await tester.pump();
        expect(harness.chatViewModel._readViewportActiveCalls, <bool>[
          true,
          false,
          true,
        ]);

        await _disposeMessageList(tester);
      },
    );

    testWidgets('list that opens hidden keeps the read viewport inactive until '
        'revealed', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _AroundAckMessageListHarness harness =
          await _createBottomMessageListHarness();

      await tester.pumpWidget(
        _messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
          body: const _RevealToggleHost(initialVisible: false),
        ),
      );
      await tester.pump();

      expect(find.byType(MessageList), findsNothing);
      expect(_offstageMessageList(), findsOneWidget);
      expect(harness.chatViewModel._readViewportActiveCalls, <bool>[false]);

      _revealHostState(tester).setVisible(visible: true);
      await tester.pump();

      expect(find.byType(MessageList), findsOneWidget);
      expect(harness.chatViewModel._readViewportActiveCalls, <bool>[
        false,
        true,
      ]);

      await _disposeMessageList(tester);
    });
  });
}

const String _messageListChannelId = 'message-list-anchor-channel';
const String _messageListCurrentUserId = '111111111111111111';
const String _messageListAuthorId = '222222222222222222';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

String _messageListContentFor({
  required String id,
  required int index,
  required String olderId,
  required String ackId,
  required String firstUnreadId,
  required String newerId,
  required String newestLoadedId,
}) {
  if (id == olderId) {
    return 'older message before ack';
  }
  if (id == ackId) {
    return 'ack boundary message';
  }
  if (id == firstUnreadId) {
    return 'first unread anchor target';
  }
  if (id == newerId) {
    return 'newer in-window message';
  }
  if (id == newestLoadedId) {
    return 'newest loaded message';
  }
  return 'window message $index';
}

Message _message({
  required String id,
  required String content,
  required DateTime timestamp,
  String authorId = _messageListAuthorId,
}) {
  return Message(
    id: id,
    channelId: _messageListChannelId,
    authorId: authorId,
    authorName: 'Webhook',
    webhookId: 'message-list-webhook',
    content: content,
    timestamp: timestamp,
  );
}

Finder _messageListScrollable() {
  return find.descendant(
    of: find.byType(MessageList),
    matching: find.byType(Scrollable),
  );
}

Finder _messageItemFor(String id) {
  return find.byWidgetPredicate(
    (Widget widget) => widget is MessageItem && widget.message.id == id,
    description: 'MessageItem for message id $id',
  );
}

ScrollPosition _messageListScrollPosition(WidgetTester tester) {
  return tester.state<ScrollableState>(_messageListScrollable()).position;
}

Finder _offstageMessageList() => find.byType(MessageList, skipOffstage: false);

ScrollPosition _offstageMessageListPosition(WidgetTester tester) {
  return tester
      .state<ScrollableState>(
        find.descendant(
          of: _offstageMessageList(),
          matching: find.byType(Scrollable, skipOffstage: false),
        ),
      )
      .position;
}

Future<void> _pumpMessageJump(WidgetTester tester) async {
  await tester.pumpAndSettle();
}

Future<void> _pumpScrollToBottom(WidgetTester tester) async {
  await tester.pump();
  await tester.pump();
}

Future<void> _disposeMessageList(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump(const Duration(milliseconds: 1));
}

class _AroundAckMessageListHarness {
  _AroundAckMessageListHarness({
    required this.database,
    required this.chatViewModel,
    required this.messages,
    required this.olderReadId,
    required this.ackId,
    required this.firstUnreadId,
    required this.newestLoadedId,
  });

  final db.FluxerDatabase database;
  final _InstrumentedChatViewModel chatViewModel;
  final List<Message> messages;
  final String olderReadId;
  final String ackId;
  final String firstUnreadId;
  final String newestLoadedId;

  String get oldestLoadedId => messages.first.id;

  String get latestReplacementNewestId =>
      chatViewModel._latestReplacementNewestIdValue;

  void appendNewerMessages({
    required int count,
    String authorId = _messageListAuthorId,
  }) {
    final List<Message> next = List<Message>.of(
      chatViewModel._testState.messages,
    );
    final DateTime lastTimestamp = next.last.timestamp;
    for (int index = 0; index < count; index += 1) {
      final DateTime timestamp = lastTimestamp.add(
        Duration(minutes: index + 1),
      );
      next.add(
        _message(
          authorId: authorId,
          id: _snowflakeForUtc(timestamp),
          content: 'appended newer message $index',
          timestamp: timestamp,
        ),
      );
    }
    chatViewModel._testState = chatViewModel._testState.copyWith(
      messages: next,
    );
  }

  void prependOlderMessages({required int count}) {
    final List<Message> next = List<Message>.of(
      chatViewModel._testState.messages,
    );
    final DateTime firstTimestamp = next.first.timestamp;
    final List<Message> older = List<Message>.generate(count, (int index) {
      final DateTime timestamp = firstTimestamp.subtract(
        Duration(minutes: count - index),
      );
      return _message(
        id: _snowflakeForUtc(timestamp),
        content: 'prepended older message $index',
        timestamp: timestamp,
      );
    });
    next.insertAll(0, older);
    chatViewModel._testState = chatViewModel._testState.copyWith(
      messages: next,
    );
  }
}

Future<_AroundAckMessageListHarness> _createAroundAckMessageListHarness({
  required int ackIndex,
  int messageCount = 50,
  bool hasMoreNewerMessages = true,
  bool readThroughNewest = false,
  String? newestAuthorId,
}) async {
  assert(ackIndex > 0, 'ackIndex must leave one older message');
  assert(ackIndex < messageCount - 1, 'ackIndex must leave one newer message');
  final DateTime base = DateTime.utc(2026, 7, 4, 12);
  final List<String> ids = List<String>.generate(
    messageCount,
    (int index) => _snowflakeForUtc(base.add(Duration(minutes: index))),
  );
  final String olderReadId = ids[ackIndex - 1];
  final String ackId = ids[ackIndex];
  final String firstUnreadId = ids[ackIndex + 1];
  final String newerId =
      ids[ackIndex + 2 < ids.length ? ackIndex + 2 : ackIndex + 1];
  final String newestLoadedId = ids.last;
  final List<Message> messages = <Message>[
    for (int index = 0; index < ids.length; index += 1)
      _message(
        id: ids[index],
        authorId: index == ids.length - 1
            ? newestAuthorId ?? _messageListAuthorId
            : _messageListAuthorId,
        content: _messageListContentFor(
          id: ids[index],
          index: index,
          olderId: olderReadId,
          ackId: ackId,
          firstUnreadId: firstUnreadId,
          newerId: newerId,
          newestLoadedId: newestLoadedId,
        ),
        timestamp: base.add(Duration(minutes: index)),
      ),
  ];
  final db.FluxerDatabase database = openTestDatabase();
  await database.readStateDao.upsertReadState(
    db.ReadStatesCompanion(
      channelId: const Value<String>(_messageListChannelId),
      lastMessageId: Value<String?>(readThroughNewest ? newestLoadedId : ackId),
    ),
  );
  final _InstrumentedChatViewModel chatViewModel = _InstrumentedChatViewModel(
    ChatViewState(
      channelId: _messageListChannelId,
      messages: messages,
      replyingTo: null,
      replyMentioning: false,
      editingMessage: null,
      messageText: '',
      scrollToBottomSignal: 0,
      isLoading: false,
      isSyncingMessages: false,
      isLoadingMore: false,
      isLoadingNewer: false,
      hasMoreMessages: true,
      hasMoreNewerMessages: hasMoreNewerMessages,
      errorMessage: null,
    ),
  );
  return _AroundAckMessageListHarness(
    database: database,
    chatViewModel: chatViewModel,
    messages: messages,
    olderReadId: olderReadId,
    ackId: ackId,
    firstUnreadId: firstUnreadId,
    newestLoadedId: newestLoadedId,
  );
}

Future<_AroundAckMessageListHarness> _createBottomMessageListHarness({
  int messageCount = 80,
  bool hasMoreNewerMessages = false,
  String? newestAuthorId,
}) {
  assert(messageCount >= 3, 'messageCount must leave loaded jump targets');
  return _createAroundAckMessageListHarness(
    ackIndex: messageCount - 2,
    messageCount: messageCount,
    hasMoreNewerMessages: hasMoreNewerMessages,
    readThroughNewest: true,
    newestAuthorId: newestAuthorId,
  );
}

Widget _messageListApp({
  required db.FluxerDatabase database,
  required _InstrumentedChatViewModel chatViewModel,
  Set<String> blockedUserIds = const <String>{},
  Widget body = const MessageList(expectedChannelId: _messageListChannelId),
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: _messageListOverrides(
      database: database,
      chatViewModel: chatViewModel,
      blockedUserIds: blockedUserIds,
    ),
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: body),
    ),
  );
}

String _centerVisibleMessageItemId(WidgetTester tester) {
  final Rect viewport = tester.getRect(_messageListScrollable());
  final double centerY = viewport.center.dy;
  String? bestId;
  double? bestDistance;
  for (final MessageItem item in tester.widgetList<MessageItem>(
    find.byType(MessageItem),
  )) {
    final Finder finder = _messageItemFor(item.message.id);
    final Rect rect = tester.getRect(finder);
    if (rect.bottom <= viewport.top || rect.top >= viewport.bottom) {
      continue;
    }
    final double distance = (rect.center.dy - centerY).abs();
    if (bestDistance == null || distance < bestDistance) {
      bestDistance = distance;
      bestId = item.message.id;
    }
  }
  final String? id = bestId;
  if (id == null) {
    throw TestFailure('Expected at least one visible MessageItem in $viewport');
  }
  return id;
}

/// Mirrors the `ChannelChatPanel` reveal round-trip wrapping: while hidden
/// the list stays mounted under `Offstage` + `TickerMode` instead of being
/// swapped out of the tree, and `MessageList.visible` tracks the reveal.
class _RevealToggleHost extends StatefulWidget {
  const _RevealToggleHost({this.initialVisible = true});

  final bool initialVisible;

  @override
  State<_RevealToggleHost> createState() => _RevealToggleHostState();
}

class _RevealToggleHostState extends State<_RevealToggleHost> {
  late bool _visible = widget.initialVisible;

  void setVisible({required bool visible}) {
    setState(() {
      _visible = visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !_visible,
      child: TickerMode(
        enabled: _visible,
        child: MessageList(
          expectedChannelId: _messageListChannelId,
          visible: _visible,
        ),
      ),
    );
  }
}

_RevealToggleHostState _revealHostState(WidgetTester tester) =>
    tester.state<_RevealToggleHostState>(find.byType(_RevealToggleHost));

List<Override> _messageListOverrides({
  required db.FluxerDatabase database,
  required _InstrumentedChatViewModel chatViewModel,
  required Set<String> blockedUserIds,
}) {
  return <Override>[
    fluxerDatabaseProvider.overrideWithValue(database),
    chatViewModelProvider.overrideWith(() => chatViewModel),
    currentUserIdProvider.overrideWithValue(_messageListCurrentUserId),
    blockedUserIdsProvider.overrideWithValue(blockedUserIds),
    activeGuildIdProvider.overrideWithValue(null),
    channelListViewModelProvider.overrideWithValue(
      const ChannelListState(
        guild: null,
        categories: <ChannelCategory>[],
        selectedChannelId: _messageListChannelId,
      ),
    ),
    dmViewModelProvider.overrideWithValue(
      const DmViewState(
        conversations: <DmConversation>[],
        friendsList: <Friend>[],
        activeTab: FriendsTab.online,
        searchQuery: '',
      ),
    ),
    channelMessagePermissionsProvider(
      _messageListChannelId,
    ).overrideWith((ref) => ChannelMessagePermissions.all),
    themePreferenceProvider.overrideWithValue(ThemePreferenceState()),
    userSettingsViewModelProvider.overrideWithValue(
      const UserSettingsViewState(
        userId: _messageListCurrentUserId,
        username: 'tester',
        displayName: 'Tester',
        discriminator: '0',
        avatar: null,
        avatarColor: null,
        memberSince: null,
        status: 'online',
        messageDisplayCompact: false,
        developerMode: false,
        trustedDomains: <String>[],
        renderEmbeds: false,
        renderReactions: false,
        inlineAttachmentMedia: false,
      ),
    ),
    chatPreferencesProvider.overrideWithValue(const ChatPreferencesState()),
    appearancePreferencesProvider.overrideWithValue(
      const AppearancePreferencesState(),
    ),
  ];
}

class _InstrumentedChatViewModel extends ChatViewModel {
  _InstrumentedChatViewModel(this._initialState);

  final ChatViewState _initialState;
  int _loadNewerCallCount = 0;
  String? _latestReplacementNewestId;
  final List<bool> _readViewportActiveCalls = <bool>[];

  @override
  ChatViewState build() => _initialState;

  ChatViewState get _testState => state;

  set _testState(ChatViewState nextState) {
    state = nextState;
  }

  String get _latestReplacementNewestIdValue {
    final String? id = _latestReplacementNewestId;
    if (id == null) {
      throw StateError('jumpToLatestMessages has not replaced the window yet');
    }
    return id;
  }

  List<Message> _latestReplacementMessages() {
    const int latestWindowCount = 30;
    final DateTime firstTimestamp = state.messages.isEmpty
        ? DateTime.utc(2026, 7, 5, 12)
        : state.messages.last.timestamp.add(const Duration(hours: 1));
    return <Message>[
      for (int index = 0; index < latestWindowCount; index += 1)
        _message(
          id: _snowflakeForUtc(firstTimestamp.add(Duration(minutes: index))),
          content: index == latestWindowCount - 1
              ? 'latest replacement newest message'
              : 'latest replacement message $index',
          timestamp: firstTimestamp.add(Duration(minutes: index)),
        ),
    ];
  }

  @override
  Future<void> loadNewer() async {
    _loadNewerCallCount += 1;
  }

  @override
  Future<void> loadMore() async {}

  @override
  void setReadViewportActive({required bool isActive}) {
    _readViewportActiveCalls.add(isActive);
  }

  @override
  void updateReadViewport({
    required bool isNearBottom,
    double distanceFromBottom = 0,
    double viewportHeight = 0,
  }) {}

  @override
  Future<void> ackCurrentChannel({bool force = false}) async {}

  @override
  Future<void> markCurrentChannelRead() async {}

  @override
  Future<void> jumpToFirstUnread() async {}

  @override
  Future<void> jumpToLatestMessages() async {
    final List<Message> latestMessages = _latestReplacementMessages();
    _latestReplacementNewestId = latestMessages.last.id;
    state = state.copyWith(
      messages: latestMessages,
      hasMoreNewerMessages: false,
    );
    scrollToBottom();
  }

  @override
  void trimToNewestWindow() {}

  @override
  void clearCurrentManualUnread() {}

  @override
  void clearStickyUnreadAfterBuildForCurrentChannel() {}
}
