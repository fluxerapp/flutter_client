import 'package:fluxer_app/features/members/domain/guild_members_search_models.dart';
import 'package:fluxer_dart/export.dart';

GuildMemberSearchRequest buildGuildMemberSearchRequest({
  required String? query,
  required int page,
  required int pageSize,
  required GuildMembersSortMode sortMode,
  required List<String> roleFilter,
  required GuildMembersDateRangeFilter memberSinceFilter,
  required GuildMembersDateRangeFilter joinedProductFilter,
  required GuildMembersJoinMethodFilter joinMethodFilter,
}) {
  final String trimmed = query?.trim() ?? '';
  return GuildMemberSearchRequest(
    query: trimmed.isEmpty ? null : trimmed,
    limit: pageSize,
    offset: (page - 1) * pageSize,
    roleIds: roleFilter.isEmpty ? null : roleFilter,
    joinedAtGte: memberSinceFilter.gte,
    joinedAtLte: memberSinceFilter.lte,
    userCreatedAtGte: joinedProductFilter.gte,
    userCreatedAtLte: joinedProductFilter.lte,
    joinSourceType: joinMethodFilter.sourceTypes.isEmpty
        ? null
        : joinMethodFilter.sourceTypes,
    sourceInviteCode: joinMethodFilter.inviteCodes.isEmpty
        ? null
        : joinMethodFilter.inviteCodes,
    sortBy: GuildMemberSearchRequestSortBySortBy.joinedAt,
    sortOrder: sortMode == GuildMembersSortMode.newest
        ? GuildMemberSearchRequestSortOrderSortOrder.desc
        : GuildMemberSearchRequestSortOrderSortOrder.asc,
  );
}

bool isDatePresetMatch(GuildMembersDateRangeFilter filter, Duration duration) {
  if (filter.gte == null || filter.lte != null) {
    return false;
  }
  final int expected =
      DateTime.now().subtract(duration).toUtc().millisecondsSinceEpoch ~/ 1000;
  return (filter.gte! - expected).abs() < 60;
}

List<String> collectInviteCodesFromMembers(
  List<GuildMemberDisplayData> members,
) {
  final Set<String> codes = <String>{};
  for (final GuildMemberDisplayData member in members) {
    final String? code = member.sourceInviteCode;
    if (code != null && code.isNotEmpty) {
      codes.add(code);
    }
  }
  return codes.toList()..sort();
}
