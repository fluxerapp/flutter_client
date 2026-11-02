import 'dart:async';

import 'package:clock/clock.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/data/read_state_effective.dart';
import 'package:fluxer_app/features/channels/data/read_state_persist.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';

const int kReadStateWriteBatchMs = 1000;

const int kReadStateMentionBatchMs = 50;
const int kReadStateUnreadMinIntervalMs = 2000;

class ReadStateAckCursor {
  const ReadStateAckCursor({
    required this.lastMessageId,
    required this.mentionCount,
    required this.manual,
    required this.stickyUnreadMessageId,
    required this.version,
    required this.lastPinTimestamp,
  });

  final String? lastMessageId;
  final int mentionCount;
  final bool manual;
  final String? stickyUnreadMessageId;
  final String? version;
  final String? lastPinTimestamp;
}

class ReadStateWriteBatcher {
  ReadStateWriteBatcher({
    required this._database,
    this._window = const Duration(milliseconds: kReadStateWriteBatchMs),
    this._mentionWindow = const Duration(
      milliseconds: kReadStateMentionBatchMs,
    ),
    this._minIntervalBetweenUnreadFlushes = const Duration(
      milliseconds: kReadStateUnreadMinIntervalMs,
    ),
    this.onOverlayChanged,
  });

  final FluxerDatabase _database;
  final VoidCallback? onOverlayChanged;
  final Duration _window;
  final Duration _mentionWindow;
  final Duration _minIntervalBetweenUnreadFlushes;
  final Map<String, _PendingUnread> _pending = <String, _PendingUnread>{};
  final Map<String, _PendingAck> _pendingAcks = <String, _PendingAck>{};
  final Map<String, _AckCursor> _cursors = <String, _AckCursor>{};
  final Map<String, Future<ReadStateAckCursor>> _seeding =
      <String, Future<ReadStateAckCursor>>{};
  final Map<String, Future<void>> _flushing = <String, Future<void>>{};
  final Map<String, DateTime> _lastUnreadFlushAt = <String, DateTime>{};
  final Map<String, _HeldReadStateOverlay> _heldWhileWriting =
      <String, _HeldReadStateOverlay>{};
  Future<void>? _ackPersist;
  bool _disposed = false;

  void _bumpOverlay() {
    if (_disposed) {
      return;
    }
    onOverlayChanged?.call();
  }

  Set<String> overlayChannelIds() => <String>{
    ..._pending.keys,
    ..._pendingAcks.keys,
    ..._heldWhileWriting.keys,
  };

  bool hasOverlay(String channelId) =>
      _pending.containsKey(channelId) ||
      _pendingAcks.containsKey(channelId) ||
      _heldWhileWriting.containsKey(channelId);

  ReadState? persistedReadState(String channelId) {
    final _AckCursor? cursor = _cursors[channelId];
    if (cursor == null || !cursor.seeded) {
      return null;
    }
    return ReadState(
      channelId: channelId,
      lastMessageId: cursor.persistedLastMessageId,
      mentionCount: cursor.persistedMentionCount,
      manual: cursor.persistedManual,
      stickyUnreadMessageId: cursor.persistedSticky,
      lastPinTimestamp: cursor.lastPinTimestamp,
      version: cursor.version,
      flags: cursor.flags,
    );
  }

  ReadStateEffectiveFields effectiveFields(
    String channelId,
    ReadState? persisted,
  ) {
    String? lastMessageId = persisted?.lastMessageId;
    var mentionCount = persisted?.mentionCount ?? 0;

    final _HeldReadStateOverlay? held = _heldWhileWriting[channelId];
    if (held != null) {
      lastMessageId = held.lastMessageId ?? lastMessageId;
      mentionCount = held.mentionCount;
    }

    final String? ackMessageId = _pendingAcks[channelId]?.messageId;
    if (ackMessageId != null &&
        compareSnowflakeIds(ackMessageId, lastMessageId) >= 0) {
      lastMessageId = ackMessageId;
      mentionCount = 0;
    }

    final _PendingUnread? pending = _pending[channelId];
    if (pending != null && pending.intents.isNotEmpty) {
      final ReadStateEffectiveFields simulated = simulateUnreadIntents(
        lastMessageId: lastMessageId,
        mentionCount: mentionCount,
        isDm: pending.isDm,
        intents: pending.intents
            .map(
              (_UnreadIntent intent) => UnreadIntentFields(
                messageId: intent.messageId,
                shouldMention: intent.shouldMention,
                seedAckCandidate: intent.seedAckCandidate,
              ),
            )
            .toList(),
      );
      lastMessageId = simulated.lastMessageId;
      mentionCount = simulated.mentionCount;
    }

    return ReadStateEffectiveFields(
      lastMessageId: lastMessageId,
      mentionCount: mentionCount,
    );
  }

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
        timer: _scheduleUnreadFlush(
          channelId,
          shouldMention ? _mentionWindow : _resolveUnreadDelay(channelId),
        ),
        urgent: shouldMention,
      ),
    );
    if (shouldMention && !pending.urgent) {
      pending.timer.cancel();
      pending
        ..timer = _scheduleUnreadFlush(channelId, _mentionWindow)
        ..urgent = true;
    }
    pending.intents.add(
      _UnreadIntent(
        messageId: messageId,
        shouldMention: shouldMention,
        seedAckCandidate: seedAckCandidate,
      ),
    );
    final _AckCursor? cursor = _cursors[channelId];
    if (cursor != null &&
        shouldMention &&
        compareSnowflakeIds(messageId, cursor.lastMessageId) > 0) {
      cursor.mentionCount += 1;
    }
    _bumpOverlay();
  }

  Timer _scheduleUnreadFlush(String channelId, Duration delay) =>
      Timer(delay, () => unawaited(flush(channelId)));

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

  bool hasPendingUnread(String channelId) => _pending.containsKey(channelId);

  ReadStateAckCursor? peekCursor(String channelId) {
    final _AckCursor? cursor = _cursors[channelId];
    if (cursor == null || !cursor.seeded) {
      return null;
    }
    return cursor.view();
  }

  Future<ReadStateAckCursor> ensureCursor(String channelId) {
    final _AckCursor? existing = _cursors[channelId];
    if (existing != null && existing.seeded) {
      return Future<ReadStateAckCursor>.value(existing.view());
    }
    return _seeding
        .putIfAbsent(channelId, () async {
          final ReadState? row = await _database.readStateDao.getReadState(
            channelId,
          );
          final _AckCursor cursor = _cursors.putIfAbsent(
            channelId,
            _AckCursor.new,
          );
          _seedCursor(cursor, row);
          final _PendingAck? pending = _pendingAcks[channelId];
          final String? pendingId = pending?.messageId;
          if (pendingId != null &&
              compareSnowflakeIds(cursor.lastMessageId, pendingId) > 0) {
            _pendingAcks.remove(channelId);
          }
          return cursor.view();
        })
        .whenComplete(() {
          _seeding.remove(channelId)?.ignore();
        });
  }

  void setCursorManual(
    String channelId, {
    required bool manual,
    bool clearSticky = false,
  }) {
    if (channelId.isEmpty) {
      return;
    }
    final _AckCursor cursor = _cursors.putIfAbsent(channelId, _AckCursor.new)
      ..manual = manual
      ..manualPinned = true;
    if (clearSticky) {
      cursor
        ..stickyUnreadMessageId = null
        ..stickyPinned = true;
    }
  }

  void adoptPersisted({
    required String channelId,
    required String? lastMessageId,
    required int mentionCount,
    required bool manual,
    String? stickyUnreadMessageId,
    String? lastPinTimestamp,
    String? version,
    int? flags,
  }) {
    final _AckCursor? cursor = _cursors[channelId];
    if (cursor == null || !cursor.seeded) {
      return;
    }
    if (cursor.ackDirty &&
        compareSnowflakeIds(cursor.lastMessageId, lastMessageId) > 0) {
      return;
    }
    cursor
      ..lastMessageId = lastMessageId
      ..mentionCount = mentionCount
      ..manual = manual
      ..manualPinned = true
      ..stickyUnreadMessageId = stickyUnreadMessageId
      ..stickyPinned = true
      ..lastPinTimestamp = lastPinTimestamp ?? cursor.lastPinTimestamp
      ..version = version ?? cursor.version
      ..flags = flags ?? cursor.flags
      ..persistedLastMessageId = lastMessageId
      ..persistedMentionCount = mentionCount
      ..persistedManual = manual
      ..persistedSticky = stickyUnreadMessageId
      ..ackDirty = false;
    _pendingAcks.remove(channelId);
  }

  void enqueueAck({
    required String channelId,
    required String messageId,
    required bool clearSticky,
  }) {
    final _PendingAck pending = _pendingAcks.putIfAbsent(
      channelId,
      _PendingAck.new,
    );
    final String? previousPendingId = pending.messageId;
    if (previousPendingId == null ||
        compareSnowflakeIds(messageId, previousPendingId) > 0) {
      pending.messageId = messageId;
    }
    pending.clearSticky = pending.clearSticky || clearSticky;
    final _AckCursor cursor = _cursors.putIfAbsent(channelId, _AckCursor.new);
    final String? previousAckId = cursor.lastMessageId;
    final int previousMentions = cursor.mentionCount;
    final bool previousManual = cursor.manual;
    final String? previousSticky = cursor.stickyUnreadMessageId;
    final String? ackId = pending.messageId;
    if (ackId != null &&
        compareSnowflakeIds(ackId, cursor.lastMessageId) >= 0) {
      cursor
        ..lastMessageId = ackId
        ..mentionCount = _mentionsAfter(channelId, ackId)
        ..manual = false
        ..manualPinned = true;
      if (pending.clearSticky) {
        cursor
          ..stickyUnreadMessageId = null
          ..stickyPinned = true;
      }
      cursor.ackDirty = true;
    }
    if (cursor.lastMessageId == previousAckId &&
        cursor.mentionCount == previousMentions &&
        cursor.manual == previousManual &&
        cursor.stickyUnreadMessageId == previousSticky) {
      return;
    }
    _bumpOverlay();
  }

  int _mentionsAfter(String channelId, String ackId) {
    final _PendingUnread? pending = _pending[channelId];
    if (pending == null) {
      return 0;
    }
    var count = 0;
    for (final _UnreadIntent intent in pending.intents) {
      if (intent.shouldMention &&
          compareSnowflakeIds(intent.messageId, ackId) > 0) {
        count += 1;
      }
    }
    return count;
  }

  Future<void> flushAck(String channelId) =>
      _persistDirtyAcks(only: <String>{channelId});

  void _releaseHeld(String channelId, _HeldReadStateOverlay held) {
    if (!identical(_heldWhileWriting[channelId], held)) {
      return;
    }
    _heldWhileWriting.remove(channelId);
    _bumpOverlay();
  }

  void discard(String channelId) {
    final _PendingUnread? pending = _pending.remove(channelId);
    pending?.timer.cancel();
    _pendingAcks.remove(channelId);
    _cursors.remove(channelId);
    _seeding.remove(channelId)?.ignore();
    _heldWhileWriting.remove(channelId);
    _bumpOverlay();
  }

  Future<void> flushAll() async {
    for (final String channelId in _pending.keys.toList()) {
      await flush(channelId);
    }
    await _persistDirtyAcks();
  }

  void clearAll() {
    for (final _PendingUnread pending in _pending.values) {
      pending.timer.cancel();
    }
    _pending.clear();
    _pendingAcks.clear();
    _cursors.clear();
    _seeding.clear();
    _heldWhileWriting.clear();
    _bumpOverlay();
  }

  Future<void> dispose() async {
    _disposed = true;
    await flushAll();
  }

  Future<void> flush(String channelId) async {
    final Future<void>? inFlight = _flushing[channelId];
    if (inFlight != null) {
      return inFlight;
    }
    final _PendingUnread? pending = _pending.remove(channelId);
    if (pending == null) {
      return;
    }
    pending.timer.cancel();
    if (pending.intents.isEmpty) {
      return;
    }
    final ReadState? persisted = await _database.readStateDao.getReadState(
      channelId,
    );
    final ReadStateEffectiveFields preview = simulateUnreadIntents(
      lastMessageId: persisted?.lastMessageId,
      mentionCount: persisted?.mentionCount ?? 0,
      isDm: pending.isDm,
      intents: pending.intents
          .map(
            (_UnreadIntent intent) => UnreadIntentFields(
              messageId: intent.messageId,
              shouldMention: intent.shouldMention,
              seedAckCandidate: intent.seedAckCandidate,
            ),
          )
          .toList(),
    );
    final _HeldReadStateOverlay held = _HeldReadStateOverlay(
      lastMessageId: preview.lastMessageId,
      mentionCount: preview.mentionCount,
    );
    _heldWhileWriting[channelId] = held;
    _bumpOverlay();
    final Future<void> future = _applyFlush(channelId, pending);
    _flushing[channelId] = future;
    await future.whenComplete(() {
      unawaited(_flushing.remove(channelId));
      _releaseHeld(channelId, held);
    });
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
          await upsertReadStateIfChanged(
            _database,
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

  Future<void> _persistDirtyAcks({Set<String>? only}) {
    final Future<void>? inFlight = _ackPersist;
    if (inFlight != null) {
      return inFlight.then((_) => _persistDirtyAcks(only: only));
    }
    final Future<void> future = _persistDirtyAcksBody(only: only);
    _ackPersist = future;
    return future.whenComplete(() {
      if (identical(_ackPersist, future)) {
        _ackPersist = null;
      }
    });
  }

  Future<void> _persistDirtyAcksBody({Set<String>? only}) async {
    final List<String> ids = <String>[
      for (final String channelId in _pendingAcks.keys)
        if (only == null || only.contains(channelId)) channelId,
    ];
    if (ids.isEmpty) {
      return;
    }
    final Map<String, _PendingAck> taken = <String, _PendingAck>{};
    final List<ReadStatesCompanion> companions = <ReadStatesCompanion>[];
    final Map<String, _AckCursor> written = <String, _AckCursor>{};
    final Map<String, _AckSnapshot> writtenSnapshot = <String, _AckSnapshot>{};
    for (final String channelId in ids) {
      final _PendingAck? pending = _pendingAcks.remove(channelId);
      if (pending == null) {
        continue;
      }
      taken[channelId] = pending;
      final _AckCursor? cursor = _cursors[channelId];
      if (cursor == null || !cursor.ackDirty) {
        continue;
      }
      if (_storedAckWins(cursor)) {
        cursor.ackDirty = false;
        continue;
      }
      if (_ackMatchesPersisted(cursor)) {
        cursor.ackDirty = false;
        continue;
      }
      companions.add(_ackCompanion(channelId, cursor));
      written[channelId] = cursor;
      writtenSnapshot[channelId] = _AckSnapshot(
        lastMessageId: cursor.lastMessageId,
        mentionCount: cursor.mentionCount,
        manual: cursor.manual,
        sticky: cursor.stickyUnreadMessageId,
      );
    }
    if (companions.isEmpty) {
      _bumpOverlay();
      return;
    }
    try {
      await _database.transaction(() async {
        await _database.readStateDao.upsertReadStates(companions);
      });
      for (final MapEntry<String, _AckCursor> entry in written.entries) {
        final _AckSnapshot? snapshot = writtenSnapshot[entry.key];
        if (snapshot == null) {
          continue;
        }
        final _AckCursor cursor = entry.value;
        cursor
          ..persistedLastMessageId = snapshot.lastMessageId
          ..persistedMentionCount = snapshot.mentionCount
          ..persistedManual = snapshot.manual
          ..persistedSticky = snapshot.sticky
          ..seeded = true
          ..ackDirty = !_ackMatchesPersisted(cursor);
      }
    } on Object catch (e, st) {
      for (final MapEntry<String, _PendingAck> entry in taken.entries) {
        _pendingAcks.putIfAbsent(entry.key, () => entry.value);
      }
      talker.error('[ReadStateWriteBatcher] ack flush failed', e, st);
    }
    _bumpOverlay();
  }

  bool _storedAckWins(_AckCursor cursor) {
    if (!cursor.seeded || cursor.persistedLastMessageId == null) {
      return false;
    }
    if (compareSnowflakeIds(
          cursor.persistedLastMessageId,
          cursor.lastMessageId,
        ) <=
        0) {
      return false;
    }
    cursor.lastMessageId = cursor.persistedLastMessageId;
    cursor.mentionCount = cursor.persistedMentionCount;
    return true;
  }

  bool _ackMatchesPersisted(_AckCursor cursor) {
    if (!cursor.seeded) {
      return false;
    }
    return cursor.persistedLastMessageId == cursor.lastMessageId &&
        cursor.persistedMentionCount == cursor.mentionCount &&
        cursor.persistedManual == cursor.manual &&
        cursor.persistedSticky == cursor.stickyUnreadMessageId;
  }

  ReadStatesCompanion _ackCompanion(String channelId, _AckCursor cursor) {
    return ReadStatesCompanion(
      channelId: Value(channelId),
      lastMessageId: Value(cursor.lastMessageId),
      mentionCount: Value(cursor.mentionCount),
      manual: Value(cursor.manual),
      stickyUnreadMessageId: cursor.seeded || cursor.stickyPinned
          ? Value(cursor.stickyUnreadMessageId)
          : const Value.absent(),
      lastPinTimestamp: cursor.seeded
          ? Value(cursor.lastPinTimestamp)
          : const Value.absent(),
      version: cursor.seeded ? Value(cursor.version) : const Value.absent(),
      flags: cursor.seeded ? Value(cursor.flags) : const Value.absent(),
    );
  }

  void _seedCursor(_AckCursor cursor, ReadState? row) {
    if (cursor.seeded) {
      return;
    }
    cursor
      ..lastPinTimestamp = row?.lastPinTimestamp
      ..version = row?.version
      ..flags = row?.flags
      ..persistedLastMessageId = row?.lastMessageId
      ..persistedMentionCount = row?.mentionCount ?? 0
      ..persistedManual = row?.manual ?? false
      ..persistedSticky = row?.stickyUnreadMessageId;
    final String? storedId = row?.lastMessageId;
    if (!cursor.ackDirty) {
      cursor
        ..lastMessageId = storedId
        ..mentionCount = row?.mentionCount ?? 0;
    } else if (compareSnowflakeIds(storedId, cursor.lastMessageId) > 0) {
      cursor
        ..lastMessageId = storedId
        ..mentionCount = row?.mentionCount ?? 0
        ..ackDirty = false;
    }
    if (!cursor.manualPinned) {
      cursor.manual = !cursor.ackDirty && (row?.manual ?? false);
    }
    if (!cursor.stickyPinned) {
      cursor.stickyUnreadMessageId = row?.stickyUnreadMessageId;
    }
    cursor.seeded = true;
  }
}

class _PendingUnread {
  _PendingUnread({
    required this.isDm,
    required this.timer,
    required this.urgent,
  });

  final bool isDm;
  Timer timer;
  bool urgent;
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

class _AckSnapshot {
  const _AckSnapshot({
    required this.lastMessageId,
    required this.mentionCount,
    required this.manual,
    required this.sticky,
  });

  final String? lastMessageId;
  final int mentionCount;
  final bool manual;
  final String? sticky;
}

class _PendingAck {
  String? messageId;
  bool clearSticky = false;
}

class _AckCursor {
  bool seeded = false;
  bool ackDirty = false;
  bool manualPinned = false;
  bool stickyPinned = false;
  String? lastMessageId;
  int mentionCount = 0;
  bool manual = false;
  String? stickyUnreadMessageId;
  String? lastPinTimestamp;
  String? version;
  int? flags;
  String? persistedLastMessageId;
  int persistedMentionCount = 0;
  bool persistedManual = false;
  String? persistedSticky;

  ReadStateAckCursor view() => ReadStateAckCursor(
    lastMessageId: lastMessageId,
    mentionCount: mentionCount,
    manual: manual,
    stickyUnreadMessageId: stickyUnreadMessageId,
    version: version,
    lastPinTimestamp: lastPinTimestamp,
  );
}

class _HeldReadStateOverlay {
  _HeldReadStateOverlay({
    required this.lastMessageId,
    required this.mentionCount,
  });

  final String? lastMessageId;
  final int mentionCount;
}
