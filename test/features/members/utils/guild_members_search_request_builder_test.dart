import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/members/domain/guild_members_search_models.dart';
import 'package:fluxer_app/features/members/utils/guild_members_search_request_builder.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  group('buildGuildMemberSearchRequest', () {
    test('builds empty-query page request for member listing', () {
      final GuildMemberSearchRequest request = buildGuildMemberSearchRequest(
        query: '',
        page: 2,
        pageSize: 25,
        sortMode: GuildMembersSortMode.newest,
        roleFilter: const <String>[],
        memberSinceFilter: GuildMembersDateRangeFilter.empty,
        joinedProductFilter: GuildMembersDateRangeFilter.empty,
        joinMethodFilter: GuildMembersJoinMethodFilter.empty,
      );

      expect(request.query, isNull);
      expect(request.limit, 25);
      expect(request.offset, 25);
      expect(request.sortBy, GuildMemberSearchRequestSortBySortBy.joinedAt);
      expect(
        request.sortOrder,
        GuildMemberSearchRequestSortOrderSortOrder.desc,
      );
    });

    test('includes search query and filters', () {
      final GuildMemberSearchRequest request = buildGuildMemberSearchRequest(
        query: ' alice ',
        page: 1,
        pageSize: 50,
        sortMode: GuildMembersSortMode.oldest,
        roleFilter: const <String>['role-1'],
        memberSinceFilter: const GuildMembersDateRangeFilter(gte: 100),
        joinedProductFilter: const GuildMembersDateRangeFilter(lte: 200),
        joinMethodFilter: const GuildMembersJoinMethodFilter(
          sourceTypes: <JoinSourceType>[JoinSourceType.instantInvite],
          inviteCodes: <String>['welcome'],
        ),
      );

      expect(request.query, 'alice');
      expect(request.limit, 50);
      expect(request.offset, 0);
      expect(request.roleIds, <String>['role-1']);
      expect(request.joinedAtGte, 100);
      expect(request.userCreatedAtLte, 200);
      expect(request.joinSourceType, <JoinSourceType>[
        JoinSourceType.instantInvite,
      ]);
      expect(request.sourceInviteCode, <String>['welcome']);
      expect(request.sortOrder, GuildMemberSearchRequestSortOrderSortOrder.asc);
    });
  });

  group('GuildMemberDisplayData.fromSearchResult', () {
    test('maps search payload and supplemental join metadata', () {
      final GuildMemberDisplayData member =
          GuildMemberDisplayData.fromSearchResult(
            const GuildMemberSearchResult(
              id: 'g1:u1',
              guildId: 'g1',
              userId: 'u1',
              username: 'alice',
              discriminator: '0001',
              globalName: 'Alice',
              nickname: 'Ally',
              roleIds: <String>['r1'],
              joinedAt: 1700000000,
              isBot: false,
              supplemental: GuildMemberSearchResultSupplemental(
                joinSourceType: JoinSourceType.instantInvite,
                sourceInviteCode: 'welcome',
                inviterId: 'u2',
              ),
            ),
          );

      expect(member.userId, 'u1');
      expect(member.displayName, 'Ally');
      expect(member.tag, 'alice#0001');
      expect(member.roleIds, <String>['r1']);
      expect(member.joinSourceType, JoinSourceType.instantInvite);
      expect(member.sourceInviteCode, 'welcome');
      expect(member.inviterId, 'u2');
      expect(
        member.joinedAt,
        DateTime.fromMillisecondsSinceEpoch(
          1700000000 * 1000,
          isUtc: true,
        ).toLocal(),
      );
    });
  });
}
