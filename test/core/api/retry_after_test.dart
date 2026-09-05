import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/retry_after.dart';

Headers _headers(Map<String, String> values) {
  return Headers.fromMap(
    values.map((key, value) => MapEntry(key, <String>[value])),
  );
}

void main() {
  group('transportRateLimitDelayMs', () {
    test('prefers X-RateLimit-Reset-After over Retry-After', () {
      expect(
        transportRateLimitDelayMs(
          headers: _headers(<String, String>{
            'x-ratelimit-reset-after': '1.25',
            'retry-after': '5',
          }),
          data: <String, dynamic>{'retry_after': 9},
        ),
        1250,
      );
    });

    test('uses Retry-After when reset-after is missing', () {
      expect(
        transportRateLimitDelayMs(
          headers: _headers(<String, String>{'retry-after': '3'}),
        ),
        3000,
      );
    });

    test('reads an HTTP-date Retry-After as remaining duration', () {
      final now = DateTime.utc(2026, 1, 27, 12);
      expect(
        transportRateLimitDelayMs(
          headers: _headers(<String, String>{
            'retry-after': 'Tue, 27 Jan 2026 12:00:03 GMT',
          }),
          now: () => now,
        ),
        3000,
      );
    });

    test('falls back to body retry_after then 1s', () {
      expect(
        transportRateLimitDelayMs(data: <String, dynamic>{'retry_after': 2.5}),
        2500,
      );
      expect(transportRateLimitDelayMs(), 1000);
    });
  });

  group('featureRetryAfterMs', () {
    test('prefers nested after_seconds over body and headers', () {
      expect(
        featureRetryAfterMs(
          headers: _headers(<String, String>{'retry-after': '30'}),
          data: <String, dynamic>{
            'retry_after': 30,
            'details': <String, dynamic>{
              'retry': <String, dynamic>{'after_seconds': 2.5},
            },
          },
        ),
        2500,
      );
    });

    test('falls back to Retry-After then reset-after', () {
      expect(
        featureRetryAfterMs(
          headers: _headers(<String, String>{'retry-after': '3'}),
        ),
        3000,
      );
      expect(
        featureRetryAfterMs(
          headers: _headers(<String, String>{
            'x-ratelimit-reset-after': '1.25',
          }),
        ),
        1250,
      );
    });
  });

  group('isGlobalRateLimit', () {
    test('reads the header or body flag', () {
      expect(
        isGlobalRateLimit(
          headers: _headers(<String, String>{'x-ratelimit-global': 'true'}),
        ),
        isTrue,
      );
      expect(
        isGlobalRateLimit(data: <String, dynamic>{'global': true}),
        isTrue,
      );
      expect(isGlobalRateLimit(), isFalse);
    });
  });
}
