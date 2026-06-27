import 'package:flutter/foundation.dart';
import 'package:fluxer_dart/gateway.dart';

@immutable
class MemberListViewportKey {
  const MemberListViewportKey({required this.guildId, required this.channelId});

  final String guildId;
  final String channelId;

  String get storageKey => '$guildId\u0000$channelId';

  @override
  bool operator ==(Object other) {
    return other is MemberListViewportKey &&
        other.guildId == guildId &&
        other.channelId == channelId;
  }

  @override
  int get hashCode => Object.hash(guildId, channelId);
}

enum MemberListViewportRowType { group, member }

class MemberListViewportRow {
  const MemberListViewportRow.group({required this.group})
    : type = MemberListViewportRowType.group,
      userId = null,
      listMember = null;

  const MemberListViewportRow.member({
    required this.userId,
    required this.listMember,
  }) : type = MemberListViewportRowType.member,
       group = null;

  final MemberListViewportRowType type;
  final MemberListGroup? group;
  final String? userId;
  final MemberListMember? listMember;
}

class MemberListViewportListState {
  const MemberListViewportListState({
    this.groups = const <MemberListGroup>[],
    this.rows = const <int, MemberListViewportRow>{},
    this.subscribedRanges = const <List<int>>[],
    this.memberCount = 0,
    this.onlineCount = 0,
    this.totalRows = 0,
    this.hasReceivedInitialPayload = false,
  });

  final List<MemberListGroup> groups;
  final Map<int, MemberListViewportRow> rows;
  final List<List<int>> subscribedRanges;
  final int memberCount;
  final int onlineCount;
  final int totalRows;
  final bool hasReceivedInitialPayload;

  MemberListViewportListState copyWith({
    List<MemberListGroup>? groups,
    Map<int, MemberListViewportRow>? rows,
    List<List<int>>? subscribedRanges,
    int? memberCount,
    int? onlineCount,
    int? totalRows,
    bool? hasReceivedInitialPayload,
  }) {
    return MemberListViewportListState(
      groups: groups ?? this.groups,
      rows: rows ?? this.rows,
      subscribedRanges: subscribedRanges ?? this.subscribedRanges,
      memberCount: memberCount ?? this.memberCount,
      onlineCount: onlineCount ?? this.onlineCount,
      totalRows: totalRows ?? this.totalRows,
      hasReceivedInitialPayload:
          hasReceivedInitialPayload ?? this.hasReceivedInitialPayload,
    );
  }
}

class MemberListViewportState {
  const MemberListViewportState({
    this.lists = const <String, MemberListViewportListState>{},
    this.listIdByChannel = const <String, String>{},
  });

  final Map<String, MemberListViewportListState> lists;
  final Map<String, String> listIdByChannel;

  MemberListViewportState copyWith({
    Map<String, MemberListViewportListState>? lists,
    Map<String, String>? listIdByChannel,
  }) {
    return MemberListViewportState(
      lists: lists ?? this.lists,
      listIdByChannel: listIdByChannel ?? this.listIdByChannel,
    );
  }
}
