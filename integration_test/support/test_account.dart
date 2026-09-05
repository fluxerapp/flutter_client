import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'app_launcher.dart';
import 'requirements.dart';
import 'test_config.dart';

Future<void> ensureAuthenticated(WidgetTester tester) async {
  await waitForAppShell(tester);

  if (await isOnAuthenticatedShell(tester)) {
    return;
  }

  requireTestLabCredentials();

  if (!await isOnLoginScreen(tester)) {
    fail('App is not on login screen and not authenticated');
  }

  final Finder fields = find.byType(EditableText);
  expect(fields, findsAtLeast(2));

  await tester.enterText(fields.at(0), IntegrationTestConfig.email);
  await tester.pump();
  await tester.enterText(fields.at(1), IntegrationTestConfig.password);
  await tester.pump();

  await tester.tap(find.text('Log in'));
  await tester.pump();

  final DateTime deadline = DateTime.now().add(
    IntegrationTestConfig.shellTimeout,
  );
  while (DateTime.now().isBefore(deadline)) {
    await tester.pump(const Duration(seconds: 1));
    if (await isOnAuthenticatedShell(tester)) {
      return;
    }
  }

  fail('Login did not reach authenticated shell');
}
