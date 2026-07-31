import 'package:dio/dio.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/guilds/data/guild_local_cleanup.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart';

class GuildRepository {
  final FluxerClient _client;
  final db.FluxerDatabase _db;

  const GuildRepository(this._client, this._db);

  Stream<List<Guild>> watchServers() {
    return _db.guildDao.watchServers().map(
      (rows) => rows.map(Guild.fromRow).toList(),
    );
  }

  Stream<Guild?> watchServerById(String id) {
    return _db.guildDao
        .watchServerById(id)
        .map((row) => row == null ? null : Guild.fromRow(row));
  }

  Future<List<Guild>> getServers() async {
    await syncServers();
    final rows = await _db.guildDao.getServers();
    return rows.map(Guild.fromRow).toList();
  }

  Future<void> syncServers() async {
    try {
      final guilds = await _client.guilds.listGuilds();
      final guildOrder = await _fetchGuildOrder();
      final companions = guilds.map((guild) {
        final position = guildOrder.indexOf(guild.id);
        return guildFromSdk(
          guild,
          position: position >= 0 ? position : guildOrder.length,
        );
      }).toList();
      await _db.guildDao.upsertServers(companions);
      final apiIds = guilds.map((guild) => guild.id).toSet();
      await removeGuildsNotInLocalDb(_db, apiIds);
    } on DioException catch (e) {
      throw Exception(e.response?.statusMessage ?? 'Failed to fetch servers');
    }
  }

  Future<void> removeGuildLocally(String guildId) async {
    await removeGuildFromLocalDb(_db, guildId);
  }

  /// Fetches ordered guild IDs from user settings guild folders.
  Future<List<String>> _fetchGuildOrder() async {
    try {
      final settings = await _client.users.getCurrentUserSettings();
      final folders = settings.guildFolders;
      return folders.expand((f) => f.guildIds).toList();
    } on Object {
      return [];
    }
  }

  Future<List<Guild>> getOwnedGuilds(String userId) async {
    final rows = await _db.guildDao.getServers();
    return rows
        .map(Guild.fromRow)
        .where((Guild guild) => guild.ownerId == userId)
        .toList(growable: false);
  }

  Future<Guild> getServer(String guildId) async {
    try {
      final guild = await _client.guilds.getGuild(guildId: guildId);

      await _db.guildDao.upsertServer(guildFromSdk(guild));

      final row = await _db.guildDao.getServerById(guildId);
      if (row == null) {
        throw Exception('Server not found after upsert');
      }
      return Guild.fromRow(row);
    } on DioException catch (e) {
      throw Exception(e.response?.statusMessage ?? 'Failed to fetch server');
    }
  }

  Future<GuildResponse> createGuild({
    required String name,
    String? iconDataUri,
  }) async {
    final GuildCreateRequest body = GuildCreateRequest(
      name: name.trim(),
      icon: iconDataUri,
    );
    final GuildResponse guild = await _client.guilds.createGuild(body: body);
    final List<String> guildOrder = await _fetchGuildOrder();
    final int position = guildOrder.indexOf(guild.id);
    await _db.guildDao.upsertServer(
      guildFromSdk(
        guild,
        position: position >= 0 ? position : guildOrder.length,
      ),
    );
    return guild;
  }
}
