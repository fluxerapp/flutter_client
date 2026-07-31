import 'dart:async';
import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/data/reaction_delta_utils.dart';
import 'package:fluxer_dart/gateway.dart';

const int kReactionWriteBatchMs = 50;

class ReactionWriteBatcher {
  ReactionWriteBatcher({
    required this._database,
    this._window = const Duration(milliseconds: kReactionWriteBatchMs),
  });

  final FluxerDatabase _database;
  final Duration _window;
  final Map<String, _PendingReactionBatch> _pending =
      <String, _PendingReactionBatch>{};
  final Map<String, Future<void>> _flushing = <String, Future<void>>{};

  void enqueue({
    required String messageId,
    required String channelId,
    required ReactionEmoji emoji,
    required bool isAdd,
    required bool isCurrentUser,
  }) {
    final _PendingReactionBatch batch = _pending.putIfAbsent(
      messageId,
      () => _PendingReactionBatch(
        channelId: channelId,
        timer: Timer(_window, () {
          unawaited(flush(messageId));
        }),
      ),
    );
    batch.deltas.add(
      _ReactionDelta(emoji: emoji, isAdd: isAdd, isCurrentUser: isCurrentUser),
    );
  }

  Future<void> flush(String messageId) {
    final Future<void>? inFlight = _flushing[messageId];
    if (inFlight != null) {
      return inFlight;
    }
    final _PendingReactionBatch? batch = _pending.remove(messageId);
    if (batch == null) {
      return Future<void>.value();
    }
    batch.timer.cancel();
    if (batch.deltas.isEmpty) {
      return Future<void>.value();
    }
    final Future<void> future = _applyFlush(messageId, batch);
    _flushing[messageId] = future;
    return future.whenComplete(() => _flushing.remove(messageId));
  }

  Future<void> flushAll() async {
    for (final String messageId in _pending.keys.toList()) {
      await flush(messageId);
    }
  }

  Future<void> dispose() => flushAll();

  Future<void> _applyFlush(
    String messageId,
    _PendingReactionBatch batch,
  ) async {
    try {
      final message = await _database.messageDao.getMessage(messageId);
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
        messageId,
        jsonEncode(reactions),
      );
    } on Object catch (e, st) {
      talker.error('[ReactionWriteBatcher] flush failed for $messageId', e, st);
    }
  }
}

class _PendingReactionBatch {
  _PendingReactionBatch({required this.channelId, required this.timer});

  final String channelId;
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
