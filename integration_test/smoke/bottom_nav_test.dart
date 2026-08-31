import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../support/app_launcher.dart';
import '../support/scroll_utils.dart';
import '../support/test_account.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('bottom nav switches between main tabs', (
    WidgetTester tester,
  ) async {
    if (kIsWeb) {
      return;
    }

    await launchFluxerApp(tester);
    await ensureAuthenticated(tester);

    await tapBottomNav(tester, 'Notifications');
    await tester.pump(const Duration(seconds: 2));

    await tapBottomNav(tester, 'You');
    await tester.pump(const Duration(seconds: 2));

    await tapBottomNav(tester, 'Home');
    expect(find.bySemanticsLabel('Home'), findsOneWidget);
  });
}
