import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show StreamProviderFamily;
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_dart/gateway.dart';

class ForumPostUnread {
  const ForumPostUnread({
    required this.guildId,
    required this.count,
    required this.ackMessageId,
  });

  final String guildId;
  final int count;
  final String ackMessageId;
}

typedef _QueuedAck = ({String guildId, String forumId, String ack});

const int _forumUnreadsSendsPerWindow = 4;
const Duration _forumUnreadsWindow = Duration(seconds: 5);
const Duration _forumUnreadsReplyTimeout = Duration(seconds: 15);

class ForumPostUnreads extends Notifier<Map<String, ForumPostUnread>> {
  final Map<String, String> _sentAcks = <String, String>{};
  final Map<String, DateTime> _awaiting = <String, DateTime>{};
  final Map<String, _QueuedAck> _queue = <String, _QueuedAck>{};
  final List<DateTime> _sendTimes = <DateTime>[];
  Timer? _pump;

  @override
  Map<String, ForumPostUnread> build() {
    ref.onDispose(() => _pump?.cancel());
    return const <String, ForumPostUnread>{};
  }

  Future<void> request({
    required String guildId,
    required String forumId,
    required List<String> postIds,
  }) async {
    if (!ref.read(threadsGateProvider).isActive(guildId)) {
      return;
    }
    final GatewayConnection connection = ref.read(gatewayConnectionProvider);
    if (connection.state != GatewayState.connected || postIds.isEmpty) {
      return;
    }
    final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
    final Set<String> joined = await database.threadDao.getJoinedThreadIds();
    final Map<String, String?> acks = <String, String?>{
      for (final db.ReadState row
          in await database.readStateDao.getReadStatesFor(postIds))
        row.channelId: row.lastMessageId,
    };
    if (!ref.mounted) {
      return;
    }
    _expireAwaiting();
    for (final String postId in postIds) {
      final String? ack = acks[postId];
      if (joined.contains(postId) ||
          ack == null ||
          ack.isEmpty ||
          _sentAcks[postId] == ack ||
          _queue[postId]?.ack == ack) {
        continue;
      }
      _queue[postId] = (guildId: guildId, forumId: forumId, ack: ack);
    }
    _drain();
  }

  void _expireAwaiting() {
    final DateTime now = clock.now();
    _awaiting.removeWhere((String postId, DateTime sentAt) {
      if (now.difference(sentAt) < _forumUnreadsReplyTimeout) {
        return false;
      }
      _sentAcks.remove(postId);
      return true;
    });
  }

  void _drain() {
    _pump?.cancel();
    _pump = null;
    while (_queue.isNotEmpty && ref.mounted) {
      final GatewayConnection connection = ref.read(gatewayConnectionProvider);
      if (connection.state != GatewayState.connected) {
        _queue.clear();
        return;
      }
      final DateTime now = clock.now();
      _sendTimes.removeWhere(
        (DateTime sentAt) => now.difference(sentAt) >= _forumUnreadsWindow,
      );
      if (_sendTimes.length >= _forumUnreadsSendsPerWindow) {
        _pump = Timer(
          _forumUnreadsWindow - now.difference(_sendTimes.first),
          _drain,
        );
        return;
      }
      final _QueuedAck head = _queue.values.first;
      final Map<String, String> batch = <String, String>{};
      for (final MapEntry<String, _QueuedAck> entry in _queue.entries) {
        if (batch.length >= forumUnreadsMaxThreads) {
          break;
        }
        if (entry.value.guildId == head.guildId &&
            entry.value.forumId == head.forumId) {
          batch[entry.key] = entry.value.ack;
        }
      }
      for (final String postId in batch.keys) {
        _queue.remove(postId);
        _awaiting[postId] = now;
      }
      _sentAcks.addAll(batch);
      _sendTimes.add(now);
      connection.requestForumUnreads(
        guildId: head.guildId,
        channelId: head.forumId,
        ackMessageIds: batch,
      );
    }
  }

  void apply(ForumUnreadsEvent event) {
    final Map<String, ForumPostUnread> next = Map<String, ForumPostUnread>.of(
      state,
    );
    for (final ForumUnreadEntry entry in event.threads) {
      _awaiting.remove(entry.threadId);
      final String? ack = _sentAcks[entry.threadId];
      final int count = entry.count ?? 0;
      if (ack != null && count > 0) {
        next[entry.threadId] = ForumPostUnread(
          guildId: event.guildId,
          count: count,
          ackMessageId: ack,
        );
      } else {
        next.remove(entry.threadId);
      }
    }
    state = next;
  }

  void resetRequests() {
    _pump?.cancel();
    _pump = null;
    _queue.clear();
    _awaiting.clear();
    _sentAcks.clear();
  }

  void clearGuild(String guildId) {
    _queue.removeWhere(
      (String _, _QueuedAck queued) => queued.guildId == guildId,
    );
    if (!state.values.any((ForumPostUnread e) => e.guildId == guildId)) {
      return;
    }
    state = Map<String, ForumPostUnread>.of(state)
      ..removeWhere((String _, ForumPostUnread e) => e.guildId == guildId);
  }
}

final NotifierProvider<ForumPostUnreads, Map<String, ForumPostUnread>>
forumPostUnreadsProvider =
    NotifierProvider<ForumPostUnreads, Map<String, ForumPostUnread>>(
      ForumPostUnreads.new,
    );

int forumPostUnreadCount(
  Map<String, ForumPostUnread> unreads, {
  required String postId,
  required String? currentAckMessageId,
}) {
  final ForumPostUnread? entry = unreads[postId];
  if (entry == null || entry.ackMessageId != currentAckMessageId) {
    return 0;
  }
  return entry.count;
}

final StreamProviderFamily<String?, String> postReadStateAckProvider =
    StreamProvider.autoDispose.family<String?, String>(
      (Ref ref, String postId) => ref
          .watch(fluxerDatabaseProvider)
          .readStateDao
          .watchReadState(postId)
          .map((db.ReadState? row) => row?.lastMessageId)
          .distinct(),
    );
