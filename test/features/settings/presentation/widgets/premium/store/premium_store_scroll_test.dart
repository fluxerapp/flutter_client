import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/material_ui.dart';

import 'premium_store_test_app.dart';

Future<void> _pumpStore(WidgetTester tester, ScrollController controller) {
  tester.view.physicalSize = const Size(412, 915);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  return tester.pumpWidget(
    premiumStoreTestApp(brightness: Brightness.dark, controller: controller),
  );
}

void main() {
  testWidgets('store panels skip the backdrop blur on scroll', (
    WidgetTester tester,
  ) async {
    final ScrollController controller = ScrollController();
    addTearDown(controller.dispose);
    await _pumpStore(tester, controller);
    await tester.pumpAndSettle();

    expect(find.byType(BackdropFilter), findsNothing);
  });
}
