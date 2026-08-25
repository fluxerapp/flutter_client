import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/focus_ring/fluxer_focus_ring.dart';
import 'package:fluxer_app/material_ui.dart';

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
  group('FluxerFocusRing', () {
    testWidgets('renders child', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerFocusRing(focused: false, child: Text('Hello')),
        ),
      );

      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('shows border when focused', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerFocusRing(
            focused: true,
            child: SizedBox(width: 100, height: 100),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final decoration = container.decoration! as BoxDecoration;

      expect(decoration.border, isNull);
      expect(decoration.boxShadow, isNotEmpty);
    });

    testWidgets('hides border when not focused', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerFocusRing(
            focused: false,
            child: SizedBox(width: 100, height: 100),
          ),
        ),
      );

      final container = tester.widget<AnimatedContainer>(
        find.byType(AnimatedContainer),
      );
      final decoration = container.decoration! as BoxDecoration;

      expect(decoration.border, isNull);
      expect(decoration.boxShadow, isEmpty);
    });
  });
}
