import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/rtc_regions.dart';

part 'rtc_regions_dao.g.dart';

@DriftAccessor(tables: [RtcRegionsTable])
class RtcRegionsDao extends DatabaseAccessor<FluxerDatabase>
    with _$RtcRegionsDaoMixin {
  RtcRegionsDao(super.attachedDatabase);

  Future<List<RtcRegionsTableData>> getAll() => select(rtcRegionsTable).get();

  Stream<List<RtcRegionsTableData>> watchAll() =>
      select(rtcRegionsTable).watch().suppressDriftCancellation;

  Future<void> replaceAll(List<RtcRegionsTableCompanion> entries) async {
    await transaction(() async {
      await delete(rtcRegionsTable).go();
      await batch((b) {
        for (final entry in entries) {
          b.insert(rtcRegionsTable, entry);
        }
      });
    });
  }

  Future<void> clearAll() => delete(rtcRegionsTable).go();
}
