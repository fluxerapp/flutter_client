import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/observability/error_log_rate_limiter.dart';

void main() {
  test('suppresses duplicate errors within cooldown', () {
    final ErrorLogRateLimiter limiter = ErrorLogRateLimiter();
    final Object error = StateError('boom');
    final StackTrace stack = StackTrace.fromString('#0 main');

    expect(
      limiter.shouldLog(error: error, stackTrace: stack, source: 'widgets'),
      isTrue,
    );
    expect(
      limiter.shouldLog(error: error, stackTrace: stack, source: 'widgets'),
      isFalse,
    );
    expect(
      limiter.suppressedCount(
        error: error,
        stackTrace: stack,
        source: 'widgets',
      ),
      1,
    );
  });

  test('allows same error after cooldown', () {
    final ErrorLogRateLimiter limiter = ErrorLogRateLimiter(
      cooldown: const Duration(milliseconds: 1),
    );
    final Object error = StateError('boom');

    expect(limiter.shouldLog(error: error, source: 'widgets'), isTrue);
    expect(limiter.shouldLog(error: error, source: 'widgets'), isFalse);
  });

  test('prunes stale entries when threshold is reached', () async {
    final ErrorLogRateLimiter limiter = ErrorLogRateLimiter(
      cooldown: const Duration(milliseconds: 10),
      pruneThreshold: 1,
    );

    expect(
      limiter.shouldLog(error: StateError('a'), source: 'widgets'),
      isTrue,
    );
    await Future<void>.delayed(const Duration(milliseconds: 20));
    expect(
      limiter.shouldLog(error: StateError('b'), source: 'widgets'),
      isTrue,
    );

    expect(
      limiter.suppressedCount(error: StateError('a'), source: 'widgets'),
      0,
    );
  });
}
