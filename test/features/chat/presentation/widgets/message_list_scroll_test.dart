@Tags(['slow'])
library;

import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_window.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/blocked_message_groups.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_demand_source.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_overlay.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_unread_review.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/pump_fluxer_app.dart';
import 'messages/message_list_test_harness.dart';

void main() {
  group('unread center open path', () {
    testWidgets(
      'first frame centers the NEW divider and keeps read messages chronological',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(ackIndex: 42);

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();

        final Finder unreadDivider = find.text('NEW');
        final Finder olderRead = messageItemFor(harness.olderReadId);
        final Finder ackBoundary = messageItemFor(harness.ackId);
        final Finder firstUnread = messageItemFor(harness.firstUnreadId);
        expect(unreadDivider, findsOneWidget);
        expect(olderRead, findsOneWidget);
        expect(ackBoundary, findsOneWidget);
        expect(firstUnread, findsOneWidget);

        final Rect viewport = tester.getRect(messageListScrollable());
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

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'many unreads keep NEW centered with the newest below the fold',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(ackIndex: 5);

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await tester.pump();

        final Finder unreadDivider = find.text('NEW');
        final Finder firstUnread = messageItemFor(harness.firstUnreadId);
        expect(unreadDivider, findsOneWidget);
        expect(firstUnread, findsOneWidget);

        final Rect viewport = tester.getRect(messageListScrollable());
        final double viewportCenterY = viewport.top + viewport.height * 0.5;
        expect(
          tester.getRect(unreadDivider).center.dy,
          moreOrLessEquals(viewportCenterY, epsilon: 48),
        );
        expect(
          tester.getRect(firstUnread).top,
          greaterThanOrEqualTo(tester.getRect(unreadDivider).bottom - 4),
        );

        final ScrollPosition position = messageListScrollPosition(tester);
        expect(
          position.maxScrollExtent - position.pixels,
          greaterThan(kMessageListReadBottomThreshold),
          reason: 'a long unread backlog should extend below the viewport',
        );
        expect(
          messageItemFor(harness.newestLoadedId),
          findsNothing,
          reason: 'the newest unread should stay below the fold on open',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'open inside the newer margin issues one bounded prefetch - an empty '
      'page parks the pump instead of refetching per frame',
      (WidgetTester tester) async {
        // The old level trigger gated on isUserDrivenScroll to avoid
        // open-time fetch loops. Demand is now a pure level: an open inside
        // the margin MAY prefetch, and the pump/park machinery - not a
        // gesture gate - bounds it.
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(ackIndex: 42);

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();

        final ScrollableState scrollable = tester.state<ScrollableState>(
          messageListScrollable(),
        );
        final double distanceFromTrailingEdge =
            messageListNewestRowOffset(tester) - scrollable.position.pixels;
        expect(
          distanceFromTrailingEdge,
          lessThanOrEqualTo(
            messageListLoadEnterMargin(scrollable.position.viewportDimension),
          ),
        );

        // Drain the pump: the double answers every request with an empty
        // page, which must park the edge after EXACTLY one request.
        for (int i = 0; i < 6; i += 1) {
          await tester.pump();
        }
        expect(
          harness.chatViewModel.loadNewerCallCount,
          1,
          reason: 'an open inside the margin activates demand exactly once',
        );
        // And a static in-margin viewport never buys a second request.
        for (int i = 0; i < 3; i += 1) {
          await tester.pump();
        }
        expect(
          harness.chatViewModel.loadNewerCallCount,
          1,
          reason:
              'an unproductive cursor parks; refetching it per frame is the '
              'pagination loop',
        );

        await disposeMessageList(tester);
      },
    );
    testWidgets(
      'async unread open publishes near-tail viewport geometry without a scroll',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 672);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              ackIndex: 47,
              startLoading: true,
              retainMessagesWhileLoading: true,
            );
        await tester.pumpWidget(
          messageListApp(
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
                channelId: messageListChannelId,
                nearLoadedTail: false,
                distanceFromBottom: double.infinity,
                viewportHeight: 0,
                sampledTailId: null,
              );
        });
        harness.chatViewModel.testState = harness.chatViewModel.testState
            .copyWith(
              write: (
                messages: harness.messages,
                origin: MessagesOrigin.windowSwap,
              ),
              isLoading: false,
            );
        await tester.pump();
        final ChatReadViewportState initialViewport = container.read(
          chatReadViewportProvider,
        );
        expect(initialViewport.channelId, messageListChannelId);
        expect(initialViewport.nearLoadedTail, isTrue);
        // NOTE: no loadNewerCallCount assertion here - under level-based
        // demand an open inside the margin may issue a bounded prefetch;
        // this test pins the read-viewport geometry publication only.
        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'async unread open near the tail has scrollable geometry without a scroll',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 1424);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              ackIndex: 47,
              hasMoreNewerMessages: false,
              startLoading: true,
            );
        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await tester.pump();
        harness.chatViewModel.testState = harness.chatViewModel.testState
            .copyWith(
              write: (
                messages: harness.messages,
                origin: MessagesOrigin.windowSwap,
              ),
              isLoading: false,
            );
        await tester.pump();
        await tester.pump();

        final ScrollPosition position = messageListScrollPosition(tester);
        expect(find.text('NEW'), findsOneWidget);
        final double trailingDistance =
            position.maxScrollExtent - position.pixels;
        expect(
          position.maxScrollExtent - position.minScrollExtent,
          greaterThan(0),
          reason: 'older history must remain scrollable above the tail',
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
        expect(harness.chatViewModel.loadNewerCallCount, 0);
        await disposeMessageList(tester);
      },
    );

    testWidgets('async unread open stays away from tail without a scroll', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final AroundAckMessageListHarness harness =
          await createAroundAckMessageListHarness(
            ackIndex: 40,
            messageCount: 55,
            hasMoreNewerMessages: false,
            startLoading: true,
          );
      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pump();
      await tester.pump();
      harness.chatViewModel.testState = harness.chatViewModel.testState
          .copyWith(
            write: (
              messages: harness.messages,
              origin: MessagesOrigin.windowSwap,
            ),
            isLoading: false,
          );
      await tester.pump();
      await tester.pump();

      final ScrollPosition position = messageListScrollPosition(tester);
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
      final int loadNewerCallCount = harness.chatViewModel.loadNewerCallCount;
      await disposeMessageList(tester);

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

      final AroundAckMessageListHarness harness =
          await createAroundAckMessageListHarness(
            messageCount: 60,
            ackIndex: 34,
          );

      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pump();
      // The open sits inside the newer margin, so level demand may issue one
      // bounded prefetch; the empty page parks the pump. Drain it first.
      for (int i = 0; i < 4; i += 1) {
        await tester.pump();
      }
      final int before = harness.chatViewModel.loadNewerCallCount;

      await tester.drag(messageListScrollable(), const Offset(0, -900));
      await tester.pump();

      expect(
        harness.chatViewModel.loadNewerCallCount,
        greaterThan(before),
        reason:
            'a deliberate gesture into the newer edge must buy a retry of '
            'the parked cursor',
      );

      await disposeMessageList(tester);
    });
    testWidgets(
      'a drag past the loaded newer edge onto the skeleton requests newer pages',
      (WidgetTester tester) async {
        // The starvation case from the device log (21:19:01-21:19:24: seven
        // fling gestures, zero requests, user bailed to jump-to-present). At
        // the loaded newer edge a drag toward newer moves ZERO pixels, so no
        // position listener ever runs; the trigger must hear the gesture
        // itself (ScrollStart with drag details, and the overscroll at the
        // clamped edge) or the edge goes dead while hasMoreNewerMessages is
        // still true.
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final DateTime base = DateTime.utc(2026, 7, 4, 12);
        final InstrumentedChatViewModel chatViewModel =
            InstrumentedChatViewModel(
              ChatViewState(
                channelId: messageListChannelId,
                messages: <Message>[
                  for (int index = 0; index < 30; index += 1)
                    harnessMessage(
                      id: snowflakeForUtc(base.add(Duration(minutes: index))),
                      content: 'message $index',
                      timestamp: base.add(Duration(minutes: index)),
                    ),
                ],
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
            );
        final db.FluxerDatabase database = openTestDatabase();

        await tester.pumpWidget(
          messageListApp(database: database, chatViewModel: chatViewModel),
        );
        await pumpFluxerFrames(tester);

        final ScrollPosition position = messageListScrollPosition(tester);
        expect(
          messageListNewestRowOffset(tester) - position.pixels,
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
          reason: 'a bottom open parks the viewport at the loaded newer edge',
        );
        final int loadNewerBefore = chatViewModel.loadNewerCallCount;

        await tester.drag(messageListScrollable(), const Offset(0, -400));
        await tester.pump();

        expect(
          position.pixels,
          greaterThan(messageListNewestRowOffset(tester)),
          reason: 'the drag carried the reader past the loaded newer edge',
        );
        expect(
          chatViewModel.loadNewerCallCount,
          greaterThan(loadNewerBefore),
          reason:
              'the gesture itself must arm and evaluate the newer-edge load: '
              'a notification-starved trigger is the device-log stall',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'scroll to bottom still works after a loaded message jump signal',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createBottomMessageListHarness();

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);

        final ScrollPosition opened = messageListScrollPosition(tester);
        expect(
          opened.maxScrollExtent - opened.pixels,
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
        );

        final String loadedId = harness.oldestLoadedId;
        harness.chatViewModel.scrollToMessage(loadedId);
        await pumpMessageJump(tester);

        // Every jump re-anchors onto a FRESH ScrollPosition: re-fetch.
        expect(messageItemFor(loadedId), findsOneWidget);
        final ScrollPosition afterFirstJump = messageListScrollPosition(tester);
        expect(
          afterFirstJump.maxScrollExtent - afterFirstJump.pixels,
          greaterThan(kMessageListReadBottomThreshold),
        );

        harness.chatViewModel.scrollToBottom();
        await pumpScrollToBottom(tester);

        final ScrollPosition afterFirstBottom = messageListScrollPosition(
          tester,
        );
        // At the tail: either a plain jumpTo(max) or - for a deep trailing
        // run - the pinned re-center re-anchor (fresh position at offset 0).
        expect(
          afterFirstBottom.maxScrollExtent - afterFirstBottom.pixels,
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
        );

        final String secondLoadedId =
            harness.messages[harness.messages.length ~/ 2].id;
        harness.chatViewModel.scrollToMessage(secondLoadedId);
        await pumpMessageJump(tester);

        expect(messageItemFor(secondLoadedId), findsOneWidget);
        final ScrollPosition afterSecondJump = messageListScrollPosition(
          tester,
        );
        expect(
          afterSecondJump.maxScrollExtent - afterSecondJump.pixels,
          greaterThan(kMessageListReadBottomThreshold),
        );

        harness.chatViewModel.scrollToBottom();
        await pumpScrollToBottom(tester);

        final ScrollPosition afterSecondBottom = messageListScrollPosition(
          tester,
        );
        expect(
          afterSecondBottom.maxScrollExtent - afterSecondBottom.pixels,
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'read channel bottom open settles at maxScrollExtent above the fade inset',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createBottomMessageListHarness();

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);
        await tester.pump();

        final ScrollPosition position = messageListScrollPosition(tester);
        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
          reason: 'read bottom open must scroll into the trailing inset',
        );

        final Finder newest = messageItemFor(harness.newestLoadedId);
        expect(newest, findsOneWidget);
        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect newestRect = tester.getRect(newest);
        expect(
          viewport.bottom - newestRect.bottom,
          greaterThanOrEqualTo(
            WideComposerLayout.mobileMessageListTrailingInset - 1,
          ),
          reason: 'newest message must clear the composer fade overlay',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'live-tail append while scrolled up preserves the visible anchor',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createBottomMessageListHarness();

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);

        final ScrollPosition position = messageListScrollPosition(tester);
        expect(
          position.maxScrollExtent - position.pixels,
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
        );

        position.jumpTo(
          (messageListOldestRowOffset(tester) + position.maxScrollExtent) * 0.5,
        );
        await pumpFluxerFrames(tester);
        expect(
          position.maxScrollExtent - position.pixels,
          greaterThan(kMessageListReadBottomThreshold),
        );

        final String anchorId = centerVisibleMessageItemId(tester);
        final Finder anchor = messageItemFor(anchorId);
        expect(anchor, findsOneWidget);
        final double anchorTopBefore = tester.getRect(anchor).top;
        final double pixelsBefore = position.pixels;
        final double distanceFromOlderEdgeBefore =
            position.pixels - position.minScrollExtent;

        harness.appendNewerMessages(
          count: 1,
          origin: MessagesOrigin.liveCreate,
        );
        await tester.pump();
        await tester.pump();

        expect(anchor, findsOneWidget);
        expect(
          tester.getRect(anchor).top,
          moreOrLessEquals(anchorTopBefore, epsilon: 1),
        );
        expect(position.pixels, moreOrLessEquals(pixelsBefore, epsilon: 1));
        expect(
          position.pixels - position.minScrollExtent,
          moreOrLessEquals(distanceFromOlderEdgeBefore, epsilon: 1),
        );
        expect(harness.chatViewModel.testState.hasMoreNewerMessages, isFalse);
        expect(harness.chatViewModel.testState.messages, hasLength(81));

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'blocked tail append splits its group at the anchor and preserves the '
      'visible anchor',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        const String blockedAuthorId = 'blocked-author';
        final AroundAckMessageListHarness harness =
            await createBottomMessageListHarness(
              newestAuthorId: blockedAuthorId,
            );
        expect(harness.messages.last.authorId, blockedAuthorId);

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
            blockedUserIds: const <String>{blockedAuthorId},
          ),
        );
        await pumpFluxerFrames(tester);
        final ProviderContainer container = ProviderScope.containerOf(
          tester.element(find.byType(MessageList)),
        );
        expect(container.read(blockedUserIdsProvider), const <String>{
          blockedAuthorId,
        });

        // One collapsed group tile for the blocked run at open.
        final Finder collapsedGroup = find.byType(
          BlockedMessageGroups,
          skipOffstage: false,
        );
        expect(collapsedGroup, findsOneWidget);

        final ScrollPosition position = messageListScrollPosition(tester);
        position.jumpTo(
          (messageListOldestRowOffset(tester) + position.maxScrollExtent) * 0.5,
        );
        await pumpFluxerFrames(tester);

        final String anchorId = centerVisibleMessageItemId(tester);
        final Finder anchor = messageItemFor(anchorId);
        final double anchorTopBefore = tester.getRect(anchor).top;
        final double pixelsBefore = position.pixels;

        harness.appendNewerMessages(
          count: 1,
          authorId: blockedAuthorId,
          origin: MessagesOrigin.liveCreate,
        );
        await tester.pump();
        await tester.pump();

        // The append lands as a SECOND collapsed tile trailing-of-center -
        // a group never absorbs content across the anchor boundary, so the
        // leading stack (and the reader) stays pixel-stable.
        expect(collapsedGroup, findsNWidgets(2));
        expect(
          tester.getRect(anchor).top,
          moreOrLessEquals(anchorTopBefore, epsilon: 1),
        );
        expect(position.pixels, moreOrLessEquals(pixelsBefore, epsilon: 1));
        expect(harness.chatViewModel.testState.messages, hasLength(81));

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'jump to newest replacement lands at the bottom edge after one frame',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createBottomMessageListHarness(hasMoreNewerMessages: true);

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);

        final ScrollPosition position = messageListScrollPosition(tester)
          ..jumpTo(messageListOldestRowOffset(tester));
        await pumpFluxerFrames(tester);
        expect(
          position.maxScrollExtent - position.pixels,
          greaterThan(kMessageListReadBottomThreshold),
        );

        harness.chatViewModel.scrollToBottom();
        await tester.pump();

        // The jump-to-latest landing re-anchored (fresh position): re-fetch.
        final ScrollPosition landed = messageListScrollPosition(tester);
        expect(
          landed.maxScrollExtent - landed.pixels,
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
        );

        await pumpScrollToBottom(tester);
        expect(
          landed.pixels,
          moreOrLessEquals(landed.maxScrollExtent, epsilon: 1),
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'unread jump to newest replacement lands at the newest trailing edge',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              messageCount: 70,
              ackIndex: 42,
            );

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);

        final Finder firstUnread = messageItemFor(harness.firstUnreadId);
        expect(firstUnread, findsOneWidget);
        final Rect viewport = tester.getRect(messageListScrollable());
        final double viewportCenterY = viewport.top + viewport.height * 0.5;
        expect(
          tester.getRect(firstUnread).center.dy,
          moreOrLessEquals(viewportCenterY, epsilon: 96),
        );

        harness.chatViewModel.scrollToBottom();
        await pumpScrollToBottom(tester);

        final ScrollPosition position = messageListScrollPosition(tester);
        // Latest-window land re-anchors (newest, 1.0): the live tail.
        expect(
          position.maxScrollExtent - position.pixels,
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
        );

        final Finder newest = messageItemFor(harness.latestReplacementNewestId);
        expect(newest, findsOneWidget);
        final Rect newestRect = tester.getRect(newest);
        final Rect viewportAfter = tester.getRect(messageListScrollable());
        expect(
          newestRect.bottom,
          moreOrLessEquals(viewportAfter.bottom, epsilon: 48),
        );
        expect(firstUnread, findsNothing);

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'appending newer messages away from the trailing edge keeps the first unread fixed',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              messageCount: 90,
              ackIndex: 30,
            );

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);

        final Finder firstUnread = messageItemFor(harness.firstUnreadId);
        expect(firstUnread, findsOneWidget);
        final ScrollableState scrollable = tester.state<ScrollableState>(
          messageListScrollable(),
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
        final int loadNewerBefore = harness.chatViewModel.loadNewerCallCount;

        harness.appendNewerMessages(count: 3);
        await tester.pump();
        await tester.pump();

        expect(firstUnread, findsOneWidget);
        expect(
          tester.getRect(firstUnread).top,
          moreOrLessEquals(firstUnreadTopBefore, epsilon: 1),
        );
        expect(harness.chatViewModel.loadNewerCallCount, loadNewerBefore);

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'historical newer append at the loaded tail does not jump to the new tail',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              messageCount: 60,
              ackIndex: 42,
            );

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);

        final ScrollableState scrollable = tester.state<ScrollableState>(
          messageListScrollable(),
        );
        scrollable.position.jumpTo(messageListNewestRowOffset(tester));
        await pumpFluxerFrames(tester);

        final Finder loadedTailMessage = messageItemFor(harness.newestLoadedId);
        expect(loadedTailMessage, findsOneWidget);
        final Rect loadedTailRectBefore = tester.getRect(loadedTailMessage);
        final double loadedTailTopBefore = loadedTailRectBefore.top;
        final double pixelsBefore = scrollable.position.pixels;
        final double tailBefore = messageListNewestRowOffset(tester);
        expect(pixelsBefore, moreOrLessEquals(tailBefore, epsilon: 1));

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
          messageListNewestRowOffset(tester) - scrollable.position.pixels,
          // The appended rows land beyond the viewport; at least a row of
          // extent must now separate it from the trailing edge.
          greaterThan(80),
        );
        // NOTE: no loadNewerCallCount rider - at the loaded tail with newer
        // history open, level demand may issue one bounded prefetch; the
        // position-preservation assertions above are this test's contract.

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'prepending older messages moves the centered viewport away from the leading edge',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              messageCount: 60,
              ackIndex: 42,
            );

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);

        final ScrollableState scrollable = tester.state<ScrollableState>(
          messageListScrollable(),
        );
        scrollable.position.jumpTo(scrollable.position.minScrollExtent);
        await pumpFluxerFrames(tester);

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
          // The prepended rows land between the viewport and the leading
          // edge; at least a row of extent must now separate them.
          greaterThan(80),
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'short unread block packs NEW above the last unread instead of mid-viewport',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              ackIndex: 48,
              hasMoreNewerMessages: false,
            );

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await tester.pump();
        await tester.pump();

        final Finder unreadDivider = find.text('NEW');
        final Finder firstUnread = messageItemFor(harness.firstUnreadId);
        final Finder newest = messageItemFor(harness.newestLoadedId);
        expect(unreadDivider, findsOneWidget);
        expect(firstUnread, findsOneWidget);
        expect(newest, findsOneWidget);

        final Rect viewport = tester.getRect(messageListScrollable());
        final double viewportCenterY = viewport.top + viewport.height * 0.5;
        final Rect unreadDividerRect = tester.getRect(unreadDivider);
        final Rect firstUnreadRect = tester.getRect(firstUnread);
        final Rect newestRect = tester.getRect(newest);

        expect(
          unreadDividerRect.center.dy,
          greaterThan(viewportCenterY + 24),
          reason:
              'NEW must sit below mid-viewport when trailing unreads are short',
        );
        expect(
          firstUnreadRect.top,
          greaterThanOrEqualTo(unreadDividerRect.bottom - 4),
        );
        expect(
          firstUnreadRect.top - unreadDividerRect.bottom,
          lessThan(48),
          reason: 'first unread should sit flush under NEW',
        );
        expect(
          newestRect.bottom,
          greaterThan(viewport.bottom - 96),
          reason:
              'the last unread should sit near the composer, not over a void',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'short channel with one unread packs the message near the composer',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              messageCount: 3,
              ackIndex: 1,
              hasMoreNewerMessages: false,
            );

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await tester.pump();
        await tester.pump();

        final Finder unreadDivider = find.text('NEW');
        final Finder firstUnread = messageItemFor(harness.firstUnreadId);
        expect(unreadDivider, findsOneWidget);
        expect(firstUnread, findsOneWidget);

        final Rect viewport = tester.getRect(messageListScrollable());
        final double viewportCenterY = viewport.top + viewport.height * 0.5;
        final Rect unreadDividerRect = tester.getRect(unreadDivider);
        final Rect firstUnreadRect = tester.getRect(firstUnread);

        expect(
          unreadDividerRect.center.dy,
          greaterThan(viewportCenterY),
          reason: 'NEW must not stay at mid-viewport over a short unread block',
        );
        expect(
          firstUnreadRect.top,
          greaterThanOrEqualTo(unreadDividerRect.bottom - 4),
        );
        expect(
          firstUnreadRect.bottom,
          greaterThan(viewport.bottom - 96),
          reason: 'the only unread should sit near the composer',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'short unread fallback append while scrolled up preserves the visible older anchor',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              ackIndex: 48,
              hasMoreNewerMessages: false,
            );

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        expect(find.text('NEW'), findsOneWidget);

        await tester.pump();
        await tester.pump();

        final ScrollPosition position = messageListScrollPosition(tester);
        expect(
          position.maxScrollExtent - position.minScrollExtent,
          greaterThan(kMessageListReadBottomThreshold),
        );

        position.jumpTo(
          (messageListOldestRowOffset(tester) + position.maxScrollExtent) * 0.5,
        );
        await tester.pump();
        await tester.pump();

        final String anchorId = centerVisibleMessageItemId(tester);
        expect(anchorId, isNot(harness.newestLoadedId));
        final Finder anchor = messageItemFor(anchorId);
        expect(anchor, findsOneWidget);
        final Rect anchorRectBefore = tester.getRect(anchor);
        final double pixelsBefore = position.pixels;
        final double distanceFromOlderEdgeBefore =
            position.pixels - position.minScrollExtent;

        harness.appendNewerMessages(
          count: 1,
          origin: MessagesOrigin.liveCreate,
        );
        await tester.pump();
        await tester.pump();

        expect(anchor, findsOneWidget);
        final Rect anchorRectAfter = tester.getRect(anchor);
        final double distanceFromOlderEdgeAfter =
            position.pixels - position.minScrollExtent;
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
        expect(position.pixels, moreOrLessEquals(pixelsBefore, epsilon: 1));
        expect(
          distanceFromOlderEdgeAfter,
          moreOrLessEquals(distanceFromOlderEdgeBefore, epsilon: 1),
          reason: failureContext,
        );
        expect(harness.chatViewModel.testState.messages, hasLength(51));

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'short unread block keeps the centered anchor when newer pages remain',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(ackIndex: 48);

        await tester.pumpWidget(
          messageListApp(
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
        final Rect viewport = tester.getRect(messageListScrollable());
        final double viewportCenterY = viewport.top + viewport.height * 0.5;
        expect(
          tester.getRect(unreadDivider).center.dy,
          moreOrLessEquals(viewportCenterY, epsilon: 48),
        );

        // The trailing half stays reserved for the newer pages: the newest
        // loaded message is not pinned to the viewport bottom.
        final Finder newest = messageItemFor(harness.newestLoadedId);
        expect(newest, findsOneWidget);
        expect(tester.getRect(newest).bottom, lessThan(viewport.bottom - 64));

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'tall first unread keeps NEW on screen and does not pin the live tail',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              ackIndex: 48,
              hasMoreNewerMessages: false,
              firstUnreadLines: 40,
            );

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await tester.pump();
        await tester.pump();

        final Finder unreadDivider = find.text('NEW');
        final Finder firstUnread = messageItemFor(harness.firstUnreadId);
        expect(unreadDivider, findsOneWidget);
        expect(firstUnread, findsOneWidget);

        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect unreadDividerRect = tester.getRect(unreadDivider);
        final Rect firstUnreadRect = tester.getRect(firstUnread);

        expect(
          unreadDividerRect.top,
          greaterThanOrEqualTo(viewport.top + 8),
          reason: 'NEW must stay on screen, not clipped above the viewport',
        );
        expect(unreadDividerRect.top, lessThan(viewport.center.dy + 48));
        expect(
          firstUnreadRect.top,
          greaterThanOrEqualTo(unreadDividerRect.bottom - 4),
        );
        expect(
          firstUnreadRect.top,
          lessThan(viewport.bottom - 64),
          reason:
              'the start of a tall unread must be visible without extra scroll',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets('caught-up channel still opens at the live tail', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();

      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(find.text('NEW'), findsNothing);
      final Finder newest = messageItemFor(harness.newestLoadedId);
      expect(newest, findsOneWidget);
      final Rect viewport = tester.getRect(messageListScrollable());
      expect(tester.getRect(newest).bottom, greaterThan(viewport.bottom - 64));
      final ScrollPosition position = messageListScrollPosition(tester);
      expect(
        position.maxScrollExtent - position.pixels,
        lessThanOrEqualTo(kMessageListReadBottomThreshold),
      );

      await disposeMessageList(tester);
    });

    testWidgets(
      'jump from an unread open centers the target instead of keeping NEW mid-screen',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              ackIndex: 48,
              hasMoreNewerMessages: false,
            );

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await tester.pump();
        await tester.pump();

        expect(find.text('NEW'), findsOneWidget);

        final String targetId = harness.messages[10].id;
        harness.chatViewModel.scrollToMessage(targetId);
        await pumpMessageJump(tester);

        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect target = tester.getRect(messageItemFor(targetId));
        expect(
          (target.center.dy - viewport.center.dy).abs(),
          lessThanOrEqualTo(48),
          reason: 'a jump after unread open must center the target tile',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'scroll to bottom from an unread open pins the newest at the composer',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              ackIndex: 48,
              hasMoreNewerMessages: false,
            );

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await tester.pump();
        await tester.pump();

        harness.chatViewModel.scrollToBottom();
        await pumpScrollToBottom(tester);

        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect newestRect = tester.getRect(
          messageItemFor(harness.newestLoadedId),
        );
        expect(newestRect.bottom, greaterThan(viewport.bottom - 64));
        expect(newestRect.bottom, lessThanOrEqualTo(viewport.bottom + 1));
        final ScrollPosition position = messageListScrollPosition(tester);
        expect(
          position.maxScrollExtent - position.pixels,
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'empty resolved channel renders the empty state instead of the loading spinner',
      (WidgetTester tester) async {
        final db.FluxerDatabase database = openTestDatabase();
        await database.readStateDao.upsertReadState(
          const db.ReadStatesCompanion(
            channelId: Value<String>(messageListChannelId),
            lastMessageId: Value<String?>(null),
          ),
        );
        final InstrumentedChatViewModel chatViewModel =
            InstrumentedChatViewModel(
              const ChatViewState(
                channelId: messageListChannelId,
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
          messageListApp(database: database, chatViewModel: chatViewModel),
        );
        await tester.pump();

        expect(find.text('No messages yet'), findsOneWidget);
        expect(find.text('Be the first to send a message!'), findsOneWidget);
        expect(find.byType(Scrollable), findsNothing);

        await disposeMessageList(tester);
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

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();
      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      addTearDown(() async {
        await disposeMessageList(tester);
        await pumpFluxerFrames(tester);
      });
      await tester.pump();
      await tester.pump();
      await tester.pump();
      final ScrollPosition position = messageListScrollPosition(tester);
      position.jumpTo(position.pixels - kMessageListReadBottomThreshold - 100);
      await tester.pump();
      position.jumpTo(position.maxScrollExtent);
      await tester.pump();
      await tester.pump();
      expect(
        position.maxScrollExtent - position.pixels,
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
      await disposeMessageList(tester);
    });

    testWidgets(
      'unacked append while scrolled up keeps the unread bar visible',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createBottomMessageListHarness();
        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        addTearDown(() async {
          await disposeMessageList(tester);
          await pumpFluxerFrames(tester);
        });
        await tester.pump();
        await tester.pump();
        await tester.pump();
        final ScrollPosition position = messageListScrollPosition(tester);
        position.jumpTo(
          position.pixels - kMessageListReadBottomThreshold - 200,
        );
        await tester.pump();
        await tester.pump();
        expect(
          position.maxScrollExtent - position.pixels,
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
        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'mark-read lands at the tail after a deliberate drag away, inside the '
      'jump-button threshold',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createBottomMessageListHarness();
        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);
        for (int frame = 0; frame < 4; frame += 1) {
          await tester.pump();
        }
        final ScrollPosition position = messageListScrollPosition(tester);

        // A finger drag, not a programmatic jump, is what disarms follow.
        await tester.drag(messageListScrollable(), const Offset(0, 120));
        await pumpFluxerFrames(tester);
        final double distance = position.maxScrollExtent - position.pixels;
        expect(
          distance,
          greaterThan(kMessageListReadBottomThreshold),
          reason: 'the unread bar only renders away from the tail',
        );
        expect(
          distance,
          lessThan(position.viewportDimension * kJumpToBottomViewportFraction),
          reason:
              'mark-read is the only to-tail intent reachable from inside '
              'the jump button threshold',
        );

        harness.appendRealtimeMessage(acknowledgedByGateway: false);
        await tester.pump();
        await tester.pump();
        expect(find.byType(MessageListNewMessagesBar), findsOneWidget);
        expect(
          position.maxScrollExtent - position.pixels,
          greaterThan(kMessageListReadBottomThreshold),
          reason: 'a disarmed leave must not follow the live arrival',
        );

        await tester.tap(find.text('Mark Read'));
        await pumpFluxerFrames(tester);

        final ScrollPosition landed = messageListScrollPosition(tester);
        expect(
          landed.pixels,
          moreOrLessEquals(landed.maxScrollExtent, epsilon: 1),
          reason: 'mark-read is a to-tail intent, not glue',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets('manual unread rollback ignores the auto-ack watermark', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();
      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      addTearDown(() async {
        await disposeMessageList(tester);
        await pumpFluxerFrames(tester);
      });
      await tester.pump();
      await tester.pump();
      await tester.pump();

      harness.chatViewModel.testState = harness.chatViewModel.testState
          .copyWith(pendingAutoAckMessageId: harness.newestLoadedId);
      await harness.database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value<String>(messageListChannelId),
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
      await disposeMessageList(tester);
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

        final AroundAckMessageListHarness harness =
            await createBottomMessageListHarness();

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
            body: const RevealToggleHost(),
          ),
        );
        await tester.pump();

        // Scroll up into history (center-anchored: smaller pixels == older).
        final ScrollPosition position = messageListScrollPosition(tester);
        expect(position.minScrollExtent, lessThan(-600));
        position.jumpTo(-600);
        await pumpFluxerFrames(tester);
        expect(position.pixels, moreOrLessEquals(-600, epsilon: 1));

        final State<MessageList> stateBeforeHide = tester
            .state<State<MessageList>>(find.byType(MessageList));

        revealHostState(tester).setVisible(visible: false);
        await tester.pump();

        expect(find.byType(MessageList), findsNothing);
        expect(offstageMessageList(), findsOneWidget);
        expect(
          identical(
            tester.state<State<MessageList>>(offstageMessageList()),
            stateBeforeHide,
          ),
          isTrue,
          reason: 'hiding the list must not dispose its State',
        );
        expect(
          offstageMessageListPosition(tester).pixels,
          moreOrLessEquals(-600, epsilon: 1),
        );

        revealHostState(tester).setVisible(visible: true);
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
          messageListScrollPosition(tester).pixels,
          moreOrLessEquals(-600, epsilon: 1),
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets('visible toggles drive the read viewport controller', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();

      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
          body: const RevealToggleHost(),
        ),
      );
      await tester.pump();
      final ProviderContainer container = ProviderScope.containerOf(
        tester.element(find.byType(MessageList)),
      );

      expect(container.read(chatReadViewportProvider).viewportActive, isTrue);

      revealHostState(tester).setVisible(visible: false);
      await tester.pump();
      expect(container.read(chatReadViewportProvider).viewportActive, isFalse);

      revealHostState(tester).setVisible(visible: true);
      await tester.pump();
      expect(container.read(chatReadViewportProvider).viewportActive, isTrue);

      await disposeMessageList(tester);
    });

    testWidgets('list that opens hidden keeps the read viewport inactive until '
        'revealed', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();

      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
          body: const RevealToggleHost(initialVisible: false),
        ),
      );
      await tester.pump();
      final ProviderContainer container = ProviderScope.containerOf(
        tester.element(offstageMessageList()),
      );

      expect(find.byType(MessageList), findsNothing);
      expect(offstageMessageList(), findsOneWidget);
      expect(container.read(chatReadViewportProvider).viewportActive, isFalse);

      revealHostState(tester).setVisible(visible: true);
      await tester.pump();

      expect(find.byType(MessageList), findsOneWidget);
      expect(container.read(chatReadViewportProvider).viewportActive, isTrue);

      await disposeMessageList(tester);
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

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();
      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await pumpFluxerFrames(tester);

      final ScrollPosition position = messageListScrollPosition(tester);
      expect(
        position.maxScrollExtent - position.pixels,
        lessThanOrEqualTo(kMessageListReadBottomThreshold),
      );

      // Slightly off the tail but still live-near-bottom (pin holds <=64px).
      position.jumpTo(position.pixels - 24);
      await tester.pump();
      expect(
        messageListTrailingDistance(position),
        lessThanOrEqualTo(kMessageListReadBottomThreshold),
      );
      final String previousNewestId =
          harness.chatViewModel.testState.messages.last.id;
      harness.appendNewerMessages(count: 1, origin: MessagesOrigin.liveCreate);
      await tester.pump();
      await tester.pump();
      final String newestId = harness.chatViewModel.testState.messages.last.id;
      expect(newestId, isNot(previousNewestId));

      await shrinkViewportHeight(tester, height: 400);

      expect(messageItemFor(newestId), findsOneWidget);
      final Rect viewport = tester.getRect(messageListScrollable());
      final Rect newest = tester.getRect(messageItemFor(newestId));
      expect(
        position.pixels,
        moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
        reason: 'near-tail shrink must pin the list to maxScrollExtent',
      );
      expect(
        newest.bottom,
        lessThanOrEqualTo(viewport.bottom + 8),
        reason: 'newest must stay above the composer after keyboard shrink',
      );

      await disposeMessageList(tester);
    });

    testWidgets('at-tail shrink keeps newest pinned via the pin latch', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();
      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await pumpFluxerFrames(tester);

      final ScrollPosition position = messageListScrollPosition(tester);
      expect(
        position.maxScrollExtent - position.pixels,
        lessThanOrEqualTo(kMessageListReadBottomThreshold),
      );
      final String newestId = harness.newestLoadedId;

      await shrinkViewportHeight(tester, height: 400);

      expect(messageItemFor(newestId), findsOneWidget);
      final Rect viewport = tester.getRect(messageListScrollable());
      final Rect newest = tester.getRect(messageItemFor(newestId));
      expect(newest.bottom, lessThanOrEqualTo(viewport.bottom + 2));
      expect(
        position.pixels,
        moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
      );

      await disposeMessageList(tester);
    });

    testWidgets('scrolled-up shrink does not yank to tail', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();
      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await pumpFluxerFrames(tester);

      final ScrollPosition position = messageListScrollPosition(tester);
      position.jumpTo(position.pixels - 200);
      await pumpFluxerFrames(tester);
      expect(
        position.maxScrollExtent - position.pixels,
        greaterThan(kMessageListReadBottomThreshold),
      );
      final String anchorId = centerVisibleMessageItemId(tester);
      final Finder anchor = messageItemFor(anchorId);
      expect(anchor, findsOneWidget);

      await shrinkViewportHeight(tester, height: 400);

      // Reading position may reflow with the shorter viewport, but must not
      // snap to the live tail.
      expect(anchor, findsOneWidget);
      expect(
        position.maxScrollExtent - position.pixels,
        greaterThan(kMessageListReadBottomThreshold),
        reason: 'must not pin to live tail when scrolled up',
      );

      await disposeMessageList(tester);
    });

    testWidgets('fully off-screen newest does not pin on shrink', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();
      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await pumpFluxerFrames(tester);

      final String newestId = harness.chatViewModel.testState.messages.last.id;
      final ScrollPosition position = messageListScrollPosition(tester);
      // Far enough that newest is fully off-screen.
      position.jumpTo(position.pixels - 400);
      await tester.pump();
      await pumpFluxerFrames(tester);
      expect(
        position.maxScrollExtent - position.pixels,
        greaterThan(kMessageListReadBottomThreshold),
      );
      expect(messageItemFor(newestId), findsNothing);

      final double pixelsBefore = position.pixels;
      await shrinkViewportHeight(tester, height: 400);

      expect(
        position.maxScrollExtent - position.pixels,
        greaterThan(kMessageListReadBottomThreshold),
        reason: 'must not yank to live tail when newest is fully off-screen',
      );
      expect(
        position.pixels,
        isNot(moreOrLessEquals(position.maxScrollExtent, epsilon: 1)),
      );
      // Position may reflow with shorter viewport but should stay scrolled up.
      expect(
        (position.pixels - pixelsBefore).abs(),
        lessThan(200),
        reason: 'no large tail yank from off-screen newest',
      );

      await disposeMessageList(tester);
    });

    testWidgets('append while keyboard-open at the tail keeps newest visible', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();
      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await pumpFluxerFrames(tester);

      // Keyboard already open, then append at the live tail.
      await shrinkViewportHeight(tester, height: 400);
      final ScrollPosition position = messageListScrollPosition(tester);
      position.jumpTo(position.maxScrollExtent);
      await tester.pump();

      final String previousNewestId =
          harness.chatViewModel.testState.messages.last.id;
      harness.appendNewerMessages(count: 1, origin: MessagesOrigin.liveCreate);
      await tester.pump();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 16));
      final String newestId = harness.chatViewModel.testState.messages.last.id;
      expect(newestId, isNot(previousNewestId));

      expect(messageItemFor(newestId), findsOneWidget);
      final Rect viewport = tester.getRect(messageListScrollable());
      final Rect newest = tester.getRect(messageItemFor(newestId));
      expect(
        newest.bottom,
        lessThanOrEqualTo(viewport.bottom + 8),
        reason: 'keyboard-open append at min must reveal the newest message',
      );
      expect(
        position.pixels,
        moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
      );

      await disposeMessageList(tester);
    });

    testWidgets(
      'tall append while near-tail follows even when post-append distance exceeds 48',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createBottomMessageListHarness();
        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);

        final ScrollPosition position = messageListScrollPosition(tester);
        // Near-tail but not exactly at the tail so a follow pin moves.
        position.jumpTo(position.pixels - 24);
        await tester.pump();
        expect(
          messageListTrailingDistance(position),
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
        );

        final String tallId = harness.appendTallNewerMessage(lines: 30);
        await tester.pump();
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 16));

        expect(messageItemFor(tallId), findsOneWidget);
        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
          reason:
              'pre-append near-tail must follow a tall append to the tail '
              'pixels=${position.pixels} max=${position.maxScrollExtent}',
        );
        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect tall = tester.getRect(messageItemFor(tallId));
        expect(
          tall.bottom,
          lessThanOrEqualTo(viewport.bottom + 8),
          reason: 'tall newest must be fully visible after near-tail follow',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets('shrink during active jump does not override jump target', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();
      final String targetId = harness.messages[20].id;

      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await pumpFluxerFrames(tester);

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

      expect(messageItemFor(targetId), findsOneWidget);
      final Rect viewport = tester.getRect(messageListScrollable());
      final Rect target = tester.getRect(messageItemFor(targetId));
      expect(
        (target.center.dy - viewport.center.dy).abs(),
        lessThanOrEqualTo(24),
        reason: 'active jump must still center its target after shrink',
      );

      await tester.pump(const Duration(milliseconds: 2000));
      await disposeMessageList(tester);
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

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              ackIndex: 20,
              messageCount: 55,
              hasMoreNewerMessages: false,
            );
        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);
        expect(find.text('NEW'), findsOneWidget);

        final String newestId =
            harness.chatViewModel.testState.messages.last.id;
        harness.chatViewModel.scrollToBottom();
        await pumpScrollToBottom(tester);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 16));

        final ScrollPosition position = messageListScrollPosition(tester);
        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
          reason: 'scroll-to-newest jumps to the live tail (maxScrollExtent)',
        );
        expect(messageItemFor(newestId), findsOneWidget);

        await shrinkViewportHeight(tester, height: 400);

        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
        );
        expect(messageItemFor(newestId), findsOneWidget);
        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect newest = tester.getRect(messageItemFor(newestId));
        expect(
          newest.bottom,
          lessThanOrEqualTo(viewport.bottom + 8),
          reason:
              'unread→bottom scroll-to-newest then keyboard shrink must keep '
              'newest fully visible',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'unread jump-to-latest replacement then shrink keeps newest visible',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              messageCount: 70,
              ackIndex: 42,
            );
        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);
        expect(find.text('NEW'), findsOneWidget);

        harness.chatViewModel.scrollToBottom();
        await pumpScrollToBottom(tester);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 16));

        final String newestId = harness.latestReplacementNewestId;
        final ScrollPosition position = messageListScrollPosition(tester);
        expect(
          position.maxScrollExtent - position.pixels,
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
        );
        expect(messageItemFor(newestId), findsOneWidget);

        await shrinkViewportHeight(tester, height: 400);

        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
        );
        expect(messageItemFor(newestId), findsOneWidget);
        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect newest = tester.getRect(messageItemFor(newestId));
        expect(
          newest.bottom,
          lessThanOrEqualTo(viewport.bottom + 8),
          reason:
              'landAtLatestTail demotion then keyboard shrink must keep '
              'newest fully visible',
        );

        await disposeMessageList(tester);
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

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();
      // Mid-window target starts outside the lazy viewport.
      final String targetId = harness.messages[24].id;

      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await pumpFluxerFrames(tester);
      expect(messageItemFor(targetId), findsNothing);

      harness.chatViewModel.scrollToMessage(targetId);
      await pumpMessageJump(tester);

      expect(messageItemFor(targetId), findsOneWidget);
      final Rect viewport = tester.getRect(messageListScrollable());
      final Rect targetRect = tester.getRect(messageItemFor(targetId));
      expect(
        (targetRect.center.dy - viewport.center.dy).abs(),
        lessThanOrEqualTo(16),
        reason:
            'target center=${targetRect.center.dy}, '
            'viewport center=${viewport.center.dy}',
      );

      await disposeMessageList(tester);
    });

    testWidgets(
      'a parked out-of-window target withholds the tail flag but keeps '
      'geometry flowing until it expires',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createBottomMessageListHarness();

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);

        final ProviderContainer container = ProviderScope.containerOf(
          tester.element(find.byType(MessageList)),
        );
        expect(
          container.read(chatReadViewportProvider).nearLoadedTail,
          isTrue,
          reason: 'the bottom open publishes near-tail geometry',
        );

        final int loadNewerBefore = harness.chatViewModel.loadNewerCallCount;
        // Ask past the OPEN older edge: the page that carries it is still in
        // flight, so the target parks and the viewport is mid-jump.
        harness.chatViewModel.scrollToMessage(
          snowflakeForUtc(DateTime.utc(2020)),
        );
        await tester.pump();
        // Force a republish while parked: geometry keeps flowing, but the
        // ack-bearing tail flag is the one thing a parked jump may not
        // assert.
        final ScrollPosition position = messageListScrollPosition(tester);
        position.jumpTo(position.pixels - 10);
        await tester.pump();

        final ChatReadViewportState parked = container.read(
          chatReadViewportProvider,
        );
        expect(
          parked.viewportHeight,
          greaterThan(0),
          reason: 'a parked target must still publish viewport geometry',
        );
        expect(
          parked.distanceFromBottom,
          isNot(double.infinity),
          reason: 'a parked target must still publish the scroll distance',
        );
        expect(
          parked.nearLoadedTail,
          isFalse,
          reason: 'a parked target must withhold the tail flag',
        );
        expect(
          harness.chatViewModel.loadNewerCallCount,
          loadNewerBefore,
          reason: 'a parked target must not trigger loadNewer by itself',
        );

        // The park is bounded: expiry retires the target and republishes
        // with the flag restored.
        await tester.pump(const Duration(seconds: 7));
        expect(
          container.read(chatReadViewportProvider).nearLoadedTail,
          isTrue,
          reason: 'target expiry must restore the tail flag',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'an in-window jump to a near-tail target publishes near-tail geometry',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final AroundAckMessageListHarness harness =
            await createBottomMessageListHarness();
        final String targetId =
            harness.messages[harness.messages.length - 2].id;

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);

        final ProviderContainer container = ProviderScope.containerOf(
          tester.element(find.byType(MessageList)),
        );
        container
            .read(chatReadViewportProvider.notifier)
            .updateViewport(
              channelId: messageListChannelId,
              nearLoadedTail: false,
              distanceFromBottom: double.infinity,
              viewportHeight: 0,
              sampledTailId: null,
            );

        harness.chatViewModel.scrollToMessage(targetId);
        await tester.pump();
        await pumpFluxerFrames(tester);

        final ChatReadViewportState after = container.read(
          chatReadViewportProvider,
        );
        expect(after.channelId, messageListChannelId);
        expect(after.nearLoadedTail, isTrue);
        expect(after.viewportHeight, greaterThan(0));
        expect(after.distanceFromBottom, isNot(double.infinity));

        await disposeMessageList(tester);
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
          harnessMessage(
            id: snowflakeForUtc(base.add(Duration(minutes: index))),
            content: 'message $index',
            timestamp: base.add(Duration(minutes: index)),
          ),
      ];
      final List<Message> initialWindow = allMessages.sublist(0, 30);
      final String targetId = initialWindow[10].id;
      final PagingInstrumentedChatViewModel chatViewModel =
          PagingInstrumentedChatViewModel(
            ChatViewState(
              channelId: messageListChannelId,
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
        messageListApp(database: database, chatViewModel: chatViewModel),
      );
      await pumpFluxerFrames(tester);

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
      await pumpFluxerFrames(tester);

      // Pump chaining: the jump landed inside the newer margin, so demand
      // drains BOTH fake pages during settle - each applied page released by
      // its own post-layout revision - without any gesture, and the tail
      // seals. Exactly one request per page: no per-frame refetch runaway.
      expect(
        chatViewModel.loadNewerCallCount,
        2,
        reason: 'one request per page - chained, bounded, no duplicates',
      );
      expect(
        chatViewModel.state.messages.last.id,
        allMessages.last.id,
        reason: 'the pump drains the fake pages to the present',
      );
      expect(chatViewModel.state.hasMoreNewerMessages, isFalse);

      // A sealed edge ignores further gestures entirely.
      await tester.drag(messageListScrollable(), const Offset(0, -900));
      await tester.pump();
      expect(chatViewModel.loadNewerCallCount, 2);

      await disposeMessageList(tester);
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

        final AroundAckMessageListHarness source =
            await createBottomMessageListHarness();
        final String targetId = source.messages[24].id;

        final InstrumentedChatViewModel loadingChatViewModel =
            InstrumentedChatViewModel(
              const ChatViewState(
                channelId: messageListChannelId,
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
          messageListApp(
            database: source.database,
            chatViewModel: loadingChatViewModel,
            body: MessageList(
              expectedChannelId: messageListChannelId,
              targetMessageId: targetId,
            ),
            overrides: <Override>[
              messageListReadStateProvider(
                messageListChannelId,
              ).overrideWith((ref) => readStateController.stream),
            ],
          ),
        );
        await tester.pump();
        expect(messageItemFor(targetId), findsNothing);

        // Around-window only — no scrollToMessage signal on this path.
        loadingChatViewModel.testState = loadingChatViewModel.testState
            .copyWith(
              write: (
                messages: source.messages,
                origin: MessagesOrigin.windowSwap,
              ),
              isLoading: false,
            );
        await tester.pump();
        await tester.pump();
        expect(
          find.byType(Scrollable),
          findsWidgets,
          reason: 'messages should render before read state arrives',
        );

        readStateController.add(null);
        await tester.pump();
        await tester.pump();
        await tester.pump();
        await pumpFluxerFrames(tester);

        expect(messageItemFor(targetId), findsOneWidget);
        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect targetRect = tester.getRect(messageItemFor(targetId));
        expect(
          (targetRect.center.dy - viewport.center.dy).abs(),
          lessThanOrEqualTo(16),
          reason:
              'target center=${targetRect.center.dy}, '
              'viewport center=${viewport.center.dy}',
        );

        await disposeMessageList(tester);
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

        final AroundAckMessageListHarness source =
            await createBottomMessageListHarness();
        final String targetId = source.messages[24].id;

        final InstrumentedChatViewModel loadingChatViewModel =
            InstrumentedChatViewModel(
              const ChatViewState(
                channelId: messageListChannelId,
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
          messageListApp(
            database: source.database,
            chatViewModel: loadingChatViewModel,
            overrides: <Override>[
              messageListReadStateProvider(
                messageListChannelId,
              ).overrideWith((ref) => readStateController.stream),
            ],
          ),
        );
        await tester.pump();
        expect(messageItemFor(targetId), findsNothing);

        // Around-window first, then scroll signal while still unresolved.
        loadingChatViewModel.testState = loadingChatViewModel.testState
            .copyWith(
              write: (
                messages: source.messages,
                origin: MessagesOrigin.windowSwap,
              ),
              isLoading: false,
            );
        await tester.pump();
        expect(
          find.byType(Scrollable),
          findsWidgets,
          reason: 'messages should render before read state arrives',
        );

        loadingChatViewModel.scrollToMessage(targetId);
        await tester.pump();
        await tester.pump();
        expect(
          find.byType(Scrollable),
          findsWidgets,
          reason: 'scroll signal should run once messages are mounted',
        );

        readStateController.add(null);
        await tester.pump();
        await tester.pump();
        await tester.pump();
        await pumpFluxerFrames(tester);

        expect(messageItemFor(targetId), findsOneWidget);
        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect targetRect = tester.getRect(messageItemFor(targetId));
        expect(
          (targetRect.center.dy - viewport.center.dy).abs(),
          lessThanOrEqualTo(16),
          reason:
              'target center=${targetRect.center.dy}, '
              'viewport center=${viewport.center.dy}',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'a missing jump target still settles and serves jump-to-bottom',
      (WidgetTester tester) async {
        // #415. An `around=<id>` fetch whose target was deleted or filtered
        // returns the neighbouring window with no error. The list lands on the
        // closest snowflake neighbour instead of latching a pending target
        // forever (which used to suppress the jump-to-bottom escape hatch).
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final StreamController<db.ReadState?> readStateController =
            StreamController<db.ReadState?>.broadcast();
        addTearDown(readStateController.close);

        final AroundAckMessageListHarness source =
            await createBottomMessageListHarness();
        // Never present in the window: the deleted search hit.
        const String deletedTargetId = 'deleted-search-hit';

        final InstrumentedChatViewModel chatViewModel =
            InstrumentedChatViewModel(
              const ChatViewState(
                channelId: messageListChannelId,
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
                hasMoreNewerMessages: true,
                errorMessage: null,
              ),
            );

        await tester.pumpWidget(
          messageListApp(
            database: source.database,
            chatViewModel: chatViewModel,
            overrides: <Override>[
              messageListReadStateProvider(
                messageListChannelId,
              ).overrideWith((ref) => readStateController.stream),
            ],
          ),
        );
        await tester.pump();

        // The around window lands without the target; scroll settles on a
        // neighbour rather than parking forever.
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (messages: source.messages, origin: MessagesOrigin.windowSwap),
          isLoading: false,
        );
        await tester.pump();
        chatViewModel.scrollToMessage(deletedTargetId);
        await tester.pump();

        readStateController.add(null);
        await tester.pump();
        await tester.pump();
        await pumpFluxerFrames(tester);

        final ProviderContainer container = ProviderScope.containerOf(
          tester.element(find.byType(MessageList)),
        );
        final ChatReadViewportState viewport = container.read(
          chatReadViewportProvider,
        );
        expect(
          viewport.viewportHeight,
          greaterThan(0),
          reason: 'a settled neighbour jump must publish viewport geometry',
        );
        expect(
          shouldShowJumpToBottomButton(
            hasMessages: true,
            isLoading: false,
            isActiveReadChannel: true,
            distanceFromBottom: viewport.distanceFromBottom,
            viewportHeight: viewport.viewportHeight,
            hasMoreNewerMessages: chatViewModel.testState.hasMoreNewerMessages,
          ),
          isTrue,
          reason: 'the escape hatch must stay reachable after a neighbour land',
        );

        // Tapping the button routes through scrollToBottom(); with the tail
        // unconfirmed it must fetch the present rather than no-op.
        chatViewModel.scrollToBottom();
        await tester.pump();
        await pumpFluxerFrames(tester);

        expect(
          chatViewModel.testState.hasMoreNewerMessages,
          isFalse,
          reason: 'the tap must have run a jump to present',
        );
        expect(
          messageItemFor(chatViewModel.latestReplacementNewestIdValue),
          findsOneWidget,
          reason: 'the newest message of the present must be rendered',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets('a to-tail intent lands while a scroll is still in flight', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();
      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await pumpFluxerFrames(tester);

      final ScrollPosition scrolled = messageListScrollPosition(tester);
      await tester.drag(messageListScrollable(), const Offset(0, 400));
      await pumpFluxerFrames(tester);
      expect(
        scrolled.maxScrollExtent - scrolled.pixels,
        greaterThanOrEqualTo(
          scrolled.viewportDimension * kJumpToBottomViewportFraction,
        ),
        reason: 'the jump button only renders beyond its own threshold',
      );

      final TestGesture drag = await tester.startGesture(
        tester.getCenter(messageListScrollable()),
      );
      await drag.moveBy(const Offset(0, 24));
      await tester.pump();

      harness.chatViewModel.scrollToBottom();
      await drag.moveBy(const Offset(0, 24));
      await tester.pump();
      await pumpFluxerFrames(tester);

      final ScrollPosition landed = messageListScrollPosition(tester);
      expect(
        landed.pixels,
        moreOrLessEquals(landed.maxScrollExtent, epsilon: 1),
        reason: 'the escape hatch must beat an in-flight scroll',
      );

      await drag.up();

      await disposeMessageList(tester);
    });

    testWidgets('drift after a jump lands does not re-center', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();
      final String targetId = harness.messages[24].id;

      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await pumpFluxerFrames(tester);

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
      await pumpFluxerFrames(tester);
      expect(messageItemFor(targetId), findsOneWidget);

      final ScrollPosition position = messageListScrollPosition(tester);
      final double drifted = (position.pixels + 140).clamp(
        position.minScrollExtent,
        position.maxScrollExtent,
      );
      position.jumpTo(drifted);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 48));
      await tester.pump(const Duration(milliseconds: 48));
      await pumpFluxerFrames(tester);

      expect(position.pixels, moreOrLessEquals(drifted, epsilon: 1));
      final Rect viewport = tester.getRect(messageListScrollable());
      final Rect targetRect = tester.getRect(messageItemFor(targetId));
      expect(
        (targetRect.center.dy - viewport.center.dy).abs(),
        greaterThan(60),
        reason:
            'post-window drift must not re-center '
            'target=${targetRect.center.dy} viewport=${viewport.center.dy}',
      );

      await disposeMessageList(tester);
    });

    // #394 post-ack: same mounted MessageList keeps jump centering.
    testWidgets('post-ack sticky retained centers post-divider jump', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createAroundAckMessageListHarness(
            ackIndex: 20,
            messageCount: 55,
          );
      final String postDividerId = harness.messages[35].id;

      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pump();
      await pumpFluxerFrames(tester);
      expect(find.text('NEW'), findsOneWidget);

      harness.chatViewModel.testState = harness.chatViewModel.testState
          .copyWith(stickyUnreadMessageId: harness.firstUnreadId);
      await tester.pump();
      await harness.database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value<String>(messageListChannelId),
          lastMessageId: Value<String?>(harness.newestLoadedId),
        ),
      );
      await tester.pump();
      await pumpFluxerFrames(tester);
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
      await pumpFluxerFrames(tester);

      expect(messageItemFor(postDividerId), findsOneWidget);
      final Rect viewport = tester.getRect(messageListScrollable());
      final Rect target = tester.getRect(messageItemFor(postDividerId));
      final double delta = (target.center.dy - viewport.center.dy).abs();
      expect(
        delta,
        lessThanOrEqualTo(16),
        reason:
            'sticky-retained post-divider center=${target.center.dy}, '
            'viewport=${viewport.center.dy}',
      );

      await tester.pump(const Duration(milliseconds: 2000));
      await disposeMessageList(tester);
    });

    testWidgets('post-ack sticky retained centers pre-divider jump', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createAroundAckMessageListHarness(
            ackIndex: 20,
            messageCount: 55,
          );
      final String preDividerId = harness.messages[15].id;

      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pump();
      await pumpFluxerFrames(tester);
      expect(find.text('NEW'), findsOneWidget);

      harness.chatViewModel.testState = harness.chatViewModel.testState
          .copyWith(stickyUnreadMessageId: harness.firstUnreadId);
      await tester.pump();
      await harness.database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value<String>(messageListChannelId),
          lastMessageId: Value<String?>(harness.newestLoadedId),
        ),
      );
      await tester.pump();
      await pumpFluxerFrames(tester);
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
      await pumpFluxerFrames(tester);

      expect(messageItemFor(preDividerId), findsOneWidget);
      final ScrollPosition position = messageListScrollPosition(tester);
      final Rect viewport = tester.getRect(messageListScrollable());
      final Rect target = tester.getRect(messageItemFor(preDividerId));
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
      await disposeMessageList(tester);
    });

    testWidgets('post-ack sticky cleared centers post-divider jump', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createAroundAckMessageListHarness(
            ackIndex: 20,
            messageCount: 55,
          );
      final String postDividerId = harness.messages[35].id;

      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pump();
      await pumpFluxerFrames(tester);
      expect(find.text('NEW'), findsOneWidget);

      harness.chatViewModel.testState = harness.chatViewModel.testState
          .copyWith(stickyUnreadMessageId: harness.firstUnreadId);
      await tester.pump();
      await harness.database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value<String>(messageListChannelId),
          lastMessageId: Value<String?>(harness.newestLoadedId),
        ),
      );
      await tester.pump();
      await tester.pump();
      harness.chatViewModel.testState = harness.chatViewModel.testState
          .copyWith(stickyUnreadMessageId: null);
      await tester.pump();
      await pumpFluxerFrames(tester);
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
      await pumpFluxerFrames(tester);

      expect(messageItemFor(postDividerId), findsOneWidget);
      final Rect viewport = tester.getRect(messageListScrollable());
      final Rect target = tester.getRect(messageItemFor(postDividerId));
      final double delta = (target.center.dy - viewport.center.dy).abs();
      expect(
        delta,
        lessThanOrEqualTo(16),
        reason:
            'sticky-cleared post-divider center=${target.center.dy}, '
            'viewport=${viewport.center.dy}',
      );

      await tester.pump(const Duration(milliseconds: 2000));
      await disposeMessageList(tester);
    });

    testWidgets('post-ack sticky cleared centers pre-divider jump', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createAroundAckMessageListHarness(
            ackIndex: 20,
            messageCount: 55,
          );
      final String preDividerId = harness.messages[15].id;

      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pump();
      await pumpFluxerFrames(tester);
      expect(find.text('NEW'), findsOneWidget);

      harness.chatViewModel.testState = harness.chatViewModel.testState
          .copyWith(stickyUnreadMessageId: harness.firstUnreadId);
      await tester.pump();
      await harness.database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value<String>(messageListChannelId),
          lastMessageId: Value<String?>(harness.newestLoadedId),
        ),
      );
      await tester.pump();
      await tester.pump();
      harness.chatViewModel.testState = harness.chatViewModel.testState
          .copyWith(stickyUnreadMessageId: null);
      await tester.pump();
      await pumpFluxerFrames(tester);
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
      await pumpFluxerFrames(tester);

      expect(messageItemFor(preDividerId), findsOneWidget);
      final ScrollPosition position = messageListScrollPosition(tester);
      final Rect viewport = tester.getRect(messageListScrollable());
      final Rect target = tester.getRect(messageItemFor(preDividerId));
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
      await disposeMessageList(tester);
    });

    testWidgets(
      'around-window swap that drops the unread anchor still re-centers a '
      'later jump',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              ackIndex: 20,
              messageCount: 120,
            );
        // Mid-window target so reverse-list extent allows true centering.
        final String targetId = harness.messages[90].id;

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await pumpFluxerFrames(tester);
        expect(find.text('NEW'), findsOneWidget);

        harness.chatViewModel.testState = harness.chatViewModel.testState
            .copyWith(stickyUnreadMessageId: harness.firstUnreadId);
        await tester.pump();
        await harness.database.readStateDao.upsertReadState(
          db.ReadStatesCompanion(
            channelId: const Value<String>(messageListChannelId),
            lastMessageId: Value<String?>(harness.newestLoadedId),
          ),
        );
        await tester.pump();
        await tester.pump();
        harness.chatViewModel.testState = harness.chatViewModel.testState
            .copyWith(stickyUnreadMessageId: null);
        await tester.pump();
        await pumpFluxerFrames(tester);
        expect(find.text('NEW'), findsNothing);

        // Around-window drops the open-mode center anchor; keep jump target.
        final List<Message> aroundWindow = harness.messages.sublist(50, 120);
        expect(
          aroundWindow.any((Message m) => m.id == harness.firstUnreadId),
          isFalse,
        );
        expect(aroundWindow.any((Message m) => m.id == targetId), isTrue);
        harness.chatViewModel.testState = harness.chatViewModel.testState
            .copyWith(
              write: (
                messages: aroundWindow,
                origin: MessagesOrigin.windowSwap,
              ),
              hasMoreMessages: true,
              hasMoreNewerMessages: false,
            );
        await tester.pump();
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 16));
        expect(find.byType(CustomScrollView), findsWidgets);

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

        expect(messageItemFor(targetId), findsOneWidget);
        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect target = tester.getRect(messageItemFor(targetId));
        expect(
          (target.center.dy - viewport.center.dy).abs(),
          lessThanOrEqualTo(16),
          reason:
              'post-ack orphaned-anchor target center=${target.center.dy}, '
              'viewport=${viewport.center.dy}',
        );

        await tester.pump(const Duration(milliseconds: 2000));
        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'around-window swap without ack that drops the unread anchor still '
      're-centers a later jump',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              ackIndex: 20,
              messageCount: 120,
            );
        final String targetId = harness.messages[90].id;

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await pumpFluxerFrames(tester);
        expect(find.text('NEW'), findsOneWidget);

        final List<Message> aroundWindow = harness.messages.sublist(50, 120);
        expect(
          aroundWindow.any((Message m) => m.id == harness.firstUnreadId),
          isFalse,
        );
        harness.chatViewModel.testState = harness.chatViewModel.testState
            .copyWith(
              write: (
                messages: aroundWindow,
                origin: MessagesOrigin.windowSwap,
              ),
              hasMoreMessages: true,
              hasMoreNewerMessages: false,
            );
        await tester.pump();
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 16));
        expect(find.byType(CustomScrollView), findsWidgets);

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

        expect(messageItemFor(targetId), findsOneWidget);
        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect target = tester.getRect(messageItemFor(targetId));
        expect(
          (target.center.dy - viewport.center.dy).abs(),
          lessThanOrEqualTo(16),
          reason:
              'unread orphaned-anchor center=${target.center.dy}, '
              'viewport=${viewport.center.dy}',
        );

        await tester.pump(const Duration(milliseconds: 2000));
        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'orphaned center anchor without jump preserves viewport message',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              ackIndex: 20,
              messageCount: 80,
            );
        // Message near the open center that stays in the window after trim.
        final String preserveId = harness.messages[30].id;

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await pumpFluxerFrames(tester);
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
        await pumpFluxerFrames(tester);
        expect(messageItemFor(preserveId), findsOneWidget);
        final Rect viewportBefore = tester.getRect(messageListScrollable());
        final Rect preserveBefore = tester.getRect(messageItemFor(preserveId));
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
        harness.chatViewModel.testState = harness.chatViewModel.testState
            .copyWith(
              write: (messages: trimmed, origin: MessagesOrigin.trim),
              hasMoreMessages: true,
              hasMoreNewerMessages:
                  harness.chatViewModel.testState.hasMoreNewerMessages,
            );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
        for (int i = 0; i < 8; i++) {
          await tester.pump(const Duration(milliseconds: 48));
        }
        for (int i = 0; i < 4; i++) {
          await tester.pump(const Duration(milliseconds: 100));
        }
        await pumpFluxerFrames(tester);

        // Still visible after layout conversion — not yanked to live tail.
        expect(messageItemFor(preserveId), findsOneWidget);
        final Rect viewportAfter = tester.getRect(messageListScrollable());
        final Rect preserveAfter = tester.getRect(messageItemFor(preserveId));
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
          final Finder newestFinder = messageItemFor(newestId);
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
        await disposeMessageList(tester);
      },
    );

    testWidgets('unread mode centers pre-divider jump targets', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final AroundAckMessageListHarness harness =
          await createAroundAckMessageListHarness(
            ackIndex: 25,
            messageCount: 55,
          );
      final String beforeId = harness.olderReadId;

      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
        ),
      );
      await tester.pump();
      await pumpFluxerFrames(tester);
      expect(find.text('NEW'), findsOneWidget);

      harness.chatViewModel.scrollToMessage(beforeId);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      await pumpFluxerFrames(tester);

      expect(messageItemFor(beforeId), findsOneWidget);
      final Rect viewport = tester.getRect(messageListScrollable());
      final Rect target = tester.getRect(messageItemFor(beforeId));
      expect(
        (target.center.dy - viewport.center.dy).abs(),
        lessThanOrEqualTo(16),
        reason:
            'pre-divider target center=${target.center.dy}, '
            'viewport center=${viewport.center.dy}',
      );

      await disposeMessageList(tester);
    });

    testWidgets(
      'unread mode centers pre-divider target from post-divider start',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              ackIndex: 25,
              messageCount: 70,
            );
        // Deep in the leading (read) side, not the message adjacent to NEW.
        final String beforeId = harness.messages[8].id;
        final String deepAfterId = harness.messages[55].id;

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await pumpFluxerFrames(tester);
        expect(find.text('NEW'), findsOneWidget);

        // Scroll well into the trailing (post-divider) region first.
        harness.chatViewModel.scrollToMessage(deepAfterId);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
        await pumpFluxerFrames(tester);
        expect(messageItemFor(deepAfterId), findsOneWidget);

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
        await pumpFluxerFrames(tester);

        expect(messageItemFor(beforeId), findsOneWidget);
        final ScrollPosition position = messageListScrollPosition(tester);
        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect target = tester.getRect(messageItemFor(beforeId));
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
        await disposeMessageList(tester);
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
        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              ackIndex: 10,
              messageCount: 60,
            );
        // Mid of the unread half (indices 11..59), not near the tail.
        final String midAfterId = harness.messages[30].id;

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await pumpFluxerFrames(tester);
        expect(find.text('NEW'), findsOneWidget);

        harness.chatViewModel.scrollToMessage(midAfterId);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
        await pumpFluxerFrames(tester);

        expect(messageItemFor(midAfterId), findsOneWidget);
        final ScrollPosition position = messageListScrollPosition(tester);
        final double remaining = position.maxScrollExtent - position.pixels;
        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect target = tester.getRect(messageItemFor(midAfterId));
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

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'unread mode near-tail post-divider jump is fully visible when clamped',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              ackIndex: 40,
              hasMoreNewerMessages: false,
            );
        // Near the live tail on the unread side (few messages below).
        final String nearTailId = harness.messages[47].id;

        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await tester.pump();
        await pumpFluxerFrames(tester);
        expect(find.text('NEW'), findsOneWidget);

        harness.chatViewModel.scrollToMessage(nearTailId);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
        await pumpFluxerFrames(tester);

        expect(messageItemFor(nearTailId), findsOneWidget);
        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect target = tester.getRect(messageItemFor(nearTailId));

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
        final ScrollPosition position = messageListScrollPosition(tester);
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
        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'a jump signalled after its window landed settles on the neighbour '
      'instead of waiting for the park to expire',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final AroundAckMessageListHarness harness =
            await createBottomMessageListHarness();
        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);

        // The view model swaps the around page in and signals afterwards, so
        // the epoch recorded at park time is already that install's. The page
        // omits the target: deleted or filtered server-side.
        final List<Message> loaded = harness.chatViewModel.testState.messages;
        final String missingId = loaded[25].id;
        final String neighbourId = loaded[26].id;
        harness.chatViewModel.testState = harness.chatViewModel.testState
            .copyWith(
              write: (
                messages: <Message>[
                  for (final Message message in loaded)
                    if (message.id != missingId) message,
                ],
                origin: MessagesOrigin.windowSwap,
              ),
              windowEpoch: harness.chatViewModel.testState.windowEpoch + 1,
            );
        await tester.pump();

        harness.chatViewModel.scrollToMessage(missingId);
        await pumpFluxerFrames(tester);

        expect(messageItemFor(neighbourId), findsOneWidget);
        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect neighbour = tester.getRect(messageItemFor(neighbourId));
        expect(
          (neighbour.center.dy - viewport.center.dy).abs(),
          lessThanOrEqualTo(16),
          reason:
              'the jump settles on the nearest loaded neighbour, not on the '
              'live tail after a timeout',
        );

        await disposeMessageList(tester);
      },
    );
  });
  group('origin-authorized follow', () {
    // The follow-vs-preserve decision spec, pinned case by case. Post-install
    // state cannot distinguish the final page of the user's own pagination
    // from a live arrival (byte-identical observables), so the write's ORIGIN
    // decides — and the assertions here are first-visible-item identity plus
    // pixel offset, never absence-of-scroll-call: the primary snap was a
    // layout-time teleport that emitted no scroll call at all.
    testWidgets(
      'a scroll-end trim bounds the window without moving the visible rows',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: false,
          count: 240,
        );
        expect(chatViewModel.state.messages, hasLength(240));

        // A held gesture never trims: a destructive trim landing mid-scroll
        // is exactly the teleport this design removes.
        final TestGesture gesture = await tester.startGesture(
          tester.getCenter(messageListScrollable()),
        );
        for (int i = 0; i < 6; i += 1) {
          await gesture.moveBy(const Offset(0, 120));
          await tester.pump();
        }
        expect(
          chatViewModel.state.messages,
          hasLength(240),
          reason: 'no trim while the gesture is held',
        );

        // Zero-velocity release: the settle applies the around-trim. The
        // rows on screen keep their pixels - both removals land at the far
        // sliver ends, away from the reader.
        final String probeId = centerVisibleMessageItemId(tester);
        final ({String id, Rect rect}) before = anchorSample(tester, probeId);
        await gesture.up();
        await pumpFluxerFrames(tester);

        expect(
          chatViewModel.state.messages,
          hasLength(kTrimmedMessageWindowSize),
        );
        expect(
          chatViewModel.state.hasMoreMessages,
          isTrue,
          reason: 'the dropped older side re-opens pagination',
        );
        expect(
          chatViewModel.state.hasMoreNewerMessages,
          isFalse,
          reason: 'the reader sits near the tail: the newer side is kept',
        );
        expectPreserved(
          tester,
          before,
          reason: 'the trim must not move the reader',
        );
        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'case 1: the FINAL newer page — the one that flips hasMoreNewerMessages '
      'false as it lands — preserves the reader at the wall',
      (WidgetTester tester) async {
        // The design discriminator. A follow decision gated on the flag
        // (follow iff nearEdge && !hasMoreNewerMessages) authorizes the snap
        // on exactly this landing, because messages and the flag move in one
        // atomic write: the mutation MUST fail this case while case 2 stays
        // green. Only the write's origin separates the two worlds.
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: true,
        );
        final ScrollPosition position = messageListScrollPosition(tester);
        expect(position.pixels, moreOrLessEquals(0, epsilon: 1));
        final ({String id, Rect rect}) before = anchorSample(
          tester,
          chatViewModel.testState.messages.last.id,
        );

        final List<Message> old = chatViewModel.testState.messages;
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[...old, ...newerRows(old, count: 8)],
            origin: MessagesOrigin.newerPage,
          ),
          hasMoreNewerMessages: false,
        );
        await tester.pump();
        await tester.pump();

        expectPreserved(
          tester,
          before,
          reason:
              "the terminal frame of the user's own pagination must not "
              'teleport them to the new tail',
        );
        expect(
          position.maxScrollExtent - position.pixels,
          greaterThan(kMessageListReadBottomThreshold),
          reason: 'the appended page sits below the preserved viewport',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'case 2: an intermediate newer page (flag stays true) preserves',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: true,
        );
        final ({String id, Rect rect}) before = anchorSample(
          tester,
          chatViewModel.testState.messages.last.id,
        );
        final List<Message> old = chatViewModel.testState.messages;
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[...old, ...newerRows(old, count: 8)],
            origin: MessagesOrigin.newerPage,
          ),
        );
        await tester.pump();
        await tester.pump();
        expectPreserved(tester, before, reason: 'intermediate page landing');

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'case 3: a newer landing with the viewport far above the edge preserves',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: true,
          count: 80,
        );
        final ScrollPosition position = messageListScrollPosition(tester);
        position.jumpTo(
          (position.pixels - 1500).clamp(
            position.minScrollExtent,
            position.maxScrollExtent,
          ),
        );
        await pumpFluxerFrames(tester);
        final ({String id, Rect rect}) before = anchorSample(
          tester,
          centerVisibleMessageItemId(tester),
        );
        final List<Message> old = chatViewModel.testState.messages;
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[...old, ...newerRows(old, count: 8)],
            origin: MessagesOrigin.newerPage,
          ),
        );
        await tester.pump();
        await tester.pump();
        expectPreserved(
          tester,
          before,
          reason: 'a fix that special-cases the exact edge is not a fix',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets('case 4: a live arrival at the tail still follows', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
      );
      final ScrollPosition position = messageListScrollPosition(tester);
      final List<Message> old = chatViewModel.testState.messages;
      final List<Message> live = newerRows(old, count: 1, label: 'live');
      chatViewModel.testState = chatViewModel.testState.copyWith(
        write: (
          messages: <Message>[...old, ...live],
          origin: MessagesOrigin.liveCreate,
        ),
      );
      await tester.pump();
      await tester.pump();
      expect(messageItemFor(live.single.id), findsOneWidget);
      expect(
        position.pixels,
        moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
        reason: 'live tail-follow must survive the origin cutover',
      );

      await disposeMessageList(tester);
    });

    testWidgets('case 4b: a live arrival during a user drag away from the tail '
        'does not follow', (WidgetTester tester) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
      );
      final ScrollPosition position = messageListScrollPosition(tester);
      expect(
        position.pixels,
        moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
      );

      // Drag physics leave the tail from anchor offset 0; the settled open
      // parks at maxScrollExtent.
      position.jumpTo(0);
      await tester.pump();

      final TestGesture gesture = await tester.startGesture(
        tester.getCenter(messageListScrollable()),
      );
      await gesture.moveBy(const Offset(0, 50));
      await tester.pump();
      expect(
        position.maxScrollExtent - position.pixels,
        greaterThan(8),
        reason: 'drag must leave the 8px engage zone',
      );

      final List<Message> old = chatViewModel.testState.messages;
      final List<Message> live = newerRows(old, count: 1, label: 'live');
      chatViewModel.testState = chatViewModel.testState.copyWith(
        write: (
          messages: <Message>[...old, ...live],
          origin: MessagesOrigin.liveCreate,
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(
        position.maxScrollExtent - position.pixels,
        greaterThan(8),
        reason: 'a mid-drag liveCreate must not follow',
      );

      await gesture.up();
      await pumpFluxerFrames(tester);
      await disposeMessageList(tester);
    });

    testWidgets('case 4c: after a short drag away from the tail, a later live '
        'arrival preserves', (WidgetTester tester) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
      );
      final ScrollPosition position = messageListScrollPosition(tester);

      // Pin distance subtracts the 16px status overlay inset; clear past
      // 8 + 16 so settle cannot re-engage.
      await tester.drag(messageListScrollable(), const Offset(0, 120));
      await pumpFluxerFrames(tester);

      final double settledPixels = position.pixels;
      expect(
        position.maxScrollExtent - settledPixels,
        greaterThan(24),
        reason: 'drag must leave the 8px engage zone',
      );

      final List<Message> old = chatViewModel.testState.messages;
      final List<Message> live = newerRows(old, count: 1, label: 'live');
      chatViewModel.testState = chatViewModel.testState.copyWith(
        write: (
          messages: <Message>[...old, ...live],
          origin: MessagesOrigin.liveCreate,
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(
        position.maxScrollExtent - position.pixels,
        greaterThan(8),
        reason: 'a disarmed leave must not re-follow on liveCreate',
      );
      expect(position.pixels, moreOrLessEquals(settledPixels, epsilon: 2));

      await disposeMessageList(tester);
    });

    testWidgets(
      'case 5: preserve on the final page does not leak into never-follow '
      '— a later live arrival at the bottom still follows',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: true,
        );
        final ScrollPosition position = messageListScrollPosition(tester);
        final ({String id, Rect rect}) before = anchorSample(
          tester,
          chatViewModel.testState.messages.last.id,
        );
        final List<Message> old = chatViewModel.testState.messages;
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[...old, ...newerRows(old, count: 8)],
            origin: MessagesOrigin.newerPage,
          ),
          hasMoreNewerMessages: false,
        );
        await tester.pump();
        await tester.pump();
        expectPreserved(tester, before, reason: 'final page preserves');

        // The reader catches up to the real bottom, then a create lands.
        position.jumpTo(position.maxScrollExtent);
        await pumpFluxerFrames(tester);
        final List<Message> caughtUp = chatViewModel.testState.messages;
        final List<Message> live = newerRows(caughtUp, count: 1, label: 'live');
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[...caughtUp, ...live],
            origin: MessagesOrigin.liveCreate,
          ),
        );
        await tester.pump();
        await tester.pump();
        expect(messageItemFor(live.single.id), findsOneWidget);
        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
          reason: 'both conjuncts recover on their own — nothing latches',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'case 6: a preserve-class write at the wall preserves — the default is '
      'preserve, not follow',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: false,
        );
        final ({String id, Rect rect}) before = anchorSample(
          tester,
          chatViewModel.testState.messages.last.id,
        );
        final List<Message> old = chatViewModel.testState.messages;
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[...old, ...newerRows(old, count: 2)],
            origin: MessagesOrigin.localMutation,
          ),
        );
        await tester.pump();
        await tester.pump();
        expectPreserved(
          tester,
          before,
          reason:
              'an untagged messages write is unrepresentable; every origin '
              'except liveCreate lands as preserve',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'case 7: back-to-back pagination append then live create in consecutive '
      'frames — each verdict binds to its own transition',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: true,
        );
        final ScrollPosition position = messageListScrollPosition(tester);
        final ({String id, Rect rect}) before = anchorSample(
          tester,
          chatViewModel.testState.messages.last.id,
        );
        final List<Message> old = chatViewModel.testState.messages;
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[...old, ...newerRows(old, count: 8)],
            origin: MessagesOrigin.newerPage,
          ),
          hasMoreNewerMessages: false,
        );
        await tester.pump();
        expectPreserved(tester, before, reason: 'frame N: pagination lands');

        position.jumpTo(position.maxScrollExtent);
        await tester.pump();
        final List<Message> paged = chatViewModel.testState.messages;
        final List<Message> live = newerRows(paged, count: 1, label: 'live');
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[...paged, ...live],
            origin: MessagesOrigin.liveCreate,
          ),
        );
        await tester.pump();
        await tester.pump();
        expect(messageItemFor(live.single.id), findsOneWidget);
        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
          reason:
              'frame N+1: the create still follows — no shared cell '
              "exists for the first frame's verdict to corrupt",
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'case 8: a coalesced delivery (pagination and create observed as one '
      'transition) preserves — the reader is mid-history',
      (WidgetTester tester) async {
        // Two writes, ONE notification: the listener is handed
        // previous=pre-pagination, next=post-create. The authorization the
        // create minted names before=post-pagination, which the delivered
        // previous does not match by identity, so the verdict falls to
        // preserve. Dropping the before-identity conjunct is the mutation
        // this case kills: the mutant follows and snaps the reader past the
        // page they were reading.
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: true,
        );
        final ({String id, Rect rect}) before = anchorSample(
          tester,
          chatViewModel.testState.messages.last.id,
        );
        final List<Message> old = chatViewModel.testState.messages;
        final ChatViewState afterPage = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[...old, ...newerRows(old, count: 8)],
            origin: MessagesOrigin.newerPage,
          ),
          hasMoreNewerMessages: false,
        );
        final List<Message> paged = afterPage.messages;
        final List<Message> live = newerRows(paged, count: 1, label: 'live');
        chatViewModel.testState = afterPage.copyWith(
          write: (
            messages: <Message>[...paged, ...live],
            origin: MessagesOrigin.liveCreate,
          ),
        );
        await tester.pump();
        await tester.pump();
        expectPreserved(
          tester,
          before,
          reason:
              'a coalesced batch is not a clean live arrival; transition '
              'identity must refuse it',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'case 9: an authorization never outlives its write — re-assigning the '
      'exact list instance a liveCreate once produced does not re-follow',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: false,
        );
        final ScrollPosition position = messageListScrollPosition(tester);
        final List<Message> old = chatViewModel.testState.messages;
        final List<Message> live = newerRows(old, count: 1, label: 'live');
        final List<Message> listC = <Message>[...old, ...live];
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (messages: listC, origin: MessagesOrigin.liveCreate),
        );
        await tester.pump();
        await tester.pump();
        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
          reason: 'the live authorization was real',
        );

        // A local mutation drops the live row, then cache re-derivation
        // re-assigns the IDENTICAL earlier instance. Every write mints its
        // own record inside copyWith, so the stale liveCreate cannot be
        // reconstructed — inherit-on-omission is unrepresentable.
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (messages: old, origin: MessagesOrigin.localMutation),
        );
        await tester.pump();
        final ({String id, Rect rect}) before = anchorSample(
          tester,
          old.last.id,
        );
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (messages: listC, origin: MessagesOrigin.localMutation),
        );
        await tester.pump();
        await tester.pump();
        expectPreserved(
          tester,
          before,
          reason: 'instance reuse must not resurrect a spent authorization',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'case 10: unified viewport - the final newer page does not follow, '
      'the next live create does',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              messageCount: 60,
              ackIndex: 42,
            );
        await tester.pumpWidget(
          messageListApp(
            database: harness.database,
            chatViewModel: harness.chatViewModel,
          ),
        );
        await pumpFluxerFrames(tester);
        final ScrollPosition position = messageListScrollPosition(tester)
          ..jumpTo(messageListNewestRowOffset(tester));
        await pumpFluxerFrames(tester);
        final double pixelsBefore = position.pixels;

        final List<Message> cur = harness.chatViewModel.testState.messages;
        harness.chatViewModel.testState = harness.chatViewModel.testState
            .copyWith(
              write: (
                messages: <Message>[
                  ...cur,
                  ...newerRows(cur, count: 6, label: 'final page'),
                ],
                origin: MessagesOrigin.newerPage,
              ),
              hasMoreNewerMessages: false,
            );
        await tester.pump();
        await tester.pump();
        expect(
          position.pixels,
          moreOrLessEquals(pixelsBefore, epsilon: 1),
          reason:
              'a follow gated on the flag would authorize the jump on the '
              'terminal pagination frame; only origin plus pin may follow',
        );

        // The preserved landing left the reader a page above the trailing
        // edge; a follow is only legitimate once they are back at it.
        position.jumpTo(position.maxScrollExtent);
        await pumpFluxerFrames(tester);
        final List<Message> paged = harness.chatViewModel.testState.messages;
        final List<Message> live = newerRows(paged, count: 1, label: 'live');
        harness.chatViewModel.testState = harness.chatViewModel.testState
            .copyWith(
              write: (
                messages: <Message>[...paged, ...live],
                origin: MessagesOrigin.liveCreate,
              ),
            );
        await tester.pump();
        await tester.pump();
        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
          reason: 'a live arrival near the trailing edge still follows',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'case 11: a channel switch in the same frame retires a scheduled '
      'follow pin - no cross-channel scroll jump (UI epoch guard)',
      (WidgetTester tester) async {
        const String switchChannelId = 'message-list-switch-channel';
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final InstrumentedChatViewModel chatViewModel =
            InstrumentedChatViewModel(
              detachedState(seedMessages(60), hasMoreNewer: false),
            );
        final db.FluxerDatabase database = openTestDatabase();
        // The switch target opens unread-centered (divider mid-viewport):
        // that layout keeps real distance to the live tail, so a stale
        // follow pin's jumpTo(maxScrollExtent) is observable as a tail yank.
        final DateTime switchBase = messageListSeedBase.subtract(
          const Duration(days: 2),
        );
        final List<Message> switchedMessages = <Message>[
          for (int index = 0; index < 60; index += 1)
            harnessMessage(
              id: snowflakeForUtc(switchBase.add(Duration(minutes: index))),
              content: 'switched $index',
              timestamp: switchBase.add(Duration(minutes: index)),
            ),
        ];
        await database.readStateDao.upsertReadState(
          db.ReadStatesCompanion(
            channelId: const Value<String>(switchChannelId),
            lastMessageId: Value<String?>(switchedMessages[8].id),
          ),
        );
        // No expectedChannelId: the same mounted list swaps channels via
        // state alone - the hazard window.
        await tester.pumpWidget(
          messageListApp(
            database: database,
            chatViewModel: chatViewModel,
            body: const MessageList(),
          ),
        );
        await pumpFluxerFrames(tester);
        for (int i = 0; i < 4; i += 1) {
          await tester.pump();
        }
        // Pre-warm the switch target's read-state family so the switch build
        // resolves its unread anchor immediately (on device the family is
        // warm for recently visited channels).
        final ProviderContainer container = ProviderScope.containerOf(
          tester.element(find.byType(MessageList)),
        );
        final ProviderSubscription<AsyncValue<db.ReadState?>> warmReadState =
            container.listen(
              messageListReadStateProvider(switchChannelId),
              (_, _) {},
            );
        addTearDown(warmReadState.close);
        await pumpFluxerFrames(tester);

        final ScrollPosition position = messageListScrollPosition(tester);
        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
        );

        // A live arrival at the pinned tail schedules the follow pin for the
        // end of the NEXT frame (registered outside a frame).
        final List<Message> old = chatViewModel.testState.messages;
        final List<Message> live = newerRows(old, count: 1, label: 'live');
        chatViewModel
          ..testState = chatViewModel.testState.copyWith(
            write: (
              messages: <Message>[...old, ...live],
              origin: MessagesOrigin.liveCreate,
            ),
          )
          // Same frame: the channel switches. Its unread open re-anchors the
          // fresh position onto the NEW divider, away from the live tail.
          ..testState = ChatViewState(
            channelId: switchChannelId,
            messages: switchedMessages,
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
          );

        await tester.pump();
        await tester.pump();

        // The switched channel opened on its unread anchor; a stale follow
        // pin firing into it would sit at the live tail instead.
        final ScrollPosition switched = messageListScrollPosition(tester);
        expect(find.text('NEW'), findsOneWidget);
        expect(
          switched.maxScrollExtent - switched.pixels,
          greaterThan(300),
          reason:
              'a follow pin scheduled for the previous channel must not fire '
              'into the switched channel (UI epoch guard)',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'case 12: a same-channel window swap retires a scheduled follow pin - '
      'the stale pin must not land the viewport on the fetched batch tail',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: false,
        );
        final ScrollPosition position = messageListScrollPosition(tester);
        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
        );

        final List<Message> old = chatViewModel.testState.messages;
        final List<Message> live = newerRows(old, count: 1, label: 'live');
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[...old, ...live],
            origin: MessagesOrigin.liveCreate,
          ),
        );

        // Before that frame renders, a detached around-window replaces the
        // window wholesale (same channel). The stale pin's jump-to-max would
        // land on the newest message of the fetched batch - re-triggering
        // the newer edge fetch (the pagination loop). The swap write itself
        // must invalidate it.
        final DateTime olderBase = messageListSeedBase.subtract(
          const Duration(days: 1),
        );
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[
              for (int index = 0; index < 60; index += 1)
                harnessMessage(
                  id: snowflakeForUtc(olderBase.add(Duration(minutes: index))),
                  content: 'swapped $index',
                  timestamp: olderBase.add(Duration(minutes: index)),
                ),
            ],
            origin: MessagesOrigin.windowSwap,
          ),
          hasMoreNewerMessages: true,
        );
        // The swapped window positions the reader mid-history.
        position.jumpTo(position.pixels - 600);

        await tester.pump();
        await tester.pump();

        expect(
          position.maxScrollExtent - position.pixels,
          greaterThan(300),
          reason:
              'a follow pin scheduled before the window swap must not fire '
              'into the replaced window (UI epoch guard)',
        );

        await disposeMessageList(tester);
      },
    );

    // ---- Phase 3 GATE tests: the unified center-anchored viewport ----

    testWidgets(
      'gate 1: in-window jump re-anchors the target to the viewport center '
      'atomically and holds',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: false,
          count: 80,
        );
        final String targetId = chatViewModel.testState.messages[30].id;
        chatViewModel.scrollToMessage(targetId);
        await tester.pump();
        await pumpFluxerFrames(tester);

        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect target = tester.getRect(messageItemFor(targetId));
        expect(
          (target.center.dy - viewport.center.dy).abs(),
          lessThanOrEqualTo(8),
          reason: 'the jump target rect-centers in the viewport',
        );

        await tester.pump();
        await tester.pump();
        final Rect after = tester.getRect(messageItemFor(targetId));
        expect(
          (after.center.dy - viewport.center.dy).abs(),
          lessThanOrEqualTo(8),
          reason: 'no post-jump drift or settle thrash',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'gate 2: a window-swap jump renders the target anchored on the FIRST '
      'pumped frame - no intermediate frame at a stale offset',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: false,
        );
        final DateTime aroundBase = messageListSeedBase.subtract(
          const Duration(days: 3),
        );
        final List<Message> aroundWindow = <Message>[
          for (int index = 0; index < 50; index += 1)
            harnessMessage(
              id: snowflakeForUtc(aroundBase.add(Duration(minutes: index))),
              content: 'around $index',
              timestamp: aroundBase.add(Duration(minutes: index)),
            ),
        ];
        final String targetId = aroundWindow[25].id;
        // Out-of-window ask: the target parks until its page arrives.
        chatViewModel.scrollToMessage(targetId);
        await tester.pump();

        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (messages: aroundWindow, origin: MessagesOrigin.windowSwap),
          hasMoreNewerMessages: true,
        );
        await tester.pump();

        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect firstFrame = tester.getRect(messageItemFor(targetId));
        // Anchor semantics on the very first frame: the target's LEADING
        // edge sits at the anchor fraction - never a stale offset.
        expect(
          (firstFrame.top - viewport.center.dy).abs(),
          lessThanOrEqualTo(1),
          reason:
              'the fresh position lays the anchor out atomically - its '
              'leading edge at the fraction, never a stale offset',
        );

        await pumpFluxerFrames(tester);
        final Rect settled = tester.getRect(messageItemFor(targetId));
        expect(
          (settled.center.dy - viewport.center.dy).abs(),
          lessThanOrEqualTo(8),
          reason: 'the half-height correction rect-centers the target',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'gate 3: deleting the anchor message re-anchors to the nearest newer '
      'survivor with neighbors pixel-stable',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: false,
          count: 80,
        );
        final List<Message> messages = chatViewModel.testState.messages;
        final String targetId = messages[40].id;
        // A before-edge jump anchor repairs to the nearest NEWER survivor,
        // keeping the leading partition (the OLDER neighbor) pixel-stable.
        final String neighborId = messages[39].id;
        chatViewModel.scrollToMessage(targetId);
        await tester.pump();
        await pumpFluxerFrames(tester);
        final Rect neighborBefore = tester.getRect(messageItemFor(neighborId));

        final List<Message> without = messages
            .where((Message m) => m.id != targetId)
            .toList();
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (messages: without, origin: MessagesOrigin.localMutation),
        );
        await tester.pump();
        await tester.pump();

        expect(messageItemFor(targetId), findsNothing);
        final Rect neighborAfter = tester.getRect(messageItemFor(neighborId));
        expect(
          (neighborAfter.top - neighborBefore.top).abs(),
          lessThanOrEqualTo(1),
          reason: 'anchor repair must not move the viewport',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'gate 4: a bulk delete that underfills a centered anchor re-anchors to '
      'the tail instead of stranding a dead band',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: false,
        );
        final List<Message> messages = chatViewModel.testState.messages;
        // A jump anchors (target, 0.5, before), which only holds while the
        // trailing side can fill the lower half of the viewport.
        chatViewModel.scrollToMessage(messages[40].id);
        await tester.pump();
        await pumpFluxerFrames(tester);
        expect(
          messageListScrollPosition(tester).maxScrollExtent,
          greaterThan(0),
          reason: 'the centered open must start filled',
        );

        // MESSAGE_DELETE_BULK shape: one preserve-class write drops the anchor
        // and every row but two.
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[messages.first, messages.last],
            origin: MessagesOrigin.realtimeEvent,
          ),
        );
        await pumpFluxerFrames(tester);
        // The underfill reanchor runs in a post-frame callback whose jumpTo
        // needs a further frame to lay out.
        for (int i = 0; i < 4; i += 1) {
          await tester.pump();
        }

        expect(find.byType(MessageItem), findsNWidgets(2));
        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect newestRect = tester.getRect(
          messageItemFor(messages.last.id),
        );
        expect(
          newestRect.bottom,
          greaterThan(viewport.bottom - 64),
          reason: 'the surviving rows must hug the composer, not the fraction',
        );
        expect(newestRect.bottom, lessThanOrEqualTo(viewport.bottom + 1));
        final ScrollPosition position = messageListScrollPosition(tester);
        expect(
          position.maxScrollExtent - position.pixels,
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
          reason: 'the demoted anchor lands at the live tail',
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'gate 5: a realtime edit that grows the newest row keeps a pinned '
      'reader glued to the live tail',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: false,
        );
        // Live arrivals land in the trailing sliver under the open-time
        // anchor, so the followed reader sits at the trailing edge.
        final List<Message> seeded = chatViewModel.testState.messages;
        final List<Message> withLive = <Message>[
          ...seeded,
          ...newerRows(seeded, count: 20, label: 'purge target'),
        ];
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (messages: withLive, origin: MessagesOrigin.liveCreate),
        );
        await pumpFluxerFrames(tester);

        final List<Message> survivors = <Message>[
          withLive.first,
          withLive.last,
        ];
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (messages: survivors, origin: MessagesOrigin.realtimeEvent),
        );
        await pumpFluxerFrames(tester);
        final ScrollPosition afterDelete = messageListScrollPosition(tester);
        expect(
          afterDelete.maxScrollExtent - afterDelete.pixels,
          lessThanOrEqualTo(1),
          reason: 'the framework clamp already holds the tail on a shrink',
        );

        // MESSAGE_UPDATE shape: the status row grows. maxScrollExtent grows
        // with it and nothing pulls pixels forward, so the newest row would
        // otherwise be pushed below the fold.
        final Message newest = survivors.last;
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[
              survivors.first,
              newest.copyWith(
                content:
                    '${newest.content}\nedited line 0\nedited line 1\n'
                    'edited line 2',
                editedTimestamp: newest.timestamp.add(
                  const Duration(minutes: 1),
                ),
              ),
            ],
            origin: MessagesOrigin.realtimeEvent,
          ),
        );
        await pumpFluxerFrames(tester);

        final ScrollPosition position = messageListScrollPosition(tester);
        expect(
          position.maxScrollExtent - position.pixels,
          lessThanOrEqualTo(1),
          reason: 'a growing edit must not detach a pinned reader',
        );
        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect newestRect = tester.getRect(messageItemFor(newest.id));
        expect(
          newestRect.bottom,
          lessThanOrEqualTo(viewport.bottom + 1),
          reason: 'the edited row must not be clipped below the fold',
        );
        expect(newestRect.bottom, greaterThan(viewport.bottom - 64));

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'gate 6: a bulk delete that underfills the trailing side leaves a reader '
      'deep in history in place, and their scroll back to the edge repairs it',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: false,
        );
        final List<Message> messages = chatViewModel.testState.messages;
        chatViewModel.scrollToMessage(messages[40].id);
        await tester.pump();
        await pumpFluxerFrames(tester);

        // Deep into history, more than a viewport above the anchor line.
        ScrollPosition position = messageListScrollPosition(tester);
        expect(position.maxScrollExtent, greaterThan(0));
        position.jumpTo(messageListOldestRowOffset(tester));
        await pumpFluxerFrames(tester);
        final double pixelsBefore = position.pixels;
        expect(pixelsBefore, lessThan(-tester.view.physicalSize.height / 2));
        final ({String id, Rect rect}) reading = anchorSample(
          tester,
          messages[2].id,
        );

        // The purge drops only trailing-partition rows, so the leading extent
        // and therefore minScrollExtent are untouched: this reader's offset
        // survives the clamp and must survive the repair too.
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[...messages.take(45), messages.last],
            origin: MessagesOrigin.realtimeEvent,
          ),
        );
        await pumpFluxerFrames(tester);

        position = messageListScrollPosition(tester);
        expect(
          position.pixels,
          moreOrLessEquals(pixelsBefore, epsilon: 1),
          reason: 'the repair must not yank a reader out of history',
        );
        expect(
          position.maxScrollExtent,
          moreOrLessEquals(0, epsilon: 1),
          reason: 'the fraction is intact, so the trailing side stays clamped',
        );
        expectPreserved(
          tester,
          reading,
          reason: 'no demotion remount while reading history',
        );

        // Scrolling back to the trailing edge arms the withheld repair.
        await tester.drag(messageListScrollable(), const Offset(0, -1200));
        await pumpFluxerFrames(tester);

        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect newestRect = tester.getRect(
          messageItemFor(messages.last.id),
        );
        expect(
          newestRect.bottom,
          greaterThan(viewport.bottom - 64),
          reason: 'the deferred repair lands the newest row at the composer',
        );
        expect(newestRect.bottom, lessThanOrEqualTo(viewport.bottom + 1));
        final ScrollPosition repaired = messageListScrollPosition(tester);
        expect(
          repaired.maxScrollExtent,
          greaterThan(0),
          reason: 'a demoted anchor reopens the trailing extent',
        );
        expect(
          repaired.maxScrollExtent - repaired.pixels,
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
        );

        await disposeMessageList(tester);
      },
    );
  });
}
