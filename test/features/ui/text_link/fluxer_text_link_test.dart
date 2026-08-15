import 'package:flutter/semantics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/test_l10n.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}

void main() {
  group('FluxerTextLink', () {
    testWidgets('renders text content', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerTextLink(text: 'Visit site')),
      );

      expect(find.text('Visit site'), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        buildTestApp(
          FluxerTextLink(text: 'Click me', onTap: () => tapped = true),
        ),
      );

      await tester.tap(find.text('Click me'));
      expect(tapped, isTrue);
    });

    testWidgets('renders selectable text when selectable is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerTextLink(text: 'Selectable link', selectable: true),
        ),
      );

      expect(find.byType(SelectableText), findsOneWidget);
      expect(find.text('Selectable link'), findsOneWidget);
    });

    testWidgets('has link semantics without duplicate button role', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerTextLink(text: 'A link', url: 'https://example.com'),
        ),
      );

      final SemanticsNode node = tester.getSemantics(find.text('A link'));
      expect(node.flagsCollection.isLink, isTrue);
      expect(node.flagsCollection.isButton, isFalse);
    });
  });
}
