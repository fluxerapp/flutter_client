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
  // A fling plus pause costs ~7.8k timeline events, the ring buffer holds
  // ~32k: more than three flings and the earlier ones are evicted.
  int flingCount = IntegrationTestConfig.perfFlingCount,
  Offset direction = const Offset(0, -1200),
  Duration pause = const Duration(milliseconds: 150),
}) async {
  final LiveTestWidgetsFlutterBindingFramePolicy previousPolicy =
      binding.framePolicy;
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  // The SEMANTICS phase cost ~9.7 ms on slow frames, which a production build
  // without an accessibility service never pays: the test harness forces the
  // tree on. Drop it for the traced window only, so bootstrap finders still
  // work either side.
  if (!IntegrationTestConfig.perfSemantics) {
    releaseFinderSemantics();
  }
  // Per-widget timeline events. Profile mode honours these (`!kReleaseMode &&`
  // guards at widgets/framework.dart:2751 and rendering/object.dart:2812), but
  // each element costs an event and the VM ring holds ~32k, so tracing both at
  // once truncates the window. PERF_WIDGET_EVENTS=builds or =layouts traces one
  // stream at a time; =1 traces both and will truncate.
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
      // 'all' floods the ~32k event VM timeline ring buffer: the API stream
      // alone was 86% of it, evicting the scroll that was being measured.
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
