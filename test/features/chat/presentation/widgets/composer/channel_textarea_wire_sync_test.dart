import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/composer_channel_textarea_harness.dart';
import '../../../../../helpers/open_test_database.dart';

void main() {
  testWidgets('ChannelTextarea mounts composer with chat draft wire', (
    tester,
  ) async {
    final container = await pumpComposerChannelTextareaHarness(tester);
    expect(channelComposerField(), findsOneWidget);
    expect(readMutableChatViewModel(container).state.messageText, 'draft-a');
    await releaseTestWidgetTree(tester);
  });

  testWidgets('typing updates chat messageText wire', (tester) async {
    final container = await pumpComposerChannelTextareaHarness(tester);
    await tester.enterText(channelComposerField(), 'hello wire');
    await tester.pump(const Duration(milliseconds: 50));

    expect(readMutableChatViewModel(container).state.messageText, 'hello wire');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pump(const Duration(milliseconds: 400));
    await releaseTestWidgetTree(tester);
  });

  testWidgets('channel switch applies messageText to controller', (
    tester,
  ) async {
    final container = await pumpComposerChannelTextareaHarness(tester);
    readMutableChatViewModel(container).setComposerChannel(
      channelId: kComposerHarnessChannelB,
      messageText: 'draft-b',
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    final EditableText editable = tester.widget<EditableText>(
      find.descendant(
        of: channelComposerField(),
        matching: find.byType(EditableText),
      ),
    );
    expect(editable.controller.text, 'draft-b');
    await releaseTestWidgetTree(tester);
  });
}
