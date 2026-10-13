import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'app_launcher.dart';
import 'scroll_utils.dart';
import 'test_config.dart';

Future<void> traceScrollPerf(
  IntegrationTestWidgetsFlutterBinding binding,
  WidgetTester tester, {
  required String reportKey,
  required Finder scrollTarget,
  int flingCount = IntegrationTestConfig.perfFlingCount,
  Offset direction = const Offset(0, -1200),
  Duration pause = const Duration(milliseconds: 150),
}) async {
  final LiveTestWidgetsFlutterBindingFramePolicy previousPolicy =
      binding.framePolicy;
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  if (!IntegrationTestConfig.perfSemantics) {
    releaseFinderSemantics();
  }
  final String widgetEvents = IntegrationTestConfig.perfWidgetEvents;
  debugProfileBuildsEnabled =
      widgetEvents == 'builds' || widgetEvents == 'both';
  debugProfileLayoutsEnabled =
      widgetEvents == 'layouts' || widgetEvents == 'both';
  final Stopwatch actionClock = Stopwatch();
  List<String> trail = const <String>[];
  try {
    await binding.traceAction(
      () async {
        actionClock.start();
        trail = await flingScrollable(
          tester,
          scrollTarget,
          count: flingCount,
          direction: direction,
          pause: pause,
        );
        await tester.pump(const Duration(milliseconds: 500));
        actionClock.stop();
      },
      streams: IntegrationTestConfig.perfStreams
          .split(',')
          .map((String stream) => stream.trim())
          .where((String stream) => stream.isNotEmpty)
          .toList(),
      reportKey: reportKey,
    );
  } finally {
    binding.framePolicy = previousPolicy;
    debugProfileBuildsEnabled = false;
    debugProfileLayoutsEnabled = false;
    debugProfilePaintsEnabled = false;
    final Object? timeline = binding.reportData?[reportKey];
    final Object? extentMicros = timeline is Map<String, dynamic>
        ? timeline['timeExtentMicros']
        : null;
    binding.reportData ??= <String, dynamic>{};
    ensureFinderSemantics(tester);
    binding.reportData!['$reportKey.scroll'] = <String>[
      'action=${actionClock.elapsedMilliseconds}ms',
      'timeline=${extentMicros is num ? (extentMicros / 1000).round() : -1}ms',
      ...trail,
    ].join(' | ');
  }
}
