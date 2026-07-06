import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/channel_last_message_index.dart';
import 'package:fluxer_app/core/talker.dart';

const int kMessageWriteBatchMs = 50;
const int kMessageWriteBatchMaxSize = 50;

typedef MessageWriteBatcherFlushCallback =
    void Function(Map<String, String> channelLastMessageIds);

class MessageWriteBatcher {
  MessageWriteBatcher({
    required FluxerDatabase database,
    ChannelLastMessageIndex? channelLastMessageIndex,
    Duration window = const Duration(milliseconds: kMessageWriteBatchMs),
    int maxBatchSize = kMessageWriteBatchMaxSize,
    MessageWriteBatcherFlushCallback? onFlush,
  }) : _database = database,
       _channelLastMessageIndex = channelLastMessageIndex,
       _window = window,
       _maxBatchSize = maxBatchSize,
       _onFlush = onFlush;

  final FluxerDatabase _database;
  final ChannelLastMessageIndex? _channelLastMessageIndex;
  final Duration _window;
  final int _maxBatchSize;
  final MessageWriteBatcherFlushCallback? _onFlush;

  final List<MessagesCompanion> _pendingMessages = <MessagesCompanion>[];
  final Map<String, String> _pendingLastMessageIds = <String, String>{};
  final Map<String, DmLastMessageUpdate> _pendingDmUpdates =
      <String, DmLastMessageUpdate>{};
  Timer? _timer;
  Future<void>? _flushing;
  int _totalPending = 0;

  void enqueueMessage({
    required MessagesCompanion companion,
    required String channelId,
    required String messageId,
    DmLastMessageUpdate? dmUpdate,
  }) {
    _pendingMessages.add(companion);
    _pendingLastMessageIds[channelId] = messageId;
    if (dmUpdate != null) {
      _pendingDmUpdates[channelId] = dmUpdate;
    }
    _totalPending += 1;
    _scheduleFlush();
    if (_totalPending >= _maxBatchSize) {
      unawaited(flush());
    }
  }

  Future<void> flushChannel(String channelId) async {
    if (_pendingLastMessageIds.containsKey(channelId)) {
      await flush();
    }
  }

  Future<void> flush() async {
    if (_flushing != null) {
      return _flushing!;
    }
    _timer?.cancel();
    _timer = null;
    if (_pendingMessages.isEmpty) {
      return;
    }
    final Future<void> future = _applyFlush();
    _flushing = future;
    return future.whenComplete(() => _flushing = null);
  }

  Future<void> flushAll() => flush();

  Future<void> dispose() => flush();

  void _scheduleFlush() {
    _timer ??= Timer(_window, () {
      unawaited(flush());
    });
  }

  Future<void> _applyFlush() async {
    final List<MessagesCompanion> messages = List<MessagesCompanion>.from(
      _pendingMessages,
    );
    final Map<String, String> lastMessageIds = Map<String, String>.from(
      _pendingLastMessageIds,
    );
    final Map<String, DmLastMessageUpdate> dmUpdates =
        Map<String, DmLastMessageUpdate>.from(_pendingDmUpdates);
    _pendingMessages.clear();
    _pendingLastMessageIds.clear();
    _pendingDmUpdates.clear();
    _totalPending = 0;
    if (messages.isEmpty) {
      return;
    }
    try {
      await _database.transaction(() async {
        await _database.messageDao.upsertMessages(messages);
        for (final MapEntry<String, String> entry in lastMessageIds.entries) {
          await _database.channelDao.updateLastMessageId(
            entry.key,
            entry.value,
          );
        }
        for (final MapEntry<String, DmLastMessageUpdate> entry
            in dmUpdates.entries) {
          final DmLastMessageUpdate update = entry.value;
          await _database.dmChannelDao.updateLastMessage(
            entry.key,
            update.messageId,
            update.content,
            update.authorId,
            update.timestamp,
          );
        }
      });
      _channelLastMessageIndex?.applyBatch(lastMessageIds);
      _onFlush?.call(lastMessageIds);
    } on Object catch (e, st) {
      talker.error('[MessageWriteBatcher] flush failed', e, st);
    }
  }
}

class DmLastMessageUpdate {
  const DmLastMessageUpdate({
    required this.messageId,
    required this.content,
    required this.authorId,
    required this.timestamp,
  });

  final String messageId;
  final String content;
  final String authorId;
  final DateTime timestamp;
}
