import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('app entry wraps the tree in MeasureWidget on observability builds', () {
    final String mainSource = File('lib/main.dart').readAsStringSync();
    expect(mainSource, contains('FluxerMeasureRoot'));
    expect(mainSource, isNot(contains('MsrGestureDetector(')));

    final String rootSource = File(
      'lib/core/observability/fluxer_measure_root.dart',
    ).readAsStringSync();
    expect(rootSource, contains('MeasureWidget'));
    expect(rootSource, contains('hasObservabilityConfig'));
  });
}
