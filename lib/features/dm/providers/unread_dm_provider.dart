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
  final bool loaded;

  const UnreadDmState({
    this.channels = const [],
    this.unreadChannelIds = const {},
    this.loaded = false,
  });

  bool hasUnread(String channelId) => unreadChannelIds.contains(channelId);

  int mentionCountFor(String channelId) {
    for (final channel in channels) {
      if (channel.id == channelId) {
        return channel.unreadCount;
      }
    }
    return 0;
  }
}

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
  StreamSubscription<List<DmChannel>>? _dmSubscription;
  StreamSubscription<List<ReadState>>? _readStateSubscription;
  List<DmChannel> _latestRows = const [];
  Map<String, ReadState> _dmReadStateSnapshot = const {};
  int _reconcileGeneration = 0;

  @override
  UnreadDmState build() {
    ref.watch(currentUserIdProvider);
    final db = ref.watch(fluxerDatabaseProvider);

    unawaited(_dmSubscription?.cancel());
    unawaited(_readStateSubscription?.cancel());
    _reconcileGeneration++;
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
      _reconcileGeneration++;
      unawaited(_dmSubscription?.cancel());
      unawaited(_readStateSubscription?.cancel());
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

  List<DmChannel> _orderChannels(Map<String, DmChannel> unread) {
    final bool hasAdditions = unread.keys.any(
      (id) => !state.channels.any((channel) => channel.id == id),
    );
    if (!hasAdditions) {
      return state.channels
          .where((channel) => unread.containsKey(channel.id))
          .map((channel) => unread[channel.id]!)
          .toList();
    }
    return _sortChannels(unread.values.toList());
  }

  Future<void> _reconcile([List<DmChannel>? rows]) async {
    if (rows != null) {
      _latestRows = rows;
    }
    final int generation = ++_reconcileGeneration;
    final db = ref.read(fluxerDatabaseProvider);
    final channelIds = _latestRows.map((row) => row.id).toList();
    final lastMessages = await db.messageDao.getLastMessageForChannels(
      channelIds,
    );
    final readStates = channelIds.isEmpty
        ? <ReadState>[]
        : await db.readStateDao.watchReadStatesForChannels(channelIds).first;
    if (generation != _reconcileGeneration) {
      return;
    }
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
    state = UnreadDmState(
      channels: _orderChannels({for (final c in unreadChannels) c.id: c}),
      unreadChannelIds: unreadChannels.map((c) => c.id).toSet(),
      loaded: true,
    );
  }
}
