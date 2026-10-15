@Tags(['slow'])
library;

import 'dart:async';
import 'dart:math' as math;

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_window.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/blocked_message_groups.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_demand_source.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_overlay.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_scroll_position.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_unread_review.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_viewport.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/chat_bottom_input_slot.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
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

        final double olderTop = tester.getRect(olderRead).top;
        final double ackTop = tester.getRect(ackBoundary).top;
        final double dividerTop = unreadDividerRect.top;
        expect(olderTop, lessThan(ackTop));
        expect(ackTop, lessThan(dividerTop));

        await disposeMessageList(tester);
      },
    );

    testWidgets('unread open does not bounce NEW across the first frames', (
      WidgetTester tester,
    ) async {
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

      final Finder firstUnread = messageItemFor(harness.firstUnreadId);
      final List<_UnreadOpenFrameSample> samples = <_UnreadOpenFrameSample>[];
      for (int i = 0; i < 4; i += 1) {
        samples.add(_sampleUnreadOpenFrame(tester, firstUnread));
        await tester.pump();
      }

      final _UnreadOpenFrameSample baseline = samples.firstWhere(
        (_UnreadOpenFrameSample sample) =>
            sample.hasNew && sample.epoch != null,
      );
      for (int i = samples.indexOf(baseline) + 1; i < samples.length; i += 1) {
        final _UnreadOpenFrameSample sample = samples[i];
        expect(
          sample.hasNew,
          isTrue,
          reason: 'NEW must stay mounted across open frames $sample',
        );
        expect(
          sample.epoch,
          baseline.epoch,
          reason:
              'unread open must not remount after first layout; frames=$samples',
        );
        expect(
          sample.newCenterY,
          moreOrLessEquals(baseline.newCenterY!, epsilon: 2),
          reason: 'NEW jumped after first layout; frames=$samples',
        );
        expect(
          sample.firstUnreadTop,
          moreOrLessEquals(baseline.firstUnreadTop!, epsilon: 2),
          reason: 'first unread jumped after first layout; frames=$samples',
        );
      }

      await disposeMessageList(tester);
    });

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

        for (int i = 0; i < 6; i += 1) {
          await tester.pump();
        }
        expect(
          harness.chatViewModel.loadNewerCallCount,
          1,
          reason: 'an open inside the margin activates demand exactly once',
        );
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
        WidgetsBinding.instance.addPostFrameCallback((_) {
          container
              .read(chatReadViewportProvider.notifier)
              .updateViewport(
                channelId: messageListChannelId,
                nearLoadedTail: false,
                distanceFromBottom: double.infinity,
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
        await tester.pump();
        await tester.pump();

        final Finder newest = messageItemFor(harness.newestLoadedId);
        expect(newest, findsOneWidget);
        final ScrollPosition position = messageListScrollPosition(tester);
        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
          reason:
              'read bottom open must sit in the trailing inset on first layout',
        );
        final double firstNewestTop = tester.getRect(newest).top;
        await tester.pump();
        expect(
          tester.getRect(newest).top,
          moreOrLessEquals(firstNewestTop, epsilon: 1),
          reason:
              'trailing inset must not lift the newest row after first layout',
        );

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
          greaterThan(80),
        );

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
        expect(leadingDistanceAfter, greaterThan(80));

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
      'unread open into collapsed blocked runs rests on the composer',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        const String blockedAuthorId = 'blocked-author';
        final List<Message> messages = <Message>[
          for (int index = 0; index < 6; index += 1)
            harnessMessage(
              id: snowflakeForUtc(DateTime.utc(2026, 10, 13, 12, index)),
              content: 'read message $index',
              timestamp: DateTime.utc(2026, 10, 13, 12, index),
            ),
          for (final int day in <int>[14, 15])
            for (int index = 0; index < 20; index += 1)
              harnessMessage(
                id: snowflakeForUtc(DateTime.utc(2026, 10, day, 12, index)),
                authorId: blockedAuthorId,
                content: 'blocked message $day-$index',
                timestamp: DateTime.utc(2026, 10, day, 12, index),
              ),
        ];
        final String ackId = messages[25].id;
        final db.FluxerDatabase database = openTestDatabase();
        await database.readStateDao.upsertReadState(
          db.ReadStatesCompanion(
            channelId: const Value<String>(messageListChannelId),
            lastMessageId: Value<String?>(ackId),
          ),
        );
        final InstrumentedChatViewModel chatViewModel =
            InstrumentedChatViewModel(
              ChatViewState(
                channelId: messageListChannelId,
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
                hasMoreMessages: false,
                hasMoreNewerMessages: false,
                errorMessage: null,
              ),
            );

        await tester.pumpWidget(
          messageListApp(
            database: database,
            chatViewModel: chatViewModel,
            blockedUserIds: const <String>{blockedAuthorId},
          ),
        );
        await pumpFluxerFrames(tester);

        final Finder groups = find.byType(BlockedMessageGroups);
        expect(groups, findsNWidgets(2));
        expect(find.text('NEW'), findsOneWidget);
        expect(find.text('20 blocked messages'), findsNWidgets(2));

        final Rect viewport = tester.getRect(messageListScrollable());
        final double composerTop =
            viewport.bottom -
            tester
                .widget<MessageListViewport>(find.byType(MessageListViewport))
                .trailingInset;
        expect(
          tester.getRect(groups.last).bottom,
          moreOrLessEquals(composerTop, epsilon: 1),
          reason: 'the newest collapsed run must rest on the composer',
        );
        expect(
          tester.getRect(find.text('NEW')).bottom,
          lessThan(tester.getRect(groups.last).top + 1),
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets('acking a collapsed blocked run drops its NEW divider', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      const String blockedAuthorId = 'blocked-author';
      final List<Message> messages = <Message>[
        for (int index = 0; index < 3; index += 1)
          harnessMessage(
            id: snowflakeForUtc(DateTime.utc(2026, 10, 15, 12, index)),
            content: 'read message $index',
            timestamp: DateTime.utc(2026, 10, 15, 12, index),
          ),
        for (int index = 0; index < 6; index += 1)
          harnessMessage(
            id: snowflakeForUtc(DateTime.utc(2026, 10, 15, 13, index)),
            authorId: blockedAuthorId,
            content: 'blocked message $index',
            timestamp: DateTime.utc(2026, 10, 15, 13, index),
          ),
      ];
      final db.FluxerDatabase database = openTestDatabase();
      await database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value<String>(messageListChannelId),
          lastMessageId: Value<String?>(messages[2].id),
        ),
      );
      final InstrumentedChatViewModel chatViewModel = InstrumentedChatViewModel(
        ChatViewState(
          channelId: messageListChannelId,
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
          hasMoreMessages: false,
          hasMoreNewerMessages: false,
          errorMessage: null,
        ),
      );

      await tester.pumpWidget(
        messageListApp(
          database: database,
          chatViewModel: chatViewModel,
          blockedUserIds: const <String>{blockedAuthorId},
        ),
      );
      await pumpFluxerFrames(tester);

      expect(find.text('6 blocked messages'), findsOneWidget);
      expect(find.text('NEW'), findsOneWidget);

      await tester.runAsync(
        () => database.readStateDao.upsertReadState(
          db.ReadStatesCompanion(
            channelId: const Value<String>(messageListChannelId),
            lastMessageId: Value<String?>(messages.last.id),
          ),
        ),
      );
      await pumpFluxerFrames(tester);

      expect(find.text('6 blocked messages'), findsOneWidget);
      expect(find.text('NEW'), findsNothing);

      await disposeMessageList(tester);
    });

    testWidgets(
      'short unread pack settles once without bouncing back toward mid',
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

        final Finder firstUnread = messageItemFor(harness.firstUnreadId);
        final List<_UnreadOpenFrameSample> samples = <_UnreadOpenFrameSample>[];
        for (int i = 0; i < 4; i += 1) {
          samples.add(_sampleUnreadOpenFrame(tester, firstUnread));
          await tester.pump();
        }

        final List<_UnreadOpenFrameSample> withNew = samples
            .where((_UnreadOpenFrameSample sample) => sample.hasNew)
            .toList();
        expect(withNew, isNotEmpty, reason: 'NEW missing on unread open');
        for (final _UnreadOpenFrameSample sample in withNew) {
          expect(sample.hasNew, isTrue);
        }

        var packed = false;
        var lastCenter = withNew.first.newCenterY!;
        for (final _UnreadOpenFrameSample sample in withNew.skip(1)) {
          final double center = sample.newCenterY!;
          if (packed) {
            expect(
              center,
              moreOrLessEquals(lastCenter, epsilon: 2),
              reason:
                  'short unread pack bounced after settling; frames=$samples',
            );
          } else if (center > lastCenter + 2) {
            packed = true;
          } else {
            expect(
              center,
              moreOrLessEquals(lastCenter, epsilon: 2),
              reason: 'NEW moved up during short unread open; frames=$samples',
            );
          }
          lastCenter = center;
        }

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'short unread open paints NEW and the unread bar only once packed',
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

        final List<double> paintedNewCenters = <double>[];
        final List<bool> barPainted = <bool>[];
        for (int i = 0; i < 6; i += 1) {
          final Finder newDivider = find.text('NEW');
          if (_isPainted(tester, newDivider)) {
            paintedNewCenters.add(tester.getRect(newDivider).center.dy);
          }
          barPainted.add(
            _isPainted(tester, find.byType(MessageListNewMessagesBar)),
          );
          await tester.pump();
        }

        expect(paintedNewCenters, isNotEmpty);
        for (final double center in paintedNewCenters) {
          expect(
            center,
            moreOrLessEquals(paintedNewCenters.last, epsilon: 2),
            reason: 'NEW was painted before the pack; $paintedNewCenters',
          );
        }
        final int firstShown = barPainted.indexOf(true);
        if (firstShown != -1) {
          expect(
            barPainted.skip(firstShown),
            everyElement(isTrue),
            reason: 'the unread bar flashed during the open; $barPainted',
          );
        }

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
        await tester.pump();
        await tester.pump();

        final Finder unreadDivider = find.text('NEW');
        expect(unreadDivider, findsOneWidget);
        final Rect viewport = tester.getRect(messageListScrollable());
        final double viewportCenterY = viewport.top + viewport.height * 0.5;
        expect(
          tester.getRect(unreadDivider).center.dy,
          moreOrLessEquals(viewportCenterY, epsilon: 48),
        );

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

        await tester.pump();
        await tester.pump();
        final ProviderContainer container = ProviderScope.containerOf(
          tester.element(find.byType(MessageList)),
        );
        final ChatReadViewportState viewport = container.read(
          chatReadViewportProvider,
        );
        expect(viewport.channelId, messageListChannelId);
        expect(viewport.nearLoadedTail, isTrue);
        expect(viewport.sampledTailId, isNull);

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

    testWidgets('unacked append at bottom never flashes the unread bar', (
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
      container.read(appUiForegroundProvider.notifier).setResumed(true);
      await tester.pump();
      expect(container.read(chatReadViewportProvider).canAutoAck, isTrue);

      harness.appendRealtimeMessage(acknowledgedByGateway: false);

      for (var frame = 1; frame <= 5; frame += 1) {
        await tester.pump();
        expect(
          find.byType(MessageListNewMessagesBar),
          findsNothing,
          reason: 'floating unread bar appeared on frame $frame',
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
          lessThan(kJumpToBottomDistance),
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

        await tester.tap(find.textContaining(RegExp(r'^Mark (as )?read$')));
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

  group('chat on-screen scope', () {
    Widget onScreenHost(ValueNotifier<bool> onScreen) {
      return ValueListenableBuilder<bool>(
        valueListenable: onScreen,
        builder: (BuildContext context, bool value, Widget? child) =>
            ChatOnScreenScope(onScreen: value, child: child!),
        child: const MessageList(expectedChannelId: messageListChannelId),
      );
    }

    testWidgets('chat pushed off screen deactivates the read viewport', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final ValueNotifier<bool> onScreen = ValueNotifier<bool>(true);
      addTearDown(onScreen.dispose);

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();

      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
          body: onScreenHost(onScreen),
        ),
      );
      await tester.pump();
      final ProviderContainer container = ProviderScope.containerOf(
        tester.element(find.byType(MessageList)),
      );

      expect(container.read(chatReadViewportProvider).viewportActive, isTrue);

      onScreen.value = false;
      await tester.pump();
      expect(container.read(chatReadViewportProvider).viewportActive, isFalse);

      onScreen.value = true;
      await tester.pump();
      expect(container.read(chatReadViewportProvider).viewportActive, isTrue);

      await disposeMessageList(tester);
    });

    testWidgets('chat mounted off screen keeps the read viewport inactive', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final ValueNotifier<bool> onScreen = ValueNotifier<bool>(false);
      addTearDown(onScreen.dispose);

      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();

      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
          body: onScreenHost(onScreen),
        ),
      );
      await tester.pump();
      final ProviderContainer container = ProviderScope.containerOf(
        tester.element(find.byType(MessageList)),
      );

      expect(container.read(chatReadViewportProvider).viewportActive, isFalse);

      onScreen.value = true;
      await tester.pump();
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

    testWidgets('at-tail drag then shrink before settle keeps newest visible', (
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

      final TestGesture drag = await tester.startGesture(
        tester.getCenter(messageListScrollable()),
      );
      try {
        await drag.moveBy(const Offset(0, -40));
        await tester.pump();

        await shrinkViewportHeight(tester, height: 400);

        expect(messageItemFor(newestId), findsOneWidget);
        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect newest = tester.getRect(messageItemFor(newestId));
        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
          reason:
              'in-flight tail drag then keyboard shrink must glue to the tail',
        );
        expect(
          newest.bottom,
          lessThanOrEqualTo(viewport.bottom + 8),
          reason:
              'newest must stay above the composer after scroll-then-keyboard',
        );
      } finally {
        await drag.up();
      }
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

  group('composer panel slot shrink', () {
    Future<void> pumpListWithBottomSlot(
      WidgetTester tester,
      AroundAckMessageListHarness harness,
    ) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
          body: const Column(
            children: <Widget>[
              Expanded(
                child: MessageList(expectedChannelId: messageListChannelId),
              ),
              BottomInputSpacer(),
            ],
          ),
        ),
      );
      await pumpFluxerFrames(tester);
    }

    Future<void> openComposerPanel(
      WidgetTester tester, {
      required bool attachment,
    }) async {
      final ProviderContainer container = ProviderScope.containerOf(
        tester.element(messageListScrollable()),
      );
      container.read(mobileKeyboardMetricsProvider.notifier)
        ..updateLayout(screenHeight: 640, isPortrait: true, isIos: true)
        ..syncViewInsets(0, safeAreaBottom: 0);
      if (attachment) {
        container.read(attachmentPanelProvider.notifier).open();
      } else {
        container.read(expressionPanelProvider.notifier).open();
      }
      await tester.pump();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 16));
      expect(
        container.read(bottomInputSlotProvider).slotHeight,
        greaterThan(200),
      );
    }

    void expectNewestAboveViewport(
      WidgetTester tester, {
      required String newestId,
      required ScrollPosition position,
    }) {
      expect(messageItemFor(newestId), findsOneWidget);
      final Rect viewport = tester.getRect(messageListScrollable());
      final Rect newest = tester.getRect(messageItemFor(newestId));
      expect(
        position.pixels,
        moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
      );
      expect(
        newest.bottom,
        lessThanOrEqualTo(viewport.bottom + 8),
        reason: 'newest must stay above the composer panel slot',
      );
    }

    Future<void> pumpOpenPanelAndExpectNewest(
      WidgetTester tester, {
      required bool attachment,
    }) async {
      final AroundAckMessageListHarness harness =
          await createBottomMessageListHarness();
      await pumpListWithBottomSlot(tester, harness);

      final ScrollPosition position = messageListScrollPosition(tester);
      expect(
        position.maxScrollExtent - position.pixels,
        lessThanOrEqualTo(kMessageListReadBottomThreshold),
      );
      final String newestId = harness.newestLoadedId;

      await openComposerPanel(tester, attachment: attachment);
      expectNewestAboveViewport(tester, newestId: newestId, position: position);

      await disposeMessageList(tester);
    }

    testWidgets(
      'expression panel open keeps newest visible',
      (WidgetTester tester) =>
          pumpOpenPanelAndExpectNewest(tester, attachment: false),
    );

    testWidgets(
      'attachment panel open keeps newest visible',
      (WidgetTester tester) =>
          pumpOpenPanelAndExpectNewest(tester, attachment: true),
    );

    testWidgets(
      'at-tail drag then expression panel before settle keeps newest visible',
      (WidgetTester tester) async {
        final AroundAckMessageListHarness harness =
            await createBottomMessageListHarness();
        await pumpListWithBottomSlot(tester, harness);

        final ScrollPosition position = messageListScrollPosition(tester);
        final String newestId = harness.newestLoadedId;
        final TestGesture drag = await tester.startGesture(
          tester.getCenter(messageListScrollable()),
        );
        try {
          await drag.moveBy(const Offset(0, -40));
          await tester.pump();
          await openComposerPanel(tester, attachment: false);
          expectNewestAboveViewport(
            tester,
            newestId: newestId,
            position: position,
          );
        } finally {
          await drag.up();
        }

        await disposeMessageList(tester);
      },
    );
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
      'unread drag-to-newest then shrink before settle keeps newest visible',
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
        final ScrollPosition position = messageListScrollPosition(tester);
        final TestGesture drag = await tester.startGesture(
          tester.getCenter(messageListScrollable()),
        );
        try {
          for (int i = 0; i < 16; i += 1) {
            await drag.moveBy(const Offset(0, -80));
            await tester.pump();
            if (messageListTrailingDistance(position) <=
                kMessageListReadBottomThreshold) {
              break;
            }
          }
          expect(
            messageListTrailingDistance(position),
            lessThanOrEqualTo(kMessageListReadBottomThreshold),
            reason: 'drag must reach the live tail before keyboard shrink',
          );

          await shrinkViewportHeight(tester, height: 400);

          expect(messageItemFor(newestId), findsOneWidget);
          final Rect viewport = tester.getRect(messageListScrollable());
          final Rect newest = tester.getRect(messageItemFor(newestId));
          expect(
            position.pixels,
            moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
          );
          expect(
            newest.bottom,
            lessThanOrEqualTo(viewport.bottom + 8),
            reason:
                'unread drag-to-newest then keyboard before settle must keep '
                'newest fully visible',
          );
        } finally {
          await drag.up();
        }
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
        harness.chatViewModel.scrollToMessage(
          snowflakeForUtc(DateTime.utc(2020)),
        );
        await tester.pump();
        final ScrollPosition position = messageListScrollPosition(tester);
        position.jumpTo(position.pixels - 10);
        await tester.pump();

        final ChatReadViewportState parked = container.read(
          chatReadViewportProvider,
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
      'clears a deep-link jump highlight a few seconds after the target lands',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final StreamController<db.ReadState?> readStateController =
            StreamController<db.ReadState?>.broadcast();
        addTearDown(readStateController.close);

        final AroundAckMessageListHarness source =
            await createBottomMessageListHarness();
        final String targetId = source.messages[24].id;

        final InstrumentedChatViewModel loadingChatViewModel =
            InstrumentedChatViewModel(
              ChatViewState(
                channelId: messageListChannelId,
                messages: const <Message>[],
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
                highlightedMessageId: targetId,
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

        loadingChatViewModel.highlightJumpMessage(targetId);
        loadingChatViewModel.testState = loadingChatViewModel.testState
            .copyWith(
              write: (
                messages: source.messages,
                origin: MessagesOrigin.windowSwap,
              ),
              isLoading: false,
            );
        readStateController.add(null);
        await tester.pump();
        await tester.pump();
        await tester.pump();
        await pumpFluxerFrames(tester);

        expect(
          tester
              .widget<MessageItem>(messageItemFor(targetId))
              .isJumpHighlighted,
          isTrue,
        );
        expect(loadingChatViewModel.testState.highlightedMessageId, targetId);

        await tester.pump(const Duration(seconds: 2));
        expect(loadingChatViewModel.testState.highlightedMessageId, isNull);
        expect(
          tester
              .widget<MessageItem>(messageItemFor(targetId))
              .isJumpHighlighted,
          isFalse,
        );

        await disposeMessageList(tester);
      },
    );

    testWidgets(
      'keeps the jump highlight while composing a reply to that message',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final StreamController<db.ReadState?> readStateController =
            StreamController<db.ReadState?>.broadcast();
        addTearDown(readStateController.close);

        final AroundAckMessageListHarness source =
            await createBottomMessageListHarness();
        final Message target = source.messages[24];

        final InstrumentedChatViewModel loadingChatViewModel =
            InstrumentedChatViewModel(
              ChatViewState(
                channelId: messageListChannelId,
                messages: const <Message>[],
                replyingTo: target,
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
                highlightedMessageId: target.id,
              ),
            );

        await tester.pumpWidget(
          messageListApp(
            database: source.database,
            chatViewModel: loadingChatViewModel,
            body: MessageList(
              expectedChannelId: messageListChannelId,
              targetMessageId: target.id,
            ),
            overrides: <Override>[
              messageListReadStateProvider(
                messageListChannelId,
              ).overrideWith((ref) => readStateController.stream),
            ],
          ),
        );
        await tester.pump();

        loadingChatViewModel.highlightJumpMessage(target.id);
        loadingChatViewModel.testState = loadingChatViewModel.testState
            .copyWith(
              write: (
                messages: source.messages,
                origin: MessagesOrigin.windowSwap,
              ),
              isLoading: false,
              replyingTo: target,
            );
        readStateController.add(null);
        await tester.pump();
        await tester.pump();
        await tester.pump();
        await pumpFluxerFrames(tester);

        await tester.pump(const Duration(seconds: 2));
        expect(loadingChatViewModel.testState.highlightedMessageId, isNull);
        expect(
          tester
              .widget<MessageItem>(messageItemFor(target.id))
              .isJumpHighlighted,
          isTrue,
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

    // A deleted around target used to latch and hide jump-to-bottom: https://feedback.fluxer.com/p/1811
    testWidgets(
      'a missing jump target still settles and serves jump-to-bottom',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(420, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final StreamController<db.ReadState?> readStateController =
            StreamController<db.ReadState?>.broadcast();
        addTearDown(readStateController.close);

        final AroundAckMessageListHarness source =
            await createBottomMessageListHarness();
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
          shouldShowJumpToBottomButton(
            hasMessages: true,
            isLoading: false,
            isActiveReadChannel: true,
            distanceFromBottom: viewport.distanceFromBottom,
            hasMoreNewerMessages: chatViewModel.testState.hasMoreNewerMessages,
            messageLoadFailed: chatViewModel.testState.messageLoadFailed,
          ),
          isTrue,
          reason: 'the escape hatch must stay reachable after a neighbour land',
        );

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
      await tester.drag(
        messageListScrollable(),
        const Offset(0, kJumpToBottomDistance + 100),
      );
      await pumpFluxerFrames(tester);
      expect(
        scrolled.maxScrollExtent - scrolled.pixels,
        greaterThanOrEqualTo(kJumpToBottomDistance),
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

    // Jump centering holds after the ack in the same mounted MessageList: https://feedback.fluxer.com/p/1797
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

        harness.chatViewModel.scrollToMessage(deepAfterId);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));
        await pumpFluxerFrames(tester);
        expect(messageItemFor(deepAfterId), findsOneWidget);

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

        final AroundAckMessageListHarness harness =
            await createAroundAckMessageListHarness(
              ackIndex: 10,
              messageCount: 60,
            );
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
    testWidgets(
      'an idle trim bounds the window without moving the visible rows',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: false,
          count: 240,
        );
        expect(chatViewModel.state.messages, hasLength(240));

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

        final String probeId = centerVisibleMessageItemId(tester);
        final ({String id, Rect rect}) before = anchorSample(tester, probeId);
        final String keptAnchorId =
            messageListAnchorId(tester) ?? chatViewModel.state.messages.last.id;
        await gesture.up();
        await pumpFluxerFrames(tester);
        await pumpMessageListIdleTrim(tester);

        expect(
          chatViewModel.state.messages.length,
          lessThanOrEqualTo(kMaxLoadedMessages),
        );
        expect(
          chatViewModel.state.messages.map((Message m) => m.id),
          contains(keptAnchorId),
          reason: 'a span that holds the anchor needs no re-anchor',
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

        final List<Message> old = chatViewModel.testState.messages;
        final List<Message> live = newerRows(old, count: 1, label: 'live');
        chatViewModel
          ..testState = chatViewModel.testState.copyWith(
            write: (
              messages: <Message>[...old, ...live],
              origin: MessagesOrigin.liveCreate,
            ),
          )
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

    testWidgets(
      'caught-up window swap onto newer present lands the newest at the composer',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: false,
        );
        final List<Message> old = chatViewModel.testState.messages;
        final String previousNewestId = old.last.id;
        final List<Message> latest = <Message>[
          ...old,
          ...newerRows(old, count: 5, label: 'gap'),
        ];
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (messages: latest, origin: MessagesOrigin.windowSwap),
          hasMoreNewerMessages: false,
        );
        await tester.pump();
        await tester.pump();

        final String newestId = latest.last.id;
        expect(newestId, isNot(previousNewestId));
        final Finder newest = messageItemFor(newestId);
        expect(newest, findsOneWidget);
        final Rect viewport = tester.getRect(messageListScrollable());
        expect(
          tester.getRect(newest).bottom,
          greaterThan(viewport.bottom - 64),
        );
        final ScrollPosition position = messageListScrollPosition(tester);
        expect(
          position.maxScrollExtent - position.pixels,
          lessThanOrEqualTo(kMessageListReadBottomThreshold),
        );
        final int epoch = messageListAnchorEpoch(tester);
        await tester.pump();
        await tester.pump();
        expect(
          messageListAnchorEpoch(tester),
          epoch,
          reason: 'present landing must not remount after the first land',
        );
        expect(
          tester.getRect(newest).bottom,
          greaterThan(viewport.bottom - 64),
        );

        await disposeMessageList(tester);
      },
    );

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
        chatViewModel.scrollToMessage(targetId);
        await tester.pump();

        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (messages: aroundWindow, origin: MessagesOrigin.windowSwap),
          hasMoreNewerMessages: true,
        );
        await tester.pump();

        final Rect viewport = tester.getRect(messageListScrollable());
        final Rect firstFrame = tester.getRect(messageItemFor(targetId));
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
        chatViewModel.scrollToMessage(messages[40].id);
        await tester.pump();
        await pumpFluxerFrames(tester);
        expect(
          messageListScrollPosition(tester).maxScrollExtent,
          greaterThan(0),
          reason: 'the centered open must start filled',
        );

        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[messages.first, messages.last],
            origin: MessagesOrigin.realtimeEvent,
          ),
        );
        await pumpFluxerFrames(tester);
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

  group('live tail motion', () {
    testWidgets('jump to present from an unread open keeps following arrivals '
        'after it lands', (WidgetTester tester) async {
      configureMessageListViewport(tester);
      final AroundAckMessageListHarness harness =
          await createAroundAckMessageListHarness(
            messageCount: 70,
            ackIndex: 30,
          );
      await tester.pumpWidget(
        messageListApp(
          database: harness.database,
          chatViewModel: harness.chatViewModel,
          disableMessageListAnimations: false,
        ),
      );
      await pumpFluxerFrames(tester);
      expect(find.text('NEW'), findsOneWidget);
      final ProviderContainer container = ProviderScope.containerOf(
        tester.element(find.byType(MessageList)),
      );

      harness.chatViewModel.scrollToBottom();
      for (int frame = 0; frame < 30; frame += 1) {
        if (frame == 4) {
          harness.appendRealtimeMessage(acknowledgedByGateway: false);
        }
        await tester.pump(const Duration(milliseconds: 16));
      }
      await pumpFluxerFrames(tester);

      final ScrollPosition position = messageListScrollPosition(tester);
      expect(
        position.pixels,
        moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
        reason: 'the jump lands at the live tail',
      );
      expect(
        container.read(chatReadViewportProvider).followsLiveTail,
        isTrue,
        reason: 'a list resting at the live tail is pinned',
      );

      for (int arrival = 0; arrival < 3; arrival += 1) {
        final String liveId = harness.appendRealtimeMessage(
          acknowledgedByGateway: false,
        );
        await tester.pump();
        await tester.pump(kMessageListTailFollowDuration);
        await pumpFluxerFrames(tester);

        expect(messageItemFor(liveId), findsOneWidget);
        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
          reason: 'arrival $arrival must be followed',
        );
        final ChatReadViewportState viewport = container.read(
          chatReadViewportProvider,
        );
        expect(viewport.followsLiveTail, isTrue);
        expect(viewport.nearLoadedTail, isTrue);
        expect(viewport.sampledTailId, liveId);
      }

      await disposeMessageList(tester);
    });

    testWidgets('smooth follow lands at tail after motion completes', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
        disableMessageListAnimations: false,
      );
      final ScrollPosition position = messageListScrollPosition(tester);
      final double tailBefore = position.maxScrollExtent;
      expect(position.pixels, moreOrLessEquals(tailBefore, epsilon: 1));

      final List<Message> old = chatViewModel.testState.messages;
      final List<Message> live = newerRows(old, count: 1, label: 'motion');
      chatViewModel.testState = chatViewModel.testState.copyWith(
        write: (
          messages: <Message>[...old, ...live],
          origin: MessagesOrigin.liveCreate,
        ),
      );
      await tester.pump();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 16));

      expect(
        position.pixels,
        greaterThan(tailBefore),
        reason: 'mid-follow must advance toward the new tail',
      );
      expect(
        position.pixels,
        lessThan(position.maxScrollExtent),
        reason: 'mid-follow must not snap early',
      );

      await tester.pump(kMessageListTailFollowDuration);
      await tester.pump();

      expect(messageItemFor(live.single.id), findsOneWidget);
      expect(
        position.pixels,
        moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
      );

      await disposeMessageList(tester);
    });

    testWidgets('own send at the tail follows with motion', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
        disableMessageListAnimations: false,
      );
      final ScrollPosition position = messageListScrollPosition(tester);
      final double tailBefore = position.maxScrollExtent;

      final List<Message> old = chatViewModel.testState.messages;
      final List<Message> sent = newerRows(old, count: 1, label: 'own');
      chatViewModel.testState = chatViewModel.testState.copyWith(
        scrollToBottomSignal: chatViewModel.testState.scrollToBottomSignal + 1,
        write: (
          messages: <Message>[...old, ...sent],
          origin: MessagesOrigin.ownSend,
        ),
      );
      await tester.pump();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 16));

      expect(
        position.pixels,
        greaterThan(tailBefore),
        reason: 'own send must smooth-follow at the pinned tail',
      );

      await tester.pump(kMessageListTailFollowDuration);
      await tester.pump();

      expect(messageItemFor(sent.single.id), findsOneWidget);
      expect(
        position.pixels,
        moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
      );

      await disposeMessageList(tester);
    });

    testWidgets('multi-line live append stays visible after tail follow', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
        disableMessageListAnimations: false,
      );
      final ScrollPosition position = messageListScrollPosition(tester);
      position.jumpTo(position.maxScrollExtent);
      await tester.pump();

      final List<Message> old = chatViewModel.testState.messages;
      final DateTime timestamp = old.last.timestamp.add(
        const Duration(minutes: 1),
      );
      final String id = snowflakeForUtc(timestamp);
      final String content = List<String>.generate(
        12,
        (int i) => 'live tail line $i with enough text to wrap in cozy mode',
      ).join('\n');
      chatViewModel.testState = chatViewModel.testState.copyWith(
        write: (
          messages: <Message>[
            ...old,
            harnessMessage(id: id, content: content, timestamp: timestamp),
          ],
          origin: MessagesOrigin.liveCreate,
        ),
      );
      await tester.pump();
      await tester.pump();
      await tester.pump(kMessageListTailFollowDuration);
      for (int i = 0; i < 4; i += 1) {
        await tester.pump();
      }

      final Rect viewport = tester.getRect(messageListScrollable());
      final Rect newest = tester.getRect(messageItemFor(id));
      expect(
        newest.bottom,
        lessThanOrEqualTo(viewport.bottom + 8),
        reason: 'multi-line newest must stay fully visible at the pinned tail',
      );
      expect(
        position.pixels,
        moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
      );

      await disposeMessageList(tester);
    });

    testWidgets('mixed-height live burst follows each arrival in one motion', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
        disableMessageListAnimations: false,
      );
      final ScrollPosition position = messageListScrollPosition(tester);
      const List<String> bodies = <String>[
        'short',
        'a slightly longer line that wraps across the phone width for sure',
        'two\nlines',
        'para one with words words words\n\npara two with more words',
      ];
      double? landedBottom;
      for (int i = 1; i <= 4; i += 1) {
        final List<Message> old = chatViewModel.testState.messages;
        final DateTime timestamp = old.last.timestamp.add(
          const Duration(seconds: 1),
        );
        final String id = snowflakeForUtc(timestamp);
        chatViewModel.testState = chatViewModel.testState.copyWith(
          write: (
            messages: <Message>[
              ...old,
              harnessMessage(
                id: id,
                content: 'burst $i ${bodies[i % bodies.length]}',
                timestamp: timestamp,
              ),
            ],
            origin: MessagesOrigin.liveCreate,
          ),
        );
        final double from = position.pixels;
        await tester.pump();
        final double distance = position.maxScrollExtent - from;
        double previous = position.pixels;
        double largestStep = 0;
        for (int frame = 0; frame < 20; frame += 1) {
          await tester.pump(const Duration(milliseconds: 16));
          largestStep = math.max(largestStep, position.pixels - previous);
          previous = position.pixels;
        }

        expect(
          largestStep,
          lessThan(distance / 2),
          reason: 'arrival $i must follow in one motion, not a mid-way snap',
        );
        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
        );
        final double bottom = tester.getRect(messageItemFor(id)).bottom;
        landedBottom ??= bottom;
        expect(
          bottom,
          moreOrLessEquals(landedBottom, epsilon: 1),
          reason: 'arrival $i must land fully above the composer',
        );
        await tester.pump(const Duration(milliseconds: 500));
      }

      await disposeMessageList(tester);
    });

    testWidgets('live append taller than the viewport is opaque on the snap '
        'frame', (WidgetTester tester) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
        disableMessageListAnimations: false,
      );
      final ScrollPosition position = messageListScrollPosition(tester);

      final List<Message> old = chatViewModel.testState.messages;
      final DateTime timestamp = old.last.timestamp.add(
        const Duration(minutes: 1),
      );
      final String id = snowflakeForUtc(timestamp);
      final String content = List<String>.generate(
        60,
        (int i) => 'long line $i',
      ).join('\n');
      chatViewModel.testState = chatViewModel.testState.copyWith(
        write: (
          messages: <Message>[
            ...old,
            harnessMessage(id: id, content: content, timestamp: timestamp),
          ],
          origin: MessagesOrigin.liveCreate,
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(
        tester.getRect(messageItemFor(id)).height,
        greaterThan(position.viewportDimension),
      );
      expect(
        position.pixels,
        moreOrLessEquals(position.maxScrollExtent, epsilon: 1),
        reason: 'a taller-than-viewport arrival snaps to the tail',
      );
      final Iterable<Opacity> opacities = tester.widgetList<Opacity>(
        find.ancestor(of: messageItemFor(id), matching: find.byType(Opacity)),
      );
      for (final Opacity opacity in opacities) {
        expect(
          opacity.opacity,
          1,
          reason: 'the snapped row fills the viewport and must not be faded',
        );
      }

      await disposeMessageList(tester);
    });
  });
}

class _UnreadOpenFrameSample {
  const _UnreadOpenFrameSample({
    required this.hasNew,
    required this.newCenterY,
    required this.firstUnreadTop,
    required this.pixels,
    required this.epoch,
    required this.leadingPad,
  });

  final bool hasNew;
  final double? newCenterY;
  final double? firstUnreadTop;
  final double? pixels;
  final int? epoch;
  final double? leadingPad;

  @override
  String toString() {
    return 'new=$hasNew y=$newCenterY unreadTop=$firstUnreadTop '
        'px=$pixels epoch=$epoch pad=$leadingPad';
  }
}

bool _isPainted(WidgetTester tester, Finder finder) {
  if (finder.evaluate().isEmpty) {
    return false;
  }
  return !tester
      .widgetList<Opacity>(
        find.ancestor(of: finder.first, matching: find.byType(Opacity)),
      )
      .any((Opacity opacity) => opacity.opacity == 0);
}

_UnreadOpenFrameSample _sampleUnreadOpenFrame(
  WidgetTester tester,
  Finder firstUnread,
) {
  final bool hasNew = find.text('NEW').evaluate().isNotEmpty;
  final bool hasViewport = find
      .byType(MessageListViewport)
      .evaluate()
      .isNotEmpty;
  final bool hasScrollable = messageListScrollable().evaluate().isNotEmpty;
  final bool hasFirstUnread = firstUnread.evaluate().isNotEmpty;
  return _UnreadOpenFrameSample(
    hasNew: hasNew,
    newCenterY: hasNew ? tester.getRect(find.text('NEW')).center.dy : null,
    firstUnreadTop: hasFirstUnread ? tester.getRect(firstUnread).top : null,
    pixels: hasScrollable ? messageListScrollPosition(tester).pixels : null,
    epoch: hasViewport ? messageListAnchorEpoch(tester) : null,
    leadingPad: hasViewport
        ? tester
              .widget<MessageListViewport>(find.byType(MessageListViewport))
              .leadingPad
        : null,
  );
}
