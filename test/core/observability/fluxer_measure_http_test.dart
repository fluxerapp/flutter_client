import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/observability/fluxer_measure_http.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:measure_flutter/measure_flutter.dart';

class _HttpRecordingMeasure implements MeasureApi {
  int httpEvents = 0;
  String? lastUrl;
  String? lastMethod;
  Map<String, String>? lastRequestHeaders;
  Map<String, String>? lastResponseHeaders;
  String? lastRequestBody;
  String? lastResponseBody;

  @override
  void trackHttpEvent({
    required String url,
    required HttpMethod method,
    required int startTime,
    required int endTime,
    int? statusCode,
    String? failureReason,
    String? failureDescription,
    Map<String, String>? requestHeaders,
    Map<String, String>? responseHeaders,
    String? requestBody,
    String? responseBody,
    String? client,
  }) {
    httpEvents++;
    lastUrl = url;
    lastMethod = method.name;
    lastRequestHeaders = requestHeaders;
    lastResponseHeaders = responseHeaders;
    lastRequestBody = requestBody;
    lastResponseBody = responseBody;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  setUp(talker.cleanHistory);
  tearDown(talker.cleanHistory);

  test('trackFluxerMeasureHttpEvent sends Measure http events', () {
    final _HttpRecordingMeasure measure = _HttpRecordingMeasure();

    trackFluxerMeasureHttpEvent(
      measure: measure,
      url: 'https://instance/api/v1/users/@me',
      method: 'get',
      startTime: 1000,
      endTime: 1600,
      statusCode: 200,
      logLocally: false,
    );

    expect(measure.httpEvents, 1);
    expect(measure.lastMethod, 'get');
    expect(measure.lastUrl, 'https://instance/api/v1/users/@me');
    expect(measure.lastRequestHeaders, isNull);
    expect(measure.lastResponseHeaders, isNull);
    expect(measure.lastRequestBody, isNull);
    expect(measure.lastResponseBody, isNull);
  });

  test('logSlowMeasureHttpIfNeeded skips fast successful calls', () {
    logSlowMeasureHttpIfNeeded(
      method: 'GET',
      url: 'https://instance/api/v1/ping',
      durationMs: 40,
      statusCode: 200,
    );

    expect(talker.history, isEmpty);
  });

  test('logSlowMeasureHttpIfNeeded records slow http in talker', () {
    logSlowMeasureHttpIfNeeded(
      method: 'GET',
      url: 'https://instance/api/v1/users/@me',
      durationMs: 1200,
      statusCode: 200,
    );

    expect(talker.history, hasLength(1));
    expect(
      talker.history.single.message,
      contains('[Measure] http GET https://instance/api/v1/users/@me 1200ms'),
    );
  });
}
