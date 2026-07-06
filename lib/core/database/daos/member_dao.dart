import 'package:drift/drift.dart';
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

  Stream<List<Member>> watchMembers(String guildId) => (select(
    members,
  )..where((m) => m.guildId.equals(guildId))).watch().suppressDriftCancellation;

  Future<void> upsertMember(MembersCompanion member) async {
    await into(members).insertOnConflictUpdate(member);
    final String? guildId = member.guildId.present
        ? member.guildId.value
        : null;
    final String? userId = member.userId.present ? member.userId.value : null;
    if (guildId != null && userId != null) {
      await touchMemberAccess(guildId, <String>[userId]);
    }
  }

  Future<void> upsertMembers(List<MembersCompanion> memberList) async {
    if (memberList.isEmpty) {
      return;
    }
    await batch((b) {
      for (final MembersCompanion member in memberList) {
        b.insert(members, member, onConflict: DoUpdate((_) => member));
      }
    });
    final String guildId = memberList.first.guildId.value;
    final List<String> userIds = memberList
        .map((MembersCompanion member) => member.userId.value)
        .toList();
    await touchMemberAccess(guildId, userIds);
  }

  Future<void> touchMemberAccess(String guildId, List<String> userIds) async {
    if (userIds.isEmpty) {
      return;
    }
    final DateTime now = DateTime.now().toUtc();
    for (final String userId in userIds) {
      await into(memberCacheAccess).insertOnConflictUpdate(
        MemberCacheAccessCompanion.insert(
          userId: userId,
          guildId: guildId,
          lastAccessedAt: now,
        ),
      );
    }
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
