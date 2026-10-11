import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/retry_interceptor.dart';
import 'package:fluxer_app/core/api/session_auth_interceptor.dart';

DioException _dio({
  int? statusCode,
  DioExceptionType type = DioExceptionType.badResponse,
  Object? error,
}) {
  final RequestOptions options = RequestOptions(path: '/test');
  return DioException(
    requestOptions: options,
    type: type,
    error: error,
    response: statusCode == null
        ? null
        : Response<dynamic>(requestOptions: options, statusCode: statusCode),
  );
}

class _ScriptedAdapter implements HttpClientAdapter {
  _ScriptedAdapter(this._outcomes, {this.onFetch});

  final List<Object> _outcomes;
  final void Function()? onFetch;
  int calls = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final Object outcome = _outcomes[min(calls, _outcomes.length - 1)];
    calls += 1;
    onFetch?.call();
    if (outcome is int) {
      return ResponseBody.fromString('{}', outcome);
    }
    throw outcome as Exception;
  }

  @override
  void close({bool force = false}) {}
}

Dio _retryingDio(_ScriptedAdapter adapter, {String? Function()? readToken}) {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
    ..httpClientAdapter = adapter;
  if (readToken != null) {
    dio.interceptors.add(SessionAuthInterceptor(readToken: readToken));
  }
  dio.interceptors.add(
    RetryInterceptor(dio: dio, random: Random(1), readToken: readToken),
  );
  return dio;
}

void main() {
  group('connectionRetryDelayMs', () {
    test('stays within 25% jitter of the exponential base', () {
      const bases = <int, int>{1: 500, 2: 1000, 3: 2000};
      for (final entry in bases.entries) {
        for (var seed = 0; seed < 40; seed++) {
          final ms = connectionRetryDelayMs(
            attempt: entry.key,
            random: Random(seed),
          );
          final jitter = (entry.value * 0.25).round();
          expect(
            ms,
            inInclusiveRange(entry.value - jitter, entry.value + jitter),
          );
        }
      }
    });
  });

  group('jitteredBackoff', () {
    test('doubles from the base within 25% jitter and stops at the cap', () {
      const Duration base = Duration(seconds: 1);
      const Duration cap = Duration(seconds: 30);
      const Map<int, int> targets = <int, int>{
        1: 1000,
        2: 2000,
        3: 4000,
        6: 30000,
        40: 30000,
      };
      for (final MapEntry<int, int> entry in targets.entries) {
        for (var seed = 0; seed < 40; seed++) {
          final Duration delay = jitteredBackoff(
            attempt: entry.key,
            base: base,
            cap: cap,
            random: Random(seed),
          );
          final int jitter = (entry.value * 0.25).round();
          expect(
            delay.inMilliseconds,
            inInclusiveRange(entry.value - jitter, entry.value + jitter),
          );
        }
      }
    });
  });

  group('isTransientNetworkError', () {
    test('treats TLS, socket and HTTP stream failures as transient', () {
      expect(
        isTransientNetworkError(
          _dio(
            type: DioExceptionType.unknown,
            error: const HandshakeException(
              'Handshake error in client',
              OSError('TLSV1_ALERT_INTERNAL_ERROR'),
            ),
          ),
        ),
        isTrue,
      );
      expect(
        isTransientNetworkError(
          _dio(
            type: DioExceptionType.unknown,
            error: const SocketException('Connection reset by peer'),
          ),
        ),
        isTrue,
      );
      expect(
        isTransientNetworkError(
          _dio(
            type: DioExceptionType.unknown,
            error: const HttpException('Connection closed while receiving'),
          ),
        ),
        isTrue,
      );
      expect(
        isTransientNetworkError(_dio(type: DioExceptionType.connectionError)),
        isTrue,
      );
      expect(
        isTransientNetworkError(_dio(type: DioExceptionType.receiveTimeout)),
        isTrue,
      );
      expect(
        isTransientNetworkError(const SocketException('Network down')),
        isTrue,
      );
    });

    test(
      'counts only failures before the request was sent as connection errors',
      () {
        expect(
          isTransientConnectionError(
            _dio(
              type: DioExceptionType.unknown,
              error: const HandshakeException('Handshake error in client'),
            ),
          ),
          isTrue,
        );
        expect(
          isTransientConnectionError(
            _dio(
              type: DioExceptionType.unknown,
              error: const SocketException('Connection reset by peer'),
            ),
          ),
          isFalse,
        );
      },
    );

    test('treats gateway errors and rate limits as transient', () {
      for (final int status in <int>[429, 502, 503, 504]) {
        expect(isTransientNetworkError(_dio(statusCode: status)), isTrue);
      }
    });

    test('treats other HTTP errors, cancels and app errors as final', () {
      for (final int status in <int>[400, 401, 403, 404, 500]) {
        expect(isTransientNetworkError(_dio(statusCode: status)), isFalse);
      }
      expect(
        isTransientNetworkError(_dio(type: DioExceptionType.cancel)),
        isFalse,
      );
      expect(
        isTransientNetworkError(
          _dio(type: DioExceptionType.unknown, error: StateError('bug')),
        ),
        isFalse,
      );
      expect(isTransientNetworkError(StateError('bug')), isFalse);
    });
  });

  group('RetryInterceptor', () {
    test('replays a request whose TLS handshake failed', () async {
      final _ScriptedAdapter adapter = _ScriptedAdapter(<Object>[
        const HandshakeException(
          'Handshake error in client',
          OSError('TLSV1_ALERT_INTERNAL_ERROR'),
        ),
        200,
      ]);

      final Response<dynamic> response = await _retryingDio(
        adapter,
      ).post<dynamic>('/read-states/ack');

      expect(response.statusCode, 200);
      expect(adapter.calls, 2);
    });

    test('replays an idempotent request after a 503', () async {
      final _ScriptedAdapter adapter = _ScriptedAdapter(<Object>[503, 200]);

      final Response<dynamic> response = await _retryingDio(
        adapter,
      ).get<dynamic>('/channels/1/messages');

      expect(response.statusCode, 200);
      expect(adapter.calls, 2);
    });

    test('does not replay a non-idempotent request after a 503', () async {
      final _ScriptedAdapter adapter = _ScriptedAdapter(<Object>[503, 200]);

      await expectLater(
        _retryingDio(adapter).post<dynamic>('/channels/1/messages'),
        throwsA(isA<DioException>()),
      );
      expect(adapter.calls, 1);
    });

    test(
      'does not replay a POST whose connection dropped mid-request',
      () async {
        final _ScriptedAdapter adapter = _ScriptedAdapter(<Object>[
          const SocketException('Connection reset by peer'),
          200,
        ]);

        await expectLater(
          _retryingDio(adapter).post<dynamic>('/channels/1/messages'),
          throwsA(isA<DioException>()),
        );
        expect(adapter.calls, 1);
      },
    );

    test('does not replay a request after the session changed', () async {
      String token = 'account-a';
      final _ScriptedAdapter adapter = _ScriptedAdapter(<Object>[
        const HandshakeException(
          'Handshake error in client',
          OSError('TLSV1_ALERT_INTERNAL_ERROR'),
        ),
        200,
      ], onFetch: () => token = 'account-b');

      await expectLater(
        _retryingDio(
          adapter,
          readToken: () => token,
        ).put<dynamic>('/users/@me/guilds/1/settings'),
        throwsA(isA<DioException>()),
      );
      expect(adapter.calls, 1);
    });

    test('does not replay a rate-limited request', () async {
      final _ScriptedAdapter adapter = _ScriptedAdapter(<Object>[429, 200]);

      await expectLater(
        _retryingDio(adapter).get<dynamic>('/channels/1/messages'),
        throwsA(isA<DioException>()),
      );
      expect(adapter.calls, 1);
    });
  });
}
