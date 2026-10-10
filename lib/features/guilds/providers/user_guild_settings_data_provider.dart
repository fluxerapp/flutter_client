import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_guild_settings_data_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<Map<String, String>> userGuildSettingsData(Ref ref) {
  final db = ref.watch(fluxerDatabaseProvider);
  return db.userGuildSettingsDao.watchAll().map(
    (List<UserGuildSettingsTableData> rows) => <String, String>{
      for (final UserGuildSettingsTableData row in rows) row.guildId: row.data,
    },
  );
}

AsyncValue<String?> watchUserGuildSettingsData(Ref ref, String guildId) {
  return ref.watch(
    userGuildSettingsDataProvider.select(
      (AsyncValue<Map<String, String>> all) =>
          all.whenData((Map<String, String> byGuild) => byGuild[guildId]),
    ),
  );
}
