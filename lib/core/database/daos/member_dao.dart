import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/bulk_upsert.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/member_cache_access.dart';
import 'package:fluxer_app/core/database/tables/members.dart';

part 'member_dao.g.dart';

@DriftAccessor(tables: [Members, MemberCacheAccess])
class MemberDao extends DatabaseAccessor<FluxerDatabase> with _$MemberDaoMixin {
  MemberDao(super.attachedDatabase);

  Future<Member?> getMemberByUserId(String userId, String guildId) =>
      (select(members)
            ..where((m) => m.userId.equals(userId) & m.guildId.equals(guildId)))
          .getSingleOrNull();

  Stream<Member?> watchMemberByUserId(String userId, String guildId) =>
      (select(members)
            ..where((m) => m.userId.equals(userId) & m.guildId.equals(guildId)))
          .watchSingleOrNull()
          .suppressDriftCancellation;

  Future<List<Member>> getMembersForUserInGuilds(
    String userId,
    List<String> guildIds,
  ) => (select(
    members,
  )..where((m) => m.userId.equals(userId) & m.guildId.isIn(guildIds))).get();

  Future<List<Member>> getMembersForUser(String userId) =>
      (select(members)..where((m) => m.userId.equals(userId))).get();

  Stream<List<Member>> watchMembersForUser(String userId) => (select(
    members,
  )..where((m) => m.userId.equals(userId))).watch().suppressDriftCancellation;

  Future<List<Member>> getMembers(String guildId) =>
      (select(members)..where((m) => m.guildId.equals(guildId))).get();

  Future<List<Member>> getMembersByUserIds(
    String guildId,
    List<String> userIds,
  ) {
    if (userIds.isEmpty) {
      return Future<List<Member>>.value(const <Member>[]);
    }
    return (select(
      members,
    )..where((m) => m.guildId.equals(guildId) & m.userId.isIn(userIds))).get();
  }

  Future<int> countMembers(String guildId) async {
    final QueryRow row = await customSelect(
      'SELECT COUNT(*) AS member_count FROM members WHERE guild_id = ?',
      variables: <Variable<Object>>[Variable<String>(guildId)],
      readsFrom: <TableInfo<Table, Object?>>{members},
    ).getSingle();
    return row.read<int>('member_count');
  }

  Stream<int> watchMemberCount(String guildId) {
    return customSelect(
          'SELECT COUNT(*) AS member_count FROM members WHERE guild_id = ?',
          variables: <Variable<Object>>[Variable<String>(guildId)],
          readsFrom: <TableInfo<Table, Object?>>{members},
        )
        .watchSingle()
        .map((QueryRow row) => row.read<int>('member_count'))
        .distinct()
        .suppressDriftCancellation;
  }

  Future<void> upsertMember(MembersCompanion member) async {
    await into(members).insertOnConflictUpdate(member);
    final String? guildId = member.guildId.present
        ? member.guildId.value
        : null;
    final String? userId = member.userId.present ? member.userId.value : null;
    if (guildId != null && userId != null) {
      await into(memberCacheAccess).insertOnConflictUpdate(
        MemberCacheAccessCompanion.insert(
          userId: userId,
          guildId: guildId,
          lastAccessedAt: DateTime.now().toUtc(),
        ),
      );
    }
  }

  Future<void> upsertMembers(List<MembersCompanion> memberList) async {
    if (memberList.isEmpty) {
      return;
    }
    await batch(
      (Batch b) => batchUpsert(b, attachedDatabase, members, memberList),
    );
    final List<({String guildId, String userId})> accessPairs =
        <({String guildId, String userId})>[
          for (final MembersCompanion member in memberList)
            if (member.guildId.present && member.userId.present)
              (guildId: member.guildId.value, userId: member.userId.value),
        ];
    await touchMemberAccessPairs(accessPairs);
  }

  Future<void> upsertGuildMembersIfChanged(
    String guildId,
    Iterable<MembersCompanion> memberList,
  ) async {
    final Map<String, MembersCompanion> latestByUserId =
        <String, MembersCompanion>{
          for (final MembersCompanion member in memberList)
            if (member.userId.present) member.userId.value: member,
        };
    if (latestByUserId.isEmpty) {
      return;
    }
    final List<String> userIds = latestByUserId.keys.toList();
    final Map<String, Member> stored = <String, Member>{};
    for (var i = 0; i < userIds.length; i += _userIdLookupChunkSize) {
      final int end = i + _userIdLookupChunkSize < userIds.length
          ? i + _userIdLookupChunkSize
          : userIds.length;
      for (final Member row in await getMembersByUserIds(
        guildId,
        userIds.sublist(i, end),
      )) {
        stored[row.userId] = row;
      }
    }
    await upsertMembers(<MembersCompanion>[
      for (final MapEntry<String, MembersCompanion> entry
          in latestByUserId.entries)
        if (rowDiffersFromStored(
          attachedDatabase,
          entry.value,
          stored[entry.key],
        ))
          entry.value,
    ]);
  }

  Future<void> touchMemberAccessPairs(
    List<({String guildId, String userId})> pairs,
  ) async {
    if (pairs.isEmpty) {
      return;
    }
    if (pairs.length == 1) {
      final ({String guildId, String userId}) pair = pairs.first;
      await into(memberCacheAccess).insertOnConflictUpdate(
        MemberCacheAccessCompanion.insert(
          userId: pair.userId,
          guildId: pair.guildId,
          lastAccessedAt: DateTime.now().toUtc(),
        ),
      );
      return;
    }
    final DateTime now = DateTime.now().toUtc();
    await batch(
      (Batch b) => batchUpsert(
        b,
        attachedDatabase,
        memberCacheAccess,
        <MemberCacheAccessCompanion>[
          for (final ({String guildId, String userId}) pair in pairs)
            MemberCacheAccessCompanion.insert(
              userId: pair.userId,
              guildId: pair.guildId,
              lastAccessedAt: now,
            ),
        ],
      ),
    );
  }

  Future<void> evictStaleMembers({
    required String guildId,
    required Set<String> protectedUserIds,
    required int maxMembers,
  }) async {
    final int count = await countMembers(guildId);
    if (count <= maxMembers) {
      return;
    }
    final int excess = count - maxMembers;
    final List<String> protected = protectedUserIds.toList();
    final StringBuffer sql = StringBuffer(
      'SELECT m.user_id AS user_id FROM members m '
      'LEFT JOIN member_cache_access a '
      'ON m.user_id = a.user_id AND m.guild_id = a.guild_id '
      'WHERE m.guild_id = ? ',
    );
    final List<Variable> variables = <Variable>[Variable<String>(guildId)];
    if (protected.isNotEmpty) {
      sql.write(
        'AND m.user_id NOT IN (${List.filled(protected.length, '?').join(', ')}) ',
      );
      variables.addAll(protected.map(Variable<String>.new));
    }
    sql.write(
      'ORDER BY a.last_accessed_at IS NULL, a.last_accessed_at ASC LIMIT ?',
    );
    variables.add(Variable<int>(excess));
    final List<QueryRow> rows = await customSelect(
      sql.toString(),
      variables: variables,
      readsFrom: <TableInfo<Table, Object?>>{members, memberCacheAccess},
    ).get();
    final List<String> userIdsToDelete = rows
        .map((QueryRow row) => row.read<String>('user_id'))
        .toList();
    if (userIdsToDelete.isEmpty) {
      return;
    }
    await batch((Batch batch) {
      for (final String userId in userIdsToDelete) {
        batch
          ..deleteWhere(
            members,
            (Members tbl) =>
                tbl.userId.equals(userId) & tbl.guildId.equals(guildId),
          )
          ..deleteWhere(
            memberCacheAccess,
            (MemberCacheAccess tbl) =>
                tbl.userId.equals(userId) & tbl.guildId.equals(guildId),
          );
      }
    });
  }

  Future<void> deleteMember(String userId, String guildId) => (delete(
    members,
  )..where((m) => m.userId.equals(userId) & m.guildId.equals(guildId))).go();

  Future<void> removeRoleFromGuildMembers(String guildId, String roleId) async {
    final List<Member> rows =
        await (select(members)..where(
              (Members tbl) =>
                  tbl.guildId.equals(guildId) &
                  tbl.roleIdsJson.contains(jsonEncode(roleId)),
            ))
            .get();
    for (final Member row in rows) {
      final Object? decoded = jsonDecode(row.roleIdsJson);
      if (decoded is! List) {
        continue;
      }
      await (update(members)..where(
            (Members tbl) =>
                tbl.userId.equals(row.userId) & tbl.guildId.equals(guildId),
          ))
          .write(
            MembersCompanion(
              roleIdsJson: Value<String>(
                jsonEncode(<Object?>[
                  for (final Object? id in decoded)
                    if (id != roleId) id,
                ]),
              ),
            ),
          );
    }
  }

  Future<void> deleteMembersForGuild(String guildId) async {
    await (delete(
      memberCacheAccess,
    )..where((MemberCacheAccess tbl) => tbl.guildId.equals(guildId))).go();
    await (delete(
      members,
    )..where((Members tbl) => tbl.guildId.equals(guildId))).go();
  }

  Future<void> clearAll() async {
    await delete(memberCacheAccess).go();
    await delete(members).go();
  }
}

const int _userIdLookupChunkSize = 500;
