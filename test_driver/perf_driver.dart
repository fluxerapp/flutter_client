import 'dart:convert';
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/integration_test_driver.dart';

const String _perfOutputDirectory = 'build/perf';

Future<void> main() => integrationDriver(
  responseDataCallback: (Map<String, dynamic>? data) async {
    if (data == null) {
      return;
    }
    for (final MapEntry<String, dynamic> entry in data.entries) {
      final dynamic value = entry.value;
      if (value is! Map<String, dynamic>) {
        continue;
      }
      try {
        final TimelineSummary summary = TimelineSummary.summarize(
          Timeline.fromJson(value),
        );
        await summary.writeTimelineToFile(
          entry.key,
          pretty: true,
          destinationDirectory: _perfOutputDirectory,
        );
        // TimelineSummary.summarize asserts rasterizer events exist, so a trace
        // recorded without the Embedder stream reaches here as a StateError.
        // ignore: avoid_catching_errors
      } on StateError {
        stdout.writeln(
          'summary skipped for ${entry.key}: no rasterizer events in trace',
        );
        await Directory(_perfOutputDirectory).create(recursive: true);
        await File(
          '$_perfOutputDirectory/${entry.key}.timeline.json',
        ).writeAsString(jsonEncode(value));
      }
    }
    await writeResponseData(data, destinationDirectory: _perfOutputDirectory);
  },
);
