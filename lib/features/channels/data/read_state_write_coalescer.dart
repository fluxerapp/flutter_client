import 'dart:async';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';

/// Debounce window for coalescing per-channel `recordUnread` read-state writes,
/// mirroring `kMemberListUpdateBatchMs` for member-list updates.
const int kReadStateWriteCoalesceMs = 1000;

/// Coalesces the high-frequency `recordUnread` read-state write path per channel
/// so a burst of inbound `MESSAGE_CREATE` events folds into one Drift
/// transaction per channel per [kReadStateWriteCoalesceMs] window instead of one
/// SELECT + autocommitted write per message.
///
/// This also closes a lost-increment race: gateway events are dispatched without
/// awaiting `GatewayEventHandler.handle`, so two `MESSAGE_CREATE` for the same
/// channel interleave the read→`mentionCount + 1`→write and drop an increment.
/// Here the increments accumulate against one in-RAM working copy and apply in a
/// single transaction.
///
/// Only the `recordUnread` write is coalesced. Acks, server acks, READY, pin
/// acks, channel delete, and the message-delete recompute keep writing
/// immediately; the flush re-reads fresh Drift and re-checks ack coverage, so it
/// self-corrects against any interleaved immediate writer without a barrier.
/// Drift remains the UI read source — consumers keep watching the DAO streams.
class ReadStateWriteCoalescer {
  ReadStateWriteCoalescer({
    required FluxerDatabase database,
    Duration window = const Duration(milliseconds: kReadStateWriteCoalesceMs),
  }) : _database = database,
       _window = window;

  final FluxerDatabase _database;
  final Duration _window;
  final Map<String, _PendingUnread> _pending = <String, _PendingUnread>{};
  final Map<String, Future<void>> _flushing = <String, Future<void>>{};

  /// Queues a non-covered, non-acked unread message for batched application.
  /// The window is measured from the first queued message for the channel and
  /// is not reset by later enqueues (mirrors `MemberListUpdateBatcher`).
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
        timer: Timer(_window, () => unawaited(flush(channelId))),
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

  /// Whether [channelId] has pending-but-unflushed unread messages. The incoming
  /// decision ORs this into `hadUnreadOrMentions` so a blocked-author message
  /// cannot auto-ack a channel whose unreads have not landed in Drift yet.
  bool hasPending(String channelId) => _pending.containsKey(channelId);

  /// Drops the pending batch for [channelId] without writing. Used when an
  /// authoritative recompute (message delete) or deletion (channel delete)
  /// supersedes the queued increments.
  void discard(String channelId) {
    final _PendingUnread? pending = _pending.remove(channelId);
    pending?.timer.cancel();
  }

  /// Flushes every pending channel to Drift. Used on background / disconnect to
  /// persist unreads before the app can be killed.
  Future<void> flushAll() async {
    for (final String channelId in _pending.keys.toList()) {
      await flush(channelId);
    }
  }

  /// Drops every pending batch without writing. Used on READY, where the server
  /// read-state snapshot is authoritative and stale pending writes must not land.
  void clearAll() {
    for (final _PendingUnread pending in _pending.values) {
      pending.timer.cancel();
    }
    _pending.clear();
  }

  /// Persists pending unreads on teardown rather than dropping them.
  Future<void> dispose() => flushAll();

  /// Flushes [channelId]'s pending unreads to Drift now, awaiting any flush
  /// already in flight for that channel. Call this before an immediate absolute
  /// read-state write (server ack, mention recompute) so the coalesced
  /// increments are materialized first and the absolute write becomes the last
  /// word, never double-counted by a later replay.
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
          // Re-check ack coverage against the working copy: an immediate ack
          // (own/auto/server) may have advanced the ack past this message while
          // it sat in the window, in which case it is no longer unread.
          if (lastMessageId != null &&
              compareSnowflakeIds(intent.messageId, lastMessageId) <= 0) {
            continue;
          }
          // Seed the ack baseline once for never-acked guild channels so new
          // messages surface as plain unread (mirrors
          // `_recordUnreadForCreatedMessage`'s guild-only seed).
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

        // Matches `_recordUnreadForCreatedMessage`'s `readStateChanged`: write
        // when a field changed, or when the row was absent and at least one
        // message recorded (the `existing == null` branch, e.g. a muted DM's
        // first unread).
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

        // DM unread is tracked via the DM row counter, incremented once per
        // recorded message (folded to a single write).
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
      // A failed flush drops these increments; the next READY snapshot or server
      // ack reconciles, since the server is authoritative for read state.
      talker.error('[ReadStateCoalescer] flush failed for $channelId', e, st);
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
