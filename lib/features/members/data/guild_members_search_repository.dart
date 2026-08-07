import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/members/domain/guild_members_search_models.dart';
import 'package:fluxer_app/features/members/utils/guild_members_search_request_builder.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_dart/export.dart';

class GuildMembersSearchPageResult {
  const GuildMembersSearchPageResult({
    required this.members,
    required this.totalCount,
    required this.indexing,
  });

  final List<GuildMemberDisplayData> members;
  final int totalCount;
  final bool indexing;
}

class GuildMembersSearchRepository {
  GuildMembersSearchRepository({
    required this.client,
    required this.database,
    required this.hydrationService,
  });

  final FluxerClient client;
  final db.FluxerDatabase database;
  final GuildMemberHydrationService hydrationService;

  Future<GuildMembersSearchPageResult> searchMembers({
    required String guildId,
    required GuildMembersSearchState state,
    int? page,
  }) async {
    final int resolvedPage = page ?? state.page;
    final GuildMemberSearchRequest request = buildGuildMemberSearchRequest(
      query: state.debouncedQuery,
      page: resolvedPage,
      pageSize: state.pageSize,
      sortMode: state.sortMode,
      roleFilter: state.roleFilter,
      memberSinceFilter: state.memberSinceFilter,
      joinedProductFilter: state.joinedProductFilter,
      joinMethodFilter: state.joinMethodFilter,
    );
    final GuildMemberSearchResponse response = await client.guilds
        .searchGuildMembers(guildId: guildId, body: request);
    final List<GuildMemberDisplayData> members = await _mapSearchResults(
      guildId,
      response.members,
    );
    _hydrateSearchResults(guildId, members);
    return GuildMembersSearchPageResult(
      members: members,
      totalCount: response.totalResultCount,
      indexing: response.indexing,
    );
  }

  Future<List<GuildMemberDisplayData>> _mapSearchResults(
    String guildId,
    List<GuildMemberSearchResult> results,
  ) async {
    if (results.isEmpty) {
      return const <GuildMemberDisplayData>[];
    }
    final List<String> userIds = results
        .map((GuildMemberSearchResult result) => result.userId)
        .toList(growable: false);
    final Map<String, db.Member> memberRows = <String, db.Member>{
      for (final db.Member row in await database.memberDao.getMembersByUserIds(
        guildId,
        userIds,
      ))
        row.userId: row,
    };
    final Map<String, db.User> usersById = <String, db.User>{
      for (final db.User user in await database.userDao.getUsersByIds(userIds))
        user.id: user,
    };
    return results
        .map(
          (GuildMemberSearchResult result) =>
              GuildMemberDisplayData.fromSearchResult(
                result,
                memberRow: memberRows[result.userId],
                user: usersById[result.userId],
              ),
        )
        .toList(growable: false);
  }

  void _hydrateSearchResults(
    String guildId,
    List<GuildMemberDisplayData> members,
  ) {
    if (members.isEmpty) {
      return;
    }
    final Set<String> idsToLoad = <String>{};
    for (final GuildMemberDisplayData member in members) {
      idsToLoad.add(member.userId);
      final String? inviterId = member.inviterId;
      if (inviterId != null && inviterId.isNotEmpty) {
        idsToLoad.add(inviterId);
      }
    }
    hydrationService.requestHydration(guildId: guildId, userIds: idsToLoad);
  }
}

final Provider<GuildMembersSearchRepository>
guildMembersSearchRepositoryProvider = Provider<GuildMembersSearchRepository>((
  Ref ref,
) {
  return GuildMembersSearchRepository(
    client: ref.watch(fluxerClientProvider),
    database: ref.watch(fluxerDatabaseProvider),
    hydrationService: ref.watch(guildMemberHydrationServiceProvider),
  );
});
