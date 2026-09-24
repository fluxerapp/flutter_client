import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../support/navigation_helpers.dart';
import '../support/perf_utils.dart';
import '../support/session_helpers.dart';

void main() {
  final IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('personal notes message list scroll perf', (
    WidgetTester tester,
  ) async {
    if (kIsWeb) {
      return;
    }

    await bootstrapAuthenticatedApp(tester);
    await openPersonalNotes(tester);

    final Finder messageList = find
        .descendant(
          of: find.byKey(const ValueKey<String>('message-list')),
          matching: find.byType(Scrollable),
        )
        .first;
    expect(messageList, findsOneWidget);

    await traceScrollPerf(
      binding,
      tester,
      reportKey: 'personal_notes_scroll',
      scrollTarget: messageList,
      direction: const Offset(0, 1200),
    );
  }, semanticsEnabled: false);
}
