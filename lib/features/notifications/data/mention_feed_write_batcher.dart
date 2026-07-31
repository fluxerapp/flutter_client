import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/talker.dart';

const int kMentionFeedWriteBatchMs = 1000;

class MentionFeedWriteBatcher {
  MentionFeedWriteBatcher({
    required this._database,
    this._window = const Duration(milliseconds: kMentionFeedWriteBatchMs),
  });

  final FluxerDatabase _database;
  final Duration _window;
  final List<_MentionFeedIntent> _pending = <_MentionFeedIntent>[];
  Timer? _timer;
  Future<void>? _flushing;

  void enqueue({required String messageId, required String channelId}) {
    _pending.add(
      _MentionFeedIntent(messageId: messageId, channelId: channelId),
    );
    _timer ??= Timer(_window, () {
      unawaited(flush());
    });
  }

  Future<void> flush() async {
    if (_flushing != null) {
      return _flushing!;
    }
    _timer?.cancel();
    _timer = null;
    if (_pending.isEmpty) {
      return;
    }
    final List<_MentionFeedIntent> batch = List<_MentionFeedIntent>.from(
      _pending,
    );
    _pending.clear();
    final Future<void> future = _applyFlush(batch);
    _flushing = future;
    return future.whenComplete(() => _flushing = null);
  }

  Future<void> flushAll() => flush();

  void clearAll() {
    _timer?.cancel();
    _timer = null;
    _pending.clear();
  }

  Future<void> dispose() => flush();

  Future<void> _applyFlush(List<_MentionFeedIntent> batch) async {
    if (batch.isEmpty) {
      return;
    }
    try {
      await _database.notificationDao.prependMentionRowsBatch(
        messageIds: batch.map((e) => e.messageId).toList(),
        channelIds: batch.map((e) => e.channelId).toList(),
      );
    } on Object catch (e, st) {
      talker.error('[MentionFeedWriteBatcher] flush failed', e, st);
    }
  }
}

class _MentionFeedIntent {
  const _MentionFeedIntent({required this.messageId, required this.channelId});

  final String messageId;
  final String channelId;
}
