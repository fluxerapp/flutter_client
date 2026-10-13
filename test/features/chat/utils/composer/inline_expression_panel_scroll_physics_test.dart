import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/composer/inline_expression_panel_scroll_physics.dart';

FixedScrollMetrics _metrics({
  double pixels = 0,
  AxisDirection axisDirection = AxisDirection.down,
}) {
  return FixedScrollMetrics(
    minScrollExtent: 0,
    maxScrollExtent: 1000,
    pixels: pixels,
    viewportDimension: 300,
    axisDirection: axisDirection,
    devicePixelRatio: 3,
  );
}

void main() {
  group('inlineExpressionPanelHomeIndicatorInset', () {
    test('uses viewPadding bottom', () {
      const MediaQueryData mediaQuery = MediaQueryData(
        viewPadding: EdgeInsets.only(bottom: 34),
      );

      expect(inlineExpressionPanelHomeIndicatorInset(mediaQuery), 34);
    });
  });

  group('inlineExpressionPanelContentScrollPhysics', () {
    final ScrollPhysics docked = inlineExpressionPanelContentScrollPhysics(
      isSheetExpanded: false,
      parent: const ClampingScrollPhysics(),
    );
    final ScrollPhysics expanded = inlineExpressionPanelContentScrollPhysics(
      isSheetExpanded: true,
      parent: const ClampingScrollPhysics(),
    );

    test('docked list at top leaves an upward drag to the sheet', () {
      expect(docked.applyPhysicsToUserOffset(_metrics(), -12), 0);
      expect(docked.createBallisticSimulation(_metrics(), 800), isNull);
    });

    test('docked list scrolls when it is not at top', () {
      expect(docked.applyPhysicsToUserOffset(_metrics(pixels: 40), -12), -12);
      expect(docked.applyPhysicsToUserOffset(_metrics(), 12), 12);
    });

    test('docked horizontal strip at its start still scrolls', () {
      final FixedScrollMetrics strip = _metrics(
        axisDirection: AxisDirection.right,
      );
      expect(docked.applyPhysicsToUserOffset(strip, -12), -12);
      expect(docked.createBallisticSimulation(strip, 800), isNotNull);
    });

    test('builds on the ambient physics instead of its own bounce', () {
      expect(docked.parent, isA<ClampingScrollPhysics>());
      expect(expanded.parent, isA<ClampingScrollPhysics>());
      expect(
        docked.applyBoundaryConditions(_metrics(), -20),
        -20,
        reason: 'a clamping parent stops the list at its leading edge',
      );
    });

    test('expanded list at top scrolls immediately', () {
      expect(expanded.applyPhysicsToUserOffset(_metrics(), -12), -12);
      expect(expanded.createBallisticSimulation(_metrics(), 800), isNotNull);
    });
  });
}
