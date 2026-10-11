import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_badge.dart';
import 'package:fluxer_app/material_ui.dart';

Widget buildTestApp(Widget child, {MediaQueryData? mediaQuery}) {
  final colorTheme = buildDarkColorTheme();
  final Widget app = MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: Center(child: child)),
  );
  if (mediaQuery == null) {
    return app;
  }
  return MediaQuery(data: mediaQuery, child: app);
}

BoxDecoration _pillDecoration(WidgetTester tester) {
  final Container pill = tester.widget<Container>(
    find.descendant(
      of: find.byType(FluxerBadge),
      matching: find.byType(Container),
    ),
  );
  return pill.decoration! as BoxDecoration;
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

    testWidgets('count pill is fully rounded', (tester) async {
      await tester.pumpWidget(buildTestApp(const FluxerBadge.count(count: 7)));

      expect(
        _pillDecoration(tester).borderRadius,
        BorderRadius.circular(FluxerBadge.height / 2),
      );
      expect(tester.getSize(find.byType(FluxerBadge)).height, 20);
    });

    testWidgets('inline badge draws no cutout ring', (tester) async {
      await tester.pumpWidget(buildTestApp(const FluxerBadge.count(count: 3)));

      expect(_pillDecoration(tester).border, isNull);
    });

    testWidgets('overlay badge draws its cutout ring in the given colour', (
      tester,
    ) async {
      const Color surface = Color(0xFF121214);
      await tester.pumpWidget(
        buildTestApp(const FluxerBadge.count(count: 3, cutoutColor: surface)),
      );

      final Border border = _pillDecoration(tester).border! as Border;
      expect(border.top.color, surface);
      expect(border.top.width, FluxerBadge.cutoutWidth);
    });

    testWidgets('digits keep their size at the largest text scale', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerBadge.count(count: 99),
          mediaQuery: const MediaQueryData(textScaler: TextScaler.linear(3.1)),
        ),
      );

      expect(tester.getSize(find.byType(FluxerBadge)).height, 20);
      final Size text = tester.getSize(find.text('99'));
      expect(text.height, lessThanOrEqualTo(FluxerBadge.height));
      expect(tester.takeException(), isNull);
    });

    testWidgets('dot variant renders as small circle', (tester) async {
      await tester.pumpWidget(buildTestApp(const FluxerBadge.dot()));

      final badge = tester.widget<FluxerBadge>(find.byType(FluxerBadge));
      expect(badge.isDot, isTrue);
      expect(badge.size, 8);
    });

    testWidgets('label variant renders arbitrary text', (tester) async {
      await tester.pumpWidget(
        buildTestApp(const FluxerBadge.label(text: 'NEW')),
      );

      expect(find.text('NEW'), findsOneWidget);
    });
  });

  group('FluxerBadgeEntrance', () {
    double scaleOf(WidgetTester tester) {
      final Transform transform = tester.widget<Transform>(
        find.descendant(
          of: find.byType(FluxerBadgeEntrance),
          matching: find.byType(Transform),
        ),
      );
      return transform.transform.storage[0];
    }

    testWidgets('springs in from 0.85 scale', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerBadgeEntrance(child: FluxerBadge.count(count: 1)),
        ),
      );

      expect(scaleOf(tester), closeTo(FluxerBadgeEntrance.initialScale, 0.01));
      await tester.pump(const Duration(milliseconds: 40));
      expect(scaleOf(tester), greaterThan(FluxerBadgeEntrance.initialScale));
      await tester.pumpAndSettle();
      expect(scaleOf(tester), 1);
    });

    testWidgets('appears at full size when animations are disabled', (
      tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerBadgeEntrance(child: FluxerBadge.count(count: 1)),
          mediaQuery: const MediaQueryData(disableAnimations: true),
        ),
      );

      expect(scaleOf(tester), 1);
    });
  });
}
