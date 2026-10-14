import 'dart:async';
import 'dart:convert';

import 'package:fluxer_app/core/database/daos/message_dao.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/data/reaction_delta_utils.dart';
import 'package:fluxer_dart/gateway.dart';

const int kReactionWriteBatchMs = 50;

typedef ReactionWriteBatcherFlushCallback =
    void Function(String channelId, String messageId);

class ReactionWriteBatcher {
  ReactionWriteBatcher({
    required this._database,
    this._window = const Duration(milliseconds: kReactionWriteBatchMs),
    this.onFlush,
  });

  final FluxerDatabase _database;
  final Duration _window;
  ReactionWriteBatcherFlushCallback? onFlush;
  final Map<MessageKey, _PendingReactionBatch> _pending =
      <MessageKey, _PendingReactionBatch>{};
  final Map<MessageKey, Future<void>> _flushing = <MessageKey, Future<void>>{};

  void enqueue({
    required String messageId,
    required String channelId,
    required ReactionEmoji emoji,
    required bool isAdd,
    required bool isCurrentUser,
  }) {
    final _PendingReactionBatch batch = _pending.putIfAbsent(
      (channelId: channelId, id: messageId),
      () => _PendingReactionBatch(
        timer: Timer(_window, () {
          unawaited(flush(channelId, messageId));
        }),
      ),
    );
    batch.deltas.add(
      _ReactionDelta(emoji: emoji, isAdd: isAdd, isCurrentUser: isCurrentUser),
    );
  }

  Future<void> flush(String channelId, String messageId) {
    final MessageKey key = (channelId: channelId, id: messageId);
    final Future<void>? inFlight = _flushing[key];
    if (inFlight != null) {
      return inFlight.then((_) => flush(channelId, messageId));
    }
    final Future<void> future = _drain(key);
    _flushing[key] = future;
    return future.whenComplete(() => _flushing.remove(key));
  }

  Future<void> flushAll() async {
    final Set<MessageKey> keys = <MessageKey>{
      ..._pending.keys,
      ..._flushing.keys,
    };
    for (final MessageKey key in keys) {
      await flush(key.channelId, key.id);
    }
  }

  Future<void> dispose() => flushAll();

  Future<void> _drain(MessageKey key) async {
    while (true) {
      final _PendingReactionBatch? batch = _pending.remove(key);
      if (batch == null) {
        return;
      }
      batch.timer.cancel();
      if (batch.deltas.isEmpty) {
        continue;
      }
      await _applyFlush(key, batch);
    }
  }

  Future<void> _applyFlush(MessageKey key, _PendingReactionBatch batch) async {
    final String messageId = key.id;
    try {
      final message = await _database.messageDao.getMessage(
        key.channelId,
        messageId,
      );
      if (message == null) {
        return;
      }
      final List<Map<String, dynamic>> reactions = decodeMessageReactionsJson(
        message.reactionsJson,
      );
      var changed = false;
      for (final _ReactionDelta delta in batch.deltas) {
        final bool applied = applyMessageReactionDelta(
          reactions,
          delta.emoji,
          isAdd: delta.isAdd,
          isCurrentUser: delta.isCurrentUser,
        );
        changed = changed || applied;
      }
      if (!changed) {
        return;
      }
      await _database.messageDao.updateReactions(
        key.channelId,
        messageId,
        jsonEncode(reactions),
      );
      onFlush?.call(key.channelId, messageId);
    } on Object catch (e, st) {
      talker.error('[ReactionWriteBatcher] flush failed for $messageId', e, st);
    }
  }
}

class _PendingReactionBatch {
  _PendingReactionBatch({required this.timer});

  final Timer timer;
  final List<_ReactionDelta> deltas = <_ReactionDelta>[];
}

class _ReactionDelta {
  const _ReactionDelta({
    required this.emoji,
    required this.isAdd,
    required this.isCurrentUser,
  });

  final ReactionEmoji emoji;
  final bool isAdd;
  final bool isCurrentUser;
}
