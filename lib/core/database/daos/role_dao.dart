import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/roles.dart';

part 'role_dao.g.dart';

@DriftAccessor(tables: [Roles])
class RoleDao extends DatabaseAccessor<FluxerDatabase> with _$RoleDaoMixin {
  RoleDao(super.attachedDatabase);

  Future<List<Role>> getRoles(String guildId) =>
      (select(roles)
            ..where((r) => r.guildId.equals(guildId))
            ..orderBy([(r) => OrderingTerm.desc(r.position)]))
          .get();

  Stream<List<Role>> watchRoles(String guildId) =>
      (select(roles)
            ..where((r) => r.guildId.equals(guildId))
            ..orderBy([(r) => OrderingTerm.desc(r.position)]))
          .watch()
          .suppressDriftCancellation;

  Future<Role?> getRoleById(String id) =>
      (select(roles)..where((r) => r.id.equals(id))).getSingleOrNull();

  Future<void> upsertRoles(List<RolesCompanion> roleList) async {
    await batch((b) {
      for (final role in roleList) {
        b.insert(roles, role, onConflict: DoUpdate((_) => role));
      }
    });
  }

  Future<void> deleteRole(String id) =>
      (delete(roles)..where((r) => r.id.equals(id))).go();

  Future<Set<String>> deleteGuildRolesNotIn(
    Map<String, Set<String>> keepIdsByGuildId,
  ) async {
    if (keepIdsByGuildId.isEmpty) {
      return const <String>{};
    }
    final List<Role> staleRoles = <Role>[
      for (final Role row in await (select(
        roles,
      )..where((r) => r.guildId.isIn(keepIdsByGuildId.keys))).get())
        if (!(keepIdsByGuildId[row.guildId]?.contains(row.id) ?? true)) row,
    ];
    if (staleRoles.isNotEmpty) {
      await (delete(roles)..where(
            (r) => r.id.isIn(<String>[
              for (final Role role in staleRoles) role.id,
            ]),
          ))
          .go();
    }
    return <String>{for (final Role role in staleRoles) role.guildId};
  }

  Future<void> deleteRolesForGuild(String guildId) =>
      (delete(roles)..where((r) => r.guildId.equals(guildId))).go();

  Future<void> clearAll() => delete(roles).go();
}
