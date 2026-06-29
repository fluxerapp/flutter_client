import 'package:flutter/widgets.dart';

/// Reuses a row's built widget while its render signature is unchanged, so a
/// list rebuild skips unchanged row subtrees instead of rebuilding every row.
class MessageTileCache {
  final Map<String, ({Object signature, Widget widget})> _entries =
      <String, ({Object signature, Widget widget})>{};

  Widget resolve(String id, Object signature, Widget Function() build) {
    final ({Object signature, Widget widget})? existing = _entries[id];
    if (existing != null && existing.signature == signature) {
      return existing.widget;
    }
    final Widget widget = build();
    _entries[id] = (signature: signature, widget: widget);
    return widget;
  }

  void retainKeys(Set<String> ids) =>
      _entries.removeWhere((String id, _) => !ids.contains(id));

  void clear() => _entries.clear();
}
