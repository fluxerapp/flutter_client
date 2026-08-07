import 'dart:async';

import 'package:clock/clock.dart';
import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';

const int kReadStateWriteBatchMs = 1000;

const int kReadStateAckBatchMs = 50;
const int kReadStateUnreadMinIntervalMs = 2000;

/// Batches per-channel unread read-state writes during gateway bursts.
class ReadStateWriteBatcher {
  ReadStateWriteBatcher({
    required this._database,
    this._window = const Duration(milliseconds: kReadStateWriteBatchMs),
    this._ackWindow = const Duration(milliseconds: kReadStateAckBatchMs),
    this._minIntervalBetweenUnreadFlushes = const Duration(
      milliseconds: kReadStateUnreadMinIntervalMs,
    ),
  });

  final FluxerDatabase _database;
  final Duration _window;
  final Duration _ackWindow;
  final Duration _minIntervalBetweenUnreadFlushes;
  final Map<String, _PendingUnread> _pending = <String, _PendingUnread>{};
  final Map<String, _PendingAck> _pendingAcks = <String, _PendingAck>{};
  final Map<String, Future<void>> _flushing = <String, Future<void>>{};
  final Map<String, DateTime> _lastUnreadFlushAt = <String, DateTime>{};

  void enqueueUnread({
    required String channelId,
    required String messageId,
    required bool shouldMention,
    required bool isDm,
    required String? seedAckCandidate,
  }) {
    final _PendingUnread pending = _pending.putIfAbsent(
      channelId,
      () => _PendingUnread(
        isDm: isDm,
        timer: Timer(
          _resolveUnreadDelay(channelId),
          () => unawaited(flush(channelId)),
        ),
      ),
    );
    pending.intents.add(
      _UnreadIntent(
        messageId: messageId,
        shouldMention: shouldMention,
        seedAckCandidate: seedAckCandidate,
      ),
    );
  }

  Duration _resolveUnreadDelay(String channelId) {
    final DateTime? lastFlush = _lastUnreadFlushAt[channelId];
    if (lastFlush == null) {
      return _window;
    }
    final DateTime now = clock.now();
    final Duration sinceLastFlush = now.difference(lastFlush);
    if (sinceLastFlush >= _minIntervalBetweenUnreadFlushes) {
      return _window;
    }
    return _minIntervalBetweenUnreadFlushes - sinceLastFlush;
  }

  bool hasPending(String channelId) =>
      _pending.containsKey(channelId) || _pendingAcks.containsKey(channelId);

  void enqueueAck({
    required String channelId,
    required String messageId,
    required bool isDm,
    required bool clearSticky,
    required bool markDmRead,
  }) {
    final _PendingAck pending = _pendingAcks.putIfAbsent(
      channelId,
      () => _PendingAck(
        isDm: isDm,
        timer: Timer(_ackWindow, () => unawaited(flushAck(channelId))),
      ),
    );
    if (pending.messageId == null ||
        compareSnowflakeIds(messageId, pending.messageId) > 0) {
      pending.messageId = messageId;
    }
    pending
      ..clearSticky = pending.clearSticky || clearSticky
      ..markDmRead = pending.markDmRead || markDmRead;
  }

  Future<void> flushAck(String channelId) {
    final Future<void>? inFlight = _flushing['ack:$channelId'];
    if (inFlight != null) {
      return inFlight;
    }
    final _PendingAck? pending = _pendingAcks.remove(channelId);
    if (pending == null) {
      return Future<void>.value();
    }
    pending.timer.cancel();
    final String? messageId = pending.messageId;
    if (messageId == null) {
      return Future<void>.value();
    }
    final Future<void> future = _applyAckFlush(
      channelId: channelId,
      messageId: messageId,
      isDm: pending.isDm,
      clearSticky: pending.clearSticky,
      markDmRead: pending.markDmRead,
    );
    _flushing['ack:$channelId'] = future;
    return future.whenComplete(() => _flushing.remove('ack:$channelId'));
  }

  void discard(String channelId) {
    final _PendingUnread? pending = _pending.remove(channelId);
    pending?.timer.cancel();
    final _PendingAck? ack = _pendingAcks.remove(channelId);
    ack?.timer.cancel();
  }

  Future<void> flushAll() async {
    for (final String channelId in _pending.keys.toList()) {
      await flush(channelId);
    }
    for (final String channelId in _pendingAcks.keys.toList()) {
      await flushAck(channelId);
    }
  }

  void clearAll() {
    for (final _PendingUnread pending in _pending.values) {
      pending.timer.cancel();
    }
    for (final _PendingAck pending in _pendingAcks.values) {
      pending.timer.cancel();
    }
    _pending.clear();
    _pendingAcks.clear();
  }

  Future<void> dispose() => flushAll();

  Future<void> flush(String channelId) {
    final Future<void>? inFlight = _flushing[channelId];
    if (inFlight != null) {
      return inFlight;
    }
    final _PendingUnread? pending = _pending.remove(channelId);
    if (pending == null) {
      return Future<void>.value();
    }
    pending.timer.cancel();
    if (pending.intents.isEmpty) {
      return Future<void>.value();
    }
    final Future<void> future = _applyFlush(channelId, pending);
    _flushing[channelId] = future;
    return future.whenComplete(() => _flushing.remove(channelId));
  }

  Future<void> _applyFlush(String channelId, _PendingUnread pending) async {
    _lastUnreadFlushAt[channelId] = clock.now();
    try {
      await _database.transaction(() async {
        final ReadState? working = await _database.readStateDao.getReadState(
          channelId,
        );
        String? lastMessageId = working?.lastMessageId;
        int mentionCount = working?.mentionCount ?? 0;
        int unreadMessages = 0;
        bool fieldsChanged = false;

        for (final _UnreadIntent intent in pending.intents) {
          if (lastMessageId != null &&
              compareSnowflakeIds(intent.messageId, lastMessageId) <= 0) {
            continue;
          }
          if (lastMessageId == null &&
              !pending.isDm &&
              intent.seedAckCandidate != null) {
            lastMessageId = intent.seedAckCandidate;
            fieldsChanged = true;
          }
          if (intent.shouldMention) {
            mentionCount += 1;
            fieldsChanged = true;
          }
          unreadMessages += 1;
        }

        final bool shouldWrite =
            fieldsChanged || (working == null && unreadMessages > 0);
        if (shouldWrite) {
          await _database.readStateDao.upsertReadState(
            ReadStatesCompanion(
              channelId: Value(channelId),
              lastMessageId: Value(lastMessageId),
              mentionCount: Value(mentionCount),
              lastPinTimestamp: Value(working?.lastPinTimestamp),
              manual: Value(working?.manual ?? false),
              stickyUnreadMessageId: Value(working?.stickyUnreadMessageId),
              version: Value(working?.version),
            ),
          );
        }

        if (pending.isDm && unreadMessages > 0) {
          final DmChannel? dm = await _database.dmChannelDao.getDmChannelById(
            channelId,
          );
          if (dm != null) {
            await _database.dmChannelDao.updateUnreadCount(
              channelId,
              dm.unreadCount + unreadMessages,
            );
          }
        }
      });
    } on Object catch (e, st) {
      talker.error(
        '[ReadStateWriteBatcher] flush failed for $channelId',
        e,
        st,
      );
    }
  }

  Future<void> _applyAckFlush({
    required String channelId,
    required String messageId,
    required bool isDm,
    required bool clearSticky,
    required bool markDmRead,
  }) async {
    try {
      await _database.transaction(() async {
        final ReadState? existing = await _database.readStateDao.getReadState(
          channelId,
        );
        await _database.readStateDao.upsertReadState(
          ReadStatesCompanion(
            channelId: Value(channelId),
            lastMessageId: Value(messageId),
            mentionCount: const Value(0),
            lastPinTimestamp: Value(existing?.lastPinTimestamp),
            manual: const Value(false),
            stickyUnreadMessageId: clearSticky
                ? const Value(null)
                : Value(existing?.stickyUnreadMessageId),
            version: Value(existing?.version),
          ),
        );
        if (isDm && markDmRead) {
          await _database.dmChannelDao.markAsRead(channelId);
        }
      });
    } on Object catch (e, st) {
      talker.error(
        '[ReadStateWriteBatcher] ack flush failed for $channelId',
        e,
        st,
      );
    }
  }
}

class _PendingUnread {
  _PendingUnread({required this.isDm, required this.timer});

  final bool isDm;
  final Timer timer;
  final List<_UnreadIntent> intents = <_UnreadIntent>[];
}

class _UnreadIntent {
  const _UnreadIntent({
    required this.messageId,
    required this.shouldMention,
    required this.seedAckCandidate,
  });

  final String messageId;
  final bool shouldMention;
  final String? seedAckCandidate;
}

class _PendingAck {
  _PendingAck({required this.isDm, required this.timer});

  final bool isDm;
  final Timer timer;
  String? messageId;
  bool clearSticky = false;
  bool markDmRead = false;
}
