import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_send_and_voice_button.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/pending_composer_sticker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../../helpers/composer_channel_textarea_harness.dart';
import '../../../../../helpers/open_test_database.dart';

const StickerEntry _kSticker = StickerEntry(
  id: '1000000000000000900',
  guildId: '1000000000000000200',
  name: 'wave',
  description: '',
  tags: <String>[],
  animated: false,
);

void main() {
  testWidgets('picking a sticker with a draft stages it and keeps the text', (
    tester,
  ) async {
    final container = await pumpComposerChannelTextareaHarness(tester);
    await tester.enterText(channelComposerField(), 'hello');
    await tester.pump(const Duration(milliseconds: 50));

    container
        .read(pendingStickerSelectionProvider.notifier)
        .setSelection(_kSticker);
    await tester.pump(const Duration(milliseconds: 50));

    final MutableChatViewModel vm = readMutableChatViewModel(container);
    expect(vm.state.messageText, 'hello');
    expect(
      container.read(pendingComposerStickerProvider)[kComposerHarnessChannelA],
      same(_kSticker),
    );

    tester
        .widget<ComposerSendAndVoiceButton>(
          find.byType(ComposerSendAndVoiceButton),
        )
        .onSend();
    await tester.pump(const Duration(milliseconds: 50));
    await tester.pump(const Duration(milliseconds: 50));

    expect(vm.sentTexts, <String?>['hello']);
    expect(vm.sentStickerIds, <List<String>>[
      <String>[_kSticker.id],
    ]);
    expect(container.read(pendingComposerStickerProvider), isEmpty);
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pump(const Duration(milliseconds: 400));
    await releaseTestWidgetTree(tester);
  });
}
