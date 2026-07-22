import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unread_dm_provider.g.dart';

class UnreadDmState {
  final List<DmChannel> channels;
  final Set<String> unreadChannelIds;
  final Set<String> pendingRemovalIds;

  const UnreadDmState({
    this.channels = const [],
    this.unreadChannelIds = const {},
    this.pendingRemovalIds = const {},
  });

  bool hasUnread(String channelId) => unreadChannelIds.contains(channelId);

  bool isPendingRemoval(String channelId) =>
      pendingRemovalIds.contains(channelId);

  int mentionCountFor(String channelId) {
    for (final channel in channels) {
      if (channel.id == channelId) {
        return channel.unreadCount;
      }
    }
    return 0;
  }
}

/// Value-equal token capturing only the navbar-rail DM membership and identity
/// (id, type, name) of the unread-DM list — NOT mention/unread counts. The guild
/// navbar watches this via `.select` so it rebuilds only when a DM enters/leaves
/// the rail or its displayed identity changes, not on every read-state reconcile.
String dmNavbarMembershipToken(UnreadDmState state) {
  final buffer = StringBuffer();
  for (final channel in state.channels) {
    buffer
      ..write(channel.id)
      ..write(':')
      ..write(channel.type)
      ..write(':')
      ..write(channel.name ?? '')
      ..write('\u0001');
  }
  return buffer.toString();
}

@Riverpod(keepAlive: true)
class UnreadDmChannels extends _$UnreadDmChannels {
  final _removalTimers = <String, Timer>{};
  StreamSubscription<List<DmChannel>>? _dmSubscription;
  StreamSubscription<List<ReadState>>? _readStateSubscription;
  List<DmChannel> _latestRows = const [];
  Map<String, ReadState> _dmReadStateSnapshot = const {};

  @override
  UnreadDmState build() {
    ref.watch(currentUserIdProvider);
    final db = ref.watch(fluxerDatabaseProvider);

    unawaited(_dmSubscription?.cancel());
    unawaited(_readStateSubscription?.cancel());
    _dmReadStateSnapshot = const {};
    _dmSubscription = db.dmChannelDao.watchDmChannels().listen(
      (rows) => unawaited(_reconcile(rows)),
    );
    _readStateSubscription = db.readStateDao.watchReadStates().listen((rows) {
      final dmIds = _latestRows.map((row) => row.id).toSet();
      final next = <String, ReadState>{
        for (final r in rows)
          if (dmIds.contains(r.channelId)) r.channelId: r,
      };
      if (!dmReadStatesChanged(_dmReadStateSnapshot, next)) {
        return;
      }
      _dmReadStateSnapshot = next;
      unawaited(_reconcile());
    });

    ref.onDispose(() {
      unawaited(_dmSubscription?.cancel());
      unawaited(_readStateSubscription?.cancel());
      for (final timer in _removalTimers.values) {
        timer.cancel();
      }
      _removalTimers.clear();
    });

    return const UnreadDmState();
  }

  bool _shouldExcludeChannel(DmChannel channel) {
    final String? currentUserId = ref.read(currentUserIdProvider);
    return shouldExcludeFromDmConversationList(
      type: channel.type,
      channelId: channel.id,
      currentUserId: currentUserId,
    );
  }

  List<DmChannel> _sortChannels(List<DmChannel> channels) {
    return channels.toList()
      ..sort((a, b) => b.lastMessageTime.compareTo(a.lastMessageTime));
  }

  List<DmChannel> _orderChannels({
    required Map<String, DmChannel> merged,
    required Set<String> previousIds,
    required Set<String> addedIds,
  }) {
    final visible = merged.values
        .where((channel) => !_shouldExcludeChannel(channel))
        .toList();
    if (addedIds.isEmpty && visible.length == previousIds.length) {
      return state.channels
          .where((channel) => merged.containsKey(channel.id))
          .map((channel) => merged[channel.id]!)
          .toList();
    }
    return _sortChannels(visible);
  }

  Future<void> _reconcile([List<DmChannel>? rows]) async {
    if (rows != null) {
      _latestRows = rows;
    }
    final db = ref.read(fluxerDatabaseProvider);
    final channelIds = _latestRows.map((row) => row.id).toList();
    final lastMessages = await db.messageDao.getLastMessageForChannels(
      channelIds,
    );
    final readStates = channelIds.isEmpty
        ? <ReadState>[]
        : await db.readStateDao.watchReadStatesForChannels(channelIds).first;
    final readStateMap = {for (final rs in readStates) rs.channelId: rs};
    _dmReadStateSnapshot = readStateMap;
    final allChannels = _latestRows.map((channel) {
      final readState = readStateMap[channel.id];
      final latestMessageId = resolveLatestMessageIdForUnread(
        strictLatestMessageId: lastMessages[channel.id]?.id,
        channelLastMessageId: channel.lastMessageId,
        ackLastMessageId: readState?.lastMessageId,
        mentionCount: readState?.mentionCount ?? 0,
        channelLastMessageExistsInCache:
            lastMessages[channel.id]?.id == channel.lastMessageId,
      );
      final hasUnreadMessages =
          (latestMessageId == null && channel.unreadCount > 0) ||
          hasUnreadByReadState(
            channelLastMessageId: latestMessageId,
            ackLastMessageId: readState?.lastMessageId,
            fallbackAckMs: snowflakeTimestampMs(channel.id),
            mentionCount: 0,
          );
      final mentionCount = readState?.mentionCount ?? 0;
      return (
        channel: channel.copyWith(unreadCount: mentionCount),
        hasUnread: hasUnreadMessages || mentionCount > 0,
      );
    }).toList();
    final unreadChannels = allChannels
        .where(
          (entry) => entry.hasUnread && !_shouldExcludeChannel(entry.channel),
        )
        .map((entry) => entry.channel)
        .toList();
    final unreadIds = unreadChannels.map((c) => c.id).toSet();
    final currentIds = state.channels.map((c) => c.id).toSet();
    final pendingRemovalIds = {...state.pendingRemovalIds};

    for (final id in currentIds) {
      if (!unreadIds.contains(id)) {
        if (!_removalTimers.containsKey(id)) {
          pendingRemovalIds.add(id);
          _removalTimers[id] = Timer(const Duration(milliseconds: 750), () {
            _removalTimers.remove(id);
            state = UnreadDmState(
              channels: state.channels.where((c) => c.id != id).toList(),
              unreadChannelIds: {...state.unreadChannelIds}..remove(id),
              pendingRemovalIds: {...state.pendingRemovalIds}..remove(id),
            );
          });
        }
      }
    }

    for (final channel in unreadChannels) {
      _removalTimers[channel.id]?.cancel();
      _removalTimers.remove(channel.id);
      pendingRemovalIds.remove(channel.id);
    }

    final merged = <String, DmChannel>{};
    for (final c in state.channels) {
      if (!_shouldExcludeChannel(c)) {
        merged[c.id] = c;
      }
    }
    for (final c in unreadChannels) {
      merged[c.id] = c;
    }

    final addedIds = merged.keys.toSet().difference(currentIds);
    final newChannels = _orderChannels(
      merged: merged,
      previousIds: currentIds,
      addedIds: addedIds,
    );

    state = UnreadDmState(
      channels: newChannels,
      unreadChannelIds: unreadIds,
      pendingRemovalIds: pendingRemovalIds,
    );
  }
}
