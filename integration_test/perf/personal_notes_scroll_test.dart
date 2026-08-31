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

    expect(find.byType(ListView), findsWidgets);

    await traceScrollPerf(
      binding,
      tester,
      reportKey: 'personal_notes_scroll',
      scrollTarget: find.byType(ListView).first,
    );
  });
}
