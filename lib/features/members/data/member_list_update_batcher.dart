import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/members/data/member_cache_evictor.dart';
import 'package:fluxer_app/features/members/data/member_list_drift_sync.dart';
import 'package:fluxer_app/features/members/domain/member_list_range_utils.dart';
import 'package:fluxer_app/features/members/domain/member_list_viewport_state.dart';
import 'package:fluxer_app/features/members/providers/member_list_viewport_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'member_list_update_batcher.g.dart';

const int kMemberListUpdateBatchMs = 1000;

class MemberListUpdateBatcher {
  MemberListUpdateBatcher(this._ref);

  final Ref _ref;
  final Map<String, _PendingMemberListBatch> _pending =
      <String, _PendingMemberListBatch>{};

  void enqueue(GuildMemberListUpdateEvent event) {
    final String? channelId = event.channelId;
    if (channelId == null || channelId.isEmpty) {
      _apply(event, reason: 'no-channel', coalesced: 1);
      return;
    }
    final MemberListViewportListState? list = _ref
        .read(memberListViewportProvider(readAccountUserId(_ref)).notifier)
        .getList(guildId: event.guildId, channelId: channelId);
    if (list == null || !list.hasReceivedInitialPayload) {
      _apply(event, reason: 'initial', coalesced: 1);
      return;
    }
    final String key = _batchKey(event.guildId, event.id);
    if (_isOwnPresenceChange(event, list)) {
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
    _ref
        .read(memberListViewportProvider(readAccountUserId(_ref)).notifier)
        .applyListUpdate(event);
    final FluxerDatabase database = _ref.read(fluxerDatabaseProvider);
    final MemberCacheEvictor evictor = _ref.read(memberCacheEvictorProvider);
    unawaited(() async {
      await MemberListDriftSync(database).syncFromListUpdate(
        guildId: event.guildId,
        ops: event.ops,
        isValidRange: isValidMemberListRange,
      );
      if (!_ref.mounted) {
        return;
      }
      await evictor.evictIfNeeded(
        guildId: event.guildId,
        protectedUserIds: collectProtectedMemberUserIds(
          ref: _ref,
          guildId: event.guildId,
        ),
      );
    }());
  }

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
      ops: _withoutReplacedSyncs(<MemberListOp>[...existing.ops, ...next.ops]),
    );
  }

  List<MemberListOp> _withoutReplacedSyncs(List<MemberListOp> ops) {
    final Set<String> syncedRanges = <String>{};
    final List<MemberListOp> kept = <MemberListOp>[];
    for (final MemberListOp op in ops.reversed) {
      final List<int>? range = op.range;
      if (op.op == 'SYNC' &&
          range != null &&
          !syncedRanges.add(range.join(':'))) {
        continue;
      }
      kept.add(op);
    }
    return kept.reversed.toList();
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

@Riverpod(keepAlive: true)
MemberListUpdateBatcher memberListUpdateBatcher(Ref ref, String accountUserId) {
  final MemberListUpdateBatcher batcher = MemberListUpdateBatcher(ref);
  ref.onDispose(batcher.dispose);
  return batcher;
}
