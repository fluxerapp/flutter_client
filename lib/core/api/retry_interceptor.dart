import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Key used in [RequestOptions.extra] to track retry attempts.
const _kRetryCountKey = '_retryCount';

/// Set to `true` in [RequestOptions.extra] to skip retry logic.
const kNoRetryKey = 'noRetry';

/// Retryable [DioExceptionType]s — transient connection-level failures.
const Set<DioExceptionType> _kRetryableTypes = {
  DioExceptionType.connectionError,
  DioExceptionType.connectionTimeout,
  DioExceptionType.sendTimeout,
};

int connectionRetryDelayMs({required int attempt, required Random random}) {
  final int baseMs = 250 * (1 << attempt);
  final int jitterRange = (baseMs * 0.25).round();
  if (jitterRange <= 0) {
    return baseMs;
  }
  final int offset = random.nextInt(jitterRange * 2 + 1) - jitterRange;
  return max(0, baseMs + offset);
}

/// Dio interceptor that retries requests on transient connection errors
/// (e.g. "Connection reset by peer", connection timeouts).
///
/// Uses exponential backoff with jitter: 500ms → 1s → 2s, ±25%.
///
/// Retry count is tracked in [RequestOptions.extra] because
/// [Dio.fetch] sends the retry through the full interceptor chain,
/// so each failure re-enters [onError] rather than being caught by
/// the caller.
class RetryInterceptor extends Interceptor {
  RetryInterceptor({required this.dio, this.maxRetries = 3, Random? random})
    : _random = random ?? Random();

  final Dio dio;
  final int maxRetries;
  final Random _random;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!_kRetryableTypes.contains(err.type) ||
        err.requestOptions.extra[kNoRetryKey] == true) {
      handler.next(err);
      return;
    }

    final attempt = err.requestOptions.extra[_kRetryCountKey] as int? ?? 0;
    if (attempt >= maxRetries) {
      handler.next(err);
      return;
    }

    unawaited(_retry(err, handler, attempt));
  }

  Future<void> _retry(
    DioException err,
    ErrorInterceptorHandler handler,
    int previousAttempt,
  ) async {
    final attempt = previousAttempt + 1;
    final delay = Duration(
      milliseconds: connectionRetryDelayMs(attempt: attempt, random: _random),
    );

    if (kDebugMode) {
      debugPrint(
        '[RetryInterceptor] attempt $attempt/$maxRetries '
        'after ${delay.inMilliseconds}ms — '
        '${err.type.name}: ${err.message}',
      );
    }

    await Future<void>.delayed(delay);

    err.requestOptions.extra[_kRetryCountKey] = attempt;

    try {
      final response = await dio.fetch<dynamic>(err.requestOptions);
      handler.resolve(response);
    } on DioException catch (retryErr) {
      handler.next(retryErr);
    }
  }
}
