import 'package:flutter_test/flutter_test.dart';

import 'app_launcher.dart';
import 'test_account.dart';

bool _appLaunched = false;

Future<void> bootstrapApp(WidgetTester tester) async {
  if (_appLaunched) {
    return;
  }
  await launchFluxerApp(tester);
  _appLaunched = true;
}

Future<void> bootstrapAuthenticatedApp(WidgetTester tester) async {
  await bootstrapApp(tester);
  await ensureAuthenticated(tester);
}
