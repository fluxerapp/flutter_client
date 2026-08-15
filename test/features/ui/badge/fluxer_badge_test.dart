import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_badge.dart';
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
  group('FluxerBadge', () {
    testWidgets('count variant renders count text', (tester) async {
      await tester.pumpWidget(buildTestApp(const FluxerBadge.count(count: 5)));

      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('count variant caps at 99+', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerBadge.count(count: 150)),
      );

      expect(find.text('99+'), findsOneWidget);
    });

    testWidgets('compact count variant renders as a small circle', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerBadge.compactCount(count: 3)),
      );

      final badge = tester.widget<FluxerBadge>(find.byType(FluxerBadge));
      expect(badge.isCompact, isTrue);
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('compact count variant caps at 99+', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerBadge.compactCount(count: 150)),
      );

      expect(find.text('99+'), findsOneWidget);
    });

    testWidgets('dot variant renders as small circle', (tester) async {
      await tester.pumpWidget(buildTestApp(const FluxerBadge.dot()));

      final badge = tester.widget<FluxerBadge>(find.byType(FluxerBadge));
      expect(badge.isDot, isTrue);
      expect(badge.size, 8);

      expect(find.byType(FluxerBadge), findsOneWidget);
    });

    testWidgets('label variant renders arbitrary text', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerBadge.label(text: 'NEW')),
      );

      expect(find.text('NEW'), findsOneWidget);
    });
  });
}
