import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

Widget _app({
  required Locale locale,
  required Widget child,
  bool use12Hour = false,
}) {
  final FluxerColorTheme colorTheme = buildDarkColorTheme();
  return ProviderScope(
    key: ValueKey<String>('${locale.toLanguageTag()}-$use12Hour'),
    overrides: [use12HourTimeFormatProvider.overrideWithValue(use12Hour)],
    child: MaterialApp(
      locale: locale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

List<String> _renderedTexts(WidgetTester tester) => tester
    .widgetList<RichText>(find.byType(RichText))
    .map((RichText richText) => richText.text.toPlainText())
    .toList();

void main() {
  setUpAll(() async {
    await initializeDateFormatting('en_US');
    await initializeDateFormatting('fr');
    await initializeDateFormatting('de');
  });

  testWidgets('timestamp follows app locale when Intl default differs', (
    WidgetTester tester,
  ) async {
    final String? previousDefaultLocale = Intl.defaultLocale;
    Intl.defaultLocale = 'de';
    addTearDown(() => Intl.defaultLocale = previousDefaultLocale);
    final DateTime dateTime = DateTime(2026, 7, 20, 16, 5);
    final int unix = dateTime.millisecondsSinceEpoch ~/ 1000;
    final String french = DateFormat.yMMMMd('fr').format(dateTime);
    final String german = DateFormat.yMMMMd('de').format(dateTime);
    expect(french, isNot(german));

    await tester.pumpWidget(
      _app(
        locale: const Locale('fr'),
        child: MessageMarkdown(
          data: '<t:$unix:D>',
          baseStyle: const TextStyle(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(_renderedTexts(tester), contains(french));
    expect(_renderedTexts(tester), isNot(contains(german)));

    await tester.pumpWidget(
      _app(
        locale: const Locale('de'),
        child: MessageMarkdown(
          data: '<t:$unix:D>',
          baseStyle: const TextStyle(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(_renderedTexts(tester), contains(german));
  });

  testWidgets('timestamp follows the user hour-cycle preference', (
    WidgetTester tester,
  ) async {
    final DateTime dateTime = DateTime(2026, 7, 20, 16, 5);
    final int unix = dateTime.millisecondsSinceEpoch ~/ 1000;

    await tester.pumpWidget(
      _app(
        locale: const Locale('en', 'US'),
        use12Hour: true,
        child: MessageMarkdown(
          data: '<t:$unix:t>',
          baseStyle: const TextStyle(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(
      _renderedTexts(
        tester,
      ).map((String text) => text.replaceAll('\u202f', ' ')),
      contains('4:05 PM'),
    );

    await tester.pumpWidget(
      _app(
        locale: const Locale('en', 'US'),
        child: MessageMarkdown(
          data: '<t:$unix:t>',
          baseStyle: const TextStyle(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(_renderedTexts(tester), contains('16:05'));
  });
}
