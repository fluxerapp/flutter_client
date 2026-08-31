import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../support/app_launcher.dart';
import '../support/perf_utils.dart';
import '../support/requirements.dart';
import '../support/scroll_utils.dart';
import '../support/test_account.dart';
import '../support/test_config.dart';

void main() {
  final IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('guild navbar scroll perf', (WidgetTester tester) async {
    if (kIsWeb) {
      return;
    }

    requireGuildChannelConfig();

    await launchFluxerApp(tester);
    await ensureAuthenticated(tester);

    await tester.tap(
      find.byKey(
        const ValueKey<String>('guild-${IntegrationTestConfig.guildId}'),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));

    expect(find.byType(Scrollable), findsWidgets);

    await traceScrollPerf(
      binding,
      tester,
      reportKey: 'guild_navbar_scroll',
      scrollTarget: findPrimaryScrollable(),
      flingCount: 8,
    );
  });
}
