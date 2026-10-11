import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_send_and_voice_button.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';

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

  testWidgets('sending closes the attachment tray', (tester) async {
    final container = await pumpComposerChannelTextareaHarness(tester);
    await tester.enterText(channelComposerField(), 'hello');
    await tester.pump(const Duration(milliseconds: 50));
    container.read(attachmentPanelProvider.notifier).open();
    await tester.pump();

    tester
        .widget<ComposerSendAndVoiceButton>(
          find.byType(ComposerSendAndVoiceButton),
        )
        .onSend();
    await tester.pump(const Duration(milliseconds: 50));
    await tester.pump(const Duration(milliseconds: 50));

    expect(readMutableChatViewModel(container).sentTexts, <String?>['hello']);
    expect(container.read(attachmentPanelProvider), isFalse);
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

  testWidgets('cancelling an edit clears text the keyboard is composing', (
    tester,
  ) async {
    final container = await pumpComposerChannelTextareaHarness(tester);
    final MutableChatViewModel vm = readMutableChatViewModel(container)
      ..setEditing(
        message: Message(
          id: '1000000000000000200',
          channelId: kComposerHarnessChannelA,
          authorId: kComposerHarnessUserId,
          authorName: 'me',
          content: 'Test',
          timestamp: DateTime.utc(2026, 10, 11),
        ),
        messageText: 'Test',
      );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    final EditableText editable = tester.widget<EditableText>(
      find.descendant(
        of: channelComposerField(),
        matching: find.byType(EditableText),
      ),
    );
    expect(editable.focusNode.hasFocus, isTrue);
    expect(editable.controller.text, 'Test');
    editable.controller.value = const TextEditingValue(
      text: 'Test',
      selection: TextSelection.collapsed(offset: 4),
      composing: TextRange(start: 0, end: 4),
    );
    await tester.pump();

    vm.setEditing(message: null, messageText: '');
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(editable.controller.text, isEmpty);
    expect(vm.state.messageText, isEmpty);
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pump(const Duration(milliseconds: 400));
    await releaseTestWidgetTree(tester);
  });
}
