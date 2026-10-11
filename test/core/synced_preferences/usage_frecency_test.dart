import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/usage_frecency.dart';

const int _day = 24 * 60 * 60 * 1000;
const int _now = 1_800_000_000_000;

void main() {
  group('usageFrecencyScore', () {
    test('is log2(count + 1) with a seven day half-life', () {
      expect(
        usageFrecencyScore(const UsageEntry(count: 3, lastUsedMs: _now), _now),
        closeTo(2, 1e-12),
      );
      expect(
        usageFrecencyScore(
          const UsageEntry(count: 3, lastUsedMs: _now - 7 * _day),
          _now,
        ),
        closeTo(1, 1e-12),
      );
      expect(
        usageFrecencyScore(
          const UsageEntry(count: 7, lastUsedMs: _now - 14 * _day),
          _now,
        ),
        closeTo(3 * 0.25, 1e-12),
      );
    });

    test('treats a future lastUsed as age zero', () {
      expect(
        usageFrecencyScore(
          const UsageEntry(count: 1, lastUsedMs: _now + _day),
          _now,
        ),
        closeTo(1, 1e-12),
      );
    });
  });

  group('bumpUsageEntry', () {
    test('increments the count and stamps now', () {
      expect(
        bumpUsageEntry(const UsageEntry(count: 4, lastUsedMs: 1), _now),
        const UsageEntry(count: 5, lastUsedMs: _now),
      );
      expect(
        bumpUsageEntry(null, _now),
        const UsageEntry(count: 1, lastUsedMs: _now),
      );
    });

    test('caps the count at 100000', () {
      expect(
        bumpUsageEntry(const UsageEntry(count: 100000, lastUsedMs: 1), _now),
        const UsageEntry(count: 100000, lastUsedMs: _now),
      );
    });
  });

  group('rankUsageKeys', () {
    test('orders by score, then lastUsed, then count, then key', () {
      final ranked = rankUsageKeys({
        'unicode:b': const UsageEntry(count: 1, lastUsedMs: _now),
        'unicode:a': const UsageEntry(count: 1, lastUsedMs: _now),
        'unicode:old_heavy': const UsageEntry(
          count: 63,
          lastUsedMs: _now - 35 * _day,
        ),
        'unicode:top': const UsageEntry(count: 15, lastUsedMs: _now),
        'unicode:same_score_newer': const UsageEntry(
          count: 3,
          lastUsedMs: _now - 7 * _day + 1,
        ),
      }, _now);
      expect(ranked, [
        'unicode:top',
        'unicode:same_score_newer',
        'unicode:a',
        'unicode:b',
        'unicode:old_heavy',
      ]);
    });
  });

  group('sanitizeUsageMap', () {
    test('drops invalid keys and entries and clamps values', () {
      final sanitized = sanitizeUsageMap({
        '': const UsageEntry(count: 2, lastUsedMs: _now),
        'x' * 257: const UsageEntry(count: 2, lastUsedMs: _now),
        'zero': const UsageEntry(count: 0, lastUsedMs: _now),
        'future': const UsageEntry(count: 2, lastUsedMs: _now + _day),
        'negative': const UsageEntry(count: 2, lastUsedMs: -5),
        'huge': const UsageEntry(count: 200000, lastUsedMs: _now),
      }, _now);
      expect(sanitized, {
        'future': const UsageEntry(count: 2, lastUsedMs: _now),
        'negative': const UsageEntry(count: 2, lastUsedMs: 0),
        'huge': const UsageEntry(count: 100000, lastUsedMs: _now),
      });
    });

    test('keeps the 200 best scored keys when over the cap', () {
      final input = <String, UsageEntry>{
        for (var i = 0; i < 250; i++)
          'unicode:e$i': UsageEntry(count: i + 1, lastUsedMs: _now),
      };
      final sanitized = sanitizeUsageMap(input, _now);
      expect(sanitized.length, kMaxTrackedUsageKeys);
      expect(sanitized.containsKey('unicode:e249'), isTrue);
      expect(sanitized.containsKey('unicode:e50'), isTrue);
      expect(sanitized.containsKey('unicode:e49'), isFalse);
    });
  });

  group('mergeUsageMaps', () {
    test('takes the max count and max lastUsed per key', () {
      final merged = mergeUsageMaps(
        {
          'unicode:heart': const UsageEntry(count: 5, lastUsedMs: _now - _day),
          'unicode:local_only': const UsageEntry(count: 1, lastUsedMs: _now),
        },
        {
          'unicode:heart': const UsageEntry(count: 2, lastUsedMs: _now),
          'unicode:remote_only': const UsageEntry(
            count: 3,
            lastUsedMs: _now - 2 * _day,
          ),
        },
        _now,
      );
      expect(merged, {
        'unicode:heart': const UsageEntry(count: 5, lastUsedMs: _now),
        'unicode:local_only': const UsageEntry(count: 1, lastUsedMs: _now),
        'unicode:remote_only': const UsageEntry(
          count: 3,
          lastUsedMs: _now - 2 * _day,
        ),
      });
    });

    test('is commutative', () {
      final random = math.Random(7);
      Map<String, UsageEntry> randomMap() => {
        for (var i = 0; i < 40; i++)
          'unicode:k${random.nextInt(60)}': UsageEntry(
            count: random.nextInt(9) + 1,
            lastUsedMs: _now - random.nextInt(30) * _day,
          ),
      };
      for (var round = 0; round < 20; round++) {
        final a = randomMap();
        final b = randomMap();
        expect(mergeUsageMaps(a, b, _now), mergeUsageMaps(b, a, _now));
      }
    });
  });

  group('dedupeBoundedIds', () {
    test('drops empty, overlong and repeated ids and caps the length', () {
      expect(dedupeBoundedIds(['a', '', 'b', 'a', 'x' * 257, 'c', 'd'], 3), [
        'a',
        'b',
        'c',
      ]);
    });

    test('keeps ids verbatim without trimming', () {
      expect(dedupeBoundedIds([' a'], 5), [' a']);
    });
  });

  group('usage JSON codec', () {
    test('round trips a usage map', () {
      const usage = {
        'unicode:heart': UsageEntry(count: 3, lastUsedMs: _now),
        'custom:1:2': UsageEntry(count: 1, lastUsedMs: 5),
      };
      expect(decodeUsageMapJson(encodeUsageMapJson(usage)), usage);
    });

    test('decodes malformed input as empty', () {
      expect(decodeUsageMapJson(''), isEmpty);
      expect(decodeUsageMapJson('[1]'), isEmpty);
      expect(decodeUsageMapJson('{"a": "b"}'), isEmpty);
    });
  });
}
