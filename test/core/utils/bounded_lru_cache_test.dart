import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/utils/bounded_lru_cache.dart';

void main() {
  group('BoundedLruCache', () {
    test('evicts the least recently used entry', () {
      final cache = BoundedLruCache<String, int>(capacity: 2)
        ..set('a', 1)
        ..set('b', 2);

      expect(cache.get('a'), 1);

      cache.set('c', 3);

      expect(cache.get('b'), isNull);
      expect(cache.get('a'), 1);
      expect(cache.get('c'), 3);
    });

    test('does not store entries when capacity is zero', () {
      final cache = BoundedLruCache<String, int>(capacity: 0)..set('a', 1);

      expect(cache.get('a'), isNull);
    });
  });
}
