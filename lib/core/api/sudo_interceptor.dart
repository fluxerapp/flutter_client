import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluxer_app/core/talker.dart';

/// Header used to send and receive the sudo mode JWT token.
const kSudoTokenHeader = 'x-fluxer-sudo-mode-jwt';

/// Key in [RequestOptions.extra] to mark requests made internally by the
/// sudo interceptor (retry after verification), preventing re-entrant
/// verification prompts.
const _kSudoInternalKey = '_sudoInternal';

/// How long a sudo token stays valid before we discard it and re-prompt.
const _kSudoTokenLifetime = Duration(minutes: 4, seconds: 30);

/// Dio interceptor that handles sudo mode challenges from the Fluxer API.
///
/// When a response with status 403 and error code `SUDO_MODE_REQUIRED` is
/// received, the interceptor:
/// 1. Shows a verification bottom sheet to collect credentials.
/// 2. Merges the verification payload into the original request body.
/// 3. Retries the request.
/// 4. Caches the returned `x-fluxer-sudo-mode-jwt` token for subsequent
///    requests within a 4.5-minute window.
class SudoInterceptor extends Interceptor {
  SudoInterceptor({required this.dio, required this.showSudoSheet});

  /// The Dio instance used to retry requests.
  final Dio dio;

  /// Callback that shows the sudo verification bottom sheet and returns
  /// the verification payload as a map (e.g. `{'password': '...'}` or
  /// `{'mfa_method': 'totp', 'mfa_code': '...'}`).
  /// Returns `null` if the user cancels.
  final Future<Map<String, dynamic>?> Function() showSudoSheet;

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

    final code = _extractErrorCode(response);
    if (code != 'SUDO_MODE_REQUIRED') {
      handler.next(err);
      return;
    }

    // Invalidate any stale cached token since the server rejected us.
    _cachedToken = null;
    _cachedTokenExpiry = null;

    talker.debug(
      '[SudoInterceptor] Challenge received for ${err.requestOptions.path}',
    );
    unawaited(_verifyAndRetry(err, handler));
  }

  Future<void> _verifyAndRetry(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      final credentials = await showSudoSheet();

      if (credentials == null || credentials.isEmpty) {
        talker.debug('[SudoInterceptor] User cancelled verification');
        handler.next(err);
        return;
      }

      final opts = err.requestOptions;
      _mergeCredentials(opts, credentials);
      opts.extra[_kSudoInternalKey] = true;

      talker.debug('[SudoInterceptor] Retrying with credentials');
      final retryResponse = await dio.fetch<dynamic>(opts);
      _extractAndCacheToken(retryResponse);
      handler.resolve(retryResponse);
    } on DioException catch (retryError) {
      final retryResponse = retryError.response;
      if (retryResponse != null) {
        _extractAndCacheToken(retryResponse);
      }
      talker.warning(
        '[SudoInterceptor] Retry failed: '
        '${retryError.response?.statusCode} ${retryError.message}',
      );
      handler.next(retryError);
    } on Exception catch (e) {
      talker.error('[SudoInterceptor] Unexpected error: $e');
      handler.next(err);
    }
  }

  void _mergeCredentials(
    RequestOptions opts,
    Map<String, dynamic> credentials,
  ) {
    final data = opts.data;
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

  String? _extractErrorCode(Response<dynamic> response) {
    final data = response.data;
    if (data is Map) {
      final code = data['code'];
      return code is String ? code : null;
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
