import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/popout/fluxer_popout.dart';
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
  group('FluxerPopout', () {
    testWidgets('content is not visible initially', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerPopout(
            anchorBuilder: (context, toggle) =>
                TextButton(onPressed: toggle, child: const Text('Anchor')),
            contentBuilder: (context, close) => const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Popout Content'),
            ),
          ),
        ),
      );

      expect(find.text('Anchor'), findsOneWidget);
      expect(find.text('Popout Content'), findsNothing);
    });

    testWidgets('shows content when anchor is tapped', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerPopout(
            anchorBuilder: (context, toggle) =>
                TextButton(onPressed: toggle, child: const Text('Anchor')),
            contentBuilder: (context, close) => const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Popout Content'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Anchor'));
      await tester.pumpAndSettle();

      expect(find.text('Popout Content'), findsOneWidget);
    });

    testWidgets('dismiss barrier closes the popout', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerPopout(
            anchorBuilder: (context, toggle) =>
                TextButton(onPressed: toggle, child: const Text('Anchor')),
            contentBuilder: (context, close) => const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Popout Content'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Anchor'));
      await tester.pumpAndSettle();
      expect(find.text('Popout Content'), findsOneWidget);

      // Tap the dismiss barrier (the edge of the screen, away from content)
      await tester.tapAt(const Offset(700, 500));
      await tester.pumpAndSettle();
      expect(find.text('Popout Content'), findsNothing);
    });

    testWidgets('close callback hides content', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerPopout(
            anchorBuilder: (context, toggle) =>
                TextButton(onPressed: toggle, child: const Text('Anchor')),
            contentBuilder: (context, close) =>
                TextButton(onPressed: close, child: const Text('Close Me')),
          ),
        ),
      );

      await tester.tap(find.text('Anchor'));
      await tester.pumpAndSettle();
      expect(find.text('Close Me'), findsOneWidget);

      await tester.tap(find.text('Close Me'));
      await tester.pumpAndSettle();
      expect(find.text('Close Me'), findsNothing);
    });
  });
}
