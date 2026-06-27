import 'package:drift/drift.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/servers.dart';

part 'guild_dao.g.dart';

@DriftAccessor(tables: [Servers])
class GuildDao extends DatabaseAccessor<FluxerDatabase> with _$GuildDaoMixin {
  GuildDao(super.attachedDatabase);

  Stream<List<Server>> watchServers() =>
      (select(servers)..orderBy([
            (s) => OrderingTerm.asc(s.position),
            (s) => OrderingTerm.asc(s.name),
          ]))
          .watch();

  Future<List<Server>> getServers() =>
      (select(servers)..orderBy([
            (s) => OrderingTerm.asc(s.position),
            (s) => OrderingTerm.asc(s.name),
          ]))
          .get();

  Future<Server?> getServerById(String id) =>
      (select(servers)..where((s) => s.id.equals(id))).getSingleOrNull();

  Stream<Server?> watchServerById(String id) =>
      (select(servers)..where((s) => s.id.equals(id))).watchSingleOrNull();

  Future<void> upsertServer(ServersCompanion server) =>
      into(servers).insertOnConflictUpdate(server);

  Future<void> upsertServers(List<ServersCompanion> serverList) async {
    await batch((b) {
      for (final server in serverList) {
        b.insert(servers, server, onConflict: DoUpdate((_) => server));
      }
    });
  }

  Future<void> updateServerCounts(
    String id, {
    int? memberCount,
    int? onlineCount,
  }) => (update(servers)..where((s) => s.id.equals(id))).write(
    ServersCompanion(
      memberCount: memberCount == null
          ? const Value.absent()
          : Value(memberCount),
      onlineCount: onlineCount == null
          ? const Value.absent()
          : Value(onlineCount),
    ),
  );

  Future<void> markUnavailable(String id) =>
      (update(servers)..where((s) => s.id.equals(id))).write(
        const ServersCompanion(unavailable: Value(true)),
      );

  Future<void> deleteServer(String id) =>
      (delete(servers)..where((s) => s.id.equals(id))).go();

  Future<void> clearAll() => delete(servers).go();
}
