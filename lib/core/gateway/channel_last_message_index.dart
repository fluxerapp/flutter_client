import 'dart:async';

class ChannelLastMessageIndex {
  final Map<String, String?> _lastMessageIds = <String, String?>{};
  final StreamController<Map<String, String>> _flushController =
      StreamController<Map<String, String>>.broadcast();

  String? lastMessageIdFor(String channelId) => _lastMessageIds[channelId];

  Stream<Map<String, String>> get flushStream => _flushController.stream;

  void setLastMessageId(String channelId, String? messageId) {
    _lastMessageIds[channelId] = messageId;
  }

  void applyBatch(Map<String, String> updates) {
    if (updates.isEmpty) {
      return;
    }
    _lastMessageIds.addAll(updates);
    _flushController.add(updates);
  }

  void seedAll(Map<String, String?> values) {
    _lastMessageIds
      ..clear()
      ..addAll(values);
  }

  void removeChannel(String channelId) {
    _lastMessageIds.remove(channelId);
  }

  void clear() {
    _lastMessageIds.clear();
  }

  Future<void> dispose() async {
    await _flushController.close();
  }
}
