import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('no widget feeds taps or layout snapshots to Measure', () {
    final List<String> offenders = <String>[];
    final RegExp tapCapture = RegExp(
      r'\b(MeasureWidget|MsrGestureDetector|trackClick|trackLongClick|'
      r'trackScroll|getLayoutSnapshotWidgetFilter)\b',
    );
    for (final FileSystemEntity entity in Directory(
      'lib',
    ).listSync(recursive: true)) {
      if (entity is! File || !entity.path.endsWith('.dart')) {
        continue;
      }
      if (tapCapture.hasMatch(entity.readAsStringSync())) {
        offenders.add(entity.path);
      }
    }

    expect(offenders, isEmpty);
  });
}
