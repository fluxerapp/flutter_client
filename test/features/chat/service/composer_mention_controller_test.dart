import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/service/composer_mention_controller.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

/// Builds a [ComposerMentionController] inside a live, themed widget tree and
/// returns it once the [TextField] using it has been pumped. The controller is
/// created once (guarded) so rebuilds keep the same instance, and the Fluxer
/// theme is supplied so inline mention chips can resolve `context.colors`.
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
  testWidgets('insertUserMentionPlaceholder replaces the full @query range', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    controller
      ..text = '@msu'
      ..selection = const TextSelection.collapsed(offset: 4);
    controller.insertUserMentionPlaceholder(
      matchStart: 0,
      matchEnd: 4,
      userId: '1481621807877361924',
      displayName: 'msubizo',
    );
    await tester.pump();

    expect(find.text('@msubizo'), findsOneWidget);
    expect(controller.toWireText().trim(), '<@1481621807877361924>');
    expect(controller.text, isNot(contains('u')));
  });

  testWidgets(
    'insertUserMentionPlaceholder leaves suffix when range is stale',
    (WidgetTester tester) async {
      final ComposerMentionController controller = await _pumpController(
        tester,
      );

      controller
        ..text = '@msu'
        ..selection = const TextSelection.collapsed(offset: 4);
      controller.insertUserMentionPlaceholder(
        matchStart: 0,
        matchEnd: 3,
        userId: '1481621807877361924',
        displayName: 'msubizo',
      );
      await tester.pump();

      expect(find.text('@msubizo'), findsOneWidget);
      expect(controller.toWireText().trim(), '<@1481621807877361924> u');
    },
  );

  testWidgets('stores the user mention display label and renders it', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    controller.insertUserMentionPlaceholder(
      matchStart: 0,
      matchEnd: 0,
      userId: '123',
      displayName: 'Alice',
    );
    await tester.pump();

    expect(find.text('@Alice'), findsOneWidget);
    expect(controller.toWireText().trim(), '<@123>');
  });

  testWidgets('stores the role mention display label and renders wire text', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    controller.insertRoleMentionPlaceholder(
      matchStart: 0,
      matchEnd: 0,
      roleId: '789',
      displayName: 'Moderators',
      colorArgb: 0xFFFF0000,
    );
    await tester.pump();

    expect(find.text('@Moderators'), findsOneWidget);
    expect(controller.toWireText().trim(), '<@&789>');
  });

  testWidgets('stores the channel mention display label and renders it', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    controller.insertChannelMentionPlaceholder(
      matchStart: 0,
      matchEnd: 0,
      channelId: '456',
      displayName: 'general',
    );
    await tester.pump();

    expect(find.text('#general'), findsOneWidget);
    expect(controller.toWireText().trim(), '<#456>');
  });

  testWidgets('keeps user labels aligned with ids after deleting one', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    controller
      ..insertUserMentionPlaceholder(
        matchStart: 0,
        matchEnd: 0,
        userId: '111',
        displayName: 'Alice',
      )
      ..insertUserMentionPlaceholder(
        matchStart: controller.text.length,
        matchEnd: controller.text.length,
        userId: '222',
        displayName: 'Bob',
      );
    await tester.pump();
    expect(find.text('@Alice'), findsOneWidget);
    expect(find.text('@Bob'), findsOneWidget);

    // Removing the trailing placeholder drops the last id and its label in
    // lockstep, so the surviving chip still resolves to its stored label.
    final String trimmed = controller.text.trimRight();
    controller.value = TextEditingValue(
      text: trimmed.substring(0, trimmed.length - 1),
      selection: const TextSelection.collapsed(offset: 0),
    );
    await tester.pump();

    expect(find.text('@Bob'), findsNothing);
    expect(find.text('@Alice'), findsOneWidget);
    expect(controller.toWireText().trim(), '<@111>');
  });

  testWidgets('inserts a custom emoji as a chip carrying its markdown wire', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    controller.insertEmoji('cool', '<:cool:123>');
    await tester.pump();

    expect(find.text(':cool:'), findsOneWidget);
    expect(controller.toWireText().trim(), '<:cool:123>');
  });

  testWidgets('inserts a unicode emoji as a chip carrying its shortcode', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    controller.insertEmoji('wave', '\u{1F44B}');
    await tester.pump();

    expect(find.text(':wave:'), findsOneWidget);
    expect(controller.toWireText().trim(), ':wave:');
  });

  testWidgets('a picker-inserted emoji leaves a trailing space', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    controller.insertEmoji('wave', '\u{1F44B}');
    await tester.pump();

    expect(controller.toWireText(), ':wave: ');
    expect(controller.selection.baseOffset, controller.text.length);

    final String before = controller.text;
    controller.value = TextEditingValue(
      text: '${before}text',
      selection: TextSelection.collapsed(offset: before.length + 4),
    );
    await tester.pump();

    expect(controller.toWireText(), ':wave: text');
  });

  testWidgets('applyWireText re-chips a custom emoji and round-trips', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    await controller.applyWireText('hi <:cool:123> there');
    await tester.pump();

    expect(find.text(':cool:'), findsOneWidget);
    expect(controller.toWireText(), 'hi <:cool:123> there');
  });

  testWidgets('preserves order and wire forms for a mixed mention and emoji', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    controller
      ..insertUserMentionPlaceholder(
        matchStart: 0,
        matchEnd: 0,
        userId: '123',
        displayName: 'Alice',
      )
      ..insertEmoji('cool', '<:cool:9>');
    await tester.pump();

    expect(find.text('@Alice'), findsOneWidget);
    expect(find.text(':cool:'), findsOneWidget);
    expect(controller.toWireText().trim(), '<@123> <:cool:9>');
  });

  testWidgets('applyWireText leaves ambiguous typed colons unchipped', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    await controller.applyWireText('12:30:45 <:smile:9>');
    await tester.pump();

    // Only the explicitly written custom emoji becomes a chip.
    expect(find.text(':smile:'), findsOneWidget);
    expect(find.text(':30:'), findsNothing);
    // The typed time stays literal text and the custom emoji round-trips.
    expect(controller.text.startsWith('12:30:45 '), isTrue);
    expect(controller.toWireText(), '12:30:45 <:smile:9>');
  });

  testWidgets('mentionWireToDisplayFragment chips pasted mention and emoji', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    final String display = await controller.mentionWireToDisplayFragment(
      'hi <@123> :wave:',
    );
    controller.text = display;

    expect(display, isNot(contains('<@123>')));
    expect(controller.toWireText(), 'hi <@123> :wave:');
  });

  testWidgets('keeps mention chip visible during IME composing', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    controller
      ..insertUserMentionPlaceholder(
        matchStart: 0,
        matchEnd: 0,
        userId: '123',
        displayName: 'Alice',
      )
      ..value = TextEditingValue(
        text: 'hi${controller.text.trim()}',
        composing: const TextRange(start: 0, end: 2),
        selection: const TextSelection.collapsed(offset: 2),
      );
    await tester.pump();

    expect(find.text('@Alice'), findsOneWidget);
  });

  testWidgets('applyWireText swaps atomically without orphan sentinels', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    controller.insertEmoji('cool', '<:cool:123>');
    await tester.pump();

    final Future<void> apply = controller.applyWireText('next <:wave:9>');
    expect(controller.toWireText().trim(), '<:cool:123>');
    expect(
      controller.toWireText().contains(String.fromCharCode(0xE000)),
      isFalse,
    );

    await apply;
    await tester.pump();

    expect(controller.toWireText(), 'next <:wave:9>');
    expect(
      controller.toWireText().contains(String.fromCharCode(0xE000)),
      isFalse,
    );
  });

  testWidgets('custom emoji wire text never contains private-use sentinels', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    controller.insertEmoji('guild_emoji', '<:guild_emoji:999>');
    await tester.pump();

    final String wire = controller.toWireText();
    expect(wire.trim(), '<:guild_emoji:999>');
    for (final int code in wire.runes) {
      expect(code >= 0xE000 && code <= 0xF8FF, isFalse);
    }
  });

  testWidgets('stale applyWireText does not orphan tokens', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);

    final Future<void> first = controller.applyWireText('hi <:a:1>');
    final Future<void> second = controller.applyWireText('bye <:b:2>');
    await Future.wait(<Future<void>>[first, second]);
    await tester.pump();

    expect(controller.toWireText(), 'bye <:b:2>');
    expect(
      controller.toWireText().contains(String.fromCharCode(0xE000)),
      isFalse,
    );
  });

  testWidgets('applyWireText aborts when controller diverged during async', (
    WidgetTester tester,
  ) async {
    final ComposerMentionController controller = await _pumpController(tester);
    controller
      ..text = 'hello'
      ..selection = const TextSelection.collapsed(offset: 5);

    final Future<void> apply = controller.applyWireText('stale draft');
    controller.value = const TextEditingValue(
      text: 'hello world',
      selection: TextSelection.collapsed(offset: 11),
    );
    await apply;
    await tester.pump();

    expect(controller.toWireText(), 'hello world');
  });
}
