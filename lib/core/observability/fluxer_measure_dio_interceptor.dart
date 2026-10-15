import 'dart:collection';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/observability/measure_log_redaction.dart';
import 'package:measure_flutter/measure_flutter.dart';

class FluxerMeasureDioInterceptor extends Interceptor {
  final HashMap<RequestOptions, int> _requestsStartTime =
      HashMap<RequestOptions, int>();
  final MeasureApi _measure;

  FluxerMeasureDioInterceptor() : _measure = Measure.instance;

  @visibleForTesting
  FluxerMeasureDioInterceptor.withMeasure(this._measure);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _requestsStartTime[options] = Measure.instance.getCurrentTime();
    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    final String rawUrl = response.requestOptions.uri.toString();
    if (!_measure.shouldTrackHttpEvent(rawUrl)) {
      handler.next(response);
      return;
    }

    try {
      final RequestOptions request = response.requestOptions;
      final String url = _getRequestUrl(request);
      final String method = _getMethod(request);
      final int? startTime = _requestsStartTime[request];
      final int endTime = Measure.instance.getCurrentTime();

      if (startTime == null) {
        developer.log('Failed to track http event, unable to get start time');
        return;
      }

      _measure.trackHttpEvent(
        url: url,
        method: HttpMethod.fromString(method),
        startTime: startTime,
        endTime: endTime,
        statusCode: response.statusCode,
        client: 'dio',
      );
    } catch (e, stacktrace) {
      _logInternalError(e, stacktrace);
    } finally {
      handler.next(response);
      _requestsStartTime.remove(response.requestOptions);
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      final RequestOptions request = err.requestOptions;
      final String url = _getRequestUrl(request);
      final String method = _getMethod(request);
      final int startTime =
          _requestsStartTime[request] ?? Measure.instance.getCurrentTime();
      final int endTime = Measure.instance.getCurrentTime();
      final String failureReason = _getFailureReason(err);
      final String? failureDescription = _getFailureDescription(err);

      _measure.trackHttpEvent(
        url: url,
        method: HttpMethod.fromString(method),
        startTime: startTime,
        endTime: endTime,
        failureReason: failureReason,
        failureDescription: failureDescription,
        client: 'dio',
      );
    } catch (e, stacktrace) {
      _logInternalError(e, stacktrace);
    } finally {
      handler.next(err);
      _requestsStartTime.remove(err.requestOptions);
    }
  }

  String _getMethod(RequestOptions request) {
    return request.method.toLowerCase();
  }

  String _getFailureReason(DioException err) {
    if (err.type != DioExceptionType.unknown) {
      return err.type.toString();
    }
    return err.runtimeType.toString();
  }

  String? _getFailureDescription(DioException err) {
    final String? description = err.message ?? err.error?.toString();
    if (description == null) {
      return null;
    }
    return scrubForMeasure(description);
  }

  String _getRequestUrl(RequestOptions request) {
    return redactMeasureHttpUrl(request.uri.toString());
  }

  void _logInternalError(Object e, StackTrace stacktrace) {
    developer.log(
      'Failed to track HTTP event',
      error: e,
      stackTrace: stacktrace,
      name: 'fluxer-measure-dio',
    );
  }
}
