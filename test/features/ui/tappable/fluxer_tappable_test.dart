import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
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
  group('FluxerTappable', () {
    testWidgets('calls onTap when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        buildTestApp(
          FluxerTappable(
            onTap: () => tapped = true,
            builder: (context, states) =>
                const SizedBox(width: 100, height: 100),
          ),
        ),
      );

      await tester.tap(find.byType(FluxerTappable));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onTap when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        buildTestApp(
          FluxerTappable(
            onTap: () => tapped = true,
            enabled: false,
            builder: (context, states) =>
                const SizedBox(width: 100, height: 100),
          ),
        ),
      );

      await tester.tap(find.byType(FluxerTappable));
      expect(tapped, isFalse);
    });

    testWidgets('exposes disabled state when enabled is false', (tester) async {
      Set<WidgetState>? capturedStates;
      await tester.pumpWidget(
        buildTestApp(
          FluxerTappable(
            onTap: () {},
            enabled: false,
            builder: (context, states) {
              capturedStates = states;
              return const SizedBox(width: 100, height: 100);
            },
          ),
        ),
      );

      expect(capturedStates, contains(WidgetState.disabled));
    });

    testWidgets('shows click cursor when enabled', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerTappable(
            onTap: () {},
            builder: (context, states) =>
                const SizedBox(width: 100, height: 100),
          ),
        ),
      );

      final mouseRegion = tester.widget<MouseRegion>(
        find.descendant(
          of: find.byType(FluxerTappable),
          matching: find.byType(MouseRegion),
        ),
      );
      expect(mouseRegion.cursor, SystemMouseCursors.click);
    });

    testWidgets('shows basic cursor when disabled', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerTappable(
            onTap: () {},
            enabled: false,
            builder: (context, states) =>
                const SizedBox(width: 100, height: 100),
          ),
        ),
      );

      final mouseRegion = tester.widget<MouseRegion>(
        find.descendant(
          of: find.byType(FluxerTappable),
          matching: find.byType(MouseRegion),
        ),
      );
      expect(mouseRegion.cursor, SystemMouseCursors.basic);
    });

    testWidgets('calls onLongPress when long-pressed', (tester) async {
      var longPressed = false;
      await tester.pumpWidget(
        buildTestApp(
          FluxerTappable(
            onLongPress: () => longPressed = true,
            builder: (context, states) =>
                const SizedBox(width: 100, height: 100),
          ),
        ),
      );

      await tester.longPress(find.byType(FluxerTappable));
      expect(longPressed, isTrue);
    });

    testWidgets('has reduced opacity when disabled', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerTappable(
            onTap: () {},
            enabled: false,
            builder: (context, states) =>
                const SizedBox(width: 100, height: 100),
          ),
        ),
      );

      final animatedOpacity = tester.widget<AnimatedOpacity>(
        find.byType(AnimatedOpacity),
      );
      expect(animatedOpacity.opacity, 0.5);
    });

    testWidgets('exposes selected state and minimum hit target when provided', (
      tester,
    ) async {
      Set<WidgetState>? capturedStates;

      await tester.pumpWidget(
        buildTestApp(
          FluxerTappable(
            onTap: () {},
            selected: true,
            minSize: const Size(48, 52),
            builder: (context, states) {
              capturedStates = states;
              return const SizedBox(width: 8, height: 8);
            },
          ),
        ),
      );

      expect(capturedStates, contains(WidgetState.selected));

      final constrainedBox = tester.widget<ConstrainedBox>(
        find.descendant(
          of: find.byType(FluxerTappable),
          matching: find.byType(ConstrainedBox),
        ),
      );
      expect(constrainedBox.constraints.minWidth, 48);
      expect(constrainedBox.constraints.minHeight, 52);
    });
  });
}
