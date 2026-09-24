import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/chat_back_button.dart';
import 'package:fluxer_app/main.dart' as app;

import 'test_config.dart';

/// `testWidgets` holds a `SemanticsHandle` for the whole test by default
/// (flutter_test/lib/src/widget_tester.dart:153,178-181). The perf tests opt
/// out so the traced window has no semantics tree, and take this handle only
/// while the bootstrap needs `bySemanticsLabel` finders.
SemanticsHandle? _finderSemantics;

void ensureFinderSemantics(WidgetTester tester) {
  _finderSemantics ??= tester.ensureSemantics();
}

void releaseFinderSemantics() {
  _finderSemantics?.dispose();
  _finderSemantics = null;
}

Future<void> launchFluxerApp(WidgetTester tester) async {
  await app.main(<String>[]);
  await tester.pump();
  ensureFinderSemantics(tester);
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

Future<bool> isOnChannelScreen(WidgetTester tester) {
  return Future<bool>.value(
    find.byKey(const ValueKey<String>('message-list')).evaluate().isNotEmpty,
  );
}

/// The app restores its last route, so a run that follows one which left the
/// app installed starts inside a channel, where the guild rail and bottom nav
/// are not mounted. Back out the way a user would.
Future<void> returnToShell(WidgetTester tester) async {
  for (var attempt = 0; attempt < 3; attempt++) {
    if (await isOnAuthenticatedShell(tester)) {
      return;
    }
    final Finder back = find.byType(ChatBackButton);
    if (back.evaluate().isEmpty) {
      return;
    }
    await tester.tap(back.first);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
  }
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
    if (await isOnChannelScreen(tester)) {
      await returnToShell(tester);
      if (await isOnAuthenticatedShell(tester)) {
        return;
      }
    }
    if (await isOnLoginScreen(tester)) {
      return;
    }
  }

  fail('Timed out waiting for app shell or login screen');
}
