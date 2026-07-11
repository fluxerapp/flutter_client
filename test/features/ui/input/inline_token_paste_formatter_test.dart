import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/service/composer_mention_controller.dart';
import 'package:fluxer_app/features/chat/utils/composer_message_length_paste_formatter.dart';
import 'package:fluxer_app/features/ui/input/inline_token_paste_formatter.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Future<ComposerMentionController> _pumpMentionController(
  WidgetTester tester,
) async {
  final colorTheme = buildDarkColorTheme();
  ComposerMentionController? controller;
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        localizationsDelegates: FluxerLocalizations.localizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        home: Scaffold(
          body: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? _) {
              controller ??= ComposerMentionController(ref: ref);
              return TextField(controller: controller);
            },
          ),
        ),
      ),
    ),
  );
  addTearDown(() => controller?.dispose());
  return controller!;
}

TextEditingValue _applyFormatter(
  TextInputFormatter formatter,
  TextEditingValue oldValue,
  TextEditingValue newValue,
) {
  return formatter.formatEditUpdate(oldValue, newValue);
}

void main() {
  group('ComposerMentionPasteFormatter', () {
    testWidgets('passes through single-character typing', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpMentionController(
        tester,
      );
      final ComposerMentionPasteFormatter formatter =
          ComposerMentionPasteFormatter(controller: controller);

      const TextEditingValue oldValue = TextEditingValue(
        text: 'hel',
        selection: TextSelection.collapsed(offset: 3),
      );
      const TextEditingValue newValue = TextEditingValue(
        text: 'hell',
        selection: TextSelection.collapsed(offset: 4),
      );

      final TextEditingValue result = _applyFormatter(
        formatter,
        oldValue,
        newValue,
      );

      expect(result, newValue);
      controller.value = result;
      await tester.pump();
      expect(controller.text, 'hell');
    });

    testWidgets('passes through IME autocomplete without post-frame mutation', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpMentionController(
        tester,
      );
      final ComposerMentionPasteFormatter formatter =
          ComposerMentionPasteFormatter(controller: controller);

      const TextEditingValue oldValue = TextEditingValue(
        text: 'I am typ hel',
        selection: TextSelection.collapsed(offset: 13),
        composing: TextRange(start: 10, end: 13),
      );
      const TextEditingValue newValue = TextEditingValue(
        text: 'I am typ hello',
        selection: TextSelection.collapsed(offset: 15),
      );

      final TextEditingValue result = _applyFormatter(
        formatter,
        oldValue,
        newValue,
      );

      expect(result, newValue);
      controller.value = result;
      await tester.pump();
      expect(controller.text, 'I am typ hello');
    });

    testWidgets(
      'does not duplicate mid-sentence autocomplete without composing',
      (WidgetTester tester) async {
        final ComposerMentionController controller =
            await _pumpMentionController(tester);
        final ComposerMentionPasteFormatter formatter =
            ComposerMentionPasteFormatter(controller: controller);

        const TextEditingValue oldValue = TextEditingValue(
          text: 'I am typ hel',
          selection: TextSelection.collapsed(offset: 13),
        );
        const TextEditingValue newValue = TextEditingValue(
          text: 'I am typ hello',
          selection: TextSelection.collapsed(offset: 15),
        );

        final TextEditingValue result = _applyFormatter(
          formatter,
          oldValue,
          newValue,
        );

        expect(result, newValue);
        controller.value = result;
        await tester.pump();
        await tester.pump();
        expect(controller.text, 'I am typ hello');
      },
    );

    testWidgets('chips pasted mention wire text once', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpMentionController(
        tester,
      );
      final ComposerMentionPasteFormatter formatter =
          ComposerMentionPasteFormatter(controller: controller);

      const TextEditingValue oldValue = TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
      const TextEditingValue newValue = TextEditingValue(
        text: 'hi <@123>',
        selection: TextSelection.collapsed(offset: 10),
      );

      final TextEditingValue result = _applyFormatter(
        formatter,
        oldValue,
        newValue,
      );

      expect(result, newValue);
      controller.value = result;
      await tester.pump();
      await tester.pump();

      expect(controller.text, isNot(contains('<@123>')));
      expect(controller.toWireText(), 'hi <@123>');
    });
  });

  group('ComposerMessageLengthPasteFormatter', () {
    testWidgets('passes through IME autocomplete when composing is active', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpMentionController(
        tester,
      );
      var attachCalled = false;
      final ComposerMessageLengthPasteFormatter formatter =
          ComposerMessageLengthPasteFormatter(
            controller: controller,
            maxLength: 5,
            canAttachOnExceed: () => true,
            onPasteExceedsLimit: (_) => attachCalled = true,
          );

      const TextEditingValue oldValue = TextEditingValue(
        text: 'hel',
        selection: TextSelection.collapsed(offset: 3),
        composing: TextRange(start: 0, end: 3),
      );
      const TextEditingValue newValue = TextEditingValue(
        text: 'hello world',
        selection: TextSelection.collapsed(offset: 11),
      );

      final TextEditingValue result = _applyFormatter(
        formatter,
        oldValue,
        newValue,
      );

      expect(result, newValue);
      controller.value = result;
      await tester.pump();
      expect(attachCalled, isFalse);
      expect(controller.text, 'hello world');
    });
  });
}
