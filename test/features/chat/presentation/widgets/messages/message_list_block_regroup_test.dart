import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/open_test_database.dart';
import '../../../../../helpers/pump_fluxer_app.dart';
import '../../../../../helpers/test_l10n.dart';
import 'message_list_test_harness.dart';

const String _targetId = '333333333333333333';

List<Message> _conversation() {
  final List<(String, String)> rows = <(String, String)>[
    (messageListCurrentUserId, 'Is the fern still around?'),
    (_targetId, 'Hey, are you still selling that fern?'),
    (_targetId, 'Send me your address and I will come pick it up tonight.'),
    (_targetId, 'This is the one I mean.'),
    (messageListCurrentUserId, 'Let me check.'),
    (_targetId, 'Group plan: we meet at the greenhouse at 9.'),
  ];
  return <Message>[
    for (int index = 0; index < rows.length; index += 1)
      Message(
        id: snowflakeForUtc(messageListSeedBase.add(Duration(minutes: index))),
        channelId: messageListChannelId,
        authorId: rows[index].$1,
        authorName: rows[index].$1 == _targetId ? 'Jordan Target' : 'Tester',
        content: rows[index].$2,
        timestamp: messageListSeedBase.add(Duration(minutes: index)),
      ),
  ];
}

List<Message> _tallChannel() {
  final List<(String, String)> rows = <(String, String)>[
    for (int index = 0; index < 14; index += 1)
      (messageListCurrentUserId, 'older chatter $index'),
    for (int index = 0; index < 3; index += 1)
      (
        _targetId,
        List<String>.generate(
          10,
          (int line) => 'swap post $index line $line',
        ).join('\n'),
      ),
    for (int index = 0; index < 40; index += 1)
      (messageListCurrentUserId, 'newer chatter $index'),
  ];
  return <Message>[
    for (int index = 0; index < rows.length; index += 1)
      Message(
        id: snowflakeForUtc(messageListSeedBase.add(Duration(minutes: index))),
        channelId: messageListChannelId,
        authorId: rows[index].$1,
        authorName: rows[index].$1 == _targetId ? 'Jordan Target' : 'Tester',
        content: rows[index].$2,
        timestamp: messageListSeedBase.add(Duration(minutes: index)),
      ),
  ];
}

bool _nearLoadedTail(WidgetTester tester) => ProviderScope.containerOf(
  tester.element(find.byType(MessageList)),
).read(chatReadViewportProvider).nearLoadedTail;

void main() {
  testWidgets('blocking the author regroups visible rows without a sliver '
      'child-order failure', (WidgetTester tester) async {
    configureMessageListViewport(tester);
    final db.FluxerDatabase database = openTestDatabase();
    final InstrumentedChatViewModel chatViewModel = InstrumentedChatViewModel(
      detachedState(_conversation(), hasMoreNewer: false),
    );
    await tester.pumpWidget(
      messageListApp(database: database, chatViewModel: chatViewModel),
    );
    await pumpFluxerFrames(tester);
    expect(
      find.textContaining('still selling that fern', findRichText: true),
      findsOneWidget,
    );

    await tester.pumpWidget(
      messageListApp(
        database: database,
        chatViewModel: chatViewModel,
        blockedUserIds: const <String>{_targetId},
      ),
    );
    await pumpFluxerFrames(tester);

    expect(tester.takeException(), isNull);
    expect(
      find.textContaining('still selling that fern', findRichText: true),
      findsNothing,
    );
    expect(find.text(testL10n.chatBlockedMessagesCollapsed(3)), findsOneWidget);
    expect(find.text(testL10n.chatBlockedMessagesCollapsed(1)), findsOneWidget);
    expect(find.textContaining('Let me check', findRichText: true), findsOne);

    await tester.pumpWidget(
      messageListApp(database: database, chatViewModel: chatViewModel),
    );
    await pumpFluxerFrames(tester);

    expect(tester.takeException(), isNull);
    expect(
      find.textContaining('still selling that fern', findRichText: true),
      findsOneWidget,
    );

    await disposeMessageList(tester);
  });

  testWidgets('blocking the author of a row the reader is looking at keeps '
      'the reading position', (WidgetTester tester) async {
    configureMessageListViewport(tester);
    final db.FluxerDatabase database = openTestDatabase();
    final InstrumentedChatViewModel chatViewModel = InstrumentedChatViewModel(
      detachedState(
        _tallChannel(),
        hasMoreNewer: false,
      ).copyWith(hasMoreMessages: false),
    );
    await tester.pumpWidget(
      messageListApp(database: database, chatViewModel: chatViewModel),
    );
    await pumpFluxerFrames(tester);

    final Finder firstPost = find.textContaining(
      'swap post 0 line 0',
      findRichText: true,
    );
    for (int attempt = 0; attempt < 40; attempt += 1) {
      final double top = tester.getRect(messageListScrollable()).top;
      if (firstPost.hitTestable().evaluate().isNotEmpty &&
          tester.getRect(firstPost).top > top + 20 &&
          tester.getRect(firstPost).top < top + 200) {
        break;
      }
      await tester.drag(messageListScrollable(), const Offset(0, 40));
      await pumpFluxerFrames(tester);
    }
    final Rect viewport = tester.getRect(messageListScrollable());
    final Rect postRect = tester.getRect(firstPost);
    expect(postRect.top, greaterThan(viewport.top));
    expect(postRect.top, lessThan(viewport.top + 200));
    final Rect olderRect = tester.getRect(
      find.textContaining('older chatter 13', findRichText: true),
    );
    final ScrollPosition before = messageListScrollPosition(tester);
    expect(before.pixels, greaterThan(before.minScrollExtent + 1));
    final bool nearTailBefore = _nearLoadedTail(tester);
    expect(nearTailBefore, isFalse);

    await tester.pumpWidget(
      messageListApp(
        database: database,
        chatViewModel: chatViewModel,
        blockedUserIds: const <String>{_targetId},
      ),
    );
    await pumpFluxerFrames(tester);

    expect(tester.takeException(), isNull);
    final Finder group = find.text(testL10n.chatBlockedMessagesCollapsed(3));
    expect(group.hitTestable(), findsOneWidget);
    expect(
      find.textContaining('older chatter 13', findRichText: true),
      findsOneWidget,
    );
    expect(
      tester
          .getRect(find.textContaining('older chatter 13', findRichText: true))
          .top,
      moreOrLessEquals(olderRect.top, epsilon: 1),
    );
    expect(tester.getRect(group).top, greaterThan(olderRect.bottom));
    expect(tester.getRect(group).top, lessThan(postRect.top + 40));
    final ScrollPosition after = messageListScrollPosition(tester);
    expect(after.pixels, greaterThan(after.minScrollExtent + 1));
    expect(
      find.textContaining('older chatter 0', findRichText: true).hitTestable(),
      findsNothing,
    );
    expect(_nearLoadedTail(tester), nearTailBefore);
    final double groupTop = tester.getRect(group).top;

    await tester.pumpWidget(
      messageListApp(database: database, chatViewModel: chatViewModel),
    );
    await pumpFluxerFrames(tester);

    expect(tester.takeException(), isNull);
    expect(firstPost.hitTestable(), findsOneWidget);
    expect(
      tester
          .getRect(find.textContaining('older chatter 13', findRichText: true))
          .top,
      moreOrLessEquals(olderRect.top, epsilon: 1),
    );
    expect(tester.getRect(firstPost).top, lessThan(groupTop + 40));
    expect(_nearLoadedTail(tester), nearTailBefore);

    await disposeMessageList(tester);
  });
}
