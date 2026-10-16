import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/observability/measure_trace.dart';
import 'package:measure_flutter/measure_flutter.dart';

void main() {
  test('inferMeasureTraceCaller skips observability frames', () {
    final StackTrace stack = StackTrace.fromString('''
#0      FluxerObservability.traceAsync (package:fluxer_app/core/observability/fluxer_observability.dart:130:5)
#1      main.<anonymous closure> (package:fluxer_app/main.dart:85:33)
#2      _startMicrotaskLoop (dart:async/schedule_microtask.dart:40:35)
''');

    expect(inferMeasureTraceCaller(stack), 'main.dart:85');
  });

  test('measureTraceAttributes adds trace.caller when missing', () {
    final Map<String, AttributeValue> attributes = measureTraceAttributes(
      caller: 'lib/foo.dart:12',
    );

    expect(
      (attributes[kMeasureTraceCallerAttribute]! as StringAttr).value,
      'lib/foo.dart:12',
    );
  });

  test('formatMeasureTraceLogLine includes location and detail', () {
    expect(
      formatMeasureTraceLogLine(
        name: 'gateway.ready.apply',
        durationMs: 240,
        caller: 'lib/core/gateway/gateway_event_handler.dart:317',
        detail: 'class=janky',
      ),
      'trace gateway.ready.apply 240ms at '
      'lib/core/gateway/gateway_event_handler.dart:317 (class=janky)',
    );
  });
}
