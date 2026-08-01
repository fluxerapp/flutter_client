import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/members/domain/guild_members_search_models.dart';
import 'package:fluxer_app/features/members/utils/guild_members_search_request_builder.dart';
import 'package:fluxer_dart/export.dart';

final Provider<GuildMembersSearchRepository>
guildMembersSearchRepositoryProvider = Provider<GuildMembersSearchRepository>((
  Ref ref,
) {
  return GuildMembersSearchRepository(ref.watch(fluxerClientProvider));
});

class GuildMembersSearchRepository {
  GuildMembersSearchRepository(this._client);

  final FluxerClient _client;

  Future<GuildMemberSearchResponse> search({
    required String guildId,
    required GuildMembersSearchState state,
    required int page,
  }) {
    final GuildMemberSearchRequest request = buildGuildMemberSearchRequest(
      query: state.debouncedQuery,
      page: page,
      pageSize: state.pageSize,
      sortMode: state.sortMode,
      roleFilter: state.roleFilter,
      memberSinceFilter: state.memberSinceFilter,
      joinedProductFilter: state.joinedProductFilter,
      joinMethodFilter: state.joinMethodFilter,
    );
    return _client.guilds.searchGuildMembers(guildId: guildId, body: request);
  }
}
