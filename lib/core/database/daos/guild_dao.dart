import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/bulk_upsert.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/servers.dart';

part 'guild_dao.g.dart';

typedef ServerCounts = ({String id, int memberCount, int onlineCount});

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

  Future<void> updateServerCountsBulk(List<ServerCounts> counts) async {
    if (counts.isEmpty) {
      return;
    }
    final Map<String, (int?, int?)> stored = <String, (int?, int?)>{
      for (final TypedResult row
          in await (selectOnly(servers)
                ..addColumns(<Expression<Object>>[
                  servers.id,
                  servers.memberCount,
                  servers.onlineCount,
                ])
                ..where(servers.id.isIn(counts.map((ServerCounts c) => c.id))))
              .get())
        row.read(servers.id)!: (
          row.read(servers.memberCount),
          row.read(servers.onlineCount),
        ),
    };
    final List<ServerCounts> changed = <ServerCounts>[
      for (final ServerCounts count in counts)
        if (stored[count.id] case (
          final int? members,
          final int? online,
        ) when members != count.memberCount || online != count.onlineCount)
          count,
    ];
    if (changed.isEmpty) {
      return;
    }
    await batch((Batch b) {
      for (final ServerCounts count in changed) {
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
