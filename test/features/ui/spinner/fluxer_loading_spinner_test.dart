import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
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
  group('FluxerLoadingSpinner', () {
    testWidgets('announces loading label to screen readers', (tester) async {
      await tester.pumpWidget(buildTestApp(const FluxerLoadingSpinner()));

      expect(find.bySemanticsLabel('Loading'), findsOneWidget);
    });

    testWidgets('animates dot alpha without an Opacity layer', (tester) async {
      await tester.pumpWidget(buildTestApp(const FluxerLoadingSpinner()));
      await tester.pump();

      final Finder dotFinder = find.descendant(
        of: find.byType(FluxerLoadingSpinner),
        matching: find.byType(Container),
      );
      expect(dotFinder, findsNWidgets(3));

      // The fade is baked into the dot color, so no saveLayer-forcing Opacity
      // widget should exist in the spinner subtree.
      expect(
        find.descendant(
          of: find.byType(FluxerLoadingSpinner),
          matching: find.byType(Opacity),
        ),
        findsNothing,
      );

      double alphaOf(Element e) =>
          (((e.widget as Container).decoration! as BoxDecoration).color!).a;

      // Every dot stays within the [0.3, 1.0] design range.
      for (final Element e in dotFinder.evaluate()) {
        expect(alphaOf(e), inInclusiveRange(0.3, 1.0));
      }

      // The controller actually modulates the alpha over time.
      final double before = alphaOf(dotFinder.evaluate().first);
      await tester.pump(const Duration(milliseconds: 350));
      expect(alphaOf(dotFinder.evaluate().first), isNot(equals(before)));
    });
  });
}
