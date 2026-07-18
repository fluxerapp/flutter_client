import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/members/data/member_cache_evictor.dart';
import 'package:fluxer_app/features/members/data/member_list_drift_sync.dart';
import 'package:fluxer_app/features/members/domain/member_list_range_utils.dart';
import 'package:fluxer_app/features/members/domain/member_list_viewport_state.dart';
import 'package:fluxer_app/features/members/providers/member_list_viewport_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/gateway.dart';

/// Debounce window for coalescing `GUILD_MEMBER_LIST_UPDATE` events, mirroring
/// the web client's `MEMBER_LIST_UPDATE_BATCH_MS`.
const int kMemberListUpdateBatchMs = 1000;

/// Coalesces high-frequency `GUILD_MEMBER_LIST_UPDATE` events per member list so
/// the viewport, Drift sync, and cache eviction run at most once per
/// [kMemberListUpdateBatchMs] window instead of once per event.
///
/// The backend broadcasts one event per member-list mutation (presence flips,
/// joins/leaves, role/hoist changes), which on an active guild is many per
/// second. Applied individually, each event triggers a member-list widget
/// rebuild, a multi-table Drift transaction, and a member-count query — the
/// dominant cost under churn.
///
/// Because [MemberListViewport.applyListUpdate] folds `ops` onto existing rows
/// (delete range, then set), applying the concatenated ops of several events in
/// one pass yields the same result as applying each event in turn. Batched
/// events are therefore merged by appending ops and keeping the latest
/// counts/groups, then flushed once per window.
///
/// Two cases bypass the window and apply immediately: the first payload for a
/// list (so it first-paints without delay) and a change to the local user's own
/// presence (so their status updates feel instant), matching the web client.
class MemberListUpdateBatcher {
  MemberListUpdateBatcher(this._ref);

  final Ref _ref;
  final Map<String, _PendingMemberListBatch> _pending =
      <String, _PendingMemberListBatch>{};

  /// Queues [event] for batched application. Channel-less events, the first
  /// payload for a list, and the local user's own presence changes are applied
  /// immediately; everything else is coalesced into a [kMemberListUpdateBatchMs]
  /// window measured from the first queued event.
  void enqueue(GuildMemberListUpdateEvent event) {
    final String? channelId = event.channelId;
    if (channelId == null || channelId.isEmpty) {
      _apply(event, reason: 'no-channel', coalesced: 1);
      return;
    }
    final MemberListViewportListState? list = _ref
        .read(memberListViewportProvider.notifier)
        .getList(guildId: event.guildId, channelId: channelId);
    if (list == null || !list.hasReceivedInitialPayload) {
      _apply(event, reason: 'initial', coalesced: 1);
      return;
    }
    final String key = _batchKey(event.guildId, event.id);
    if (_isOwnPresenceChange(event, list)) {
      // Flush anything already queued for this list first so ordering holds,
      // then land the local user's status without the batch delay.
      _flush(key);
      _apply(event, reason: 'self', coalesced: 1);
      return;
    }
    final _PendingMemberListBatch? existing = _pending[key];
    if (existing == null) {
      _pending[key] = _PendingMemberListBatch(
        event: event,
        timer: Timer(
          const Duration(milliseconds: kMemberListUpdateBatchMs),
          () => _flush(key),
        ),
      );
      return;
    }
    existing
      ..event = _mergeEvents(existing.event, event)
      ..count += 1;
  }

  /// Applies every pending batch immediately.
  void flushAll() {
    for (final String key in _pending.keys.toList()) {
      _flush(key);
    }
  }

  /// Drops every pending batch without applying it. Called when the session is
  /// reset so updates queued against a stale socket never land.
  void clearAll() {
    for (final _PendingMemberListBatch batch in _pending.values) {
      batch.timer.cancel();
    }
    _pending.clear();
  }

  void dispose() => clearAll();

  void _flush(String key) {
    final _PendingMemberListBatch? batch = _pending.remove(key);
    if (batch == null) {
      return;
    }
    batch.timer.cancel();
    _apply(batch.event, reason: 'batched', coalesced: batch.count);
  }

  void _apply(
    GuildMemberListUpdateEvent event, {
    required String reason,
    required int coalesced,
  }) {
    talker.debug(
      '[Gateway] GUILD_MEMBER_LIST_UPDATE: ${event.guildId} '
      '($reason, ${coalesced}x)',
    );
    _ref.read(memberListViewportProvider.notifier).applyListUpdate(event);
    unawaited(() async {
      await MemberListDriftSync(
        _ref.read(fluxerDatabaseProvider),
      ).syncFromListUpdate(
        guildId: event.guildId,
        memberCount: event.memberCount,
        onlineCount: event.onlineCount,
        ops: event.ops,
        isValidRange: isValidMemberListRange,
      );
      await _ref
          .read(memberCacheEvictorProvider)
          .evictIfNeeded(
            guildId: event.guildId,
            protectedUserIds: collectProtectedMemberUserIds(
              ref: _ref,
              guildId: event.guildId,
            ),
          );
    }());
  }

  /// Whether [event] carries a presence change for the local user that is
  /// already visible in [list]. Such updates skip the batch so the user's own
  /// status reflects immediately.
  bool _isOwnPresenceChange(
    GuildMemberListUpdateEvent event,
    MemberListViewportListState list,
  ) {
    if (list.subscribedRanges.isEmpty) {
      return false;
    }
    final String currentUserId = _ref.read(
      userSettingsViewModelProvider.select(
        (UserSettingsViewState settings) => settings.userId,
      ),
    );
    if (currentUserId.isEmpty) {
      return false;
    }
    final MemberListMember? currentRow = _currentUserRow(list, currentUserId);
    if (currentRow == null) {
      return false;
    }
    for (final MemberListOp op in event.ops) {
      final List<MemberListItem>? items = op.items;
      if (items == null) {
        continue;
      }
      for (final MemberListItem item in items) {
        final MemberListMember? member = item.member;
        if (member == null || member.member.user.id != currentUserId) {
          continue;
        }
        if (member.status != currentRow.status ||
            member.customStatus != currentRow.customStatus ||
            member.mobile != currentRow.mobile) {
          return true;
        }
      }
    }
    return false;
  }

  MemberListMember? _currentUserRow(
    MemberListViewportListState list,
    String currentUserId,
  ) {
    for (final MemberListViewportRow row in list.rows.values) {
      if (row.userId == currentUserId) {
        return row.listMember;
      }
    }
    return null;
  }

  GuildMemberListUpdateEvent _mergeEvents(
    GuildMemberListUpdateEvent existing,
    GuildMemberListUpdateEvent next,
  ) {
    return GuildMemberListUpdateEvent(
      guildId: next.guildId,
      id: next.id,
      channelId: next.channelId ?? existing.channelId,
      memberCount: next.memberCount,
      onlineCount: next.onlineCount,
      groups: next.groups,
      ops: <MemberListOp>[...existing.ops, ...next.ops],
    );
  }

  String _batchKey(String guildId, String listId) => '$guildId:$listId';
}

class _PendingMemberListBatch {
  _PendingMemberListBatch({required this.event, required this.timer})
    : count = 1;

  GuildMemberListUpdateEvent event;
  final Timer timer;
  int count;
}

final Provider<MemberListUpdateBatcher> memberListUpdateBatcherProvider =
    Provider<MemberListUpdateBatcher>((Ref ref) {
      final MemberListUpdateBatcher batcher = MemberListUpdateBatcher(ref);
      ref.onDispose(batcher.dispose);
      return batcher;
    });
