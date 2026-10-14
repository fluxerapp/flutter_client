import 'dart:math' as math;

import 'package:flutter/widgets.dart' as fw;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/reaction_chip_colors.dart';
import 'package:fluxer_app/core/theme/themes/coal.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/dark_legacy.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/message_reactions_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_reactions_bar.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_reactors_provider.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

typedef _Theme = ({
  String name,
  FluxerColorTheme colors,
  Brightness brightness,
});

final List<_Theme> _themes = <_Theme>[
  (name: 'dark', colors: buildDarkColorTheme(), brightness: Brightness.dark),
  (name: 'coal', colors: buildCoalColorTheme(), brightness: Brightness.dark),
  (
    name: 'dark legacy',
    colors: buildDarkLegacyColorTheme(),
    brightness: Brightness.dark,
  ),
  (name: 'light', colors: buildLightColorTheme(), brightness: Brightness.light),
];

double _luminance(Color c) => c.computeLuminance();

double _contrast(Color a, Color b) {
  final double la = _luminance(a);
  final double lb = _luminance(b);
  return (math.max(la, lb) + 0.05) / (math.min(la, lb) + 0.05);
}

const Reaction _mine = Reaction(emoji: '😀', count: 2, hasReacted: true);

Message _message() {
  return Message(
    id: 'm1',
    channelId: 'c1',
    authorId: '123456789012345678',
    authorName: 'Alice',
    content: 'hello',
    timestamp: DateTime(2026, 10, 14),
    reactions: const <Reaction>[_mine],
  );
}

class _NoReactors extends MessageReactors {
  @override
  Future<MessageReactorsState> build({
    required String channelId,
    required String messageId,
    required String emoji,
  }) async => const MessageReactorsState(users: [], hasMore: false);
}

Widget _app(_Theme theme, Widget home) {
  return ProviderScope(
    overrides: [
      messageReactorsProvider.overrideWith2(
        (({String channelId, String messageId, String emoji}) _) =>
            _NoReactors(),
      ),
    ],
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: theme.colors,
        textTheme: FluxerTextTheme.fromColors(theme.colors),
        layoutTheme: FluxerLayoutTheme.scaled(),
        brightness: theme.brightness,
      ),
      home: Scaffold(body: home),
    ),
  );
}

Color _countColor(WidgetTester tester, Finder scope) {
  final fw.Text text = tester.widget<fw.Text>(
    find.descendant(
      of: scope,
      matching: find.byWidgetPredicate(
        (Widget w) => w is fw.Text && w.data == '2',
      ),
    ),
  );
  return text.style!.color!;
}

void main() {
  for (final _Theme theme in _themes) {
    test('a selected chip reads clearly in ${theme.name}', () {
      final FluxerColorTheme colors = theme.colors;
      for (final Color? surface in <Color?>[
        null,
        colors.backgroundTertiary,
        colors.backgroundSecondaryAlt,
      ]) {
        final SelectedReactionChipColors chip = selectedReactionChipColorsFor(
          colors,
          brightness: theme.brightness,
          surface: surface,
        );
        expect(
          _contrast(chip.foreground, chip.background),
          greaterThanOrEqualTo(4.5),
        );
        expect(chip.border.withValues(alpha: 1), colors.brandPrimary);
      }
    });

    testWidgets('the sheet tab and the message chip agree in ${theme.name}', (
      tester,
    ) async {
      await tester.pumpWidget(
        _app(
          theme,
          Builder(
            builder: (BuildContext context) => Column(
              children: <Widget>[
                MessageReactionsBar(
                  reactions: const <Reaction>[_mine],
                  channelId: 'c1',
                  onReactionTap: (_, {emojiId, animated = false}) {},
                ),
                TextButton(
                  onPressed: () =>
                      showMessageReactionsSheet(context, message: _message()),
                  child: const Text('open'),
                ),
              ],
            ),
          ),
        ),
      );
      final Color chipCount = _countColor(
        tester,
        find.byType(MessageReactionsBar),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      final Color tabCount = _countColor(
        tester,
        find.byKey(const ValueKey<String>('reaction-tab-😀')),
      );

      final SelectedReactionChipColors expected = selectedReactionChipColorsFor(
        theme.colors,
        brightness: theme.brightness,
      );
      expect(chipCount, expected.foreground);
      expect(tabCount, expected.foreground);
    });
  }
}
