import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/pinned_dms.dart';

part 'pinned_dms_dao.g.dart';

@DriftAccessor(tables: [PinnedDmsTable])
class PinnedDmsDao extends DatabaseAccessor<FluxerDatabase>
    with _$PinnedDmsDaoMixin {
  PinnedDmsDao(super.attachedDatabase);

  Future<List<PinnedDmsTableData>> getPinnedDms() => (select(
    pinnedDmsTable,
  )..orderBy([(t) => OrderingTerm.asc(t.position)])).get();

  Stream<List<PinnedDmsTableData>> watchPinnedDms() =>
      (select(pinnedDmsTable)..orderBy([(t) => OrderingTerm.asc(t.position)]))
          .watch()
          .suppressDriftCancellation;

  Future<void> replaceAll(List<PinnedDmsTableCompanion> entries) async {
    await transaction(() async {
      await delete(pinnedDmsTable).go();
      await batch((b) {
        for (final entry in entries) {
          b.insert(pinnedDmsTable, entry);
        }
      });
    });
  }

  Future<void> clearAll() => delete(pinnedDmsTable).go();
}
