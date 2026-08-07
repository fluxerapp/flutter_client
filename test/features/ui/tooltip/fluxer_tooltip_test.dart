import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';

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
  group('FluxerTooltip', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerTooltip(message: 'Tooltip text', child: Text('Child')),
        ),
      );

      expect(find.text('Child'), findsOneWidget);
    });

    testWidgets('does not show tooltip initially', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerTooltip(message: 'Tooltip text', child: Text('Child')),
        ),
      );

      expect(find.text('Tooltip text'), findsNothing);
    });

    testWidgets('shows tooltip message on long press', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerTooltip(
            message: 'Tooltip text',
            child: SizedBox(width: 100, height: 100),
          ),
        ),
      );

      await tester.longPress(find.byType(FluxerTooltip));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Tooltip text'), findsOneWidget);
    });

    testWidgets('exposes message as semantics label', (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();

      await tester.pumpWidget(
        buildTestApp(
          const FluxerTooltip(
            message: 'Open settings',
            child: SizedBox(width: 40, height: 40),
          ),
        ),
      );

      expect(find.bySemanticsLabel('Open settings'), findsOneWidget);
      handle.dispose();
    });
  });
}
