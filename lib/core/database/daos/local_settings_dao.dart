import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/local_settings.dart';
import 'package:fluxer_app/core/local_settings/local_setting_id.dart';

part 'local_settings_dao.g.dart';

@DriftAccessor(tables: [LocalSettingsTable])
class LocalSettingsDao extends DatabaseAccessor<FluxerDatabase>
    with _$LocalSettingsDaoMixin {
  LocalSettingsDao(super.attachedDatabase);

  Future<Map<LocalSettingId, String>> loadAll() async {
    final List<LocalSettingRow> rows = await select(localSettingsTable).get();
    return <LocalSettingId, String>{
      for (final LocalSettingRow row in rows)
        (scope: row.scope, key: row.key): row.value,
    };
  }

  Future<void> apply(Map<LocalSettingId, String?> changes) {
    final DateTime now = DateTime.now();
    return batch((Batch batch) {
      for (final MapEntry<LocalSettingId, String?> change in changes.entries) {
        final LocalSettingId id = change.key;
        final String? value = change.value;
        if (value == null) {
          batch.deleteWhere(
            localSettingsTable,
            (LocalSettingsTable table) =>
                table.scope.equals(id.scope) & table.key.equals(id.key),
          );
        } else {
          batch.insert(
            localSettingsTable,
            _companion(id, value, now),
            mode: InsertMode.insertOrReplace,
          );
        }
      }
    });
  }

  Future<void> insertMissing(Map<LocalSettingId, String> values) {
    final DateTime now = DateTime.now();
    return batch((Batch batch) {
      batch.insertAll(localSettingsTable, <LocalSettingsTableCompanion>[
        for (final MapEntry<LocalSettingId, String> entry in values.entries)
          _companion(entry.key, entry.value, now),
      ], mode: InsertMode.insertOrIgnore);
    });
  }

  LocalSettingsTableCompanion _companion(
    LocalSettingId id,
    String value,
    DateTime updatedAt,
  ) {
    return LocalSettingsTableCompanion.insert(
      scope: id.scope,
      key: id.key,
      value: value,
      updatedAt: Value(updatedAt),
    );
  }
}
