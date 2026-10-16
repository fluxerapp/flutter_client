import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/observability/measure_log_redaction.dart';
import 'package:measure_flutter/measure_flutter.dart';

const int kMeasureTraceLocalLogMinDurationMs = 16;

const String kMeasureTraceCallerAttribute = 'trace.caller';

enum MeasureTraceKind { app, network }

final RegExp _dartStackFrame = RegExp(r'#\d+\s+.+? \((.+?):(\d+):\d+\)');

bool _isObservabilityFrame(String path) {
  return path.contains('fluxer_observability.dart') ||
      path.contains('measure_trace.dart');
}

@visibleForTesting
String? inferMeasureTraceCaller([StackTrace? stackTrace]) {
  final String trace = (stackTrace ?? StackTrace.current).toString();
  for (final String rawLine in trace.split('\n')) {
    final Match? match = _dartStackFrame.firstMatch(rawLine);
    if (match == null) {
      continue;
    }
    final String path = match.group(1)!;
    if (_isObservabilityFrame(path)) {
      continue;
    }
    if (!path.startsWith('package:fluxer_app/')) {
      continue;
    }
    final String relative = path.replaceFirst('package:fluxer_app/', '');
    final String line = match.group(2)!;
    return scrubForMeasure('$relative:$line');
  }
  return null;
}

Map<String, AttributeValue> measureTraceAttributes({
  Map<String, AttributeValue> attributes = const <String, AttributeValue>{},
  String? caller,
  StackTrace? stackTrace,
}) {
  final String? resolvedCaller = caller ?? inferMeasureTraceCaller(stackTrace);
  if (resolvedCaller == null || resolvedCaller.isEmpty) {
    return attributes;
  }
  if (attributes.containsKey(kMeasureTraceCallerAttribute)) {
    return attributes;
  }
  return <String, AttributeValue>{
    ...attributes,
    kMeasureTraceCallerAttribute: StringAttr(resolvedCaller),
  };
}

String formatMeasureTraceLogLine({
  required String name,
  required int durationMs,
  String? caller,
  String? detail,
  SpanStatus? status,
}) {
  final StringBuffer buffer = StringBuffer('trace $name ${durationMs}ms');
  if (status == SpanStatus.error) {
    buffer.write(' error');
  }
  if (caller != null && caller.isNotEmpty) {
    buffer.write(' at $caller');
  }
  if (detail != null && detail.isNotEmpty) {
    buffer.write(' ($detail)');
  }
  return buffer.toString();
}
