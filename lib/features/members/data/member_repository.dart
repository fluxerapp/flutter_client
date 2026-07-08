import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/chat/utils/composer_mention_query.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart';

class MemberRepository {
  static const int mentionAutocompleteMaxMatches = kMentionMemberSearchLimit;
  static const int restBackfillPageSize = 100;
  static const int restBackfillMaxGuildMembers = 1000;

  final FluxerClient _client;
  final db.FluxerDatabase _db;

  const MemberRepository(this._client, this._db);

  Future<List<Member>> getMembersByUserIds(
    String guildId,
    List<String> userIds,
  ) async {
    if (userIds.isEmpty) {
      return const <Member>[];
    }
    final List<db.Member> rows = await _db.memberDao.getMembersByUserIds(
      guildId,
      userIds,
    );
    return _membersFromRows(guildId, rows);
  }

  Future<List<Member>> getMembers(String guildId, {int limit = 100}) async {
    final List<GuildMemberResponse> sdkMembers = await _fetchGuildMemberPage(
      guildId: guildId,
      limit: limit,
    );
    await _upsertGuildMembersFromSdk(guildId, sdkMembers);
    final List<String> userIds = sdkMembers
        .map((GuildMemberResponse m) => m.user.id)
        .toList();
    return getMembersByUserIds(guildId, userIds);
  }

  /// Fills the local cache from REST when gateway lazy sync left the roster sparse.
  Future<void> backfillMembersIfSparse(String guildId) async {
    final db.Server? server = await _db.guildDao.getServerById(guildId);
    if (server == null) {
      return;
    }
    final int expectedCount = server.memberCount;
    if (expectedCount <= 0 || expectedCount > restBackfillMaxGuildMembers) {
      return;
    }
    int cachedCount = await _db.memberDao.countMembers(guildId);
    if (cachedCount >= expectedCount) {
      return;
    }
    String? after;
    while (cachedCount < expectedCount) {
      final List<GuildMemberResponse> page = await _fetchGuildMemberPage(
        guildId: guildId,
        limit: restBackfillPageSize,
        after: after,
      );
      if (page.isEmpty) {
        return;
      }
      await _upsertGuildMembersFromSdk(guildId, page);
      cachedCount = await _db.memberDao.countMembers(guildId);
      if (page.length < restBackfillPageSize) {
        return;
      }
      after = page.last.user.id;
    }
  }

  Future<List<GuildMemberResponse>> _fetchGuildMemberPage({
    required String guildId,
    required int limit,
    String? after,
  }) async {
    try {
      return await _client.guilds.listGuildMembers(
        guildId: guildId,
        limit: limit,
        after: after,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 200 && e.response?.data != null) {
        final List<dynamic> rawList = e.response!.data as List<dynamic>;
        return rawList
            .map(
              (dynamic item) =>
                  GuildMemberResponse.fromJson(item as Map<String, Object?>),
            )
            .toList();
      }
      throw Exception(e.response?.statusMessage ?? 'Failed to fetch members');
    }
  }

  Future<void> _upsertGuildMembersFromSdk(
    String guildId,
    List<GuildMemberResponse> members,
  ) async {
    if (members.isEmpty) {
      return;
    }
    final List<db.UsersCompanion> userCompanions = <db.UsersCompanion>[];
    final List<db.MembersCompanion> memberCompanions = <db.MembersCompanion>[];
    for (final GuildMemberResponse sdk in members) {
      userCompanions.add(userFromPartialSdk(sdk.user));
      memberCompanions.add(memberCompanionFromSdk(sdk, guildId: guildId));
    }
    await _db.userDao.upsertUsers(userCompanions);
    await _db.memberDao.upsertMembers(memberCompanions);
  }

  Future<List<MemberRole>> getRoles(String guildId) async {
    List<db.RolesCompanion> companions;
    try {
      final List<GuildRoleResponse> roles = await _client.guilds.listGuildRoles(
        guildId: guildId,
      );
      companions = roles
          .map((GuildRoleResponse r) => roleFromSdk(r, guildId))
          .toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 200 && e.response?.data != null) {
        final List<dynamic> rawList = e.response!.data as List<dynamic>;
        companions = rawList.map((dynamic item) {
          final Map<String, dynamic> map = item as Map<String, dynamic>;
          return db.RolesCompanion.insert(
            id: map['id'] as String,
            guildId: guildId,
            name: map['name'] as String,
            color: map['color'] != null
                ? Value(map['color'] as int)
                : const Value.absent(),
            position: map['position'] != null
                ? Value(map['position'] as int)
                : const Value.absent(),
            hoist: map['hoist'] != null
                ? Value(map['hoist'] as bool)
                : const Value.absent(),
            mentionable: map['mentionable'] != null
                ? Value(map['mentionable'] as bool)
                : const Value.absent(),
            permissions: map['permissions'] != null
                ? Value(map['permissions'] as String)
                : const Value.absent(),
            hoistPosition: map['hoist_position'] != null
                ? Value(map['hoist_position'] as int)
                : const Value.absent(),
          );
        }).toList();
      } else {
        throw Exception(e.response?.statusMessage ?? 'Failed to fetch roles');
      }
    }

    await _db.roleDao.upsertRoles(companions);

    final rows = await _db.roleDao.getRoles(guildId);
    return rows.map(MemberRole.fromRow).toList();
  }

  Future<List<Member>> getCachedMembersForGuild(String guildId) async {
    final List<db.Member> rows = await _db.memberDao.getMembers(guildId);
    return _membersFromRows(guildId, rows);
  }

  Future<bool> isGuildMemberCacheComplete(String guildId) async {
    final db.Server? server = await _db.guildDao.getServerById(guildId);
    if (server == null) {
      return false;
    }
    final int expectedCount = server.memberCount;
    if (expectedCount <= 0) {
      return false;
    }
    final int cachedCount = await _db.memberDao.countMembers(guildId);
    return cachedCount >= expectedCount;
  }

  /// Resolves mention matches from scoped local rows.
  ///
  /// Callers should first send gateway opcode 8 (`requestGuildMembers`) with the
  /// same [query] so `GUILD_MEMBERS_CHUNK` can populate rows, then pass
  /// [scopeUserIds] from the chunk. Do not use `POST /guilds/:id/members-search`:
  /// that route requires moderation permissions.
  Future<List<Member>> searchMembersForAutocomplete({
    required String guildId,
    required String query,
    required List<String> scopeUserIds,
  }) async {
    if (scopeUserIds.isEmpty) {
      return const <Member>[];
    }
    final List<db.Member> rows = await _db.memberDao.getMembersByUserIds(
      guildId,
      scopeUserIds,
    );
    final List<db.Role> roles = await _db.roleDao.getRoles(guildId);
    final List<String> userIds = rows.map((db.Member m) => m.userId).toList();
    final List<db.User> userList = await _db.userDao.getUsersByIds(userIds);
    final Map<String, db.User> users = <String, db.User>{
      for (final db.User u in userList) u.id: u,
    };
    final String trimmed = query.trim();
    final String? qLower = trimmed.isEmpty ? null : trimmed.toLowerCase();
    final List<Member> hits = <Member>[];
    for (final db.Member row in rows) {
      final Member member = Member.fromRow(row, users[row.userId], roles);
      if (qLower != null &&
          !memberMentionHaystackContainsQuery(member, qLower)) {
        continue;
      }
      hits.add(member);
      if (hits.length >= mentionAutocompleteMaxMatches) {
        break;
      }
    }
    return hits;
  }

  Future<List<Member>> _membersFromRows(
    String guildId,
    List<db.Member> members,
  ) async {
    if (members.isEmpty) {
      return const <Member>[];
    }
    final List<db.Role> roles = await _db.roleDao.getRoles(guildId);
    final List<String> userIds = members
        .map((db.Member m) => m.userId)
        .toList();
    final List<db.User> userList = await _db.userDao.getUsersByIds(userIds);
    final Map<String, db.User> users = <String, db.User>{
      for (final db.User u in userList) u.id: u,
    };
    return members
        .map((db.Member m) => Member.fromRow(m, users[m.userId], roles))
        .toList();
  }
}
