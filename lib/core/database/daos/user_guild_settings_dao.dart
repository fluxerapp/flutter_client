import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/user_guild_settings.dart';

part 'user_guild_settings_dao.g.dart';

@DriftAccessor(tables: [UserGuildSettingsTable])
class UserGuildSettingsDao extends DatabaseAccessor<FluxerDatabase>
    with _$UserGuildSettingsDaoMixin {
  UserGuildSettingsDao(super.attachedDatabase);

  Future<List<UserGuildSettingsTableData>> getAll() =>
      select(userGuildSettingsTable).get();

  Stream<List<UserGuildSettingsTableData>> watchAll() =>
      select(userGuildSettingsTable).watch().suppressDriftCancellation;

  Future<UserGuildSettingsTableData?> getByGuildId(String guildId) => (select(
    userGuildSettingsTable,
  )..where((t) => t.guildId.equals(guildId))).getSingleOrNull();

  Stream<UserGuildSettingsTableData?> watchByGuildId(String guildId) =>
      (select(userGuildSettingsTable)..where((t) => t.guildId.equals(guildId)))
          .watchSingleOrNull()
          .suppressDriftCancellation;

  Future<void> upsert(UserGuildSettingsTableCompanion entry) =>
      into(userGuildSettingsTable).insertOnConflictUpdate(entry);

  Future<void> deleteForGuild(String guildId) => (delete(
    userGuildSettingsTable,
  )..where((table) => table.guildId.equals(guildId))).go();

  Future<void> clearAll() => delete(userGuildSettingsTable).go();
}
