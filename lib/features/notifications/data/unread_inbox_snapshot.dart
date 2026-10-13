import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';

const Duration kUnreadInboxRefreezeCooldown = Duration(seconds: 10);

class UnreadInboxSnapshot {
  UnreadInboxSnapshot(List<UnreadInboxEntry> live, {required this.takenAt})
    : _frozen = <String, UnreadInboxEntry>{
        for (final UnreadInboxEntry entry in _groupByGuild(live))
          entry.channelId: entry,
      };

  final DateTime takenAt;
  final Map<String, UnreadInboxEntry> _frozen;

  bool get isEmpty => _frozen.isEmpty;

  List<UnreadInboxEntry> select(List<UnreadInboxEntry> live) {
    final Map<String, UnreadInboxEntry> liveById = <String, UnreadInboxEntry>{
      for (final UnreadInboxEntry entry in live) entry.channelId: entry,
    };
    final List<UnreadInboxEntry> held = <UnreadInboxEntry>[];
    for (final UnreadInboxEntry frozen in _frozen.values) {
      final UnreadInboxEntry? current = liveById[frozen.channelId];
      if (current == null) {
        continue;
      }
      held.add(
        UnreadInboxEntry(
          channelId: frozen.channelId,
          guildId: frozen.guildId,
          isDm: frozen.isDm,
          mentionCount: frozen.mentionCount,
          isCollapsed: current.isCollapsed,
          recencyComparator: frozen.recencyComparator,
          ackMessageId: current.ackMessageId,
          lastMessageId: frozen.lastMessageId,
          isThreadOnly: frozen.isThreadOnly,
        ),
      );
    }
    return held;
  }

  static List<UnreadInboxEntry> _groupByGuild(List<UnreadInboxEntry> entries) {
    final Map<String, List<UnreadInboxEntry>> groups =
        <String, List<UnreadInboxEntry>>{};
    for (final UnreadInboxEntry entry in entries) {
      groups
          .putIfAbsent(entry.guildId ?? '', () => <UnreadInboxEntry>[])
          .add(entry);
    }
    return <UnreadInboxEntry>[
      for (final List<UnreadInboxEntry> group in groups.values) ...group,
    ];
  }
}

bool sameUnreadInboxRows(List<UnreadInboxEntry> a, List<UnreadInboxEntry> b) {
  if (a.length != b.length) {
    return false;
  }
  for (int i = 0; i < a.length; i++) {
    if (a[i].channelId != b[i].channelId ||
        a[i].isCollapsed != b[i].isCollapsed ||
        a[i].ackMessageId != b[i].ackMessageId ||
        a[i].mentionCount != b[i].mentionCount) {
      return false;
    }
  }
  return true;
}
