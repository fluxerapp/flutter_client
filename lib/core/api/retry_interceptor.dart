import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/service_unavailable.dart';
import 'package:fluxer_app/core/api/session_authorization_header.dart';

const _kRetryCountKey = '_retryCount';

const kNoRetryKey = 'noRetry';

const Set<DioExceptionType> _kRetryableTypes = {
  DioExceptionType.connectionError,
  DioExceptionType.connectionTimeout,
  DioExceptionType.sendTimeout,
};

const Set<String> _kIdempotentMethods = <String>{
  'GET',
  'HEAD',
  'OPTIONS',
  'PUT',
  'DELETE',
};

bool _isTransientIoFailure(Object? error) =>
    error is SocketException || error is TlsException || error is HttpException;

bool isTransientConnectionError(DioException error) =>
    _kRetryableTypes.contains(error.type) || error.error is HandshakeException;

bool isTransientNetworkError(Object error) {
  if (error is DioException) {
    return isTransientConnectionError(error) ||
        error.type == DioExceptionType.receiveTimeout ||
        (error.type == DioExceptionType.unknown &&
            _isTransientIoFailure(error.error)) ||
        error.response?.statusCode == 429 ||
        isHttpServiceUnavailable(error);
  }
  return error is ServiceUnavailableException ||
      error is TimeoutException ||
      _isTransientIoFailure(error);
}

bool _isSafeToReplay(DioException error) {
  if (error.response?.statusCode == 429) {
    return false;
  }
  if (_kIdempotentMethods.contains(error.requestOptions.method.toUpperCase())) {
    return isTransientNetworkError(error);
  }
  return isTransientConnectionError(error);
}

Duration jitteredBackoff({
  required int attempt,
  required Duration base,
  required Duration cap,
  required Random random,
}) {
  final int exponent = min(max(attempt - 1, 0), 16);
  final int targetMs = min(
    base.inMilliseconds * (1 << exponent),
    cap.inMilliseconds,
  );
  final int jitterRange = (targetMs * 0.25).round();
  if (jitterRange <= 0) {
    return Duration(milliseconds: targetMs);
  }
  final int offset = random.nextInt(jitterRange * 2 + 1) - jitterRange;
  return Duration(milliseconds: max(0, targetMs + offset));
}

int connectionRetryDelayMs({required int attempt, required Random random}) {
  final int baseMs = 250 * (1 << attempt);
  final int jitterRange = (baseMs * 0.25).round();
  if (jitterRange <= 0) {
    return baseMs;
  }
  final int offset = random.nextInt(jitterRange * 2 + 1) - jitterRange;
  return max(0, baseMs + offset);
}

class RetryInterceptor extends Interceptor {
  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.readToken,
    Random? random,
  }) : _random = random ?? Random();

  final Dio dio;
  final int maxRetries;
  final String? Function()? readToken;
  final Random _random;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!_isSafeToReplay(err) ||
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

    if (_sessionChanged(err.requestOptions)) {
      handler.next(err);
      return;
    }

    err.requestOptions.extra[_kRetryCountKey] = attempt;

    try {
      final response = await dio.fetch<dynamic>(err.requestOptions);
      handler.resolve(response);
    } on DioException catch (retryErr) {
      handler.next(retryErr);
    }
  }

  bool _sessionChanged(RequestOptions options) {
    final String? Function()? readToken = this.readToken;
    final Object? sentAuthorization = options.headers['Authorization'];
    if (readToken == null || sentAuthorization == null) {
      return false;
    }
    final String? token = readToken();
    return token == null ||
        token.isEmpty ||
        sentAuthorization != formatSessionAuthorizationHeader(token);
  }
}
