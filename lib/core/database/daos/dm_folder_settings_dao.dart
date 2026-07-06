import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/dm_folder_settings.dart';

part 'dm_folder_settings_dao.g.dart';

@DriftAccessor(tables: [DmFolderSettingsTable])
class DmFolderSettingsDao extends DatabaseAccessor<FluxerDatabase>
    with _$DmFolderSettingsDaoMixin {
  DmFolderSettingsDao(super.attachedDatabase);

  Future<DmFolderSettingsTableData?> getSettings() => (select(
    dmFolderSettingsTable,
  )..where((t) => t.id.equals(0))).getSingleOrNull();

  Stream<DmFolderSettingsTableData?> watchSettings() =>
      (select(dmFolderSettingsTable)..where((t) => t.id.equals(0)))
          .watchSingleOrNull()
          .suppressDriftCancellation;

  Future<void> upsertSettings(DmFolderSettingsTableCompanion companion) =>
      into(dmFolderSettingsTable).insertOnConflictUpdate(companion);

  Future<void> clearAll() => delete(dmFolderSettingsTable).go();
}
