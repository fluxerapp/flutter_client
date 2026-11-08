import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/observability/fluxer_observability.dart';
import 'package:measure_flutter/measure_flutter.dart';

enum StartupShellSource { cache, live }

class StartupTimeline {
  StartupTimeline._();

  static final StartupTimeline instance = StartupTimeline._();

  final Stopwatch _stopwatch = Stopwatch();
  StartupShellSource? _shellSource;
  bool _firstFrameRecorded = false;
  bool _shellRecorded = false;
  bool _liveRecorded = false;

  void start() {
    if (_stopwatch.isRunning) {
      return;
    }
    _stopwatch.start();
  }

  Duration get elapsed => _stopwatch.elapsed;

  void markFirstFrame() {
    if (_firstFrameRecorded || !_stopwatch.isRunning) {
      return;
    }
    _firstFrameRecorded = true;
    final Duration elapsed = _stopwatch.elapsed;
    debugPrint(
      '[StartupTimeline] startup.first_frame=${elapsed.inMilliseconds}ms',
    );
    FluxerObservability.instance.recordMilestone(
      'startup.first_frame',
      elapsed: elapsed,
    );
  }

  void markShellShown(StartupShellSource source) {
    if (_shellRecorded || !_stopwatch.isRunning) {
      return;
    }
    _shellRecorded = true;
    _shellSource = source;
    _record('startup.time_to_shell', source);
  }

  void markLive() {
    if (_liveRecorded || !_stopwatch.isRunning) {
      return;
    }
    _liveRecorded = true;
    _record('startup.time_to_live', _shellSource ?? StartupShellSource.live);
  }

  void _record(String name, StartupShellSource source) {
    final Duration elapsed = _stopwatch.elapsed;
    debugPrint(
      '[StartupTimeline] $name=${elapsed.inMilliseconds}ms '
      'source=${source.name}',
    );
    FluxerObservability.instance.recordMilestone(
      name,
      elapsed: elapsed,
      attributes: <String, AttributeValue>{
        'startup.source': StringAttr(source.name),
      },
    );
  }

  @visibleForTesting
  void resetForTest() {
    _stopwatch
      ..stop()
      ..reset();
    _shellSource = null;
    _firstFrameRecorded = false;
    _shellRecorded = false;
    _liveRecorded = false;
  }
}
