import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/service/composer_mention_controller.dart';
import 'package:fluxer_app/features/ui/input/emoji_inline_token.dart';
import 'package:fluxer_app/features/ui/input/inline_token_text_editing_controller.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_sprite_sheet.dart';

/// Substitutes [raw] through a scratch controller and returns the wire
/// round-trip of the display text.
({String display, String wire, int chips}) _substitute(
  String raw, {
  required bool includePlainShortcodes,
}) {
  final controller = InlineTokenTextEditingController();
  addTearDown(controller.dispose);
  final String display = substituteEmojiTokens(
    raw,
    controller.allocateToken,
    includePlainShortcodes: includePlainShortcodes,
  );
  controller.text = display;
  var chips = 0;
  for (final int rune in display.runes) {
    if (rune >= 0xE000 && rune <= 0xF8FF) {
      chips++;
    }
  }
  return (display: display, wire: controller.toWireText(), chips: chips);
}

Future<ComposerMentionController> _pumpController(WidgetTester tester) async {
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

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await EmojiRegistry.preload();
  });

  group('substituteEmojiTokens with resolution gate', () {
    test('chips resolvable shortcodes and leaves typed colons literal', () {
      final result = _substitute(
        'hi :smile: at 12:30:45',
        includePlainShortcodes: false,
      );
      expect(result.chips, 1);
      expect(result.display, contains('12:30:45'));
      expect(result.display, isNot(contains(':smile:')));
      expect(result.wire, 'hi :smile: at 12:30:45');
    });

    test('chips resolvable skin-tone shortcodes', () {
      final result = _substitute(
        'hey :wave::skin-tone-3:',
        includePlainShortcodes: false,
      );
      expect(result.chips, 1);
      expect(result.wire, 'hey :wave::skin-tone-3:');
    });

    test('leaves unresolvable skin-tone shortcodes literal', () {
      final result = _substitute(
        ':notarealemoji::skin-tone-3:',
        includePlainShortcodes: false,
      );
      expect(result.chips, 0);
      expect(result.wire, ':notarealemoji::skin-tone-3:');
    });

    test('chips raw unicode emoji and round-trips the exact surrogate', () {
      final String heart = EmojiRegistry.entryByName('heart')!.surrogates;
      final result = _substitute('love $heart!', includePlainShortcodes: false);
      expect(result.chips, 1);
      expect(result.wire, 'love $heart!');
      expect(result.display, isNot(contains(heart)));
    });

    test('chips skin-toned raw unicode via the variant surrogate map', () {
      final EmojiEntry wave = EmojiRegistry.entryByName('wave')!;
      final String toned = wave.skinSurrogates[2];
      expect(toned, isNotEmpty);
      expect(EmojiRegistry.entryBySurrogates(toned), same(wave));

      final result = _substitute(toned, includePlainShortcodes: false);
      expect(result.chips, 1);
      expect(result.wire, toned);
    });

    test('still chips unresolvable shortcodes when explicitly included', () {
      final result = _substitute(
        ':notarealemoji:',
        includePlainShortcodes: true,
      );
      expect(result.chips, 1);
      expect(result.wire, ':notarealemoji:');
    });
  });

  group('edit-mode applyWireText', () {
    testWidgets('chips shortcode, unicode, and custom emoji from a message', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpController(
        tester,
      );
      final String heart = EmojiRegistry.entryByName('heart')!.surrogates;

      await controller.applyWireText('hi :smile: $heart <:cool:123> 12:30:45');
      await tester.pump();

      expect(find.byType(SpriteEmoji), findsNWidgets(2));
      expect(controller.text, contains('12:30:45'));
      expect(controller.toWireText(), 'hi :smile: $heart <:cool:123> 12:30:45');
    });
  });

  group('chip rendering', () {
    testWidgets('resolvable unicode chip renders the sprite emoji', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpController(
        tester,
      );
      await tester.runAsync(EmojiSpriteSheet.preload);

      controller.insertEmoji('wave', '\u{1F44B}');
      await tester.pump();

      expect(find.byType(SpriteEmoji), findsOneWidget);
      expect(find.text(':wave:'), findsNothing);
      expect(controller.toWireText().trim(), ':wave:');
    });

    testWidgets('skin-toned chip targets the diversity sheet', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpController(
        tester,
      );
      final EmojiEntry wave = EmojiRegistry.entryByName('wave')!;

      controller.insertEmoji(
        'wave',
        EmojiRegistry.resolveSkinToneSurrogates(wave, '\u{1F3FD}'),
      );
      await tester.pump();

      final SpriteEmoji sprite = tester.widget<SpriteEmoji>(
        find.byType(SpriteEmoji),
      );
      expect(sprite.skinTone, '\u{1F3FD}');
      expect(sprite.diversityIndex, wave.diversityIndex);
      expect(controller.toWireText().trim(), ':wave::skin-tone-3:');
    });

    testWidgets('unresolvable shortcode chip falls back to the text chip', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpController(
        tester,
      );

      controller.insertEmoji('notarealemoji', ':notarealemoji:');
      await tester.pump();

      expect(find.byType(SpriteEmoji), findsNothing);
      expect(find.text(':notarealemoji:'), findsOneWidget);
    });
  });

  group('platform keyboard commits', () {
    testWidgets('chips a committed emoji and keeps the caret after it', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpController(
        tester,
      );
      final String heart = EmojiRegistry.entryByName('heart')!.surrogates;

      controller.value = TextEditingValue(
        text: 'hi $heart',
        selection: TextSelection.collapsed(offset: 3 + heart.length),
      );
      await tester.pump();

      expect(find.byType(SpriteEmoji), findsOneWidget);
      expect(controller.text, isNot(contains(heart)));
      expect(controller.text.length, 4);
      expect(controller.selection.baseOffset, 4);
      expect(controller.toWireText(), 'hi $heart');
    });

    testWidgets('chips an emoji committed at the end of a long message', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpController(
        tester,
      );
      final String heart = EmojiRegistry.entryByName('heart')!.surrogates;
      final String body = 'lorem ipsum ' * 40;

      controller
        ..value = TextEditingValue(
          text: body,
          selection: TextSelection.collapsed(offset: body.length),
        )
        ..value = TextEditingValue(
          text: '$body$heart',
          selection: TextSelection.collapsed(
            offset: body.length + heart.length,
          ),
        );
      await tester.pump();

      expect(find.byType(SpriteEmoji), findsOneWidget);
      expect(controller.toWireText(), '$body$heart');
      expect(controller.selection.baseOffset, body.length + 1);
    });

    testWidgets('keeps one chip when typing far from an earlier emoji', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpController(
        tester,
      );
      final String heart = EmojiRegistry.entryByName('heart')!.surrogates;

      controller.value = TextEditingValue(
        text: '$heart lorem ipsum dolor sit amet',
        selection: const TextSelection.collapsed(offset: 0),
      );
      await tester.pump();
      controller.value = TextEditingValue(
        text: '${controller.text}!',
        selection: TextSelection.collapsed(offset: controller.text.length + 1),
      );
      await tester.pump();

      expect(find.byType(SpriteEmoji), findsOneWidget);
      expect(controller.toWireText(), '$heart lorem ipsum dolor sit amet!');
    });

    testWidgets('leaves a committed emoji raw while an IME range composes', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpController(
        tester,
      );
      final String heart = EmojiRegistry.entryByName('heart')!.surrogates;

      controller.value = TextEditingValue(
        text: '$heart nihao',
        selection: TextSelection.collapsed(offset: heart.length + 6),
        composing: TextRange(start: heart.length + 1, end: heart.length + 6),
      );
      await tester.pump();

      expect(find.byType(SpriteEmoji), findsNothing);
      expect(controller.text, '$heart nihao');
    });

    testWidgets('chips the emoji once the composing range commits', (
      WidgetTester tester,
    ) async {
      final ComposerMentionController controller = await _pumpController(
        tester,
      );
      final String heart = EmojiRegistry.entryByName('heart')!.surrogates;

      controller.value = TextEditingValue(
        text: '$heart ni',
        selection: TextSelection.collapsed(offset: heart.length + 3),
        composing: TextRange(start: heart.length + 1, end: heart.length + 3),
      );
      await tester.pump();
      controller.value = TextEditingValue(
        text: '$heart 你',
        selection: TextSelection.collapsed(offset: heart.length + 2),
      );
      await tester.pump();

      expect(find.byType(SpriteEmoji), findsOneWidget);
      expect(controller.toWireText(), '$heart 你');
      expect(controller.selection.baseOffset, 3);
    });
  });
}
