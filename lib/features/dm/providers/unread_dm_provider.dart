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

  const UnreadDmState({
    this.channels = const [],
    this.unreadChannelIds = const {},
  });

  bool hasUnread(String channelId) => unreadChannelIds.contains(channelId);
}

@Riverpod(keepAlive: true)
class UnreadDmChannels extends _$UnreadDmChannels {
  final _removalTimers = <String, Timer>{};
  StreamSubscription<List<DmChannel>>? _dmSubscription;
  StreamSubscription<List<ReadState>>? _readStateSubscription;
  List<DmChannel> _latestRows = const [];

  @override
  UnreadDmState build() {
    ref.watch(currentUserIdProvider);
    final db = ref.watch(fluxerDatabaseProvider);

    unawaited(_dmSubscription?.cancel());
    unawaited(_readStateSubscription?.cancel());
    _dmSubscription = db.dmChannelDao.watchDmChannels().listen(
      (rows) => unawaited(_reconcile(rows)),
    );
    _readStateSubscription = db.readStateDao.watchReadStates().listen(
      (_) => unawaited(_reconcile()),
    );

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
    final allChannels = _latestRows.map((channel) {
      final readState = readStateMap[channel.id];
      final latestMessageId =
          channel.lastMessageId ?? lastMessages[channel.id]?.id;
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

    // Start removal timers for channels that became read
    for (final id in currentIds) {
      if (!unreadIds.contains(id)) {
        if (!_removalTimers.containsKey(id)) {
          _removalTimers[id] = Timer(const Duration(milliseconds: 750), () {
            _removalTimers.remove(id);
            state = UnreadDmState(
              channels: state.channels.where((c) => c.id != id).toList(),
              unreadChannelIds: {...state.unreadChannelIds}..remove(id),
            );
          });
        }
      }
    }

    // Cancel timers for channels that became unread again
    for (final channel in unreadChannels) {
      _removalTimers[channel.id]?.cancel();
      _removalTimers.remove(channel.id);
    }

    // Merge: keep existing + add new unread
    final merged = <String, DmChannel>{};
    for (final c in state.channels) {
      if (!_shouldExcludeChannel(c)) {
        merged[c.id] = c;
      }
    }
    for (final c in unreadChannels) {
      merged[c.id] = c;
    }

    final newChannels =
        merged.values.where((c) => !_shouldExcludeChannel(c)).toList()
          ..sort((a, b) => b.lastMessageTime.compareTo(a.lastMessageTime));

    state = UnreadDmState(channels: newChannels, unreadChannelIds: unreadIds);
  }
}
