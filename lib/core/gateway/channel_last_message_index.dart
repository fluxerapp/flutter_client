import 'dart:async';

class ChannelLastMessageIndex {
  final Map<String, String?> _lastMessageIds = <String, String?>{};
  final StreamController<Map<String, String>> _flushController =
      StreamController<Map<String, String>>.broadcast();
  final Map<String, Set<StreamController<void>>> _channelFlushes =
      <String, Set<StreamController<void>>>{};

  String? lastMessageIdFor(String channelId) => _lastMessageIds[channelId];

  Stream<Map<String, String>> get flushStream => _flushController.stream;

  Stream<void> flushesFor(String channelId) {
    late final StreamController<void> controller;
    controller = StreamController<void>(
      onListen: () =>
          (_channelFlushes[channelId] ??= <StreamController<void>>{}).add(
            controller,
          ),
      onCancel: () {
        final Set<StreamController<void>>? controllers =
            _channelFlushes[channelId];
        if (controllers == null) {
          return;
        }
        controllers.remove(controller);
        if (controllers.isEmpty) {
          _channelFlushes.remove(channelId);
        }
      },
    );
    return controller.stream;
  }

  void setLastMessageId(String channelId, String? messageId) {
    _lastMessageIds[channelId] = messageId;
  }

  void applyBatch(Map<String, String> updates) {
    if (updates.isEmpty) {
      return;
    }
    _lastMessageIds.addAll(updates);
    for (final String channelId in updates.keys) {
      final Set<StreamController<void>>? controllers =
          _channelFlushes[channelId];
      if (controllers == null) {
        continue;
      }
      for (final StreamController<void> controller in controllers) {
        controller.add(null);
      }
    }
    _flushController.add(updates);
  }

  void seedAll(Map<String, String?> values) {
    _lastMessageIds
      ..clear()
      ..addAll(values);
  }

  void clear() {
    _lastMessageIds.clear();
  }

  Future<void> dispose() async {
    final List<StreamController<void>> controllers = <StreamController<void>>[
      for (final Set<StreamController<void>> set in _channelFlushes.values)
        ...set,
    ];
    _channelFlushes.clear();
    for (final StreamController<void> controller in controllers) {
      unawaited(controller.close());
    }
    await _flushController.close();
  }
}
