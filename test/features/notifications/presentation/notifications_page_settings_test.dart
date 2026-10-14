import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/bookmarks/presentation/widgets/saved_messages_body.dart';
import 'package:fluxer_app/features/notifications/presentation/notifications_page.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_settings_search_field.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../helpers/pump_fluxer_app.dart';

void main() {
  setUpAll(() => driftRuntimeOptions.dontWarnAboutMultipleDatabases = true);

  testWidgets(
    'notification settings opened from the inbox have no settings overview behind them',
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        pumpFluxerApp(child: const Scaffold(body: NotificationsPage())),
      );
      await _settle(tester);

      await tester.tap(find.byIcon(PhosphorIconsBold.dotsThree));
      await _settle(tester);
      await tester.tap(find.text('Notification settings'));
      await _settle(tester);

      expect(find.text('Text-to-speech notifications'), findsOneWidget);
      expect(
        find.byType(UserSettingsSearchField, skipOffstage: false),
        findsNothing,
      );

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(seconds: 30));
    },
  );

  testWidgets('bookmarks open from the inbox header in one tap', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      pumpFluxerApp(child: const Scaffold(body: NotificationsPage())),
    );
    await _settle(tester);

    await tester.tap(find.byTooltip('Bookmarks'));
    await _settle(tester);

    expect(find.byType(SavedMessagesBody), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 30));
  });
}

Future<void> _settle(WidgetTester tester) async {
  for (int i = 0; i < 10; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}
