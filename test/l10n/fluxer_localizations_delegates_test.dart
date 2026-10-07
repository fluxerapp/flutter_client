import 'package:cupertino_ui/cupertino_ui.dart' show CupertinoLocalizations;
import 'package:flutter/material.dart' as flutter show MaterialLocalizations;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/material_ui.dart';

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
}
