import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/accordion/fluxer_accordion.dart';
import 'package:material_ui/material_ui.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}

void main() {
  group('FluxerAccordion', () {
    testWidgets('shows title text', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAccordion(
            title: 'Section Title',
            child: Text('Hidden content'),
          ),
        ),
      );

      expect(find.text('Section Title'), findsOneWidget);
    });

    testWidgets('shows child content when initially expanded', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAccordion(
            title: 'Expanded Section',
            initiallyExpanded: true,
            child: Text('Visible content'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Visible content'), findsOneWidget);
      final visibleContentBox = tester.getSize(find.text('Visible content'));
      expect(visibleContentBox.height, greaterThan(0));
    });

    testWidgets('hides child content when collapsed by default', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAccordion(
            title: 'Collapsed Section',
            child: Text('Hidden content'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final sizeTransition = tester.widget<SizeTransition>(
        find.byType(SizeTransition),
      );
      expect(sizeTransition.sizeFactor.value, 0.0);
    });

    testWidgets('expands when header is tapped', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerAccordion(
            title: 'Tap Me',
            child: Text('Expanded content'),
          ),
        ),
      );

      await tester.tap(find.text('Tap Me'));
      await tester.pumpAndSettle();

      final sizeTransition = tester.widget<SizeTransition>(
        find.byType(SizeTransition),
      );
      expect(sizeTransition.sizeFactor.value, 1.0);
    });
  });
}
