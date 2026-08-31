import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../support/app_launcher.dart';
import '../support/test_account.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('cold start reaches login or authenticated shell', (
    WidgetTester tester,
  ) async {
    if (kIsWeb) {
      return;
    }

    await launchFluxerApp(tester);
    await waitForAppShell(tester);

    final bool authenticated = await isOnAuthenticatedShell(tester);
    final bool onLogin = await isOnLoginScreen(tester);
    expect(authenticated || onLogin, isTrue);
  });

  testWidgets('login reaches home tab', (WidgetTester tester) async {
    if (kIsWeb) {
      return;
    }

    await ensureAuthenticated(tester);

    expect(find.bySemanticsLabel('Home'), findsOneWidget);
  });
}
