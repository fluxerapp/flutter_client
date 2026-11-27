import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/channel_textarea.dart';
import 'package:fluxer_app/features/input/presentation/keybind_scope.dart';
import 'package:fluxer_app/features/input/providers/keyboard_mode_provider.dart';
import 'package:fluxer_app/shared/utils/emoji/emoji_registry.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../../helpers/composer_channel_textarea_harness.dart';
import '../../../../../helpers/input_modality_override.dart';
import '../../../../../helpers/open_test_database.dart';

Future<ProviderContainer> _pump(WidgetTester tester) async {
  final ProviderContainer container = await pumpComposerChannelTextareaHarness(
    tester,
    extraOverrides: <Override>[inputModalityOverride(touch: false)],
    home: const Scaffold(body: KeybindScope(child: ChannelTextarea())),
  );
  await tester.tap(channelComposerField());
  await tester.pump();
  return container;
}

TextEditingController _composerController(WidgetTester tester) {
  return tester.widget<TextField>(channelComposerField()).controller!;
}

Future<void> _type(WidgetTester tester, String text) async {
  await tester.enterText(channelComposerField(), text);
  await tester.pump(const Duration(milliseconds: 50));
}

Future<void> _release(WidgetTester tester) async {
  FocusManager.instance.primaryFocus?.unfocus();
  await tester.pump(const Duration(milliseconds: 400));
  await releaseTestWidgetTree(tester);
  debugDefaultTargetPlatformOverride = null;
}

Message _ownMessage(String id) {
  return Message(
    id: id,
    channelId: kComposerHarnessChannelA,
    authorId: kComposerHarnessUserId,
    authorName: 'me',
    content: 'content $id',
    timestamp: DateTime.utc(2026),
  );
}

void main() {
  setUpAll(() async {
    await EmojiRegistry.preload();
  });

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('Tab accepts the highlighted emoji suggestion', (tester) async {
    final ProviderContainer container = await _pump(tester);
    await _type(tester, ':smile');
    await tester.pump(const Duration(milliseconds: 300));

    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump(const Duration(milliseconds: 50));

    expect(_composerController(tester).text, isNot(contains(':smile')));
    expect(container.read(keyboardModeProvider), isFalse);
    await _release(tester);
  });

  testWidgets('Tab inside a code block indents instead of leaving', (
    tester,
  ) async {
    final ProviderContainer container = await _pump(tester);
    await _type(tester, '```\nfoo');

    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();

    expect(_composerController(tester).text, '```\nfoo\t');
    expect(container.read(keyboardModeProvider), isFalse);
    await _release(tester);
  });

  testWidgets('Enter inside a code block does not send but Cmd+Enter does', (
    tester,
  ) async {
    final ProviderContainer container = await _pump(tester);
    await _type(tester, '```\nfoo');

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump(const Duration(milliseconds: 50));
    expect(readMutableChatViewModel(container).sentTexts, isEmpty);

    await tester.sendKeyDownEvent(LogicalKeyboardKey.metaLeft);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.metaLeft);
    await tester.pump(const Duration(milliseconds: 50));
    expect(readMutableChatViewModel(container).sentTexts, <String?>[
      '```\nfoo',
    ]);
    await _release(tester);
  });

  testWidgets('Cmd+B wraps the selection in bold markers', (tester) async {
    await _pump(tester);
    await _type(tester, 'say hello');
    _composerController(tester).selection = const TextSelection(
      baseOffset: 4,
      extentOffset: 9,
    );
    await tester.pump();

    await tester.sendKeyDownEvent(LogicalKeyboardKey.metaLeft);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyB);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.metaLeft);
    await tester.pump();

    expect(_composerController(tester).text, 'say **hello**');
    await _release(tester);
  });

  testWidgets('Escape cancels the reply', (tester) async {
    final ProviderContainer container = await _pump(tester);
    readMutableChatViewModel(container).setReplyingTo(_ownMessage('1'));
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pump();

    expect(readMutableChatViewModel(container).state.replyingTo, isNull);
    await _release(tester);
  });

  testWidgets('Up on an empty composer edits the last own message', (
    tester,
  ) async {
    final ProviderContainer container = await _pump(tester);
    readMutableChatViewModel(
      container,
    ).setMessages(<Message>[_ownMessage('1'), _ownMessage('2')]);
    await _type(tester, '');

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.pump(const Duration(milliseconds: 50));

    expect(readMutableChatViewModel(container).state.editingMessage?.id, '2');
    await _release(tester);
  });
}
