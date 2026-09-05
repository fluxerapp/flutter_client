import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../support/navigation_helpers.dart';
import '../support/session_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('open guild channel from sidebar', (WidgetTester tester) async {
    if (kIsWeb) {
      return;
    }

    await bootstrapAuthenticatedApp(tester);
    await openGuildChannel(tester);

    expect(find.byType(ListView), findsWidgets);
    expect(find.bySemanticsLabel('Loading messages'), findsNothing);
  });

  testWidgets('open personal notes from home', (WidgetTester tester) async {
    if (kIsWeb) {
      return;
    }

    await bootstrapAuthenticatedApp(tester);
    await openPersonalNotes(tester);

    expect(find.byType(ListView), findsWidgets);
    expect(find.bySemanticsLabel('Loading messages'), findsNothing);
  });
}
