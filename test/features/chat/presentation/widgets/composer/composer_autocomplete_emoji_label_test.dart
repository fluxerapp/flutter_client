import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';
import 'package:material_ui/material_ui.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    home: Scaffold(body: child),
  );
}

void main() {
  testWidgets(
    'emoji autocomplete row renders the emoji preview and its source label',
    (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          ComposerAutocompletePanelListTile(
            title: ':monkey:',
            subtitle: 'Linux Hub',
            isSelected: false,
            onTap: () {},
            emojiSurrogates: '🐒',
          ),
        ),
      );

      // Title, the emoji glyph preview, and the source label all render
      // together in a single row.
      expect(find.text(':monkey:'), findsOneWidget);
      expect(find.byType(UnicodeEmojiWidget), findsOneWidget);
      expect(find.text('Linux Hub'), findsOneWidget);
    },
  );
}
