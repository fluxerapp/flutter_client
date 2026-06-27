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

    testWidgets('animates dots via CustomPainter without Opacity layers', (
      tester,
    ) async {
      await tester.pumpWidget(buildTestApp(const FluxerLoadingSpinner()));
      await tester.pump();

      final Finder spinnerPaint = find.descendant(
        of: find.byType(FluxerLoadingSpinner),
        matching: find.byType(CustomPaint),
      );
      expect(spinnerPaint, findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(FluxerLoadingSpinner),
          matching: find.byType(Opacity),
        ),
        findsNothing,
      );

      await tester.pump(const Duration(milliseconds: 350));
      await tester.pump();
    });
  });
}
