import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
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

    testWidgets('keeps long tooltip on screen near the right edge', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        buildTestApp(
          const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 8, bottom: 40),
              child: FluxerTooltip(
                message: 'Slowmode is set to 30s for this channel.',
                child: Text('Slowmode is enabled'),
              ),
            ),
          ),
        ),
      );

      await tester.longPress(find.text('Slowmode is enabled'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      final Rect tooltipRect = tester.getRect(
        find.text('Slowmode is set to 30s for this channel.'),
      );
      expect(tooltipRect.left, greaterThanOrEqualTo(8));
      expect(tooltipRect.right, lessThanOrEqualTo(312));
      expect(tooltipRect.top, greaterThanOrEqualTo(8));
      expect(tooltipRect.bottom, lessThanOrEqualTo(632));
    });
  });
}
