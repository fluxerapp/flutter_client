import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/bulk_upsert.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

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
          .watch()
          .suppressDriftCancellation;

  Future<List<Server>> getServers() =>
      (select(servers)..orderBy([
            (s) => OrderingTerm.asc(s.position),
            (s) => OrderingTerm.asc(s.name),
          ]))
          .get();

  Future<Server?> getServerById(String id) =>
      (select(servers)..where((s) => s.id.equals(id))).getSingleOrNull();

  Future<List<Server>> getServersByIds(List<String> ids) =>
      (select(servers)..where((s) => s.id.isIn(ids))).get();

  Stream<Server?> watchServerById(String id) =>
      (select(servers)..where((s) => s.id.equals(id)))
          .watchSingleOrNull()
          .suppressDriftCancellation;

  Future<void> upsertServer(ServersCompanion server) =>
      into(servers).insertOnConflictUpdate(server);

  Future<void> upsertServers(List<ServersCompanion> serverList) =>
      batch((Batch b) => batchUpsert(b, attachedDatabase, servers, serverList));

  Future<void> updateServerCountsBulk(
    List<({String id, int memberCount, int onlineCount})> counts,
  ) async {
    if (counts.isEmpty) {
      return;
    }
    await batch((Batch b) {
      for (final ({String id, int memberCount, int onlineCount}) count
          in counts) {
        b.update(
          servers,
          ServersCompanion(
            memberCount: Value(count.memberCount),
            onlineCount: Value(count.onlineCount),
          ),
          where: (s) => s.id.equals(count.id),
        );
      }
    });
  }

  Future<void> markUnavailable(String id) =>
      (update(servers)..where((s) => s.id.equals(id))).write(
        const ServersCompanion(unavailable: Value(true)),
      );

  Future<void> deleteServer(String id) =>
      (delete(servers)..where((s) => s.id.equals(id))).go();

  Future<void> clearAll() => delete(servers).go();
}
