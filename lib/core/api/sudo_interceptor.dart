import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/talker.dart';

const kSudoTokenHeader = 'x-fluxer-sudo-mode-jwt';

const _kSudoInternalKey = '_sudoInternal';

const _kSudoTokenLifetime = Duration(minutes: 4, seconds: 30);

const int _kMaxSudoReissues = 1;

const Set<String> _kSudoVerificationFields = <String>{
  'password',
  'mfa_method',
  'mfa_code',
  'webauthn_response',
  'webauthn_challenge',
};

class SudoChallenge {
  const SudoChallenge({
    required this.hasMfa,
    required this.totp,
    required this.webauthn,
    required this.backupCodes,
    this.error,
  });

  factory SudoChallenge.fromResponseData(Map<String, dynamic>? data) {
    final Object? methods = data?['methods'];
    final Map<String, dynamic> methodMap = methods is Map<String, dynamic>
        ? methods
        : const <String, dynamic>{};
    return SudoChallenge(
      hasMfa: data?['has_mfa'] == true,
      totp: methodMap['totp'] == true,
      webauthn: methodMap['webauthn'] == true,
      backupCodes: methodMap['backup_codes'] == true,
    );
  }

  final bool hasMfa;
  final bool totp;
  final bool webauthn;
  final bool backupCodes;
  final String? error;

  SudoChallenge withError(String? error) => SudoChallenge(
    hasMfa: hasMfa,
    totp: totp,
    webauthn: webauthn,
    backupCodes: backupCodes,
    error: error,
  );
}

class SudoInterceptor extends Interceptor {
  SudoInterceptor({required this.dio, required this.showSudoSheet});

  final Dio dio;

  final Future<Map<String, dynamic>?> Function(SudoChallenge challenge)
  showSudoSheet;

  String? _cachedToken;
  DateTime? _cachedTokenExpiry;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _cachedToken;
    final expiry = _cachedTokenExpiry;

    if (token != null &&
        expiry != null &&
        DateTime.now().isBefore(expiry) &&
        options.extra[_kSudoInternalKey] != true) {
      options.headers[kSudoTokenHeader] = token;
    }

    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _extractAndCacheToken(response);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.requestOptions.extra[_kSudoInternalKey] == true) {
      handler.next(err);
      return;
    }

    final response = err.response;
    if (response == null || response.statusCode != 403) {
      handler.next(err);
      return;
    }

    final Map<String, dynamic>? body = _responseBody(response);
    if (body?['code'] != 'SUDO_MODE_REQUIRED') {
      handler.next(err);
      return;
    }

    _cachedToken = null;
    _cachedTokenExpiry = null;

    talker.debug(
      '[SudoInterceptor] Challenge received for ${err.requestOptions.path}',
    );
    unawaited(
      _verifyAndRetry(err, SudoChallenge.fromResponseData(body), handler),
    );
  }

  Future<void> _verifyAndRetry(
    DioException err,
    SudoChallenge initialChallenge,
    ErrorInterceptorHandler handler,
  ) async {
    SudoChallenge challenge = initialChallenge;
    final RequestOptions opts = err.requestOptions;
    final Object? originalData = opts.data;
    DioException lastError = err;
    int reissues = 0;
    try {
      while (true) {
        final credentials = await showSudoSheet(challenge);

        if (credentials == null || credentials.isEmpty) {
          talker.debug('[SudoInterceptor] User cancelled verification');
          handler.next(lastError);
          return;
        }

        _mergeCredentials(opts, originalData, credentials);
        opts.extra[_kSudoInternalKey] = true;

        talker.debug('[SudoInterceptor] Retrying with credentials');
        try {
          final retryResponse = await dio.fetch<dynamic>(opts);
          _extractAndCacheToken(retryResponse);
          handler.resolve(retryResponse);
          return;
        } on DioException catch (retryError) {
          final retryResponse = retryError.response;
          if (retryResponse != null) {
            _extractAndCacheToken(retryResponse);
          }
          talker.warning(
            '[SudoInterceptor] Retry failed: '
            '${retryResponse?.statusCode} ${retryError.message}',
          );
          lastError = retryError;
          final Map<String, dynamic>? body = retryResponse == null
              ? null
              : _responseBody(retryResponse);
          if (retryResponse?.statusCode == 400 &&
              _isSudoVerificationFailure(body)) {
            reissues = 0;
            challenge = challenge.withError(
              apiMessageFromDioException(retryError),
            );
            continue;
          }
          if (retryResponse?.statusCode == 403 &&
              body?['code'] == 'SUDO_MODE_REQUIRED' &&
              reissues < _kMaxSudoReissues) {
            reissues++;
            challenge = SudoChallenge.fromResponseData(body);
            continue;
          }
          handler.next(retryError);
          return;
        }
      }
    } on Exception catch (e) {
      talker.error('[SudoInterceptor] Unexpected error: $e');
      handler.next(lastError);
    }
  }

  bool _isSudoVerificationFailure(Map<String, dynamic>? body) {
    if (body?['code'] != 'INVALID_FORM_BODY') {
      return false;
    }
    final Object? errors = body?['errors'];
    if (errors is! List<dynamic>) {
      return false;
    }
    return errors.any(
      (Object? error) =>
          error is Map<String, dynamic> &&
          _kSudoVerificationFields.contains(error['path']),
    );
  }

  void _mergeCredentials(
    RequestOptions opts,
    Object? data,
    Map<String, dynamic> credentials,
  ) {
    if (data is Map) {
      opts.data = <String, dynamic>{
        for (final entry in data.entries)
          if (entry.key is String) entry.key as String: entry.value,
        ...credentials,
      };
    } else if (data == null) {
      opts.data = Map<String, dynamic>.from(credentials);
    } else {
      throw StateError(
        'Cannot merge sudo credentials into non-map request body: '
        '${data.runtimeType}',
      );
    }
  }

  void _extractAndCacheToken(Response<dynamic> response) {
    final token = response.headers.value(kSudoTokenHeader);
    if (token != null && token.isNotEmpty) {
      _cachedToken = token;
      _cachedTokenExpiry = DateTime.now().add(_kSudoTokenLifetime);
      talker.debug('[SudoInterceptor] Cached sudo token');
    }
  }

  Map<String, dynamic>? _responseBody(Response<dynamic> response) {
    final data = response.data;
    if (data is Map<String, dynamic>) {
      return data;
    }
    if (data is String) {
      try {
        final Object? parsed = jsonDecode(data);
        return parsed is Map<String, dynamic> ? parsed : null;
      } on FormatException {
        return null;
      }
    }
    return null;
  }
}
