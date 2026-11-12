import 'package:cupertino_ui/cupertino_ui.dart' show CupertinoLocalizations;
import 'package:flutter/material.dart' as flutter show MaterialLocalizations;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;

import '../helpers/pump_fluxer_app.dart';
import '../helpers/test_l10n.dart';

void main() {
  test('every app locale has a delegate for each localization type', () {
    const List<Type> types = <Type>[
      FluxerLocalizations,
      MaterialLocalizations,
      flutter.MaterialLocalizations,
      CupertinoLocalizations,
      WidgetsLocalizations,
    ];
    for (final Locale locale in FluxerLocalizations.supportedLocales) {
      for (final Type type in types) {
        expect(
          fluxerLocalizationsDelegates.any(
            (LocalizationsDelegate<dynamic> delegate) =>
                delegate.type == type && delegate.isSupported(locale),
          ),
          isTrue,
          reason: '${locale.toLanguageTag()} $type',
        );
      }
    }
  });

  for (final (Locale locale, TextDirection direction, String backTooltip)
      in <(Locale, TextDirection, String)>[
        (const Locale('de'), TextDirection.ltr, 'Zurück'),
        (const Locale('ar'), TextDirection.rtl, 'رجوع'),
        (const Locale('art'), TextDirection.ltr, 'Back'),
      ]) {
    testWidgets('material widgets are localized in ${locale.languageCode}', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        pumpFluxerApp(
          locale: locale,
          child: const Scaffold(
            body: Column(children: <Widget>[BackButton(), TextField()]),
          ),
        ),
      );
      await tester.pump();

      expect(tester.takeException(), isNull);
      final BuildContext context = tester.element(find.byType(TextField));
      expect(Directionality.of(context), direction);
      expect(FluxerLocalizations.of(context).localeName, locale.languageCode);
      expect(
        MaterialLocalizations.of(context),
        isA<GlobalMaterialLocalizations>(),
      );
      expect(
        flutter.MaterialLocalizations.of(context).backButtonTooltip,
        backTooltip,
      );
      expect(find.byTooltip(backTooltip), findsOneWidget);
    });
  }

  test('English-backed locales format dates and numbers like English', () {
    registerEnglishBackedIntlLocales();
    final DateTime date = DateTime(2026, 11, 6, 14, 5);
    expect(
      DateFormat.yMd('art').format(date),
      DateFormat.yMd('en').format(date),
    );
    expect(DateFormat.jm('art').format(date), DateFormat.jm('en').format(date));
    expect(NumberFormat.decimalPattern('art').format(1234567), '1,234,567');
    expect(
      NumberFormat.compact(locale: 'art').format(1234567),
      NumberFormat.compact(locale: 'en').format(1234567),
    );
    expect(DateFormat.yMd('de').format(date), '6.11.2026');
  });
}
