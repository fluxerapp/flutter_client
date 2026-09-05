import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';

void main() {
  group('syncedPreferencesRateLimitRetryDelay', () {
    test('uses Retry-After when present', () {
      expect(
        syncedPreferencesRateLimitRetryDelay(
          consecutive429s: 1,
          retryAfterMs: 5000,
        ),
        const Duration(seconds: 5),
      );
    });

    test('clamps Retry-After between 250ms and 60s', () {
      expect(
        syncedPreferencesRateLimitRetryDelay(
          consecutive429s: 1,
          retryAfterMs: 10,
        ),
        const Duration(milliseconds: 250),
      );
      expect(
        syncedPreferencesRateLimitRetryDelay(
          consecutive429s: 1,
          retryAfterMs: 120000,
        ),
        const Duration(seconds: 60),
      );
    });

    test('falls back to exponential backoff', () {
      expect(
        syncedPreferencesRateLimitRetryDelay(consecutive429s: 1),
        const Duration(seconds: 2),
      );
      expect(
        syncedPreferencesRateLimitRetryDelay(consecutive429s: 2),
        const Duration(seconds: 4),
      );
      expect(
        syncedPreferencesRateLimitRetryDelay(consecutive429s: 6),
        const Duration(seconds: 60),
      );
    });
  });
}
