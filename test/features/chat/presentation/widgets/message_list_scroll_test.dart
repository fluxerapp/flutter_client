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
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_overlay.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_pagination.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_unread_review.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
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

    testWidgets('append while scrolled up keeps position with 500 items', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: ReverseChatHarness(initialCount: 500)),
      );
      await tester.pumpAndSettle();
      final ReverseChatHarnessState state = _stateOf(tester);

      state.scrollController.jumpTo(10000);
      await tester.pumpAndSettle();
      final double pixelsBefore = state.scrollController.position.pixels;
      final Finder anchor = find.byKey(const ValueKey<int>(328));
      expect(anchor, findsOneWidget);
      final double yBefore = tester.getTopLeft(anchor).dy;

      state.appendNewest(3);
      await tester.pumpAndSettle();

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
    testWidgets(
      'async unread open publishes near-tail viewport geometry without a scroll',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 672);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(
              ackIndex: 47,
              startLoading: true,
              retainMessagesWhileLoading: true,
            );
        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await tester.pump();
        final ProviderContainer container = ProviderScope.containerOf(
          tester.element(find.byType(MessageList)),
        );
        // Simulates a stale viewport left by an unread layout with no scroll
        // callback; the production callback must republish geometry.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          container
              .read(chatReadViewportProvider.notifier)
              .updateViewport(
                channelId: _messageListChannelId,
                nearLoadedTail: false,
                distanceFromBottom: double.infinity,
                viewportHeight: 0,
              );
        });
        harness.chatViewModel._testState = harness.chatViewModel._testState
            .copyWith(messages: harness.messages, isLoading: false);
        await tester.pump();
        final ChatReadViewportState initialViewport = container.read(
          chatReadViewportProvider,
        );
        expect(initialViewport.channelId, _messageListChannelId);
        expect(initialViewport.nearLoadedTail, isTrue);
        expect(harness.chatViewModel._loadNewerCallCount, 0);
        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'async unread open near the tail has scrollable geometry without a scroll',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 1424);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(
              ackIndex: 47,
              hasMoreNewerMessages: false,
              startLoading: true,
            );
        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await tester.pump();
        harness.chatViewModel._testState = harness.chatViewModel._testState
            .copyWith(messages: harness.messages, isLoading: false);
        await tester.pump();
        await tester.pump();

        final ScrollPosition position = _messageListScrollPosition(tester);
        expect(find.text('NEW'), findsOneWidget);
        final double trailingDistance =
            position.maxScrollExtent - position.pixels;
        expect(
          position.maxScrollExtent,
          greaterThan(0),
          reason: 'trailing distance: $trailingDistance',
        );
        expect(
          trailingDistance,
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
          reason: 'trailing distance: $trailingDistance',
        );
        final ProviderContainer container = ProviderScope.containerOf(
          tester.element(find.byType(MessageList)),
        );
        expect(container.read(chatReadViewportProvider).nearLoadedTail, isTrue);
        expect(harness.chatViewModel._loadNewerCallCount, 0);
        await _disposeMessageList(tester);
      },
    );

    testWidgets('async unread open stays away from tail without a scroll', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final _AroundAckMessageListHarness harness =
          await _createAroundAckMessageListHarness(
            ackIndex: 40,
            messageCount: 55,
            hasMoreNewerMessages: false,
            startLoading: true,
          );
      await tester.pumpWidget(
        _messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pump();
      await tester.pump();
      harness.chatViewModel._testState = harness.chatViewModel._testState
          .copyWith(messages: harness.messages, isLoading: false);
      await tester.pump();
      await tester.pump();

      final ScrollPosition position = _messageListScrollPosition(tester);
      final double trailingDistance =
          position.maxScrollExtent - position.pixels;
      final ProviderContainer container = ProviderScope.containerOf(
        tester.element(find.byType(MessageList)),
      );
      final bool nearLoadedTail = container
          .read(chatReadViewportProvider)
          .nearLoadedTail;
      final double viewportDistance = container
          .read(chatReadViewportProvider)
          .distanceFromBottom;
      final int loadNewerCallCount = harness.chatViewModel._loadNewerCallCount;
      await _disposeMessageList(tester);

      expect(
        trailingDistance,
        greaterThan(kMessageListReadBottomThreshold),
        reason: 'trailing distance: $trailingDistance',
      );
      expect(
        nearLoadedTail,
        isFalse,
        reason: 'viewport distance: $viewportDistance',
      );
      expect(loadNewerCallCount, 0);
    });

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
        // Latest-window land demotes to bottom reverse (newest at min).
        expect(
          position.pixels,
          moreOrLessEquals(position.minScrollExtent, epsilon: 1),
        );

        final Finder newest = _messageItemFor(
          harness.latestReplacementNewestId,
        );
        expect(newest, findsOneWidget);
        final Rect newestRect = tester.getRect(newest);
        final Rect viewportAfter = tester.getRect(_messageListScrollable());
        expect(
          newestRect.bottom,
          moreOrLessEquals(viewportAfter.bottom, epsilon: 48),
        );
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

  group('live unread indicators', () {
    testWidgets('acked append at bottom never renders unread indicators', (
      WidgetTester tester,
    ) async {
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
      addTearDown(() async {
        await _disposeMessageList(tester);
        await tester.pumpAndSettle();
      });
      await tester.pump();
      await tester.pump();
      await tester.pump();
      final ScrollPosition position = _messageListScrollPosition(tester);
      position.jumpTo(
        position.minScrollExtent + kMessageListReadBottomThreshold + 100,
      );
      await tester.pump();
      position.jumpTo(position.minScrollExtent);
      await tester.pump();
      await tester.pump();
      expect(
        position.pixels - position.minScrollExtent,
        lessThanOrEqualTo(kMessageListReadBottomThreshold),
      );
      final ProviderContainer container = ProviderScope.containerOf(
        tester.element(find.byType(MessageList)),
      );
      expect(container.read(chatReadViewportProvider).nearLoadedTail, isTrue);

      harness.appendRealtimeMessage(acknowledgedByGateway: true);

      for (var frame = 1; frame <= 5; frame += 1) {
        await tester.pump();
        expect(
          find.byType(MessageListNewMessagesBar),
          findsNothing,
          reason: 'floating unread bar appeared on frame $frame',
        );
        expect(
          find.text('NEW'),
          findsNothing,
          reason: 'inline NEW divider appeared on frame $frame',
        );
      }
      await _disposeMessageList(tester);
    });

    testWidgets(
      'unacked append while scrolled up keeps the unread bar visible',
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
        addTearDown(() async {
          await _disposeMessageList(tester);
          await tester.pumpAndSettle();
        });
        await tester.pump();
        await tester.pump();
        await tester.pump();
        final ScrollPosition position = _messageListScrollPosition(tester);
        position.jumpTo(
          position.minScrollExtent + kMessageListReadBottomThreshold + 200,
        );
        await tester.pump();
        await tester.pump();
        expect(
          position.pixels - position.minScrollExtent,
          greaterThan(kMessageListReadBottomThreshold),
        );
        final ProviderContainer container = ProviderScope.containerOf(
          tester.element(find.byType(MessageList)),
        );
        expect(
          container.read(chatReadViewportProvider).nearLoadedTail,
          isFalse,
        );

        harness.appendRealtimeMessage(acknowledgedByGateway: false);

        for (var frame = 1; frame <= 5; frame += 1) {
          await tester.pump();
          expect(
            find.byType(MessageListNewMessagesBar),
            findsOneWidget,
            reason: 'floating unread bar missing on frame $frame',
          );
        }
        await _disposeMessageList(tester);
      },
    );

    testWidgets('manual unread rollback ignores the auto-ack watermark', (
      WidgetTester tester,
    ) async {
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
      addTearDown(() async {
        await _disposeMessageList(tester);
        await tester.pumpAndSettle();
      });
      await tester.pump();
      await tester.pump();
      await tester.pump();

      harness.chatViewModel._testState = harness.chatViewModel._testState
          .copyWith(pendingAutoAckMessageId: harness.newestLoadedId);
      await harness.database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value<String>(_messageListChannelId),
          lastMessageId: Value<String?>(harness.ackId),
          manual: const Value<bool>(true),
        ),
      );
      await tester.pump();
      await tester.pump();
      await tester.pump();

      final Finder unreadBar = find.byType(MessageListNewMessagesBar);
      expect(unreadBar, findsOneWidget);
      expect(tester.widget<MessageListNewMessagesBar>(unreadBar).count, 1);
      await _disposeMessageList(tester);
    });
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

    testWidgets('visible toggles drive the read viewport controller', (
      WidgetTester tester,
    ) async {
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
      final ProviderContainer container = ProviderScope.containerOf(
        tester.element(find.byType(MessageList)),
      );

      expect(container.read(chatReadViewportProvider).viewportActive, isTrue);

      _revealHostState(tester).setVisible(visible: false);
      await tester.pump();
      expect(container.read(chatReadViewportProvider).viewportActive, isFalse);

      _revealHostState(tester).setVisible(visible: true);
      await tester.pump();
      expect(container.read(chatReadViewportProvider).viewportActive, isTrue);

      await _disposeMessageList(tester);
    });

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
      final ProviderContainer container = ProviderScope.containerOf(
        tester.element(_offstageMessageList()),
      );

      expect(find.byType(MessageList), findsNothing);
      expect(_offstageMessageList(), findsOneWidget);
      expect(container.read(chatReadViewportProvider).viewportActive, isFalse);

      _revealHostState(tester).setVisible(visible: true);
      await tester.pump();

      expect(find.byType(MessageList), findsOneWidget);
      expect(container.read(chatReadViewportProvider).viewportActive, isTrue);

      await _disposeMessageList(tester);
    });
  });

  group('keyboard viewport shrink near tail', () {
    Future<void> shrinkViewportHeight(
      WidgetTester tester, {
      required double height,
    }) async {
      tester.view.physicalSize = Size(420, height);
      await tester.pump();
      // Allow metrics notification + post-frame pin.
      await tester.pump();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 16));
    }

    testWidgets('near-tail append then shrink keeps newest visible', (
      WidgetTester tester,
    ) async {
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

      // Slightly off min but still live-near-bottom (within 48px threshold).
      position.jumpTo(position.minScrollExtent + 24);
      await tester.pump();
      expect(
        position.pixels - position.minScrollExtent,
        lessThanOrEqualTo(kMessageListReadBottomThreshold),
      );
      final String previousNewestId =
          harness.chatViewModel._testState.messages.last.id;
      harness.appendNewerMessages(count: 1);
      await tester.pump();
      await tester.pump();
      final String newestId = harness.chatViewModel._testState.messages.last.id;
      expect(newestId, isNot(previousNewestId));

      await shrinkViewportHeight(tester, height: 400);

      expect(_messageItemFor(newestId), findsOneWidget);
      final Rect viewport = tester.getRect(_messageListScrollable());
      final Rect newest = tester.getRect(_messageItemFor(newestId));
      expect(
        position.pixels,
        moreOrLessEquals(position.minScrollExtent, epsilon: 1),
        reason: 'near-tail shrink must pin reverse list to minScrollExtent',
      );
      expect(
        newest.bottom,
        lessThanOrEqualTo(viewport.bottom + 8),
        reason: 'newest must stay above the composer after keyboard shrink',
      );

      await _disposeMessageList(tester);
    });

    testWidgets('at-min shrink keeps newest pinned', (
      WidgetTester tester,
    ) async {
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
      final String newestId = harness.newestLoadedId;

      await shrinkViewportHeight(tester, height: 400);

      expect(_messageItemFor(newestId), findsOneWidget);
      final Rect viewport = tester.getRect(_messageListScrollable());
      final Rect newest = tester.getRect(_messageItemFor(newestId));
      expect(newest.bottom, lessThanOrEqualTo(viewport.bottom + 2));
      expect(
        position.pixels,
        moreOrLessEquals(position.minScrollExtent, epsilon: 1),
      );

      await _disposeMessageList(tester);
    });

    testWidgets('scrolled-up shrink does not yank to tail', (
      WidgetTester tester,
    ) async {
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
      position.jumpTo(position.minScrollExtent + 200);
      await tester.pumpAndSettle();
      expect(
        position.pixels - position.minScrollExtent,
        greaterThan(kMessageListReadBottomThreshold),
      );
      final String anchorId = _centerVisibleMessageItemId(tester);
      final Finder anchor = _messageItemFor(anchorId);
      expect(anchor, findsOneWidget);

      await shrinkViewportHeight(tester, height: 400);

      // Reading position may reflow with the shorter viewport, but must not
      // snap to the live tail.
      expect(anchor, findsOneWidget);
      expect(
        position.pixels - position.minScrollExtent,
        greaterThan(kMessageListReadBottomThreshold),
        reason: 'must not pin to live tail when scrolled up',
      );

      await _disposeMessageList(tester);
    });

    testWidgets('tall partially-visible newest pins on shrink past 48px gate', (
      WidgetTester tester,
    ) async {
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

      final String tallId = harness.appendTallNewerMessage(lines: 20);
      await tester.pump();
      await tester.pump();
      await tester.pumpAndSettle();

      final ScrollPosition position = _messageListScrollPosition(tester);
      // Scroll past 48px while tall newest remains partially visible.
      position.jumpTo(position.minScrollExtent + 120);
      await tester.pump();
      await tester.pump();
      expect(
        position.pixels - position.minScrollExtent,
        greaterThan(kMessageListReadBottomThreshold),
      );
      expect(_messageItemFor(tallId), findsOneWidget);
      final Rect viewportBefore = tester.getRect(_messageListScrollable());
      final Rect tallBefore = tester.getRect(_messageItemFor(tallId));
      expect(
        tallBefore.overlaps(viewportBefore),
        isTrue,
        reason: 'tall newest must still intersect viewport pre-shrink',
      );

      await shrinkViewportHeight(tester, height: 400);

      expect(
        position.pixels,
        moreOrLessEquals(position.minScrollExtent, epsilon: 1),
        reason:
            'partially-visible tall newest must pin despite distance>48 '
            'pixels=${position.pixels} min=${position.minScrollExtent}',
      );
      expect(_messageItemFor(tallId), findsOneWidget);
      final Rect viewportAfter = tester.getRect(_messageListScrollable());
      final Rect tallAfter = tester.getRect(_messageItemFor(tallId));
      expect(
        tallAfter.bottom,
        lessThanOrEqualTo(viewportAfter.bottom + 8),
        reason: 'tall newest bottom must stay in the shrunken viewport',
      );

      await _disposeMessageList(tester);
    });

    testWidgets('fully off-screen newest does not pin on shrink', (
      WidgetTester tester,
    ) async {
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

      final String newestId = harness.chatViewModel._testState.messages.last.id;
      final ScrollPosition position = _messageListScrollPosition(tester);
      // Far enough that newest is fully off-screen.
      position.jumpTo(position.minScrollExtent + 400);
      await tester.pump();
      await tester.pumpAndSettle();
      expect(
        position.pixels - position.minScrollExtent,
        greaterThan(kMessageListReadBottomThreshold),
      );
      expect(_messageItemFor(newestId), findsNothing);

      final double pixelsBefore = position.pixels;
      await shrinkViewportHeight(tester, height: 400);

      expect(
        position.pixels - position.minScrollExtent,
        greaterThan(kMessageListReadBottomThreshold),
        reason: 'must not yank to live tail when newest is fully off-screen',
      );
      expect(
        position.pixels,
        isNot(moreOrLessEquals(position.minScrollExtent, epsilon: 1)),
      );
      // Position may reflow with shorter viewport but should stay scrolled up.
      expect(
        (position.pixels - pixelsBefore).abs(),
        lessThan(200),
        reason: 'no large tail yank from off-screen newest',
      );

      await _disposeMessageList(tester);
    });

    testWidgets('append while keyboard-open at min keeps newest visible', (
      WidgetTester tester,
    ) async {
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

      // Keyboard already open, then append at min.
      await shrinkViewportHeight(tester, height: 400);
      final ScrollPosition position = _messageListScrollPosition(tester);
      position.jumpTo(position.minScrollExtent);
      await tester.pump();

      final String previousNewestId =
          harness.chatViewModel._testState.messages.last.id;
      harness.appendNewerMessages(count: 1);
      await tester.pump();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 16));
      final String newestId = harness.chatViewModel._testState.messages.last.id;
      expect(newestId, isNot(previousNewestId));

      expect(_messageItemFor(newestId), findsOneWidget);
      final Rect viewport = tester.getRect(_messageListScrollable());
      final Rect newest = tester.getRect(_messageItemFor(newestId));
      expect(
        newest.bottom,
        lessThanOrEqualTo(viewport.bottom + 8),
        reason: 'keyboard-open append at min must reveal the newest message',
      );
      expect(
        position.pixels,
        moreOrLessEquals(position.minScrollExtent, epsilon: 1),
      );

      await _disposeMessageList(tester);
    });

    testWidgets(
      'tall append while near-tail follows even when post-append distance exceeds 48',
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
        // Near-tail but not exactly min so a follow pin moves.
        position.jumpTo(position.minScrollExtent + 40);
        await tester.pump();
        expect(
          position.pixels - position.minScrollExtent,
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
        );

        final String tallId = harness.appendTallNewerMessage(lines: 30);
        await tester.pump();
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 16));

        expect(_messageItemFor(tallId), findsOneWidget);
        expect(
          position.pixels,
          moreOrLessEquals(position.minScrollExtent, epsilon: 1),
          reason:
              'pre-append near-tail must follow a tall append to min '
              'pixels=${position.pixels} min=${position.minScrollExtent}',
        );
        final Rect viewport = tester.getRect(_messageListScrollable());
        final Rect tall = tester.getRect(_messageItemFor(tallId));
        expect(
          tall.bottom,
          lessThanOrEqualTo(viewport.bottom + 8),
          reason: 'tall newest must be fully visible after near-tail follow',
        );

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'shrink pin skips when user drag starts before post-frame callback',
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
        // Near-tail but not at min so a pin would move pixels.
        position.jumpTo(position.minScrollExtent + 24);
        await tester.pump();
        expect(
          position.pixels - position.minScrollExtent,
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
        );
        expect(position.pixels, greaterThan(position.minScrollExtent + 0.5));

        // Mark user drag after metrics, before the pin post-frame.
        tester.view.physicalSize = const Size(420, 400);
        await tester.pump();

        final BuildContext scrollContext = tester.element(
          _messageListScrollable(),
        );
        ScrollStartNotification(
          metrics: position,
          context: scrollContext,
          dragDetails: DragStartDetails(
            globalPosition: tester.getCenter(_messageListScrollable()),
          ),
        ).dispatch(scrollContext);

        final double pixelsDuringDrag = position.pixels;
        // Pin post-frame runs here if the drag guard is missing.
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 16));

        expect(
          position.pixels,
          moreOrLessEquals(pixelsDuringDrag, epsilon: 1),
          reason:
              'mid-drag shrink pin must not jumpTo minScrollExtent '
              'pixels=${position.pixels} min=${position.minScrollExtent}',
        );
        expect(
          position.pixels,
          isNot(moreOrLessEquals(position.minScrollExtent, epsilon: 1)),
          reason: 'must not yank to live tail under an active user drag',
        );

        ScrollEndNotification(
          metrics: position,
          context: scrollContext,
        ).dispatch(scrollContext);
        await tester.pump();
        await _disposeMessageList(tester);
      },
    );

    testWidgets('shrink during active jump does not override jump target', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _AroundAckMessageListHarness harness =
          await _createBottomMessageListHarness();
      final String targetId = harness.messages[20].id;

      await tester.pumpWidget(
        _messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pumpAndSettle();

      harness.chatViewModel.scrollToMessage(targetId);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 16));
      // Shrink mid-settle / mid-jump.
      await shrinkViewportHeight(tester, height: 400);
      for (int i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 48));
      }
      for (int i = 0; i < 6; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      await tester.pump(const Duration(milliseconds: 500));

      expect(_messageItemFor(targetId), findsOneWidget);
      final Rect viewport = tester.getRect(_messageListScrollable());
      final Rect target = tester.getRect(_messageItemFor(targetId));
      expect(
        (target.center.dy - viewport.center.dy).abs(),
        lessThanOrEqualTo(24),
        reason: 'active jump must still center its target after shrink',
      );

      await tester.pump(const Duration(milliseconds: 2000));
      await _disposeMessageList(tester);
    });
  });

  group('unread scroll-to-newest then keyboard shrink', () {
    Future<void> shrinkViewportHeight(
      WidgetTester tester, {
      required double height,
    }) async {
      tester.view.physicalSize = Size(420, height);
      await tester.pump();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 16));
    }

    testWidgets(
      'unread in-window scroll-to-newest then shrink keeps newest visible',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(
              ackIndex: 20,
              messageCount: 55,
              hasMoreNewerMessages: false,
            );
        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('NEW'), findsOneWidget);

        final String newestId =
            harness.chatViewModel._testState.messages.last.id;
        harness.chatViewModel.scrollToBottom();
        await _pumpScrollToBottom(tester);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 16));

        final ScrollPosition position = _messageListScrollPosition(tester);
        expect(
          position.pixels,
          moreOrLessEquals(position.minScrollExtent, epsilon: 1),
          reason: 'scroll-to-newest demotes to bottom reverse min',
        );
        expect(_messageItemFor(newestId), findsOneWidget);

        await shrinkViewportHeight(tester, height: 400);

        expect(
          position.pixels,
          moreOrLessEquals(position.minScrollExtent, epsilon: 1),
        );
        expect(_messageItemFor(newestId), findsOneWidget);
        final Rect viewport = tester.getRect(_messageListScrollable());
        final Rect newest = tester.getRect(_messageItemFor(newestId));
        expect(
          newest.bottom,
          lessThanOrEqualTo(viewport.bottom + 8),
          reason:
              'unread→bottom scroll-to-newest then keyboard shrink must keep '
              'newest fully visible',
        );

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'unread jump-to-latest replacement then shrink keeps newest visible',
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
        expect(find.text('NEW'), findsOneWidget);

        harness.chatViewModel.scrollToBottom();
        await _pumpScrollToBottom(tester);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 16));

        final String newestId = harness.latestReplacementNewestId;
        final ScrollPosition position = _messageListScrollPosition(tester);
        expect(
          position.pixels,
          moreOrLessEquals(position.minScrollExtent, epsilon: 1),
        );
        expect(_messageItemFor(newestId), findsOneWidget);

        await shrinkViewportHeight(tester, height: 400);

        expect(
          position.pixels,
          moreOrLessEquals(position.minScrollExtent, epsilon: 1),
        );
        expect(_messageItemFor(newestId), findsOneWidget);
        final Rect viewport = tester.getRect(_messageListScrollable());
        final Rect newest = tester.getRect(_messageItemFor(newestId));
        expect(
          newest.bottom,
          lessThanOrEqualTo(viewport.bottom + 8),
          reason:
              'landAtLatestTail demotion then keyboard shrink must keep '
              'newest fully visible',
        );

        await _disposeMessageList(tester);
      },
    );
  });

  group('jump target centering', () {
    testWidgets('centers a loaded bottom-mode target via scrollToMessage', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _AroundAckMessageListHarness harness =
          await _createBottomMessageListHarness();
      // Mid-window target starts outside the lazy viewport.
      final String targetId = harness.messages[24].id;

      await tester.pumpWidget(
        _messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pumpAndSettle();
      expect(_messageItemFor(targetId), findsNothing);

      harness.chatViewModel.scrollToMessage(targetId);
      await _pumpMessageJump(tester);

      expect(_messageItemFor(targetId), findsOneWidget);
      final Rect viewport = tester.getRect(_messageListScrollable());
      final Rect targetRect = tester.getRect(_messageItemFor(targetId));
      expect(
        (targetRect.center.dy - viewport.center.dy).abs(),
        lessThanOrEqualTo(16),
        reason:
            'target center=${targetRect.center.dy}, '
            'viewport center=${viewport.center.dy}',
      );

      await _disposeMessageList(tester);
    });

    testWidgets('jump settle suppresses read viewport publish and newer loads', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _AroundAckMessageListHarness harness =
          await _createBottomMessageListHarness();
      final String targetId = harness.messages[24].id;

      await tester.pumpWidget(
        _messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pumpAndSettle();

      final ProviderContainer container = ProviderScope.containerOf(
        tester.element(find.byType(MessageList)),
      );
      // Poison geometry so a mid-settle publish would be visible.
      container
          .read(chatReadViewportProvider.notifier)
          .updateViewport(
            channelId: _messageListChannelId,
            nearLoadedTail: false,
            distanceFromBottom: double.infinity,
            viewportHeight: 0,
          );

      final int loadNewerBefore = harness.chatViewModel._loadNewerCallCount;
      harness.chatViewModel.scrollToMessage(targetId);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      // Programmatic scroll during settle (no dragDetails — settle continues).
      final ScrollPosition position = _messageListScrollPosition(tester);
      position.jumpTo(
        (position.pixels + 120).clamp(
          position.minScrollExtent,
          position.maxScrollExtent,
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 48));

      final ChatReadViewportState midSettle = container.read(
        chatReadViewportProvider,
      );
      expect(
        midSettle.distanceFromBottom,
        double.infinity,
        reason: 'settle-active must suppress read-viewport publish',
      );
      expect(midSettle.viewportHeight, 0);
      expect(
        harness.chatViewModel._loadNewerCallCount,
        loadNewerBefore,
        reason: 'settle re-jumps must not trigger loadNewer',
      );

      await tester.pump(const Duration(milliseconds: 2000));
      await _disposeMessageList(tester);
    });

    testWidgets(
      'jump settle publishes near-tail geometry after natural completion',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final _AroundAckMessageListHarness harness =
            await _createBottomMessageListHarness();
        final String targetId =
            harness.messages[harness.messages.length - 2].id;

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pumpAndSettle();

        final ProviderContainer container = ProviderScope.containerOf(
          tester.element(find.byType(MessageList)),
        );
        container
            .read(chatReadViewportProvider.notifier)
            .updateViewport(
              channelId: _messageListChannelId,
              nearLoadedTail: false,
              distanceFromBottom: double.infinity,
              viewportHeight: 0,
            );

        harness.chatViewModel.scrollToMessage(targetId);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
        // Exhaust the settle window so natural completion publishes.
        for (int i = 0; i < 8; i++) {
          await tester.pump(const Duration(milliseconds: 48));
        }
        for (int i = 0; i < 6; i++) {
          await tester.pump(const Duration(milliseconds: 100));
        }
        for (int i = 0; i < 6; i++) {
          await tester.pump(const Duration(milliseconds: 160));
        }
        await tester.pumpAndSettle();

        final ChatReadViewportState after = container.read(
          chatReadViewportProvider,
        );
        expect(after.channelId, _messageListChannelId);
        expect(after.nearLoadedTail, isTrue);
        expect(after.viewportHeight, greaterThan(0));
        expect(after.distanceFromBottom, isNot(double.infinity));

        await _disposeMessageList(tester);
      },
    );

    testWidgets('loads newer pages after a search-style jump settles', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final DateTime base = DateTime.utc(2026, 7, 4, 12);
      final List<Message> allMessages = <Message>[
        for (int index = 0; index < 80; index += 1)
          _message(
            id: _snowflakeForUtc(base.add(Duration(minutes: index))),
            content: 'message $index',
            timestamp: base.add(Duration(minutes: index)),
          ),
      ];
      final List<Message> initialWindow = allMessages.sublist(0, 30);
      final String targetId = initialWindow[10].id;
      final _PagingInstrumentedChatViewModel chatViewModel =
          _PagingInstrumentedChatViewModel(
            ChatViewState(
              channelId: _messageListChannelId,
              messages: initialWindow,
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
              hasMoreNewerMessages: true,
              errorMessage: null,
            ),
            newerPages: <List<Message>>[
              allMessages.sublist(30, 60),
              allMessages.sublist(60, 80),
            ],
          );
      final db.FluxerDatabase database = openTestDatabase();

      await tester.pumpWidget(
        _messageListApp(database: database, chatViewModel: chatViewModel),
      );
      await tester.pumpAndSettle();

      chatViewModel.scrollToMessage(targetId);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      for (int i = 0; i < 8; i++) {
        await tester.pump(const Duration(milliseconds: 48));
      }
      for (int i = 0; i < 6; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      for (int i = 0; i < 6; i++) {
        await tester.pump(const Duration(milliseconds: 160));
      }
      await tester.pumpAndSettle();

      final int loadNewerBefore = chatViewModel._loadNewerCallCount;
      await tester.drag(_messageListScrollable(), const Offset(0, -900));
      await tester.pump();
      expect(chatViewModel._loadNewerCallCount, greaterThan(loadNewerBefore));
      expect(chatViewModel.state.hasMoreNewerMessages, isTrue);
      expect(
        int.parse(chatViewModel.state.messages.last.id),
        greaterThan(int.parse(initialWindow.last.id)),
      );

      await _disposeMessageList(tester);
    });

    testWidgets(
      'centers a fresh targetMessageId after its around-window loads',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        // Hold read state in AsyncLoading so open mode stays unresolved while
        // the around-window arrives. Exercises initState pending + consume gate.
        final StreamController<db.ReadState?> readStateController =
            StreamController<db.ReadState?>.broadcast();
        addTearDown(readStateController.close);

        final _AroundAckMessageListHarness source =
            await _createBottomMessageListHarness();
        final String targetId = source.messages[24].id;

        final _InstrumentedChatViewModel loadingChatViewModel =
            _InstrumentedChatViewModel(
              const ChatViewState(
                channelId: _messageListChannelId,
                messages: <Message>[],
                replyingTo: null,
                replyMentioning: false,
                editingMessage: null,
                messageText: '',
                scrollToBottomSignal: 0,
                isLoading: true,
                isSyncingMessages: false,
                isLoadingMore: false,
                isLoadingNewer: false,
                hasMoreMessages: true,
                hasMoreNewerMessages: false,
                errorMessage: null,
              ),
            );

        await tester.pumpWidget(
          _messageListApp(
            database: source.database,
            chatViewModel: loadingChatViewModel,
            body: MessageList(
              expectedChannelId: _messageListChannelId,
              targetMessageId: targetId,
            ),
            overrides: <Override>[
              messageListReadStateProvider(
                _messageListChannelId,
              ).overrideWith((ref) => readStateController.stream),
            ],
          ),
        );
        await tester.pump();
        expect(_messageItemFor(targetId), findsNothing);

        // Around-window only — no scrollToMessage signal on this path.
        loadingChatViewModel._testState = loadingChatViewModel._testState
            .copyWith(messages: source.messages, isLoading: false);
        await tester.pump();
        await tester.pump();
        expect(
          find.byType(Scrollable),
          findsNothing,
          reason: 'list must stay unresolved until read state arrives',
        );

        readStateController.add(null);
        await tester.pump();
        await tester.pump();
        await tester.pump();
        await tester.pumpAndSettle();

        expect(_messageItemFor(targetId), findsOneWidget);
        final Rect viewport = tester.getRect(_messageListScrollable());
        final Rect targetRect = tester.getRect(_messageItemFor(targetId));
        expect(
          (targetRect.center.dy - viewport.center.dy).abs(),
          lessThanOrEqualTo(16),
          reason:
              'target center=${targetRect.center.dy}, '
              'viewport center=${viewport.center.dy}',
        );

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'centers a fresh scrollToMessage signal after its around-window loads',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        // Hold read state in AsyncLoading so open mode stays unresolved while
        // the around-window and signal arrive. No widget.targetMessageId.
        final StreamController<db.ReadState?> readStateController =
            StreamController<db.ReadState?>.broadcast();
        addTearDown(readStateController.close);

        final _AroundAckMessageListHarness source =
            await _createBottomMessageListHarness();
        final String targetId = source.messages[24].id;

        final _InstrumentedChatViewModel loadingChatViewModel =
            _InstrumentedChatViewModel(
              const ChatViewState(
                channelId: _messageListChannelId,
                messages: <Message>[],
                replyingTo: null,
                replyMentioning: false,
                editingMessage: null,
                messageText: '',
                scrollToBottomSignal: 0,
                isLoading: true,
                isSyncingMessages: false,
                isLoadingMore: false,
                isLoadingNewer: false,
                hasMoreMessages: true,
                hasMoreNewerMessages: false,
                errorMessage: null,
              ),
            );

        await tester.pumpWidget(
          _messageListApp(
            database: source.database,
            chatViewModel: loadingChatViewModel,
            overrides: <Override>[
              messageListReadStateProvider(
                _messageListChannelId,
              ).overrideWith((ref) => readStateController.stream),
            ],
          ),
        );
        await tester.pump();
        expect(_messageItemFor(targetId), findsNothing);

        // Around-window first, then scroll signal while still unresolved.
        loadingChatViewModel._testState = loadingChatViewModel._testState
            .copyWith(messages: source.messages, isLoading: false);
        await tester.pump();
        expect(
          find.byType(Scrollable),
          findsNothing,
          reason: 'list must stay unresolved until read state arrives',
        );

        loadingChatViewModel.scrollToMessage(targetId);
        await tester.pump();
        await tester.pump();
        expect(
          find.byType(Scrollable),
          findsNothing,
          reason: 'signal must park while open mode is unresolved',
        );

        readStateController.add(null);
        await tester.pump();
        await tester.pump();
        await tester.pump();
        await tester.pumpAndSettle();

        expect(_messageItemFor(targetId), findsOneWidget);
        final Rect viewport = tester.getRect(_messageListScrollable());
        final Rect targetRect = tester.getRect(_messageItemFor(targetId));
        expect(
          (targetRect.center.dy - viewport.center.dy).abs(),
          lessThanOrEqualTo(16),
          reason:
              'target center=${targetRect.center.dy}, '
              'viewport center=${viewport.center.dy}',
        );

        await _disposeMessageList(tester);
      },
    );

    testWidgets('recenters after delayed tile reflow above the jump target', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final DateTime base = DateTime.utc(2026, 7, 4, 12);
      final List<Message> shortMessages = <Message>[
        for (int index = 0; index < 40; index += 1)
          _message(
            id: _snowflakeForUtc(base.add(Duration(minutes: index))),
            content: 'seed $index',
            timestamp: base.add(Duration(minutes: index)),
          ),
      ];
      final String targetId = shortMessages[18].id;
      // Grow tiles above + the target after the jump (async media reflow).
      final List<Message> reflowedMessages = <Message>[
        for (int index = 0; index < shortMessages.length; index += 1)
          _message(
            id: shortMessages[index].id,
            content: index >= 12 && index <= 18
                ? 'reflow media $index\n'
                      '${'expanded line after media load\n' * 5}'
                : shortMessages[index].content,
            timestamp: shortMessages[index].timestamp,
          ),
      ];
      final db.FluxerDatabase database = openTestDatabase();
      await database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value<String>(_messageListChannelId),
          lastMessageId: Value<String?>(shortMessages.last.id),
        ),
      );
      final _InstrumentedChatViewModel chatViewModel =
          _InstrumentedChatViewModel(
            ChatViewState(
              channelId: _messageListChannelId,
              messages: shortMessages,
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
              hasMoreNewerMessages: false,
              errorMessage: null,
            ),
          );

      await tester.pumpWidget(
        _messageListApp(database: database, chatViewModel: chatViewModel),
      );
      await tester.pumpAndSettle();

      chatViewModel.scrollToMessage(targetId);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      // One in-tolerance check only — not yet 3 consecutive stables.
      await tester.pump(const Duration(milliseconds: 48));
      expect(_messageItemFor(targetId), findsOneWidget);
      final Rect viewportBefore = tester.getRect(_messageListScrollable());
      final Rect targetBefore = tester.getRect(_messageItemFor(targetId));
      expect(
        (targetBefore.center.dy - viewportBefore.center.dy).abs(),
        lessThanOrEqualTo(16),
        reason: 'jump must land on-center before delayed reflow',
      );

      // Media above/target resolves taller while settle is still armed.
      chatViewModel._testState = chatViewModel._testState.copyWith(
        messages: reflowedMessages,
      );
      await tester.pump();
      for (int i = 0; i < 8; i++) {
        await tester.pump(const Duration(milliseconds: 48));
      }
      for (int i = 0; i < 6; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      for (int i = 0; i < 4; i++) {
        await tester.pump(const Duration(milliseconds: 160));
      }
      await tester.pumpAndSettle();

      expect(_messageItemFor(targetId), findsOneWidget);
      final Rect viewport = tester.getRect(_messageListScrollable());
      final Rect targetRect = tester.getRect(_messageItemFor(targetId));
      expect(
        (targetRect.center.dy - viewport.center.dy).abs(),
        lessThanOrEqualTo(16),
        reason:
            'target center=${targetRect.center.dy}, '
            'viewport center=${viewport.center.dy}',
      );

      await _disposeMessageList(tester);
    });

    testWidgets('recenters after late reflow past three stable settle checks', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final DateTime base = DateTime.utc(2026, 7, 4, 12);
      final List<Message> shortMessages = <Message>[
        for (int index = 0; index < 40; index += 1)
          _message(
            id: _snowflakeForUtc(base.add(Duration(minutes: index))),
            content: 'seed $index',
            timestamp: base.add(Duration(minutes: index)),
          ),
      ];
      final String targetId = shortMessages[18].id;
      final List<Message> reflowedMessages = <Message>[
        for (int index = 0; index < shortMessages.length; index += 1)
          _message(
            id: shortMessages[index].id,
            content: index >= 12 && index <= 18
                ? 'late reflow media $index\n'
                      '${'expanded line after late media load\n' * 5}'
                : shortMessages[index].content,
            timestamp: shortMessages[index].timestamp,
          ),
      ];
      final db.FluxerDatabase database = openTestDatabase();
      await database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value<String>(_messageListChannelId),
          lastMessageId: Value<String?>(shortMessages.last.id),
        ),
      );
      final _InstrumentedChatViewModel chatViewModel =
          _InstrumentedChatViewModel(
            ChatViewState(
              channelId: _messageListChannelId,
              messages: shortMessages,
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
              hasMoreNewerMessages: false,
              errorMessage: null,
            ),
          );

      await tester.pumpWidget(
        _messageListApp(database: database, chatViewModel: chatViewModel),
      );
      await tester.pumpAndSettle();

      chatViewModel.scrollToMessage(targetId);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      // More than three in-tolerance settle checks (~200ms+).
      await tester.pump(const Duration(milliseconds: 48));
      await tester.pump(const Duration(milliseconds: 48));
      await tester.pump(const Duration(milliseconds: 48));
      await tester.pump(const Duration(milliseconds: 48));
      await tester.pump(const Duration(milliseconds: 48));
      expect(_messageItemFor(targetId), findsOneWidget);
      final Rect viewportBefore = tester.getRect(_messageListScrollable());
      final Rect targetBefore = tester.getRect(_messageItemFor(targetId));
      expect(
        (targetBefore.center.dy - viewportBefore.center.dy).abs(),
        lessThanOrEqualTo(16),
        reason: 'jump must be on-center before late reflow',
      );

      // Media resolves after the old K=3 exit would have disarmed settle.
      chatViewModel._testState = chatViewModel._testState.copyWith(
        messages: reflowedMessages,
      );
      await tester.pump();
      for (int i = 0; i < 8; i++) {
        await tester.pump(const Duration(milliseconds: 48));
      }
      for (int i = 0; i < 6; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      for (int i = 0; i < 4; i++) {
        await tester.pump(const Duration(milliseconds: 160));
      }
      await tester.pumpAndSettle();

      expect(_messageItemFor(targetId), findsOneWidget);
      final Rect viewport = tester.getRect(_messageListScrollable());
      final Rect targetRect = tester.getRect(_messageItemFor(targetId));
      expect(
        (targetRect.center.dy - viewport.center.dy).abs(),
        lessThanOrEqualTo(16),
        reason:
            'late reflow target center=${targetRect.center.dy}, '
            'viewport center=${viewport.center.dy}',
      );

      await _disposeMessageList(tester);
    });
    testWidgets('drift after settle window closes does not re-center', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _AroundAckMessageListHarness harness =
          await _createBottomMessageListHarness();
      final String targetId = harness.messages[24].id;

      await tester.pumpWidget(
        _messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pumpAndSettle();

      harness.chatViewModel.scrollToMessage(targetId);
      // Exhaust the production settle window (~1.8s) so correction ends.
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      for (int i = 0; i < 8; i++) {
        await tester.pump(const Duration(milliseconds: 48));
      }
      for (int i = 0; i < 6; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      for (int i = 0; i < 6; i++) {
        await tester.pump(const Duration(milliseconds: 160));
      }
      await tester.pumpAndSettle();
      expect(_messageItemFor(targetId), findsOneWidget);

      final ScrollPosition position = _messageListScrollPosition(tester);
      final double drifted = (position.pixels + 140).clamp(
        position.minScrollExtent,
        position.maxScrollExtent,
      );
      position.jumpTo(drifted);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 48));
      await tester.pump(const Duration(milliseconds: 48));
      await tester.pumpAndSettle();

      expect(position.pixels, moreOrLessEquals(drifted, epsilon: 1));
      final Rect viewport = tester.getRect(_messageListScrollable());
      final Rect targetRect = tester.getRect(_messageItemFor(targetId));
      expect(
        (targetRect.center.dy - viewport.center.dy).abs(),
        greaterThan(60),
        reason:
            'post-window drift must not re-center '
            'target=${targetRect.center.dy} viewport=${viewport.center.dy}',
      );

      await _disposeMessageList(tester);
    });

    // #394 post-ack: same mounted MessageList keeps jump centering.
    testWidgets('post-ack sticky retained centers post-divider jump', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _AroundAckMessageListHarness harness =
          await _createAroundAckMessageListHarness(
            ackIndex: 20,
            messageCount: 55,
          );
      final String postDividerId = harness.messages[35].id;

      await tester.pumpWidget(
        _messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.text('NEW'), findsOneWidget);

      harness.chatViewModel._testState = harness.chatViewModel._testState
          .copyWith(stickyUnreadMessageId: harness.firstUnreadId);
      await tester.pump();
      await harness.database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value<String>(_messageListChannelId),
          lastMessageId: Value<String?>(harness.newestLoadedId),
        ),
      );
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.text('NEW'), findsOneWidget);

      harness.chatViewModel.scrollToMessage(postDividerId);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      for (int i = 0; i < 8; i++) {
        await tester.pump(const Duration(milliseconds: 48));
      }
      for (int i = 0; i < 4; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      await tester.pumpAndSettle();

      expect(_messageItemFor(postDividerId), findsOneWidget);
      final Rect viewport = tester.getRect(_messageListScrollable());
      final Rect target = tester.getRect(_messageItemFor(postDividerId));
      final double delta = (target.center.dy - viewport.center.dy).abs();
      expect(
        delta,
        lessThanOrEqualTo(16),
        reason:
            'sticky-retained post-divider center=${target.center.dy}, '
            'viewport=${viewport.center.dy}',
      );

      await tester.pump(const Duration(milliseconds: 2000));
      await _disposeMessageList(tester);
    });

    testWidgets('post-ack sticky retained centers pre-divider jump', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _AroundAckMessageListHarness harness =
          await _createAroundAckMessageListHarness(
            ackIndex: 20,
            messageCount: 55,
          );
      final String preDividerId = harness.messages[15].id;

      await tester.pumpWidget(
        _messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.text('NEW'), findsOneWidget);

      harness.chatViewModel._testState = harness.chatViewModel._testState
          .copyWith(stickyUnreadMessageId: harness.firstUnreadId);
      await tester.pump();
      await harness.database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value<String>(_messageListChannelId),
          lastMessageId: Value<String?>(harness.newestLoadedId),
        ),
      );
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.text('NEW'), findsOneWidget);

      harness.chatViewModel.scrollToMessage(preDividerId);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      for (int i = 0; i < 8; i++) {
        await tester.pump(const Duration(milliseconds: 48));
      }
      for (int i = 0; i < 4; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      await tester.pumpAndSettle();

      expect(_messageItemFor(preDividerId), findsOneWidget);
      final ScrollPosition position = _messageListScrollPosition(tester);
      final Rect viewport = tester.getRect(_messageListScrollable());
      final Rect target = tester.getRect(_messageItemFor(preDividerId));
      final double delta = (target.center.dy - viewport.center.dy).abs();
      final bool atMin = position.pixels <= position.minScrollExtent + 1;
      final bool atMax = position.pixels >= position.maxScrollExtent - 1;
      if (atMin || atMax) {
        expect(target.top, greaterThanOrEqualTo(viewport.top - 8));
        expect(target.bottom, lessThanOrEqualTo(viewport.bottom + 8));
      } else {
        expect(
          delta,
          lessThanOrEqualTo(16),
          reason:
              'sticky-retained pre-divider center=${target.center.dy}, '
              'viewport=${viewport.center.dy}',
        );
      }

      await tester.pump(const Duration(milliseconds: 2000));
      await _disposeMessageList(tester);
    });

    testWidgets('post-ack sticky cleared centers post-divider jump', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _AroundAckMessageListHarness harness =
          await _createAroundAckMessageListHarness(
            ackIndex: 20,
            messageCount: 55,
          );
      final String postDividerId = harness.messages[35].id;

      await tester.pumpWidget(
        _messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.text('NEW'), findsOneWidget);

      harness.chatViewModel._testState = harness.chatViewModel._testState
          .copyWith(stickyUnreadMessageId: harness.firstUnreadId);
      await tester.pump();
      await harness.database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value<String>(_messageListChannelId),
          lastMessageId: Value<String?>(harness.newestLoadedId),
        ),
      );
      await tester.pump();
      await tester.pump();
      harness.chatViewModel._testState = harness.chatViewModel._testState
          .copyWith(stickyUnreadMessageId: null);
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.text('NEW'), findsNothing);

      harness.chatViewModel.scrollToMessage(postDividerId);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      for (int i = 0; i < 8; i++) {
        await tester.pump(const Duration(milliseconds: 48));
      }
      for (int i = 0; i < 4; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      await tester.pumpAndSettle();

      expect(_messageItemFor(postDividerId), findsOneWidget);
      final Rect viewport = tester.getRect(_messageListScrollable());
      final Rect target = tester.getRect(_messageItemFor(postDividerId));
      final double delta = (target.center.dy - viewport.center.dy).abs();
      expect(
        delta,
        lessThanOrEqualTo(16),
        reason:
            'sticky-cleared post-divider center=${target.center.dy}, '
            'viewport=${viewport.center.dy}',
      );

      await tester.pump(const Duration(milliseconds: 2000));
      await _disposeMessageList(tester);
    });

    testWidgets('post-ack sticky cleared centers pre-divider jump', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _AroundAckMessageListHarness harness =
          await _createAroundAckMessageListHarness(
            ackIndex: 20,
            messageCount: 55,
          );
      final String preDividerId = harness.messages[15].id;

      await tester.pumpWidget(
        _messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.text('NEW'), findsOneWidget);

      harness.chatViewModel._testState = harness.chatViewModel._testState
          .copyWith(stickyUnreadMessageId: harness.firstUnreadId);
      await tester.pump();
      await harness.database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value<String>(_messageListChannelId),
          lastMessageId: Value<String?>(harness.newestLoadedId),
        ),
      );
      await tester.pump();
      await tester.pump();
      harness.chatViewModel._testState = harness.chatViewModel._testState
          .copyWith(stickyUnreadMessageId: null);
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.text('NEW'), findsNothing);

      harness.chatViewModel.scrollToMessage(preDividerId);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      for (int i = 0; i < 8; i++) {
        await tester.pump(const Duration(milliseconds: 48));
      }
      for (int i = 0; i < 4; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      await tester.pumpAndSettle();

      expect(_messageItemFor(preDividerId), findsOneWidget);
      final ScrollPosition position = _messageListScrollPosition(tester);
      final Rect viewport = tester.getRect(_messageListScrollable());
      final Rect target = tester.getRect(_messageItemFor(preDividerId));
      final double delta = (target.center.dy - viewport.center.dy).abs();
      final bool atMin = position.pixels <= position.minScrollExtent + 1;
      final bool atMax = position.pixels >= position.maxScrollExtent - 1;
      // Strict center when not extent-clamped: sticky-cleared is the
      // stream-split mismatch case (jump stream still injects divider).
      if (atMin || atMax) {
        expect(target.top, greaterThanOrEqualTo(viewport.top - 8));
        expect(target.bottom, lessThanOrEqualTo(viewport.bottom + 8));
      } else {
        expect(
          delta,
          lessThanOrEqualTo(16),
          reason:
              'sticky-cleared pre-divider center=${target.center.dy}, '
              'viewport=${viewport.center.dy}',
        );
      }

      await tester.pump(const Duration(milliseconds: 2000));
      await _disposeMessageList(tester);
    });

    testWidgets(
      'orphaned center anchor after around-window converts and centers jump',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(
              ackIndex: 20,
              messageCount: 120,
            );
        // Mid-window target so reverse-list extent allows true centering.
        final String targetId = harness.messages[90].id;

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await tester.pumpAndSettle();
        expect(find.text('NEW'), findsOneWidget);

        harness.chatViewModel._testState = harness.chatViewModel._testState
            .copyWith(stickyUnreadMessageId: harness.firstUnreadId);
        await tester.pump();
        await harness.database.readStateDao.upsertReadState(
          db.ReadStatesCompanion(
            channelId: const Value<String>(_messageListChannelId),
            lastMessageId: Value<String?>(harness.newestLoadedId),
          ),
        );
        await tester.pump();
        await tester.pump();
        harness.chatViewModel._testState = harness.chatViewModel._testState
            .copyWith(stickyUnreadMessageId: null);
        await tester.pump();
        await tester.pumpAndSettle();
        expect(find.text('NEW'), findsNothing);

        // Around-window drops the open-mode center anchor; keep jump target.
        final List<Message> aroundWindow = harness.messages.sublist(50, 120);
        expect(
          aroundWindow.any((Message m) => m.id == harness.firstUnreadId),
          isFalse,
        );
        expect(aroundWindow.any((Message m) => m.id == targetId), isTrue);
        harness.chatViewModel._testState = harness.chatViewModel._testState
            .copyWith(
              messages: aroundWindow,
              hasMoreMessages: true,
              hasMoreNewerMessages: false,
            );
        await tester.pump();
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 16));
        expect(find.byType(ListView), findsWidgets);

        harness.chatViewModel.scrollToMessage(targetId);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
        for (int i = 0; i < 12; i++) {
          await tester.pump(const Duration(milliseconds: 48));
        }
        for (int i = 0; i < 8; i++) {
          await tester.pump(const Duration(milliseconds: 100));
        }
        await tester.pump(const Duration(milliseconds: 500));
        for (int i = 0; i < 6; i++) {
          await tester.pump(const Duration(milliseconds: 160));
        }

        expect(_messageItemFor(targetId), findsOneWidget);
        final Rect viewport = tester.getRect(_messageListScrollable());
        final Rect target = tester.getRect(_messageItemFor(targetId));
        expect(
          (target.center.dy - viewport.center.dy).abs(),
          lessThanOrEqualTo(16),
          reason:
              'post-ack orphaned-anchor target center=${target.center.dy}, '
              'viewport=${viewport.center.dy}',
        );

        await tester.pump(const Duration(milliseconds: 2000));
        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'orphaned center anchor without ack converts and centers jump',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(
              ackIndex: 20,
              messageCount: 120,
            );
        final String targetId = harness.messages[90].id;

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await tester.pumpAndSettle();
        expect(find.text('NEW'), findsOneWidget);

        final List<Message> aroundWindow = harness.messages.sublist(50, 120);
        expect(
          aroundWindow.any((Message m) => m.id == harness.firstUnreadId),
          isFalse,
        );
        harness.chatViewModel._testState = harness.chatViewModel._testState
            .copyWith(
              messages: aroundWindow,
              hasMoreMessages: true,
              hasMoreNewerMessages: false,
            );
        await tester.pump();
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 16));
        expect(find.byType(ListView), findsWidgets);

        harness.chatViewModel.scrollToMessage(targetId);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
        for (int i = 0; i < 12; i++) {
          await tester.pump(const Duration(milliseconds: 48));
        }
        for (int i = 0; i < 8; i++) {
          await tester.pump(const Duration(milliseconds: 100));
        }
        await tester.pump(const Duration(milliseconds: 500));
        for (int i = 0; i < 6; i++) {
          await tester.pump(const Duration(milliseconds: 160));
        }

        expect(_messageItemFor(targetId), findsOneWidget);
        final Rect viewport = tester.getRect(_messageListScrollable());
        final Rect target = tester.getRect(_messageItemFor(targetId));
        expect(
          (target.center.dy - viewport.center.dy).abs(),
          lessThanOrEqualTo(16),
          reason:
              'unread orphaned-anchor center=${target.center.dy}, '
              'viewport=${viewport.center.dy}',
        );

        await tester.pump(const Duration(milliseconds: 2000));
        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'orphaned center anchor without jump preserves viewport message',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(
              ackIndex: 20,
              messageCount: 80,
            );
        // Message near the open center that stays in the window after trim.
        final String preserveId = harness.messages[30].id;

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await tester.pumpAndSettle();
        expect(find.text('NEW'), findsOneWidget);

        // Scroll so preserveId is the reading position (center-ish).
        harness.chatViewModel.scrollToMessage(preserveId);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
        for (int i = 0; i < 8; i++) {
          await tester.pump(const Duration(milliseconds: 48));
        }
        for (int i = 0; i < 4; i++) {
          await tester.pump(const Duration(milliseconds: 100));
        }
        await tester.pumpAndSettle();
        expect(_messageItemFor(preserveId), findsOneWidget);
        final Rect viewportBefore = tester.getRect(_messageListScrollable());
        final Rect preserveBefore = tester.getRect(_messageItemFor(preserveId));
        expect(
          (preserveBefore.center.dy - viewportBefore.center.dy).abs(),
          lessThanOrEqualTo(16),
        );

        // Drop only the open-mode center anchor from the stream (trim older
        // side through firstUnread) with no pending jump target.
        final int firstUnreadIndex = harness.messages.indexWhere(
          (Message m) => m.id == harness.firstUnreadId,
        );
        expect(firstUnreadIndex, greaterThan(0));
        final List<Message> trimmed = harness.messages.sublist(
          firstUnreadIndex + 1,
        );
        expect(
          trimmed.any((Message m) => m.id == harness.firstUnreadId),
          isFalse,
        );
        expect(trimmed.any((Message m) => m.id == preserveId), isTrue);
        harness.chatViewModel._testState = harness.chatViewModel._testState
            .copyWith(
              messages: trimmed,
              hasMoreMessages: true,
              hasMoreNewerMessages:
                  harness.chatViewModel._testState.hasMoreNewerMessages,
            );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
        for (int i = 0; i < 8; i++) {
          await tester.pump(const Duration(milliseconds: 48));
        }
        for (int i = 0; i < 4; i++) {
          await tester.pump(const Duration(milliseconds: 100));
        }
        await tester.pumpAndSettle();

        // Still visible after layout conversion — not yanked to live tail.
        expect(_messageItemFor(preserveId), findsOneWidget);
        final Rect viewportAfter = tester.getRect(_messageListScrollable());
        final Rect preserveAfter = tester.getRect(_messageItemFor(preserveId));
        expect(
          preserveAfter.top,
          lessThan(viewportAfter.bottom - 8),
          reason: 'preserved message must remain in viewport after convert',
        );
        expect(
          preserveAfter.bottom,
          greaterThan(viewportAfter.top + 8),
          reason: 'preserved message must remain in viewport after convert',
        );
        // Must not be parked at the newest edge only (tail yank).
        final String newestId = trimmed.last.id;
        if (newestId != preserveId) {
          final Finder newestFinder = _messageItemFor(newestId);
          if (tester.any(newestFinder)) {
            final Rect newestRect = tester.getRect(newestFinder);
            final bool newestDominates =
                (newestRect.center.dy - viewportAfter.center.dy).abs() <= 16 &&
                (preserveAfter.center.dy - viewportAfter.center.dy).abs() > 80;
            expect(
              newestDominates,
              isFalse,
              reason: 'conversion must not yank viewport to live tail',
            );
          }
        }

        await tester.pump(const Duration(milliseconds: 2000));
        await _disposeMessageList(tester);
      },
    );

    testWidgets('user drag during jump settle cancels re-centering', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _AroundAckMessageListHarness harness =
          await _createBottomMessageListHarness();
      final String targetId = harness.messages[24].id;

      await tester.pumpWidget(
        _messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pumpAndSettle();

      harness.chatViewModel.scrollToMessage(targetId);
      // Let the index jump land; settle correction is still armed.
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      expect(_messageItemFor(targetId), findsOneWidget);

      // User-initiated drag cancels post-jump settle re-centering.
      await tester.drag(_messageListScrollable(), const Offset(0, -180));
      await tester.pump();
      final ScrollPosition position = _messageListScrollPosition(tester);
      final double pixelsAfterDrag = position.pixels;
      final Rect viewportAfterDrag = tester.getRect(_messageListScrollable());
      final Rect targetAfterDrag = tester.getRect(_messageItemFor(targetId));
      final double driftAfterDrag =
          (targetAfterDrag.center.dy - viewportAfterDrag.center.dy).abs();
      expect(
        driftAfterDrag,
        greaterThan(60),
        reason: 'drag must leave the target off-center for this regression',
      );

      // Inject additional drift; settle must not yank back to center.
      final double drifted = (position.pixels + 80).clamp(
        position.minScrollExtent,
        position.maxScrollExtent,
      );
      position.jumpTo(drifted);
      await tester.pump();
      final double pixelsAfterInject = position.pixels;

      await tester.pump(const Duration(milliseconds: 48));
      await tester.pump(const Duration(milliseconds: 48));
      await tester.pump(const Duration(milliseconds: 48));
      await tester.pump(const Duration(milliseconds: 48));
      await tester.pumpAndSettle();

      expect(
        position.pixels,
        moreOrLessEquals(pixelsAfterInject, epsilon: 1),
        reason:
            'settle must not re-jump after user drag '
            '(afterDrag=$pixelsAfterDrag inject=$pixelsAfterInject)',
      );
      final Rect viewport = tester.getRect(_messageListScrollable());
      final Rect targetRect = tester.getRect(_messageItemFor(targetId));
      expect(
        (targetRect.center.dy - viewport.center.dy).abs(),
        greaterThan(60),
        reason: 'user-left offset must remain off-center after settle window',
      );

      await _disposeMessageList(tester);
    });

    testWidgets('unread mode centers pre-divider jump targets', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _AroundAckMessageListHarness harness =
          await _createAroundAckMessageListHarness(
            ackIndex: 25,
            messageCount: 55,
          );
      final String beforeId = harness.olderReadId;

      await tester.pumpWidget(
        _messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.text('NEW'), findsOneWidget);

      harness.chatViewModel.scrollToMessage(beforeId);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();

      expect(_messageItemFor(beforeId), findsOneWidget);
      final Rect viewport = tester.getRect(_messageListScrollable());
      final Rect target = tester.getRect(_messageItemFor(beforeId));
      expect(
        (target.center.dy - viewport.center.dy).abs(),
        lessThanOrEqualTo(16),
        reason:
            'pre-divider target center=${target.center.dy}, '
            'viewport center=${viewport.center.dy}',
      );

      await _disposeMessageList(tester);
    });

    testWidgets(
      'unread mode centers pre-divider target from post-divider start',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(
              ackIndex: 25,
              messageCount: 70,
            );
        // Deep in the leading (read) side, not the message adjacent to NEW.
        final String beforeId = harness.messages[8].id;
        final String deepAfterId = harness.messages[55].id;

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await tester.pumpAndSettle();
        expect(find.text('NEW'), findsOneWidget);

        // Scroll well into the trailing (post-divider) region first.
        harness.chatViewModel.scrollToMessage(deepAfterId);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
        await tester.pumpAndSettle();
        expect(_messageItemFor(deepAfterId), findsOneWidget);

        // Cross the center anchor upward to a deep pre-divider leading target.
        harness.chatViewModel.scrollToMessage(beforeId);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
        for (int i = 0; i < 8; i++) {
          await tester.pump(const Duration(milliseconds: 48));
        }
        for (int i = 0; i < 6; i++) {
          await tester.pump(const Duration(milliseconds: 100));
        }
        for (int i = 0; i < 4; i++) {
          await tester.pump(const Duration(milliseconds: 160));
        }
        await tester.pumpAndSettle();

        expect(_messageItemFor(beforeId), findsOneWidget);
        final ScrollPosition position = _messageListScrollPosition(tester);
        final Rect viewport = tester.getRect(_messageListScrollable());
        final Rect target = tester.getRect(_messageItemFor(beforeId));
        final double delta = (target.center.dy - viewport.center.dy).abs();
        final bool atMin = position.pixels <= position.minScrollExtent + 1;
        final bool atMax = position.pixels >= position.maxScrollExtent - 1;
        if (atMin || atMax) {
          // Geometry cannot true-center; require full visibility.
          expect(
            target.top,
            greaterThanOrEqualTo(viewport.top + 8),
            reason: 'clamped cross-anchor jump must keep target top visible',
          );
          expect(
            target.bottom,
            lessThanOrEqualTo(viewport.bottom - 8),
            reason:
                'clamped cross-anchor jump must keep target bottom visible '
                '(delta=$delta)',
          );
        } else {
          expect(
            delta,
            lessThanOrEqualTo(16),
            reason:
                'pre-divider from trailing start center=${target.center.dy}, '
                'viewport center=${viewport.center.dy}',
          );
        }

        await tester.pump(const Duration(milliseconds: 2000));
        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'unread mode mid-sliver post-divider jump centers when extent allows',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        // Plenty of messages after first unread so the target is mid-trailing.
        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(
              ackIndex: 10,
              messageCount: 60,
            );
        // Mid of the unread half (indices 11..59), not near the tail.
        final String midAfterId = harness.messages[30].id;

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await tester.pumpAndSettle();
        expect(find.text('NEW'), findsOneWidget);

        harness.chatViewModel.scrollToMessage(midAfterId);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
        await tester.pumpAndSettle();

        expect(_messageItemFor(midAfterId), findsOneWidget);
        final ScrollPosition position = _messageListScrollPosition(tester);
        final double remaining = position.maxScrollExtent - position.pixels;
        final Rect viewport = tester.getRect(_messageListScrollable());
        final Rect target = tester.getRect(_messageItemFor(midAfterId));
        final double delta = (target.center.dy - viewport.center.dy).abs();
        expect(
          remaining,
          greaterThan(80),
          reason: 'mid-sliver target must not be max-extent clamped',
        );
        expect(
          delta,
          lessThanOrEqualTo(16),
          reason:
              'mid post-divider target center=${target.center.dy}, '
              'viewport center=${viewport.center.dy}, remaining=$remaining',
        );

        await _disposeMessageList(tester);
      },
    );

    testWidgets(
      'unread mode near-tail post-divider jump is fully visible when clamped',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final _AroundAckMessageListHarness harness =
            await _createAroundAckMessageListHarness(
              ackIndex: 40,
              hasMoreNewerMessages: false,
            );
        // Near the live tail on the unread side (few messages below).
        final String nearTailId = harness.messages[47].id;

        await tester.pumpWidget(
          _messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await tester.pumpAndSettle();
        expect(find.text('NEW'), findsOneWidget);

        harness.chatViewModel.scrollToMessage(nearTailId);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
        await tester.pumpAndSettle();

        expect(_messageItemFor(nearTailId), findsOneWidget);
        final Rect viewport = tester.getRect(_messageListScrollable());
        final Rect target = tester.getRect(_messageItemFor(nearTailId));

        // Near-tail post-divider targets often cannot true-center (extent
        // clamp). Contract is full visibility, not barely-on-screen.
        expect(
          target.top,
          greaterThanOrEqualTo(viewport.top + 8),
          reason: 'post-divider near-tail jump must keep target top visible',
        );
        expect(
          target.bottom,
          lessThanOrEqualTo(viewport.bottom - 8),
          reason: 'post-divider near-tail jump must keep target bottom visible',
        );
        expect(
          target.height,
          lessThanOrEqualTo(viewport.height - 16),
          reason: 'fixture target must fit the viewport for this assertion',
        );

        // Clamp detection must stop settle re-jumps against the extent edge.
        final ScrollPosition position = _messageListScrollPosition(tester);
        final double pixelsAfterJump = position.pixels;
        await tester.pump(const Duration(milliseconds: 48));
        await tester.pump(const Duration(milliseconds: 48));
        await tester.pump(const Duration(milliseconds: 48));
        await tester.pump(const Duration(milliseconds: 48));
        expect(
          position.pixels,
          moreOrLessEquals(pixelsAfterJump, epsilon: 1),
          reason: 'clamped settle must not thrash re-jumps at the extent edge',
        );

        await tester.pump(const Duration(milliseconds: 2000));
        await _disposeMessageList(tester);
      },
    );
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

  String appendRealtimeMessage({required bool acknowledgedByGateway}) {
    final List<Message> next = List<Message>.of(
      chatViewModel._testState.messages,
    );
    final DateTime timestamp = next.last.timestamp.add(
      const Duration(minutes: 1),
    );
    final String id = _snowflakeForUtc(timestamp);
    next.add(
      _message(id: id, content: 'realtime message', timestamp: timestamp),
    );
    chatViewModel._testState = chatViewModel._testState.copyWith(
      messages: next,
      pendingAutoAckMessageId: acknowledgedByGateway ? id : null,
    );
    return id;
  }

  String appendTallNewerMessage({int lines = 18}) {
    final List<Message> next = List<Message>.of(
      chatViewModel._testState.messages,
    );
    final DateTime timestamp = next.last.timestamp.add(
      const Duration(minutes: 1),
    );
    final String id = _snowflakeForUtc(timestamp);
    final String content = List<String>.generate(
      lines,
      (int i) => 'tall line $i of the newest message',
    ).join('\n');
    next.add(_message(id: id, content: content, timestamp: timestamp));
    chatViewModel._testState = chatViewModel._testState.copyWith(
      messages: next,
    );
    return id;
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
  bool startLoading = false,
  bool retainMessagesWhileLoading = false,
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
      messages: startLoading && !retainMessagesWhileLoading
          ? const <Message>[]
          : messages,
      replyingTo: null,
      replyMentioning: false,
      editingMessage: null,
      messageText: '',
      scrollToBottomSignal: 0,
      isLoading: startLoading,
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
  List<Override> overrides = const <Override>[],
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: <Override>[
      ..._messageListOverrides(
        database: database,
        chatViewModel: chatViewModel,
        blockedUserIds: blockedUserIds,
      ),
      ...overrides,
    ],
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

  @override
  ChatViewState build() {
    ref
        .read(chatReadViewportProvider.notifier)
        .setActiveChannel(_initialState.channelId);
    return _initialState;
  }

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
  Future<void> ackCurrentChannel({bool force = false}) async {}

  @override
  Future<void> markCurrentChannelRead() async {}

  @override
  Future<void> jumpToFirstUnread() async {}

  @override
  Future<bool> jumpToLatestMessages() async {
    final List<Message> latestMessages = _latestReplacementMessages();
    _latestReplacementNewestId = latestMessages.last.id;
    state = state.copyWith(
      messages: latestMessages,
      hasMoreNewerMessages: false,
    );
    scrollToBottom();
    return true;
  }

  @override
  void trimToNewestWindow() {}

  @override
  void clearCurrentManualUnread() {}

  @override
  void clearStickyUnreadAfterBuildForCurrentChannel() {}
}

class _PagingInstrumentedChatViewModel extends _InstrumentedChatViewModel {
  _PagingInstrumentedChatViewModel(
    super._initialState, {
    required List<List<Message>> newerPages,
  }) : _newerPages = newerPages.map(List<Message>.from).toList();

  final List<List<Message>> _newerPages;

  @override
  Future<void> loadNewer() async {
    await super.loadNewer();
    if (_newerPages.isEmpty) {
      return;
    }
    final List<Message> page = _newerPages.removeAt(0);
    state = state.copyWith(
      messages: <Message>[...state.messages, ...page],
      hasMoreNewerMessages: _newerPages.isNotEmpty,
      isLoadingNewer: false,
    );
  }
}
