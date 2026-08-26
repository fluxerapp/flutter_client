import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// Opt-in: flutter drive --driver=test_driver/perf_driver.dart --target=integration_test/message_list_scroll_perf_test.dart
void main() {
  final IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('message list scroll perf harness is available', (
    WidgetTester tester,
  ) async {
    expect(binding, isNotNull);

    if (kIsWeb) {
      return;
    }

    await binding.traceAction(() async {
      await tester.pump(const Duration(milliseconds: 16));
    }, reportKey: 'message_list_scroll_timeline');
  });
}
