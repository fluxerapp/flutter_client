class VoiceGridLayoutMemo<K extends Object, V extends Object> {
  K? _key;
  V? _value;

  V resolve(K key, V Function() compute) {
    final V? cached = _value;
    if (cached != null && _key == key) {
      return cached;
    }
    final V value = compute();
    _key = key;
    _value = value;
    return value;
  }
}
