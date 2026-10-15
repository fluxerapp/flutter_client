import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/observability/observability_reporting_provider.dart';

String _source(String path) => File(path).readAsStringSync();

void main() {
  const String nativeKey = 'flutter.$kObservabilityReportingEnabledKey';

  test('iOS starts Measure at launch only from the saved switch', () {
    final String appDelegate = _source('ios/Runner/AppDelegate.swift');

    expect(appDelegate, contains('"$nativeKey"'));
    expect(appDelegate, contains('BaseMeasureConfig(autoStart: false)'));
    expect(
      RegExp(r'Measure\.initialize\(').allMatches(appDelegate),
      hasLength(1),
    );
    expect(appDelegate, contains('"fluxer_app/measure_reporting"'));
  });

  test('Android starts Measure at launch only from the saved switch', () {
    final String reporting = _source(
      'android/app/src/main/kotlin/com/fluxer/MeasureReporting.kt',
    );
    final String application = _source(
      'android/app/src/main/kotlin/com/fluxer/FluxerApplication.kt',
    );

    expect(reporting, contains('"$nativeKey"'));
    expect(reporting, contains('"FlutterSharedPreferences"'));
    expect(reporting, contains('MeasureConfig(autoStart = false)'));
    expect(reporting, contains('"fluxer_app/measure_reporting"'));
    expect(application, isNot(contains('Measure.init')));
    expect(application, contains('MeasureReporting.startIfEnabled(this)'));
  });

  test('iOS limits native HTTP capture to an unused session config', () {
    final String appDelegate = _source('ios/Runner/AppDelegate.swift');
    final int interceptor = appDelegate.indexOf(
      'MSRNetworkInterceptor.enable(on: URLSessionConfiguration.ephemeral)',
    );

    expect(interceptor, isNonNegative);
    expect(interceptor, lessThan(appDelegate.indexOf('Measure.initialize(')));
  });
}
