import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_viewport.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/messages/channel_message_stream.dart';

import '../../../../../helpers/pump_fluxer_app.dart';
import 'message_list_test_harness.dart';

int withheldLeadingCount(WidgetTester tester) {
  final MessageListViewport viewport = tester.widget<MessageListViewport>(
    find.byType(MessageListViewport),
  );
  final CustomScrollView scrollView = tester.widget<CustomScrollView>(
    find.byKey(const ValueKey<String>('message-list')),
  );
  final SliverPadding leading = scrollView.slivers
      .whereType<SliverPadding>()
      .first;
  final int builtLeading =
      (leading.child! as SliverList).delegate.estimatedChildCount!;
  final String? anchorId = viewport.anchorId;
  final int? anchorIndex = anchorId == null
      ? null
      : findChannelStreamDataIndex(viewport.stream, anchorId);
  final int splitIndex = anchorIndex == null
      ? viewport.stream.length
      : viewport.anchorEdge == MessageListAnchorEdge.before
      ? anchorIndex
      : anchorIndex + 1;
  return splitIndex - builtLeading;
}

void main() {
  testWidgets('an installed older page is exposed two rows per frame', (
    WidgetTester tester,
  ) async {
    final AroundAckMessageListHarness harness =
        await createBottomMessageListHarness();
    await tester.pumpWidget(
      messageListApp(
        database: harness.database,
        chatViewModel: harness.chatViewModel,
      ),
    );
    await pumpFluxerFrames(tester);
    expect(withheldLeadingCount(tester), 0);

    harness.prependOlderMessages(count: 50);
    await tester.pump();
    expect(withheldLeadingCount(tester), 50);
    final MessageListViewport viewportBeforeReveal = tester
        .widget<MessageListViewport>(find.byType(MessageListViewport));

    final List<int> exposed = <int>[];
    for (int frame = 0; frame < 25; frame += 1) {
      await tester.pump();
      exposed.add(50 - withheldLeadingCount(tester));
      expect(
        identical(
          tester.widget<MessageListViewport>(find.byType(MessageListViewport)),
          viewportBeforeReveal,
        ),
        isTrue,
        reason: 'revealing rows must not rebuild the whole list',
      );
    }

    expect(exposed.take(3), <int>[2, 4, 6]);
    expect(exposed.last, 50);
    expect(withheldLeadingCount(tester), 0);

    await disposeMessageList(tester);
  });

  testWidgets('a jump exposes the whole installed page in one frame', (
    WidgetTester tester,
  ) async {
    final AroundAckMessageListHarness harness =
        await createBottomMessageListHarness();
    await tester.pumpWidget(
      messageListApp(
        database: harness.database,
        chatViewModel: harness.chatViewModel,
      ),
    );
    await pumpFluxerFrames(tester);

    harness.prependOlderMessages(count: 50);
    await tester.pump();
    await tester.pump();
    expect(withheldLeadingCount(tester), 48);

    harness.chatViewModel.testState = harness.chatViewModel.testState.copyWith(
      scrollToMessageSignal: (harness.ackId, 1),
    );
    await tester.pump();

    expect(withheldLeadingCount(tester), 0);

    await disposeMessageList(tester);
  });

  testWidgets('a window swap mid-reveal exposes every row and older demand '
      'resumes', (WidgetTester tester) async {
    final AroundAckMessageListHarness harness =
        await createBottomMessageListHarness();
    await tester.pumpWidget(
      messageListApp(
        database: harness.database,
        chatViewModel: harness.chatViewModel,
      ),
    );
    await pumpFluxerFrames(tester);

    harness.prependOlderMessages(count: 50);
    await tester.pump();
    await tester.pump();
    expect(withheldLeadingCount(tester), 48);
    final int olderRequestsBefore = harness.chatViewModel.loadMoreCallCount;

    final List<Message> current = harness.chatViewModel.testState.messages;
    harness.chatViewModel.testState = harness.chatViewModel.testState.copyWith(
      write: (
        messages: current.sublist(current.length - 5),
        origin: MessagesOrigin.windowSwap,
      ),
      hasMoreNewerMessages: true,
    );
    await tester.pump();
    expect(withheldLeadingCount(tester), 0);

    await pumpFluxerFrames(tester);
    expect(
      harness.chatViewModel.loadMoreCallCount,
      greaterThan(olderRequestsBefore),
      reason: 'an underfilled window with older history must request it',
    );

    await disposeMessageList(tester);
  });

  testWidgets('the page that ends older history is exposed at once', (
    WidgetTester tester,
  ) async {
    final AroundAckMessageListHarness harness =
        await createBottomMessageListHarness();
    await tester.pumpWidget(
      messageListApp(
        database: harness.database,
        chatViewModel: harness.chatViewModel,
      ),
    );
    await pumpFluxerFrames(tester);

    final List<Message> current = harness.chatViewModel.testState.messages;
    harness.chatViewModel.testState = harness.chatViewModel.testState.copyWith(
      write: (
        messages: <Message>[...olderRows(current, count: 50), ...current],
        origin: MessagesOrigin.olderPage,
      ),
      hasMoreMessages: false,
    );
    await tester.pump();

    expect(withheldLeadingCount(tester), 0);

    await disposeMessageList(tester);
  });

  testWidgets('a page folded into a blocked group withholds stream items, '
      'not messages', (WidgetTester tester) async {
    const String blockedAuthorId = 'blocked-author';
    final AroundAckMessageListHarness harness =
        await createBottomMessageListHarness();
    await tester.pumpWidget(
      messageListApp(
        database: harness.database,
        chatViewModel: harness.chatViewModel,
        blockedUserIds: const <String>{blockedAuthorId},
      ),
    );
    await pumpFluxerFrames(tester);

    final List<Message> current = harness.chatViewModel.testState.messages;
    final DateTime first = current.first.timestamp;
    final List<Message> page = <Message>[
      for (int index = 50; index >= 1; index -= 1)
        harnessMessage(
          id: snowflakeForUtc(first.subtract(Duration(minutes: index))),
          content: 'older $index',
          timestamp: first.subtract(Duration(minutes: index)),
          authorId: index > 20 ? blockedAuthorId : messageListAuthorId,
        ),
    ];
    harness.chatViewModel.testState = harness.chatViewModel.testState.copyWith(
      write: (
        messages: <Message>[...page, ...current],
        origin: MessagesOrigin.olderPage,
      ),
    );
    await tester.pump();

    expect(withheldLeadingCount(tester), 21);

    await disposeMessageList(tester);
  });
}
