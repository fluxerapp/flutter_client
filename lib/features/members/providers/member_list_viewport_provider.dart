import 'package:fluxer_app/features/members/domain/member_list_layout.dart';
import 'package:fluxer_app/features/members/domain/member_list_range_utils.dart';
import 'package:fluxer_app/features/members/domain/member_list_viewport_state.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'member_list_viewport_provider.g.dart';

MemberListViewportRow? _convertRow(MemberListItem item) {
  final MemberListGroup? group = item.group;
  if (group != null) {
    if (group.count <= 0) {
      return null;
    }
    return MemberListViewportRow.group(group: group);
  }
  final MemberListMember? listMember = item.member;
  final String? userId = listMember?.member.user.id;
  if (userId == null || userId.isEmpty) {
    return null;
  }
  return MemberListViewportRow.member(userId: userId, listMember: listMember);
}

bool _isEmptyGroupItem(MemberListItem item) {
  return item.group != null && item.group!.count <= 0;
}

List<MemberListGroup> _visibleGroups(List<MemberListGroup> groups) {
  return groups.where((MemberListGroup g) => g.count > 0).toList();
}

Map<int, MemberListViewportRow> _pruneRowsToRanges(
  Map<int, MemberListViewportRow> rows,
  List<MemberListRange> subscribedRanges,
) {
  if (subscribedRanges.isEmpty) {
    return <int, MemberListViewportRow>{};
  }
  final Map<int, MemberListViewportRow> pruned = <int, MemberListViewportRow>{};
  for (final MapEntry<int, MemberListViewportRow> entry in rows.entries) {
    if (isIndexInMemberListRanges(entry.key, subscribedRanges)) {
      pruned[entry.key] = entry.value;
    }
  }
  return pruned;
}

String _channelAliasKey(String guildId, String channelId) {
  return '$guildId:channel:$channelId';
}

@Riverpod(keepAlive: true)
class MemberListViewport extends _$MemberListViewport {
  @override
  MemberListViewportState build() => const MemberListViewportState();

  void clearSession() {
    state = const MemberListViewportState();
  }

  void clearChannel({required String guildId, required String channelId}) {
    if (!ref.mounted) {
      return;
    }
    final String channelKey = _channelAliasKey(guildId, channelId);
    final Map<String, MemberListViewportListState> lists =
        Map<String, MemberListViewportListState>.from(state.lists);
    final Map<String, String> listIdByChannel = Map<String, String>.from(
      state.listIdByChannel,
    );
    final String? listId = listIdByChannel.remove(channelKey);
    lists.remove(channelKey);
    if (listId != null) {
      lists.remove(listId);
    }
    state = state.copyWith(lists: lists, listIdByChannel: listIdByChannel);
  }

  MemberListViewportListState? getList({
    required String guildId,
    required String channelId,
  }) {
    final String channelKey = _channelAliasKey(guildId, channelId);
    final String? listId = state.listIdByChannel[channelKey];
    if (listId != null && state.lists.containsKey(listId)) {
      return state.lists[listId];
    }
    return state.lists[channelKey];
  }

  void setSubscribedRanges({
    required String guildId,
    required String channelId,
    required List<MemberListRange> ranges,
  }) {
    final String channelKey = _channelAliasKey(guildId, channelId);
    final String storageKey = state.listIdByChannel[channelKey] ?? channelKey;
    final MemberListViewportListState? existing = state.lists[storageKey];
    if (existing == null) {
      final List<MemberListRange> normalized = normalizeMemberListRanges(
        ranges,
      );
      final Map<String, MemberListViewportListState> lists =
          Map<String, MemberListViewportListState>.from(state.lists);
      lists[channelKey] = MemberListViewportListState(
        subscribedRanges: normalized,
      );
      state = state.copyWith(lists: lists);
      return;
    }
    final List<MemberListRange> normalized = normalizeMemberListRanges(ranges);
    if (areMemberListRangesEqual(existing.subscribedRanges, normalized)) {
      return;
    }
    final Map<int, MemberListViewportRow> prunedRows = _pruneRowsToRanges(
      existing.rows,
      normalized,
    );
    final Map<String, MemberListViewportListState> lists =
        Map<String, MemberListViewportListState>.from(state.lists);
    lists[storageKey] = existing.copyWith(
      subscribedRanges: normalized,
      rows: prunedRows,
    );
    state = state.copyWith(lists: lists);
  }

  void applyListUpdate(GuildMemberListUpdateEvent event) {
    final String? channelId = event.channelId;
    if (channelId == null || channelId.isEmpty) {
      return;
    }
    final String guildId = event.guildId;
    final String listId = event.id;
    final String channelKey = _channelAliasKey(guildId, channelId);
    final Map<String, MemberListViewportListState> lists =
        Map<String, MemberListViewportListState>.from(state.lists);
    final Map<String, String> listIdByChannel = Map<String, String>.from(
      state.listIdByChannel,
    );
    listIdByChannel[channelKey] = listId;
    MemberListViewportListState listState =
        lists[listId] ??
        lists[channelKey] ??
        const MemberListViewportListState();
    final Map<int, MemberListViewportRow> newRows =
        Map<int, MemberListViewportRow>.from(listState.rows);
    for (final MemberListOp op in event.ops) {
      if (op.op != 'SYNC' || !isValidMemberListRange(op.range)) {
        continue;
      }
      final List<int> range = op.range!;
      final int start = range[0];
      final int end = range[1];
      for (int i = start; i <= end; i++) {
        newRows.remove(i);
      }
      int nextIndex = start;
      final List<MemberListItem> items = op.items ?? <MemberListItem>[];
      for (final MemberListItem item in items) {
        final MemberListViewportRow? row = _convertRow(item);
        if (row != null) {
          newRows[nextIndex] = row;
          nextIndex += 1;
        } else if (!_isEmptyGroupItem(item)) {
          nextIndex += 1;
        }
      }
    }
    final List<MemberListGroup> visibleGroups = _visibleGroups(event.groups);
    final List<MemberListGroupLayout> groupLayouts = buildMemberListLayout(
      visibleGroups,
    );
    final int totalMembers =
        event.memberCount > getTotalMemberCount(visibleGroups)
        ? event.memberCount
        : getTotalMemberCount(visibleGroups);
    final int totalRows = groupLayouts.isNotEmpty
        ? getTotalRowsFromLayout(groupLayouts)
        : totalMembers;
    final Map<int, MemberListViewportRow> boundedRows =
        <int, MemberListViewportRow>{};
    for (final MapEntry<int, MemberListViewportRow> entry in newRows.entries) {
      if (entry.key >= 0 && entry.key < totalRows) {
        boundedRows[entry.key] = entry.value;
      }
    }
    final List<MemberListRange> subscribedRanges = normalizeMemberListRanges(
      listState.subscribedRanges,
    );
    final Map<int, MemberListViewportRow> prunedRows =
        subscribedRanges.isNotEmpty
        ? _pruneRowsToRanges(boundedRows, subscribedRanges)
        : boundedRows;
    listState = listState.copyWith(
      groups: visibleGroups,
      rows: prunedRows,
      memberCount: event.memberCount,
      onlineCount: event.onlineCount,
      totalRows: totalRows,
      subscribedRanges: subscribedRanges,
      hasReceivedInitialPayload: true,
    );
    lists[listId] = listState;
    lists[channelKey] = listState;
    state = state.copyWith(lists: lists, listIdByChannel: listIdByChannel);
  }
}
