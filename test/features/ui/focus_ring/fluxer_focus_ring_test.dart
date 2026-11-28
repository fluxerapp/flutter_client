import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/input/providers/keyboard_mode_provider.dart';
import 'package:fluxer_app/features/ui/focus_ring/fluxer_focus_ring.dart';
import 'package:fluxer_app/features/ui/focus_ring/fluxer_focus_ring_painter.dart';
import 'package:fluxer_app/material_ui.dart';

Widget buildTestApp(Widget child, {ProviderContainer? container}) {
  final colorTheme = buildDarkColorTheme();
  final Widget app = MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: Center(child: child)),
  );
  if (container == null) {
    return app;
  }
  return UncontrolledProviderScope(container: container, child: app);
}

FluxerFocusRingPainter ringPainter(WidgetTester tester) {
  final CustomPaint paint = tester.widget<CustomPaint>(
    find.descendant(
      of: find.byType(FluxerFocusRing),
      matching: find.byType(CustomPaint),
    ),
  );
  return paint.foregroundPainter! as FluxerFocusRingPainter;
}

void main() {
  group('FluxerFocusRing', () {
    testWidgets('renders child without a ProviderScope', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerFocusRing(focused: true, child: Text('Hi'))),
      );

      expect(find.text('Hi'), findsOneWidget);
      expect(ringPainter(tester).visible, isFalse);
    });

    testWidgets('hides the ring outside keyboard mode', (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      await tester.pumpWidget(
        buildTestApp(
          const FluxerFocusRing(
            focused: true,
            child: SizedBox(width: 100, height: 100),
          ),
          container: container,
        ),
      );

      expect(ringPainter(tester).visible, isFalse);
    });

    testWidgets('shows a 4px ring with radius 4 in keyboard mode', (
      tester,
    ) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      container.read(keyboardModeProvider.notifier).enter();
      await tester.pumpWidget(
        buildTestApp(
          const FluxerFocusRing(
            focused: true,
            child: SizedBox(width: 100, height: 100),
          ),
          container: container,
        ),
      );

      final FluxerFocusRingPainter painter = ringPainter(tester);
      expect(painter.visible, isTrue);
      expect(painter.borderRadius, BorderRadius.circular(4));
      expect(FluxerFocusRingPainter.kRingWidth, 4);
    });

    testWidgets('hides the ring when unfocused in keyboard mode', (
      tester,
    ) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      container.read(keyboardModeProvider.notifier).enter();
      await tester.pumpWidget(
        buildTestApp(
          const FluxerFocusRing(
            focused: false,
            child: SizedBox(width: 100, height: 100),
          ),
          container: container,
        ),
      );

      expect(ringPainter(tester).visible, isFalse);
    });
  });
}
