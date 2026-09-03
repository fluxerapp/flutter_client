@Tags(['slow'])
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_window.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_overlay.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/pump_fluxer_app.dart';
import 'message_list_test_harness.dart';

void main() {
  group('geometry', () {
    testWidgets('older page insert during a fling preserves the reading row', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
        count: 80,
      );
      messageListScrollPosition(
        tester,
      ).jumpTo(messageListOldestRowOffset(tester));
      await pumpFluxerFrames(tester);

      final ({String id, Rect rect}) before = anchorSample(
        tester,
        centerVisibleMessageItemId(tester),
      );

      final List<Message> old = chatViewModel.testState.messages;
      chatViewModel.testState = chatViewModel.testState.copyWith(
        write: (
          messages: <Message>[
            ...newerRows(old.take(20).toList(), count: 30, label: 'older'),
            ...old,
          ],
          origin: MessagesOrigin.olderPage,
        ),
      );
      await tester.pump();
      await tester.pump();

      expectPreserved(
        tester,
        before,
        reason: 'an older page must not yank a reader in history',
      );
      await disposeMessageList(tester);
    });

    testWidgets('newer page insert while unpinned preserves the reading row', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: true,
      );
      messageListScrollPosition(tester).jumpTo(0);
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
        reason: 'a newer page must not yank a detached reader',
      );
      await disposeMessageList(tester);
    });

    testWidgets('compact cache expansion does not remount or jump pixels', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
        count: kTrimmedMessageWindowSize,
      );
      final ScrollPosition position = messageListScrollPosition(tester);
      final double pixelsBefore = position.pixels;
      final int epochBefore = messageListAnchorEpoch(tester);

      for (int i = 0; i < 8; i += 1) {
        await tester.pump(const Duration(milliseconds: 16));
      }

      expect(messageListAnchorEpoch(tester), epochBefore);
      expect(
        position.pixels,
        moreOrLessEquals(pixelsBefore, epsilon: 1),
        reason: 'cache expansion must not move the reader',
      );
      expect(
        chatViewModel.testState.messages,
        hasLength(kTrimmedMessageWindowSize),
      );
      await disposeMessageList(tester);
    });

    testWidgets('in-flight drag away from the tail stays monotonic on burst', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
      );
      final ScrollPosition position = messageListScrollPosition(tester);
      final double startPixels = position.pixels;

      final TestGesture gesture = await tester.startGesture(
        tester.getCenter(messageListScrollable()),
      );
      await gesture.moveBy(const Offset(0, 80));
      await tester.pump();

      final List<Message> old = chatViewModel.testState.messages;
      injectLiveCreates(chatViewModel, old, count: 30);
      await tester.pump();
      await tester.pump();

      expect(
        position.pixels,
        lessThanOrEqualTo(startPixels),
        reason: 'live traffic must not glue the tail mid-drag',
      );

      await gesture.up();
      await pumpFluxerFrames(tester);
      await disposeMessageList(tester);
    });
  });

  group('rebuild cost', () {
    testWidgets('live create while reading history preserves visible rows', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
        count: 80,
      );
      messageListScrollPosition(
        tester,
      ).jumpTo(messageListOldestRowOffset(tester));
      await pumpFluxerFrames(tester);

      final String probeId = centerVisibleMessageItemId(tester);
      final ({String id, Rect rect}) before = anchorSample(tester, probeId);
      final List<Message> old = chatViewModel.testState.messages;
      injectLiveCreates(chatViewModel, old, count: 1);
      await tester.pump();
      await tester.pump();

      expectPreserved(
        tester,
        before,
        reason: 'a single live create must not yank a history reader',
      );
      await disposeMessageList(tester);
    });
  });

  group('hot channel burst', () {
    testWidgets('pinned tail survives a 40-message single-frame burst', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
      );
      final ScrollPosition position = messageListScrollPosition(tester);
      final List<Message> old = chatViewModel.testState.messages;

      injectLiveCreates(chatViewModel, old, count: 40);
      await tester.pump();
      await tester.pump();

      expect(
        position.pixels,
        moreOrLessEquals(position.maxScrollExtent, epsilon: 2),
        reason: 'a hot burst at the tail must stay glued to newest',
      );
      expect(chatViewModel.testState.messages.length, greaterThan(old.length));
      await disposeMessageList(tester);
    });

    testWidgets('sustained burst across frames stays pinned at the tail', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
      );
      final ScrollPosition position = messageListScrollPosition(tester);
      List<Message> window = chatViewModel.testState.messages;

      for (int frame = 0; frame < 8; frame += 1) {
        injectLiveCreates(
          chatViewModel,
          window,
          count: 10,
          label: 'burst$frame',
        );
        window = chatViewModel.testState.messages;
        await tester.pump();
      }

      expect(
        position.pixels,
        moreOrLessEquals(position.maxScrollExtent, epsilon: 2),
        reason: 'sustained live traffic must keep the reader at the tail',
      );
      await disposeMessageList(tester);
    });

    testWidgets(
      'burst past the soft cap trims without yanking the pinned tail',
      (WidgetTester tester) async {
        final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
          tester,
          hasMoreNewer: false,
          count: kMaxLoadedMessages - 10,
          enableTrimToNewestWindow: true,
        );
        final ScrollPosition position = messageListScrollPosition(tester);
        final List<Message> old = chatViewModel.testState.messages;

        injectLiveCreates(chatViewModel, old, count: 20);
        await tester.pump();
        await tester.pump();
        await tester.pump();

        chatViewModel.trimToNewestWindow();
        await tester.pump();
        await tester.pump();

        expect(
          chatViewModel.testState.messages.length,
          lessThanOrEqualTo(kMaxLoadedMessages),
        );
        expect(
          position.pixels,
          moreOrLessEquals(position.maxScrollExtent, epsilon: 2),
          reason: 'trim must not detach a pinned reader from the live tail',
        );
        await disposeMessageList(tester);
      },
    );

    testWidgets('history reader survives a 40-message burst', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
        count: 80,
      );
      final ScrollPosition position = messageListScrollPosition(tester)
        ..jumpTo(messageListOldestRowOffset(tester));
      await pumpFluxerFrames(tester);

      final ({String id, Rect rect}) before = anchorSample(
        tester,
        centerVisibleMessageItemId(tester),
      );
      injectLiveCreates(
        chatViewModel,
        chatViewModel.testState.messages,
        count: 40,
      );
      await tester.pump();
      await tester.pump();

      expectPreserved(
        tester,
        before,
        reason: 'a hot burst must not yank a history reader',
      );
      expect(
        find.byType(MessageListOverlay),
        findsOneWidget,
        reason: 'new traffic below the reader should surface the overlay bar',
      );
      expect(
        position.maxScrollExtent - position.pixels,
        greaterThan(8),
        reason: 'the reader must stay detached from the live tail',
      );
      await disposeMessageList(tester);
    });

    testWidgets('mixed create and hidden edit burst does not yank history', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
        count: 80,
      );
      messageListScrollPosition(
        tester,
      ).jumpTo(messageListOldestRowOffset(tester));
      await pumpFluxerFrames(tester);

      final ({String id, Rect rect}) before = anchorSample(
        tester,
        centerVisibleMessageItemId(tester),
      );
      final List<Message> old = List<Message>.of(
        chatViewModel.testState.messages,
      );
      final Message newest = old.last;
      final Message editedNewest = newest.copyWith(
        content: '${newest.content}\n${'extra line\n' * 12}',
      );
      final List<Message> withEdit = <Message>[
        ...old.sublist(0, old.length - 1),
        editedNewest,
        ...newerRows(old, count: 20, label: 'mixed'),
      ];
      chatViewModel.testState = chatViewModel.testState.copyWith(
        write: (messages: withEdit, origin: MessagesOrigin.realtimeEvent),
      );
      await tester.pump();
      await tester.pump();

      expectPreserved(
        tester,
        before,
        reason: 'hidden tail edits must not yank a history reader',
      );
      await disposeMessageList(tester);
    });

    testWidgets('tail edit burst while pinned keeps newest unclipped', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
      );
      final List<Message> old = List<Message>.of(
        chatViewModel.testState.messages,
      );
      for (int i = 0; i < 3; i += 1) {
        final int index = old.length - 3 + i;
        old[index] = old[index].copyWith(
          content: '${old[index].content}\n${'grown line\n' * 6}',
        );
      }
      chatViewModel.testState = chatViewModel.testState.copyWith(
        write: (messages: old, origin: MessagesOrigin.realtimeEvent),
      );
      await tester.pump();
      await tester.pump();

      final ScrollPosition position = messageListScrollPosition(tester);
      expect(
        position.maxScrollExtent - position.pixels,
        lessThanOrEqualTo(2),
        reason: 'growing tail rows must not detach a pinned reader',
      );
      final Rect viewport = tester.getRect(messageListScrollable());
      final Rect newestRect = tester.getRect(
        messageItemFor(chatViewModel.testState.messages.last.id),
      );
      expect(newestRect.bottom, lessThanOrEqualTo(viewport.bottom + 1));
      await disposeMessageList(tester);
    });
  });

  group('hold during fling', () {
    Future<({InstrumentedChatViewModel vm, TestGesture hold, int epoch})>
    flingThenHold(WidgetTester tester) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
        count: kMaxLoadedMessages + 30,
      );
      await tester.fling(messageListScrollable(), const Offset(0, 300), 3000);
      await tester.pump(const Duration(milliseconds: 40));
      final ScrollPosition position = messageListScrollPosition(tester);
      expect(position.isScrollingNotifier.value, isTrue);
      chatViewModel.userScrollActiveLog.clear();
      final int epoch = messageListAnchorEpoch(tester);

      final TestGesture hold = await tester.startGesture(
        tester.getCenter(messageListScrollable()),
      );
      await tester.pump();
      return (vm: chatViewModel, hold: hold, epoch: epoch);
    }

    testWidgets('touch-down mid-fling does not trim, remount, or release the '
        'scroll lock until the finger lifts', (WidgetTester tester) async {
      final held = await flingThenHold(tester);

      expect(held.vm.trimAroundVisibleCallCount, 0);
      expect(messageListAnchorEpoch(tester), held.epoch);
      expect(held.vm.userScrollActiveLog, isNot(contains(false)));

      await held.hold.up();
      await tester.pump();
      await tester.pump();

      expect(held.vm.trimAroundVisibleCallCount, 1);
      expect(held.vm.userScrollActiveLog.where((bool v) => !v).length, 1);
      await disposeMessageList(tester);
    });

    testWidgets('a drag after the hold settles once, at the end of its fling', (
      WidgetTester tester,
    ) async {
      final held = await flingThenHold(tester);

      await held.hold.moveBy(const Offset(0, 40));
      await held.hold.moveBy(const Offset(0, 40));
      await tester.pump();
      expect(held.vm.trimAroundVisibleCallCount, 0);

      await held.hold.up();
      await pumpFluxerFrames(tester);

      expect(held.vm.trimAroundVisibleCallCount, 1);
      expect(held.vm.userScrollActiveLog.where((bool v) => !v).length, 1);
      await disposeMessageList(tester);
    });
  });

  group('edge filler', () {
    final Finder olderFiller = find.byKey(
      const ValueKey<String>('edge-filler-older'),
    );

    testWidgets('a fling past the oldest row runs into skeleton, and the '
        'page lands where the skeleton was', (WidgetTester tester) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
      );
      final ScrollPosition position = messageListScrollPosition(tester)
        ..jumpTo(messageListOldestRowOffset(tester) + 200);
      await tester.pump();
      await tester.fling(messageListScrollable(), const Offset(0, 100), 1500);
      for (int i = 0; i < 8; i += 1) {
        await tester.pump(const Duration(milliseconds: 16));
      }

      expect(
        position.isScrollingNotifier.value,
        isTrue,
        reason: 'skeleton history keeps the ballistic alive past the rows',
      );
      expect(position.pixels, lessThan(messageListOldestRowOffset(tester)));
      expect(olderFiller, findsOneWidget);
      expect(position.pixels, greaterThan(position.minScrollExtent));

      for (int i = 0; i < 90 && position.isScrollingNotifier.value; i += 1) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      final double restingPixels = position.pixels;
      final List<Message> old = chatViewModel.testState.messages;
      final List<Message> page = olderRows(old, count: 60);
      chatViewModel.testState = chatViewModel.testState.copyWith(
        write: (
          messages: <Message>[...page, ...old],
          origin: MessagesOrigin.olderPage,
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(position.pixels, moreOrLessEquals(restingPixels, epsilon: 1));
      expect(
        page.map((Message m) => m.id),
        contains(centerVisibleMessageItemId(tester)),
        reason: 'the page lands under the reader, where the skeleton was',
      );
      await pumpFluxerFrames(tester);
      await disposeMessageList(tester);
    });

    testWidgets('the terminal page removes the filler without moving rows', (
      WidgetTester tester,
    ) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
      );
      messageListScrollPosition(
        tester,
      ).jumpTo(messageListOldestRowOffset(tester));
      await pumpFluxerFrames(tester);
      final ({String id, Rect rect}) before = anchorSample(
        tester,
        centerVisibleMessageItemId(tester),
      );

      chatViewModel.testState = chatViewModel.testState.copyWith(
        hasMoreMessages: false,
      );
      await tester.pump();
      await tester.pump();

      expect(olderFiller, findsNothing);
      expectPreserved(
        tester,
        before,
        reason: 'collapsing the filler above must not yank the reader',
      );
      await disposeMessageList(tester);
    });

    testWidgets('a reader inside the filler lands on the oldest row when the '
        'channel start arrives', (WidgetTester tester) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: false,
      );
      final ScrollPosition position = messageListScrollPosition(tester)
        ..jumpTo(messageListOldestRowOffset(tester) - 300);
      await pumpFluxerFrames(tester);
      expect(olderFiller, findsOneWidget);

      chatViewModel.testState = chatViewModel.testState.copyWith(
        hasMoreMessages: false,
      );
      await pumpFluxerFrames(tester);

      expect(olderFiller, findsNothing);
      expect(position.pixels, greaterThanOrEqualTo(position.minScrollExtent));
      expect(
        messageItemFor(chatViewModel.testState.messages.first.id),
        findsOneWidget,
      );
      await disposeMessageList(tester);
    });

    final Finder newerFiller = find.byKey(
      const ValueKey<String>('edge-filler-newer'),
    );

    testWidgets('a fling past the newest row runs into skeleton, and the '
        'newer page lands where the skeleton was', (WidgetTester tester) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: true,
      );
      final ScrollPosition position = messageListScrollPosition(tester)
        ..jumpTo(messageListNewestRowOffset(tester) - 200);
      await tester.pump();
      await tester.fling(messageListScrollable(), const Offset(0, -100), 1500);
      for (int i = 0; i < 8; i += 1) {
        await tester.pump(const Duration(milliseconds: 16));
      }

      expect(position.isScrollingNotifier.value, isTrue);
      expect(position.pixels, greaterThan(messageListNewestRowOffset(tester)));
      expect(newerFiller, findsOneWidget);
      expect(position.pixels, lessThan(position.maxScrollExtent));

      for (int i = 0; i < 90 && position.isScrollingNotifier.value; i += 1) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      final double restingPixels = position.pixels;
      final List<Message> old = chatViewModel.testState.messages;
      final List<Message> page = newerRows(old, count: 60);
      chatViewModel.testState = chatViewModel.testState.copyWith(
        write: (
          messages: <Message>[...old, ...page],
          origin: MessagesOrigin.newerPage,
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(position.pixels, moreOrLessEquals(restingPixels, epsilon: 1));
      // The reader is only a few hundred pixels onto the skeleton, so the
      // page shows at the viewport bottom, not at its center.
      final Rect viewport = tester.getRect(messageListScrollable());
      expect(
        page.where(
          (Message m) =>
              messageItemFor(m.id).evaluate().isNotEmpty &&
              tester.getRect(messageItemFor(m.id)).overlaps(viewport),
        ),
        isNotEmpty,
        reason: 'the page lands under the reader, where the skeleton was',
      );
      await pumpFluxerFrames(tester);
      await disposeMessageList(tester);
    });

    testWidgets('the terminal newer page removes the filler without moving '
        'rows', (WidgetTester tester) async {
      final InstrumentedChatViewModel chatViewModel = await pumpBottomList(
        tester,
        hasMoreNewer: true,
      );
      messageListScrollPosition(
        tester,
      ).jumpTo(messageListNewestRowOffset(tester) - 300);
      await pumpFluxerFrames(tester);
      final ({String id, Rect rect}) before = anchorSample(
        tester,
        centerVisibleMessageItemId(tester),
      );

      chatViewModel.testState = chatViewModel.testState.copyWith(
        hasMoreNewerMessages: false,
      );
      await tester.pump();
      await tester.pump();

      expect(newerFiller, findsNothing);
      expectPreserved(
        tester,
        before,
        reason: 'collapsing the filler below must not yank the reader',
      );
      await disposeMessageList(tester);
    });
  });
}
