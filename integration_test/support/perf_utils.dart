import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'scroll_utils.dart';

Future<void> traceScrollPerf(
  IntegrationTestWidgetsFlutterBinding binding,
  WidgetTester tester, {
  required String reportKey,
  required Finder scrollTarget,
  int flingCount = 12,
}) async {
  await binding.traceAction(() async {
    await flingScrollable(tester, scrollTarget, count: flingCount);
    await tester.pump(const Duration(milliseconds: 500));
  }, reportKey: reportKey);
}
