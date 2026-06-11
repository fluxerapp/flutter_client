import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/favorites/data/favorites_sync_service.dart';

class FavoriteChannelsRepository {
  FavoriteChannelsRepository(this._database, this._syncService);

  final db.FluxerDatabase _database;
  final FavoritesSyncService _syncService;

  Stream<List<db.FavoriteChannel>> watchChannels() =>
      _database.favoriteChannelsDao.watchChannels();

  Stream<db.FavoriteChannel?> watchChannel(String channelId) =>
      _database.favoriteChannelsDao.watchChannel(channelId);

  Stream<List<db.FavoriteCategory>> watchCategories() =>
      _database.favoriteChannelsDao.watchCategories();

  Stream<db.FavoriteSetting> watchSettings() =>
      _database.favoriteChannelsDao.watchSettings();

  Future<bool> isFavorite(String channelId) async =>
      await _database.favoriteChannelsDao.getChannel(channelId) != null;

  Future<bool> addChannel({
    required String channelId,
    String? guildId,
    String? parentId,
    String? nickname,
  }) async {
    final added = await _database.favoriteChannelsDao.addChannel(
      channelId: channelId,
      guildId: guildId,
      parentId: parentId,
      nickname: nickname,
    );
    if (added) {
      await _syncService.applyAfterLocalMutation();
    }
    return added;
  }

  Future<bool> removeChannel(String channelId) async {
    final removed = await _database.favoriteChannelsDao.removeChannel(
      channelId,
    );
    if (removed) {
      await _syncService.applyAfterLocalMutation();
    }
    return removed;
  }

  Future<void> moveChannel({
    required String channelId,
    required int position,
    String? parentId,
  }) async {
    await _database.favoriteChannelsDao.moveChannel(
      channelId: channelId,
      position: position,
      parentId: parentId,
    );
    await _syncService.applyAfterLocalMutation();
  }

  Future<bool> addCategory({required String id, required String name}) async {
    final added = await _database.favoriteChannelsDao.addCategory(
      id: id,
      name: name,
    );
    if (added) {
      await _syncService.applyAfterLocalMutation();
    }
    return added;
  }

  Future<bool> removeCategory(String id) async {
    final removed = await _database.favoriteChannelsDao.removeCategory(id);
    if (removed) {
      await _syncService.applyAfterLocalMutation();
    }
    return removed;
  }

  Future<bool> renameCategory({
    required String id,
    required String name,
  }) async {
    final renamed = await _database.favoriteChannelsDao.renameCategory(
      id: id,
      name: name,
    );
    if (renamed) {
      await _syncService.applyAfterLocalMutation();
    }
    return renamed;
  }

  Future<void> moveCategory({required String id, required int position}) async {
    await _database.favoriteChannelsDao.moveCategory(
      id: id,
      position: position,
    );
    await _syncService.applyAfterLocalMutation();
  }

  Future<bool> setChannelNickname({
    required String channelId,
    String? nickname,
  }) async {
    final updated = await _database.favoriteChannelsDao.setChannelNickname(
      channelId: channelId,
      nickname: nickname,
    );
    if (updated) {
      await _syncService.applyAfterLocalMutation();
    }
    return updated;
  }

  Future<void> setCollapsedCategoryIds(List<String> categoryIds) async {
    await _database.favoriteChannelsDao.setCollapsedCategoryIds(categoryIds);
    await _syncService.applyAfterLocalMutation();
  }

  Future<void> setHideMuted({required bool value}) async {
    await _database.favoriteChannelsDao.setHideMuted(value: value);
    await _syncService.applyAfterLocalMutation();
  }

  Future<void> setMuted({required bool value}) async {
    await _database.favoriteChannelsDao.setMuted(value: value);
    await _syncService.applyAfterLocalMutation();
  }
}
