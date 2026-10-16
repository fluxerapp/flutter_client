import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/observability/fluxer_observability.dart';
import 'package:fluxer_app/core/observability/measure_trace.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:measure_flutter/measure_flutter.dart';
import 'package:talker/talker.dart';

class _SpanCountingMeasure implements MeasureApi {
  int spanStarts = 0;

  @override
  Span startSpan(String name, {int? timestamp}) {
    spanStarts++;
    return Span.invalid();
  }

  @override
  Future<void> start() async {}

  @override
  Future<void> stop() async {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(talker.cleanHistory);
  tearDown(talker.cleanHistory);

  test('network trace kind skips Measure spans and local trace logs', () async {
    final _SpanCountingMeasure measure = _SpanCountingMeasure();
    final FluxerObservability observability = FluxerObservability.forTesting(
      measure,
      () async => true,
    );
    await observability.start();
    talker.cleanHistory();

    await observability.traceAsync('api.users.me', () async {
      await Future<void>.delayed(const Duration(milliseconds: 20));
    }, kind: MeasureTraceKind.network);

    expect(measure.spanStarts, 0);
    expect(
      talker.history.where(
        (TalkerData entry) => entry.message?.contains('trace ') ?? false,
      ),
      isEmpty,
    );
  });

  test('app trace kind creates a Measure span', () async {
    final _SpanCountingMeasure measure = _SpanCountingMeasure();
    final FluxerObservability observability = FluxerObservability.forTesting(
      measure,
      () async => true,
    );
    await observability.start();

    await observability.traceAsync('startup.session.restore', () async {});

    expect(measure.spanStarts, 1);
  });
}
