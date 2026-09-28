import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/altcha_solver.dart';
import 'package:fluxer_app/core/talker.dart';

const _kCaptchaCodes = {'CAPTCHA_REQUIRED', 'INVALID_CAPTCHA'};

const _kCaptchaInternalKey = '_captchaInternal';

const int _kMaxCaptchaSolves = 2;

const Duration _kSlowSolveHintDelay = Duration(seconds: 2);

class CaptchaInterceptor extends Interceptor {
  CaptchaInterceptor({required this.dio, required this.showSlowSolveHint});

  final Dio dio;

  final VoidCallback Function() showSlowSolveHint;

  Future<void> _solveQueue = Future<void>.value();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.requestOptions.extra[_kCaptchaInternalKey] == true ||
        !_isCaptchaChallenge(err)) {
      handler.next(err);
      return;
    }

    final Map<String, dynamic>? challenge = readAltchaChallenge(
      err.response?.data,
    );
    if (challenge == null) {
      handler.next(err);
      return;
    }

    talker.debug(
      '[CaptchaInterceptor] Challenge received for ${err.requestOptions.path}',
    );
    _enqueueSolve(err, handler, challenge);
  }

  void _enqueueSolve(
    DioException err,
    ErrorInterceptorHandler handler,
    Map<String, dynamic> challenge,
  ) {
    _solveQueue = _solveQueue.then((_) {
      return _solveCaptchaAndRetry(err, handler, challenge).catchError((
        Object e,
        StackTrace st,
      ) {
        talker.error('[CaptchaInterceptor] Unhandled error: $e\n$st');
        handler.next(err);
      });
    });
  }

  Future<void> _solveCaptchaAndRetry(
    DioException err,
    ErrorInterceptorHandler handler,
    Map<String, dynamic> initialChallenge,
  ) async {
    final RequestOptions opts = err.requestOptions;
    Map<String, dynamic> challenge = initialChallenge;

    for (int solve = 1; solve <= _kMaxCaptchaSolves; solve++) {
      final String? token = await _solveWithHint(challenge);
      if (token == null) {
        talker.warning('[CaptchaInterceptor] Solve failed or timed out.');
        handler.next(err);
        return;
      }

      try {
        final Response<dynamic> response = await dio.fetch<dynamic>(
          opts.copyWith(
            headers: <String, dynamic>{
              ...opts.headers,
              'X-Captcha-Token': token,
              'X-Captcha-Type': 'altcha',
            },
            extra: <String, dynamic>{...opts.extra, _kCaptchaInternalKey: true},
          ),
        );
        handler.resolve(response);
        return;
      } on DioException catch (retryError) {
        final Map<String, dynamic>? nextChallenge =
            _isCaptchaChallenge(retryError)
            ? readAltchaChallenge(retryError.response?.data)
            : null;
        if (nextChallenge == null || solve == _kMaxCaptchaSolves) {
          talker.warning(
            '[CaptchaInterceptor] Retry failed: '
            '${retryError.response?.statusCode} ${retryError.message}',
          );
          handler.next(retryError);
          return;
        }
        talker.debug('[CaptchaInterceptor] Token rejected, solving again.');
        challenge = nextChallenge;
      }
    }
  }

  Future<String?> _solveWithHint(Map<String, dynamic> challenge) async {
    VoidCallback? dismissHint;
    final Timer hintTimer = Timer(_kSlowSolveHintDelay, () {
      dismissHint = showSlowSolveHint();
    });
    try {
      return await solveAltchaChallenge(challenge);
    } finally {
      hintTimer.cancel();
      dismissHint?.call();
    }
  }

  bool _isCaptchaChallenge(DioException error) {
    final Response<dynamic>? response = error.response;
    if (response == null || response.statusCode != 400) {
      return false;
    }
    final String? code = _extractErrorCode(response);
    return code != null && _kCaptchaCodes.contains(code);
  }

  String? _extractErrorCode(Response<dynamic> response) {
    final data = response.data;
    if (data is Map<String, dynamic>) {
      return data['code'] as String?;
    }
    if (data is String) {
      try {
        final parsed = jsonDecode(data) as Map<String, dynamic>;
        return parsed['code'] as String?;
      } on Exception {
        return null;
      }
    }
    return null;
  }
}
