import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_skeleton.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_viewport.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/pump_fluxer_app.dart';
import 'message_list_test_harness.dart';

MessageListEdgeFiller? leadingFiller(WidgetTester tester) {
  return tester
      .widget<MessageListViewport>(find.byType(MessageListViewport))
      .leadingFiller;
}

Widget listWithCompact(
  AroundAckMessageListHarness harness, {
  required bool compact,
}) {
  return messageListApp(
    database: harness.database,
    chatViewModel: harness.chatViewModel,
    messageDisplayCompact: compact,
  );
}

void main() {
  testWidgets('a list rebuild reuses the edge filler widget', (
    WidgetTester tester,
  ) async {
    final AroundAckMessageListHarness harness =
        await createBottomMessageListHarness();
    await tester.pumpWidget(listWithCompact(harness, compact: false));
    await pumpFluxerFrames(tester);

    final MessageListEdgeFiller? before = leadingFiller(tester);
    expect(before, isNotNull);

    harness.prependOlderMessages(count: 50);
    await tester.pump();
    await tester.pump();

    expect(identical(leadingFiller(tester), before), isTrue);

    await disposeMessageList(tester);
  });

  testWidgets('switching to compact mode builds a new edge filler', (
    WidgetTester tester,
  ) async {
    final AroundAckMessageListHarness harness =
        await createBottomMessageListHarness();
    await tester.pumpWidget(listWithCompact(harness, compact: false));
    await pumpFluxerFrames(tester);

    final MessageListEdgeFiller? cozy = leadingFiller(tester);
    expect(cozy, isNotNull);
    expect(cozy!.specs.messageCounts.length, 26);

    await tester.pumpWidget(listWithCompact(harness, compact: true));
    await tester.pump();

    final MessageListEdgeFiller? compact = leadingFiller(tester);
    expect(identical(compact, cozy), isFalse);
    expect(compact!.specs.messageCounts.length, 30);

    await disposeMessageList(tester);
  });
}
