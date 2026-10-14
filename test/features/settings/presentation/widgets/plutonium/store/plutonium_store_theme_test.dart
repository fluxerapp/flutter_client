import 'package:flutter/rendering.dart' show RenderParagraph;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../../helpers/test_l10n.dart';
import 'plutonium_store_test_app.dart';

Color _textColor(WidgetTester tester, String text) {
  return tester
      .renderObject<RenderParagraph>(find.text(text))
      .text
      .style!
      .color!;
}

Color _barColor(WidgetTester tester) {
  return tester
      .widget<ColoredBox>(
        find
            .ancestor(
              of: find.byKey(plutoniumStoreTestBarKey),
              matching: find.byType(ColoredBox),
            )
            .first,
      )
      .color;
}

void main() {
  testWidgets('light theme gives the store dark ink on a light page', (
    WidgetTester tester,
  ) async {
    final ScrollController controller = ScrollController();
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      plutoniumStoreTestApp(
        brightness: Brightness.light,
        controller: controller,
      ),
    );
    await tester.pumpAndSettle();

    expect(
      _textColor(tester, testL10n.storePlutoniumCompareTitle),
      const Color(0xFF121122),
    );
    expect(
      _textColor(tester, testL10n.storePlutoniumCompareTag),
      const Color(0xFF121122),
    );
    expect(_barColor(tester).computeLuminance(), greaterThan(0.8));
  });

  testWidgets('dark theme keeps the space palette', (
    WidgetTester tester,
  ) async {
    final ScrollController controller = ScrollController();
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      plutoniumStoreTestApp(
        brightness: Brightness.dark,
        controller: controller,
      ),
    );
    await tester.pumpAndSettle();

    expect(
      _textColor(tester, testL10n.storePlutoniumCompareTitle),
      const Color(0xFFFFFFFF),
    );
    expect(_barColor(tester).computeLuminance(), lessThan(0.05));
  });
}
