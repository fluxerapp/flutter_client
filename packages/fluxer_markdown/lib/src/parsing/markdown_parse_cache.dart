import 'dart:collection';

const int kMarkdownParseCacheMaxEntries = 2048;

/// Bounded LRU cache for pure markdown parse results.
///
/// Values returned by [resolve] are shared across builds and MUST be treated as
/// immutable by callers; the markdown renderers only read parsed nodes.
class MarkdownParseCache<K, V extends Object> {
  MarkdownParseCache({this.maxEntries = kMarkdownParseCacheMaxEntries});

  final int maxEntries;
  final LinkedHashMap<K, V> _entries = LinkedHashMap<K, V>();

  V resolve(K key, V Function() compute) {
    final existing = _entries.remove(key);
    if (existing != null) {
      _entries[key] = existing;
      return existing;
    }
    final value = compute();
    _entries[key] = value;
    if (_entries.length > maxEntries) {
      _entries.remove(_entries.keys.first);
    }
    return value;
  }
}
