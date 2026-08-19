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
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji_sprite_sheet.dart';
import 'package:material_ui/material_ui.dart';

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
}
