import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/retry_interceptor.dart';

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
}
