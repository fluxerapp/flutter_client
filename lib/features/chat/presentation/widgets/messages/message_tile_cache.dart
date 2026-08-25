import 'package:flutter/widgets.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

/// Reuses a row's built widget while its render signature is unchanged, so a
/// list rebuild skips unchanged row subtrees instead of rebuilding every row.
class MessageTileCache {
  final Map<String, _MessageTileCacheEntry> _entries =
      <String, _MessageTileCacheEntry>{};

  Widget resolve(
    String id,
    Object layoutSignature,
    Widget Function() build, {
    Message? message,
  }) {
    final _MessageTileCacheEntry? existing = _entries[id];
    if (existing != null &&
        existing.layoutSignature == layoutSignature &&
        _isMessageContentEquivalent(existing.message, message)) {
      return existing.widget;
    }
    final Widget widget = build();
    _entries[id] = _MessageTileCacheEntry(
      layoutSignature: layoutSignature,
      message: message,
      widget: widget,
    );
    return widget;
  }

  void retainKeys(Set<String> ids) =>
      _entries.removeWhere((String id, _) => !ids.contains(id));

  void clear() => _entries.clear();

  static bool _isMessageContentEquivalent(Message? cached, Message? current) {
    if (cached == null && current == null) {
      return true;
    }
    if (cached == null || current == null) {
      return false;
    }
    return cached.isRenderEquivalent(current);
  }
}

class _MessageTileCacheEntry {
  const _MessageTileCacheEntry({
    required this.layoutSignature,
    required this.message,
    required this.widget,
  });

  final Object layoutSignature;
  final Message? message;
  final Widget widget;
}
