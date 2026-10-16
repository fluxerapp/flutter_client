import 'package:fluxer_app/core/observability/measure_log_redaction.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:measure_flutter/measure_flutter.dart';

typedef FluxerMeasureHttpTrackingGate = bool Function(Uri requestUri);

const int kMeasureHttpLocalLogMinDurationMs = 500;

int measureHttpDurationMs({required int startTime, required int endTime}) {
  final int duration = endTime - startTime;
  return duration < 0 ? 0 : duration;
}

String formatMeasureHttpLogLine({
  required String method,
  required String url,
  required int durationMs,
  int? statusCode,
  String? failureReason,
}) {
  final StringBuffer buffer = StringBuffer('http $method $url ${durationMs}ms');
  if (statusCode != null) {
    buffer.write(' status=$statusCode');
  }
  if (failureReason != null && failureReason.isNotEmpty) {
    buffer.write(' failure=$failureReason');
  }
  return buffer.toString();
}

void logSlowMeasureHttpIfNeeded({
  required String method,
  required String url,
  required int durationMs,
  int? statusCode,
  String? failureReason,
}) {
  if (durationMs < kMeasureHttpLocalLogMinDurationMs &&
      (failureReason == null || failureReason.isEmpty)) {
    return;
  }
  talker.info(
    '[Measure] ${formatMeasureHttpLogLine(method: method, url: url, durationMs: durationMs, statusCode: statusCode, failureReason: failureReason)}',
  );
}

void trackFluxerMeasureHttpEvent({
  required MeasureApi measure,
  required String url,
  required String method,
  required int startTime,
  required int endTime,
  int? statusCode,
  String? failureReason,
  String? failureDescription,
  bool logLocally = true,
}) {
  final String? scrubbedFailureReason = failureReason == null
      ? null
      : scrubForMeasure(failureReason);
  final String? scrubbedFailureDescription = failureDescription == null
      ? null
      : scrubForMeasure(failureDescription);

  measure.trackHttpEvent(
    url: url,
    method: HttpMethod.fromString(method),
    startTime: startTime,
    endTime: endTime,
    statusCode: statusCode,
    failureReason: scrubbedFailureReason,
    failureDescription: scrubbedFailureDescription,
    client: 'dio',
  );
  if (!logLocally) {
    return;
  }
  final int durationMs = measureHttpDurationMs(
    startTime: startTime,
    endTime: endTime,
  );
  logSlowMeasureHttpIfNeeded(
    method: method.toUpperCase(),
    url: url,
    durationMs: durationMs,
    statusCode: statusCode,
    failureReason: scrubbedFailureReason,
  );
}
