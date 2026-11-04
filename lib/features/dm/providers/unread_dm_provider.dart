import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/read_state_effective.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/read_state_write_batcher.dart';
import 'package:fluxer_app/features/channels/providers/read_state_write_batcher_provider.dart';
import 'package:fluxer_app/features/dm/data/dm_repository.dart';
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
  Set<String> _readStateIds = const {};
  List<DmChannel> _latestRows = const [];
  Map<String, DmChannel> _rowsById = const {};
  final Map<String, Message> _lastMessages = <String, Message>{};
  final Map<String, ReadState> _dmReadStateSnapshot = <String, ReadState>{};
  final Set<String> _dirtyIds = <String>{};
  int _reconcileGeneration = 0;
  int? _drainingGeneration;

  @override
  UnreadDmState build() {
    ref.watch(currentUserIdProvider);
    final db = ref.watch(fluxerDatabaseProvider);

    unawaited(_dmSubscription?.cancel());
    unawaited(_readStateSubscription?.cancel());
    _readStateSubscription = null;
    _readStateIds = const {};
    _reconcileGeneration++;
    _latestRows = const [];
    _rowsById = const {};
    _lastMessages.clear();
    _dmReadStateSnapshot.clear();
    _dirtyIds.clear();
    final int generation = _reconcileGeneration;
    _dmSubscription = db.dmChannelDao.watchDmChannels().listen(
      (rows) => _onRows(db, rows, generation),
    );

    ref
      ..listen<int>(readStateOverlayVersionProvider, (_, _) {
        _applyAckOverlay();
      })
      ..onDispose(() {
        _reconcileGeneration++;
        unawaited(_dmSubscription?.cancel());
        unawaited(_readStateSubscription?.cancel());
      });

    return const UnreadDmState();
  }

  void _onRows(FluxerDatabase db, List<DmChannel> rows, int generation) {
    if (generation != _reconcileGeneration) {
      return;
    }
    final Map<String, DmChannel> next = <String, DmChannel>{
      for (final DmChannel row in rows) row.id: row,
    };
    for (final DmChannel row in rows) {
      if (_rowsById[row.id] != row) {
        _dirtyIds.add(row.id);
      }
    }
    for (final String id in _rowsById.keys) {
      if (!next.containsKey(id)) {
        _lastMessages.remove(id);
        _dmReadStateSnapshot.remove(id);
      }
    }
    _latestRows = rows;
    _rowsById = next;
    _watchReadStates(db, next.keys.toSet(), generation);
    unawaited(_drain(db, generation));
  }

  void _watchReadStates(FluxerDatabase db, Set<String> ids, int generation) {
    if (ids.length == _readStateIds.length && _readStateIds.containsAll(ids)) {
      return;
    }
    _readStateIds = ids;
    unawaited(_readStateSubscription?.cancel());
    _readStateSubscription = ids.isEmpty
        ? null
        : db.readStateDao.watchReadStatesForChannels(ids.toList()).listen((
            rows,
          ) {
            if (generation != _reconcileGeneration) {
              return;
            }
            final Map<String, ReadState> next = <String, ReadState>{
              for (final ReadState r in rows) r.channelId: r,
            };
            var changed = false;
            for (final String id in ids) {
              if (dmReadStateUnreadFieldsChanged(
                _dmReadStateSnapshot[id],
                next[id],
              )) {
                changed = true;
              }
              final ReadState? state = next[id];
              if (state == null) {
                _dmReadStateSnapshot.remove(id);
              } else {
                _dmReadStateSnapshot[id] = state;
              }
            }
            if (changed && _drainingGeneration != generation) {
              _publish();
            }
          });
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
    final Set<String> previousIds = state.unreadChannelIds;
    final bool hasAdditions = unread.keys.any(
      (id) => !previousIds.contains(id),
    );
    if (!hasAdditions) {
      return state.channels
          .where((channel) => unread.containsKey(channel.id))
          .map((channel) => unread[channel.id]!)
          .toList();
    }
    return _sortChannels(unread.values.toList());
  }

  Future<void> _drain(FluxerDatabase db, int generation) async {
    if (_drainingGeneration == generation) {
      return;
    }
    _drainingGeneration = generation;
    try {
      while (generation == _reconcileGeneration) {
        final List<String> ids = _dirtyIds.toList();
        _dirtyIds.clear();
        if (ids.isNotEmpty) {
          final Map<String, Message> lastMessages;
          final List<ReadState> readStates;
          try {
            lastMessages = await db.messageDao.getLastMessageForChannels(ids);
            readStates = await db.readStateDao
                .watchReadStatesForChannels(ids)
                .first;
          } catch (_) {
            _dirtyIds.addAll(ids);
            rethrow;
          }
          if (generation != _reconcileGeneration) {
            return;
          }
          for (final String id in ids) {
            _lastMessages.remove(id);
            _dmReadStateSnapshot.remove(id);
          }
          for (final MapEntry<String, Message> entry in lastMessages.entries) {
            if (_rowsById.containsKey(entry.key)) {
              _lastMessages[entry.key] = entry.value;
            }
          }
          for (final ReadState readState in readStates) {
            if (_rowsById.containsKey(readState.channelId)) {
              _dmReadStateSnapshot[readState.channelId] = readState;
            }
          }
        }
        if (_dirtyIds.isEmpty) {
          _publish();
          return;
        }
      }
    } finally {
      if (_drainingGeneration == generation) {
        _drainingGeneration = null;
      }
    }
  }

  DmChannel? _unreadEntry(DmChannel channel, ReadStateWriteBatcher batcher) {
    if (_shouldExcludeChannel(channel)) {
      return null;
    }
    final ReadStateEffectiveFields effective = batcher.effectiveFields(
      channel.id,
      _dmReadStateSnapshot[channel.id],
    );
    final Message? lastMessage = _lastMessages[channel.id];
    final String? latestMessageId = resolveLatestMessageIdForUnread(
      strictLatestMessageId: lastMessage?.id,
      channelLastMessageId: channel.lastMessageId,
      ackLastMessageId: effective.lastMessageId,
      mentionCount: effective.mentionCount,
      channelLastMessageExistsInCache: lastMessage?.id == channel.lastMessageId,
    );
    final bool hasUnreadMessages =
        (latestMessageId == null && channel.unreadCount > 0) ||
        hasUnreadByReadState(
          channelLastMessageId: latestMessageId,
          ackLastMessageId: effective.lastMessageId,
          fallbackAckMs: snowflakeTimestampMs(channel.id),
          mentionCount: 0,
        );
    if (!hasUnreadMessages && effective.mentionCount == 0) {
      return null;
    }
    return channel.copyWith(unreadCount: effective.mentionCount);
  }

  void _publish() {
    final ReadStateWriteBatcher batcher = ref.read(
      readStateWriteBatcherProvider,
    );
    final unreadChannels = <DmChannel>[
      for (final DmChannel channel in _latestRows)
        ?_unreadEntry(channel, batcher),
    ];
    state = UnreadDmState(
      channels: _orderChannels({for (final c in unreadChannels) c.id: c}),
      unreadChannelIds: unreadChannels.map((c) => c.id).toSet(),
      loaded: true,
    );
  }

  void _applyAckOverlay() {
    if (!state.loaded || _latestRows.isEmpty) {
      return;
    }
    final batcher = ref.read(readStateWriteBatcherProvider);
    final Map<String, DmChannel> unread = <String, DmChannel>{
      for (final DmChannel channel in state.channels) channel.id: channel,
    };
    final Set<String> unreadIds = <String>{...state.unreadChannelIds};
    var changed = false;
    for (final DmChannel channel in _latestRows) {
      if (!batcher.hasOverlay(channel.id)) {
        continue;
      }
      final DmChannel? updated = _unreadEntry(channel, batcher);
      if (updated == null) {
        changed = unread.remove(channel.id) != null || changed;
        changed = unreadIds.remove(channel.id) || changed;
        continue;
      }
      final DmChannel? previous = unread[channel.id];
      if (previous == null || previous.unreadCount != updated.unreadCount) {
        unread[channel.id] = updated;
        changed = true;
      }
      if (unreadIds.add(channel.id)) {
        changed = true;
      }
    }
    if (!changed) {
      return;
    }
    state = UnreadDmState(
      channels: _orderChannels(unread),
      unreadChannelIds: unreadIds,
      loaded: true,
    );
  }
}
