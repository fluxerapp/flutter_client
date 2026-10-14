import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/composer_channel_textarea_harness.dart';
import '../../../../../helpers/open_test_database.dart';

Finder _send() => find.byKey(const ValueKey<String>('mobile-composer-send'));

EditableText _editable(WidgetTester tester) => tester.widget<EditableText>(
  find.descendant(
    of: channelComposerField(),
    matching: find.byType(EditableText),
  ),
);

Future<void> _typeThenPredict(
  WidgetTester tester, {
  required String typed,
  required String predicted,
}) async {
  await tester.tap(channelComposerField());
  await tester.pump();
  tester.testTextInput.updateEditingValue(
    TextEditingValue(
      text: typed,
      selection: TextSelection.collapsed(offset: typed.length),
    ),
  );
  await tester.pump();
  tester.testTextInput.updateEditingValue(
    TextEditingValue(
      text: typed + predicted,
      selection: TextSelection.collapsed(offset: typed.length),
      composing: TextRange(
        start: typed.length,
        end: typed.length + predicted.length,
      ),
    ),
  );
  await tester.pump();
}

Future<void> _release(WidgetTester tester) async {
  FocusManager.instance.primaryFocus?.unfocus();
  await tester.pump(const Duration(milliseconds: 400));
  await releaseTestWidgetTree(tester);
}

void main() {
  testWidgets('send on iOS leaves out an inline prediction', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    try {
      final container = await pumpComposerChannelTextareaHarness(tester);
      await _typeThenPredict(tester, typed: 'see you tom', predicted: 'orrow');
      expect(_editable(tester).controller.text, 'see you tomorrow');

      await tester.tap(_send());
      await tester.pump(const Duration(milliseconds: 50));
      await tester.pump(const Duration(milliseconds: 50));

      expect(readMutableChatViewModel(container).sentTexts, <String?>[
        'see you tom',
      ]);
      expect(_editable(tester).controller.text, isEmpty);
      await _release(tester);
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('a prediction alone does not light up send on iOS', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    try {
      await pumpComposerChannelTextareaHarness(tester);
      await _typeThenPredict(tester, typed: '', predicted: 'Hello');
      await tester.pump(const Duration(milliseconds: 300));
      expect(_send(), findsNothing);
      await _release(tester);
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('send on Android keeps the word being composed', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    try {
      final container = await pumpComposerChannelTextareaHarness(tester);
      await tester.tap(channelComposerField());
      await tester.pump();
      tester.testTextInput.updateEditingValue(
        const TextEditingValue(
          text: 'on my way',
          selection: TextSelection.collapsed(offset: 9),
          composing: TextRange(start: 6, end: 9),
        ),
      );
      await tester.pump();

      await tester.tap(_send());
      await tester.pump(const Duration(milliseconds: 50));
      await tester.pump(const Duration(milliseconds: 50));

      expect(readMutableChatViewModel(container).sentTexts, <String?>[
        'on my way',
      ]);
      expect(_editable(tester).controller.text, isEmpty);
      await _release(tester);
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });
}
