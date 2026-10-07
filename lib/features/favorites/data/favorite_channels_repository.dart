import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show isThreadFeatureChannelType;

class FavoriteChannelsRepository {
  FavoriteChannelsRepository(this._database, this._store);

  final db.FluxerDatabase _database;
  final SyncedPreferencesStore _store;

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
    final db.Channel? channel = await _database.channelDao.getChannelById(
      channelId,
    );
    if (channel != null && isThreadFeatureChannelType(channel.type)) {
      return false;
    }
    final added = await _database.favoriteChannelsDao.addChannel(
      channelId: channelId,
      guildId: guildId,
      parentId: parentId,
      nickname: nickname,
    );
    if (added) {
      _store.markDirty(SyncedPreferenceField.favorites);
    }
    return added;
  }

  Future<bool> removeChannel(String channelId) async {
    final removed = await _database.favoriteChannelsDao.removeChannel(
      channelId,
    );
    if (removed) {
      _store.markDirty(SyncedPreferenceField.favorites);
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
    _store.markDirty(SyncedPreferenceField.favorites);
  }

  Future<bool> addCategory({required String id, required String name}) async {
    final added = await _database.favoriteChannelsDao.addCategory(
      id: id,
      name: name,
    );
    if (added) {
      _store.markDirty(SyncedPreferenceField.favorites);
    }
    return added;
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
      _store.markDirty(SyncedPreferenceField.favorites);
    }
    return updated;
  }

  Future<void> setCollapsedCategoryIds(List<String> categoryIds) async {
    await _database.favoriteChannelsDao.setCollapsedCategoryIds(categoryIds);
    _store.markDirty(SyncedPreferenceField.favorites);
  }

  Future<void> setHideMuted({required bool value}) async {
    await _database.favoriteChannelsDao.setHideMuted(value: value);
    _store.markDirty(SyncedPreferenceField.favorites);
  }

  Future<void> setMuted({required bool value}) async {
    await _database.favoriteChannelsDao.setMuted(value: value);
    _store.markDirty(SyncedPreferenceField.favorites);
  }
}
