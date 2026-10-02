import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/guilds/data/guild_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_providers.g.dart';

@Riverpod(keepAlive: true)
GuildRepository guildRepository(Ref ref) {
  final client = ref.watch(fluxerClientProvider);
  final db = ref.watch(fluxerDatabaseProvider);
  return GuildRepository(client, db);
}

@riverpod
Future<Guild?> guildById(Ref ref, String id) async {
  final db = ref.watch(fluxerDatabaseProvider);
  final row = await db.guildDao.getServerById(id);
  return row == null ? null : Guild.fromRow(row);
}

/// Follows the local guild row. [guildById] does not update after it resolves.
@riverpod
Stream<Guild?> guildStreamById(Ref ref, String id) {
  final db = ref.watch(fluxerDatabaseProvider);
  return db.guildDao
      .watchServerById(id)
      .map((row) => row == null ? null : Guild.fromRow(row));
}
