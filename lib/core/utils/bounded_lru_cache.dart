import 'dart:collection';

class BoundedLruCache<K extends Object, V extends Object> {
  BoundedLruCache({required this.capacity});

  final int capacity;

  final LinkedHashMap<K, V> _entries = LinkedHashMap<K, V>();

  V? get(K key) {
    if (!_entries.containsKey(key)) {
      return null;
    }

    final value = _entries.remove(key);
    if (value == null) {
      return null;
    }

    _entries[key] = value;
    return value;
  }

  void set(K key, V value) {
    if (capacity <= 0) {
      return;
    }

    _entries.remove(key);
    _entries[key] = value;

    while (_entries.length > capacity) {
      _entries.remove(_entries.keys.first);
    }
  }
}
