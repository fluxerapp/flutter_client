import 'package:fluxer_app/features/members/domain/guild_members_search_models.dart';
import 'package:fluxer_dart/export.dart';

List<GuildMemberDisplayData> filterGuildMemberDisplayData(
  List<GuildMemberDisplayData> members,
  GuildMembersSearchState state,
) {
  if (members.isEmpty) {
    return const <GuildMemberDisplayData>[];
  }
  final String query = state.debouncedQuery.trim().toLowerCase();
  final Set<String>? roleFilter = state.roleFilter.isEmpty
      ? null
      : state.roleFilter.toSet();
  final bool hasMemberSinceFilter = state.memberSinceFilter.isActive;
  final bool hasJoinedProductFilter = state.joinedProductFilter.isActive;
  final bool hasJoinMethodFilter = state.joinMethodFilter.isActive;
  if (query.isEmpty &&
      roleFilter == null &&
      !hasMemberSinceFilter &&
      !hasJoinedProductFilter &&
      !hasJoinMethodFilter) {
    return List<GuildMemberDisplayData>.from(members);
  }

  final List<GuildMemberDisplayData> filtered = <GuildMemberDisplayData>[];
  for (final GuildMemberDisplayData member in members) {
    if (query.isNotEmpty && !member.matchesSearchQuery(query)) {
      continue;
    }
    if (roleFilter != null && !member.roleIds.any(roleFilter.contains)) {
      continue;
    }
    if (hasMemberSinceFilter &&
        !_matchesDateFilter(member.joinedAt, state.memberSinceFilter)) {
      continue;
    }
    if (hasJoinedProductFilter) {
      if (member.userCreatedAt == null) {
        continue;
      }
      if (!_matchesDateFilter(
        member.userCreatedAt!,
        state.joinedProductFilter,
      )) {
        continue;
      }
    }
    if (hasJoinMethodFilter) {
      final JoinSourceType? source = member.joinSourceType;
      if (source == null) {
        continue;
      }
      if (state.joinMethodFilter.sourceTypes.isNotEmpty &&
          !state.joinMethodFilter.sourceTypes.contains(source)) {
        continue;
      }
      if (state.joinMethodFilter.inviteCodes.isNotEmpty) {
        final String? code = member.sourceInviteCode;
        if (code == null ||
            !state.joinMethodFilter.inviteCodes.contains(code)) {
          continue;
        }
      }
    }
    filtered.add(member);
  }
  return filtered;
}

bool _matchesDateFilter(DateTime date, GuildMembersDateRangeFilter filter) {
  final int seconds = date.millisecondsSinceEpoch ~/ 1000;
  if (filter.gte != null && seconds < filter.gte!) {
    return false;
  }
  if (filter.lte != null && seconds > filter.lte!) {
    return false;
  }
  return true;
}

void sortGuildMemberDisplayData(
  List<GuildMemberDisplayData> members,
  GuildMembersSortMode sortMode,
) {
  members.sort((GuildMemberDisplayData a, GuildMemberDisplayData b) {
    final int cmp = a.joinedAt.compareTo(b.joinedAt);
    return sortMode == GuildMembersSortMode.newest ? -cmp : cmp;
  });
}

List<GuildMemberDisplayData> paginateGuildMemberDisplayData(
  List<GuildMemberDisplayData> members, {
  required int page,
  required int pageSize,
}) {
  if (pageSize <= 0 || members.isEmpty) {
    return const <GuildMemberDisplayData>[];
  }
  final int start = (page - 1) * pageSize;
  if (start >= members.length) {
    return const <GuildMemberDisplayData>[];
  }
  final int end = start + pageSize;
  return members.sublist(start, end > members.length ? members.length : end);
}
