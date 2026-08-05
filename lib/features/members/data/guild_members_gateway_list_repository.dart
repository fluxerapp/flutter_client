import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/features/members/data/member_repository.dart';
import 'package:fluxer_app/features/members/domain/guild_members_search_models.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/members/utils/guild_members_local_filter.dart';
import 'package:fluxer_dart/gateway.dart';

const int kGuildMembersGatewaySearchLimit = 100;
const Duration kGuildMembersGatewayFetchDedup = Duration(milliseconds: 750);

class GuildMembersGatewayListRepository {
  GuildMembersGatewayListRepository({
    required this.memberRepository,
    required this.chunkWaiter,
    required this.readGateway,
    required this.database,
  });

  final MemberRepository memberRepository;
  final GuildMemberChunkWaiter chunkWaiter;
  final GatewayConnection? Function() readGateway;
  final db.FluxerDatabase database;
  final Map<String, DateTime> _lastGatewayFetchAt = <String, DateTime>{};

  Future<List<GuildMemberDisplayData>> fetchFilteredMembers({
    required String guildId,
    required GuildMembersSearchState state,
  }) async {
    final List<GuildMemberDisplayData> members = await _resolveDisplayMembers(
      guildId,
      state,
    );
    final List<GuildMemberDisplayData> filtered = filterGuildMemberDisplayData(
      members,
      state,
    );
    sortGuildMemberDisplayData(filtered, state.sortMode);
    return filtered;
  }

  Future<List<GuildMemberDisplayData>> _resolveDisplayMembers(
    String guildId,
    GuildMembersSearchState state,
  ) async {
    final String query = state.debouncedQuery.trim();
    if (query.isEmpty) {
      return _loadCachedDisplayMembers(guildId);
    }
    final List<GuildMemberDisplayData> cached = await _loadCachedDisplayMembers(
      guildId,
    );
    final GatewayConnection? gateway = readGateway();
    if (gateway == null || gateway.state != GatewayState.connected) {
      return _filterDisplayMembersByQuery(cached, query);
    }
    if (_shouldDedupGatewayFetch(guildId, query)) {
      return _filterDisplayMembersByQuery(cached, query);
    }
    _recordGatewayFetch(guildId, query);
    final int requestId = chunkWaiter.beginRequest(guildId);
    try {
      gateway.requestGuildMembers(
        guildId: guildId,
        query: query,
        limit: kGuildMembersGatewaySearchLimit,
      );
      await chunkWaiter.waitForChunk(guildId, requestId: requestId);
      final List<String> scopeUserIds = chunkWaiter.lastChunkUserIds(guildId);
      final List<Member> remoteMembers = await memberRepository
          .searchMembersForAutocomplete(
            guildId: guildId,
            query: query,
            scopeUserIds: scopeUserIds,
          );
      final List<GuildMemberDisplayData> remoteDisplay =
          await _displayMembersForMembers(guildId, remoteMembers);
      final Set<String> remoteUserIds = <String>{
        for (final GuildMemberDisplayData member in remoteDisplay)
          member.userId,
      };
      return <GuildMemberDisplayData>[
        ...remoteDisplay,
        for (final GuildMemberDisplayData member in cached)
          if (!remoteUserIds.contains(member.userId)) member,
      ];
    } on Object {
      return _filterDisplayMembersByQuery(cached, query);
    }
  }

  List<GuildMemberDisplayData> _filterDisplayMembersByQuery(
    List<GuildMemberDisplayData> members,
    String query,
  ) {
    final String qLower = query.toLowerCase();
    return members
        .where(
          (GuildMemberDisplayData member) => member.matchesSearchQuery(qLower),
        )
        .toList(growable: false);
  }

  bool _shouldDedupGatewayFetch(String guildId, String query) {
    final DateTime? last = _lastGatewayFetchAt['$guildId:$query'];
    if (last == null) {
      return false;
    }
    return DateTime.now().difference(last) < kGuildMembersGatewayFetchDedup;
  }

  void _recordGatewayFetch(String guildId, String query) {
    _lastGatewayFetchAt['$guildId:$query'] = DateTime.now();
  }

  Future<List<GuildMemberDisplayData>> _loadCachedDisplayMembers(
    String guildId,
  ) async {
    final List<db.Member> memberRows = await database.memberDao.getMembers(
      guildId,
    );
    if (memberRows.isEmpty) {
      return const <GuildMemberDisplayData>[];
    }
    final List<db.Role> roles = await database.roleDao.getRoles(guildId);
    final List<String> userIds = memberRows
        .map((db.Member row) => row.userId)
        .toList(growable: false);
    final Map<String, db.User> usersById = <String, db.User>{
      for (final db.User user in await database.userDao.getUsersByIds(userIds))
        user.id: user,
    };
    return memberRows
        .map(
          (db.Member row) => GuildMemberDisplayData.fromCachedMember(
            member: Member.fromRow(row, usersById[row.userId], roles),
            memberRow: row,
            user: usersById[row.userId],
          ),
        )
        .toList(growable: false);
  }

  Future<List<GuildMemberDisplayData>> _displayMembersForMembers(
    String guildId,
    List<Member> members,
  ) async {
    if (members.isEmpty) {
      return const <GuildMemberDisplayData>[];
    }
    final List<String> userIds = members
        .map((Member member) => member.id)
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
    return members
        .map(
          (Member member) => GuildMemberDisplayData.fromCachedMember(
            member: member,
            memberRow: memberRows[member.id],
            user: usersById[member.id],
          ),
        )
        .toList(growable: false);
  }
}

final Provider<GuildMembersGatewayListRepository>
guildMembersGatewayListRepositoryProvider =
    Provider<GuildMembersGatewayListRepository>((Ref ref) {
      return GuildMembersGatewayListRepository(
        memberRepository: ref.watch(memberRepositoryProvider),
        chunkWaiter: ref.watch(guildMemberChunkWaiterProvider),
        readGateway: () => ref.read(gatewayConnectionProvider),
        database: ref.watch(fluxerDatabaseProvider),
      );
    });
