import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/rtc_regions.dart';

part 'rtc_regions_dao.g.dart';

@DriftAccessor(tables: [RtcRegionsTable])
class RtcRegionsDao extends DatabaseAccessor<FluxerDatabase>
    with _$RtcRegionsDaoMixin {
  RtcRegionsDao(super.attachedDatabase);

  Future<void> clearAll() => delete(rtcRegionsTable).go();
}
