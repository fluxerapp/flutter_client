import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/main.dart' as app;

import 'test_config.dart';

Future<void> launchFluxerApp(WidgetTester tester) async {
  await app.main(<String>[]);
  await tester.pump();
  await tester.pump(const Duration(seconds: 2));
}

Future<bool> isOnAuthenticatedShell(WidgetTester tester) {
  return Future<bool>.value(
    find.bySemanticsLabel('Home').evaluate().isNotEmpty,
  );
}

Future<bool> isOnLoginScreen(WidgetTester tester) {
  return Future<bool>.value(find.text('Log in').evaluate().isNotEmpty);
}

Future<void> waitForAppShell(WidgetTester tester) async {
  final DateTime deadline = DateTime.now().add(
    IntegrationTestConfig.shellTimeout,
  );

  while (DateTime.now().isBefore(deadline)) {
    await tester.pump(const Duration(seconds: 1));

    if (await isOnAuthenticatedShell(tester)) {
      return;
    }
    if (await isOnLoginScreen(tester)) {
      return;
    }
  }

  fail('Timed out waiting for app shell or login screen');
}
