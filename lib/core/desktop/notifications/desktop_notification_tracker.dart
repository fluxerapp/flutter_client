const int kDesktopNotificationsPerChannel = 5;

class DesktopNotificationTracker {
  DesktopNotificationTracker({
    this.perChannel = kDesktopNotificationsPerChannel,
  });

  final int perChannel;
  final Map<String, List<({String messageId, int id})>> _byChannel =
      <String, List<({String messageId, int id})>>{};

  List<int> track({
    required String channelId,
    required String messageId,
    required int id,
  }) {
    final List<({String messageId, int id})> entries = _byChannel.putIfAbsent(
      channelId,
      () => <({String messageId, int id})>[],
    )..add((messageId: messageId, id: id));
    final List<int> evicted = <int>[];
    while (entries.length > perChannel) {
      evicted.add(entries.removeAt(0).id);
    }
    return evicted;
  }

  List<int> takeChannel(String channelId) {
    final List<({String messageId, int id})>? entries = _byChannel.remove(
      channelId,
    );
    if (entries == null) {
      return const <int>[];
    }
    return entries.map((entry) => entry.id).toList();
  }

  List<int> takeMessages(String channelId, Iterable<String> messageIds) {
    final List<({String messageId, int id})>? entries = _byChannel[channelId];
    if (entries == null) {
      return const <int>[];
    }
    final Set<String> wanted = messageIds.toSet();
    final List<int> removed = <int>[];
    entries.removeWhere((entry) {
      if (!wanted.contains(entry.messageId)) {
        return false;
      }
      removed.add(entry.id);
      return true;
    });
    if (entries.isEmpty) {
      _byChannel.remove(channelId);
    }
    return removed;
  }
}
