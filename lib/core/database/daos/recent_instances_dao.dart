import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/recent_instances.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';

part 'recent_instances_dao.g.dart';

@DriftAccessor(tables: [RecentInstances])
class RecentInstancesDao extends DatabaseAccessor<FluxerDatabase>
    with _$RecentInstancesDaoMixin {
  RecentInstancesDao(super.attachedDatabase);

  Future<List<RecentInstance>> getRecentInstances() {
    return (select(recentInstances)
          ..orderBy([
            (RecentInstances tbl) => OrderingTerm.desc(tbl.lastUsed),
            (RecentInstances tbl) => OrderingTerm.desc(tbl.domain),
          ])
          ..limit(InstanceConstants.maxRecentInstances))
        .get();
  }

  Future<List<RecentInstance>> touchRecentInstance({
    required String domain,
    String? name,
  }) async {
    final String normalizedDomain = domain.trim().toLowerCase();
    if (normalizedDomain.isEmpty) {
      return getRecentInstances();
    }
    await into(recentInstances).insertOnConflictUpdate(
      RecentInstancesCompanion.insert(
        domain: normalizedDomain,
        name: Value(name),
        lastUsed: Value(DateTime.now()),
      ),
    );
    await _trimToMax();
    return getRecentInstances();
  }

  Future<void> removeRecentInstance(String domain) async {
    final String normalizedDomain = domain.trim().toLowerCase();
    await (delete(recentInstances)
          ..where((RecentInstances tbl) => tbl.domain.equals(normalizedDomain)))
        .go();
  }

  Future<void> renameRecentInstanceDomain({
    required String fromDomain,
    required String toDomain,
  }) async {
    final String from = fromDomain.trim().toLowerCase();
    final String to = toDomain.trim().toLowerCase();
    if (from.isEmpty || to.isEmpty || from == to) {
      return;
    }
    final RecentInstance? row =
        await (select(recentInstances)
              ..where((RecentInstances tbl) => tbl.domain.equals(from)))
            .getSingleOrNull();
    if (row == null) {
      return;
    }
    await into(recentInstances).insertOnConflictUpdate(
      RecentInstancesCompanion.insert(
        domain: to,
        name: Value(row.name),
        lastUsed: Value(row.lastUsed),
      ),
    );
    await removeRecentInstance(from);
  }

  Future<void> _trimToMax() async {
    await customStatement('''
      DELETE FROM recent_instances
      WHERE domain NOT IN (
        SELECT domain
        FROM recent_instances
        ORDER BY last_used DESC, domain DESC
        LIMIT ${InstanceConstants.maxRecentInstances}
      )
      ''');
  }
}
