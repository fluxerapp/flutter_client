import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/favorite_categories.dart';
import 'package:fluxer_app/core/database/tables/favorite_channels.dart';
import 'package:fluxer_app/core/database/tables/favorite_settings.dart';

part 'favorite_channels_dao.g.dart';

@DriftAccessor(tables: [FavoriteChannels, FavoriteCategories, FavoriteSettings])
class FavoriteChannelsDao extends DatabaseAccessor<FluxerDatabase>
    with _$FavoriteChannelsDaoMixin {
  FavoriteChannelsDao(super.attachedDatabase);

  Stream<List<FavoriteChannel>> watchChannels() =>
      (select(favoriteChannels)..orderBy([
            (t) => OrderingTerm.asc(t.parentId),
            (t) => OrderingTerm.asc(t.position),
          ]))
          .watch()
          .suppressDriftCancellation;

  Stream<FavoriteChannel?> watchChannel(String channelId) =>
      (select(favoriteChannels)..where((t) => t.channelId.equals(channelId)))
          .watchSingleOrNull()
          .suppressDriftCancellation;

  Future<FavoriteChannel?> getChannel(String channelId) => (select(
    favoriteChannels,
  )..where((t) => t.channelId.equals(channelId))).getSingleOrNull();

  Future<bool> addChannel({
    required String channelId,
    String? guildId,
    String? parentId,
    String? nickname,
    int? position,
  }) async {
    final existing = await getChannel(channelId);
    if (existing != null) {
      return false;
    }

    final nextPosition =
        position ??
        await _nextChannelPosition(
          parentId == null || parentId.isEmpty ? null : parentId,
        );

    await into(favoriteChannels).insert(
      FavoriteChannelsCompanion.insert(
        channelId: channelId,
        guildId: Value(guildId == null || guildId.isEmpty ? null : guildId),
        parentId: Value(parentId == null || parentId.isEmpty ? null : parentId),
        position: Value(nextPosition),
        nickname: Value(
          nickname == null || nickname.trim().isEmpty ? null : nickname.trim(),
        ),
      ),
    );
    return true;
  }

  Future<bool> removeChannel(String channelId) {
    return transaction(() async {
      final existing = await getChannel(channelId);
      if (existing == null) {
        return false;
      }

      await (delete(
        favoriteChannels,
      )..where((t) => t.channelId.equals(channelId))).go();
      await _normalizeChannelPositions(existing.parentId);
      return true;
    });
  }

  Future<void> moveChannel({
    required String channelId,
    required int position,
    String? parentId,
  }) async {
    await transaction(() async {
      final existing = await getChannel(channelId);
      if (existing == null) {
        return;
      }

      final normalizedParentId = parentId == null || parentId.isEmpty
          ? null
          : parentId;
      final siblings = await _channelsForParent(normalizedParentId);
      final reordered = siblings
          .where((channel) => channel.channelId != channelId)
          .toList();
      final nextIndex = position.clamp(0, reordered.length);
      reordered.insert(
        nextIndex,
        existing.copyWith(parentId: Value(normalizedParentId)),
      );

      for (var i = 0; i < reordered.length; i++) {
        final channel = reordered[i];
        await (update(
          favoriteChannels,
        )..where((t) => t.channelId.equals(channel.channelId))).write(
          FavoriteChannelsCompanion(
            parentId: Value(normalizedParentId),
            position: Value(i),
          ),
        );
      }

      if (existing.parentId != normalizedParentId) {
        await _normalizeChannelPositions(existing.parentId);
      }
    });
  }

  Stream<List<FavoriteCategory>> watchCategories() =>
      (select(favoriteCategories)
            ..orderBy([(t) => OrderingTerm.asc(t.position)]))
          .watch()
          .suppressDriftCancellation;

  Future<List<FavoriteCategory>> getCategories() => (select(
    favoriteCategories,
  )..orderBy([(t) => OrderingTerm.asc(t.position)])).get();

  Future<bool> addCategory({
    required String id,
    required String name,
    int? position,
  }) async {
    final existing = await (select(
      favoriteCategories,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    if (existing != null) {
      return false;
    }
    final nextPosition = position ?? await _nextCategoryPosition();
    await into(favoriteCategories).insert(
      FavoriteCategoriesCompanion.insert(
        id: id,
        name: name,
        position: Value(nextPosition),
      ),
    );
    return true;
  }

  Future<bool> removeCategory(String id) {
    return transaction(() async {
      final existing = await (select(
        favoriteCategories,
      )..where((t) => t.id.equals(id))).getSingleOrNull();
      if (existing == null) {
        return false;
      }
      await (delete(favoriteCategories)..where((t) => t.id.equals(id))).go();
      await (update(favoriteChannels)..where((t) => t.parentId.equals(id)))
          .write(const FavoriteChannelsCompanion(parentId: Value(null)));
      await _normalizeCategoryPositions();
      await _normalizeChannelPositions(null);
      return true;
    });
  }

  Stream<FavoriteSetting> watchSettings() async* {
    await _ensureSettings();
    yield* (select(
      favoriteSettings,
    )..where((t) => t.id.equals(1))).watchSingle().suppressDriftCancellation;
  }

  Future<FavoriteSetting> getSettings() async {
    await _ensureSettings();
    return (select(favoriteSettings)..where((t) => t.id.equals(1))).getSingle();
  }

  Future<void> setCollapsedCategoryIds(List<String> categoryIds) async {
    await _ensureSettings();
    await (update(favoriteSettings)..where((t) => t.id.equals(1))).write(
      FavoriteSettingsCompanion(
        collapsedCategoryIdsJson: Value(_encodeStringList(categoryIds)),
      ),
    );
  }

  Future<void> setHideMuted({required bool value}) async {
    await _ensureSettings();
    await (update(favoriteSettings)..where((t) => t.id.equals(1))).write(
      FavoriteSettingsCompanion(hideMuted: Value(value)),
    );
  }

  Future<void> setMuted({required bool value}) async {
    await _ensureSettings();
    await (update(favoriteSettings)..where((t) => t.id.equals(1))).write(
      FavoriteSettingsCompanion(muted: Value(value)),
    );
  }

  Future<bool> renameCategory({
    required String id,
    required String name,
  }) async {
    final trimmed = name.trim();
    if (trimmed.isEmpty) {
      return false;
    }
    final updated =
        await (update(favoriteCategories)..where((t) => t.id.equals(id))).write(
          FavoriteCategoriesCompanion(name: Value(trimmed)),
        );
    return updated > 0;
  }

  Future<void> moveCategory({required String id, required int position}) async {
    await transaction(() async {
      final existing = await (select(
        favoriteCategories,
      )..where((t) => t.id.equals(id))).getSingleOrNull();
      if (existing == null) {
        return;
      }
      final categories = await getCategories();
      final reordered = categories.where((cat) => cat.id != id).toList();
      final nextIndex = position.clamp(0, reordered.length);
      reordered.insert(nextIndex, existing);
      for (var i = 0; i < reordered.length; i++) {
        await (update(favoriteCategories)
              ..where((t) => t.id.equals(reordered[i].id)))
            .write(FavoriteCategoriesCompanion(position: Value(i)));
      }
    });
  }

  Future<bool> setChannelNickname({
    required String channelId,
    String? nickname,
  }) async {
    final trimmed = nickname?.trim();
    final normalized = trimmed == null || trimmed.isEmpty ? null : trimmed;
    final updated =
        await (update(favoriteChannels)
              ..where((t) => t.channelId.equals(channelId)))
            .write(FavoriteChannelsCompanion(nickname: Value(normalized)));
    return updated > 0;
  }

  Future<void> replaceAllFromSync({
    required List<FavoriteChannel> channels,
    required List<FavoriteCategory> categories,
    required List<String> collapsedCategoryIds,
    required bool hideMutedChannels,
    required bool muted,
  }) async {
    await transaction(() async {
      await delete(favoriteChannels).go();
      await delete(favoriteCategories).go();
      await _ensureSettings();
      for (final category in categories) {
        await into(favoriteCategories).insert(
          FavoriteCategoriesCompanion.insert(
            id: category.id,
            name: category.name,
            position: Value(category.position),
          ),
        );
      }
      for (final channel in channels) {
        await into(favoriteChannels).insert(
          FavoriteChannelsCompanion.insert(
            channelId: channel.channelId,
            guildId: Value(channel.guildId),
            parentId: Value(channel.parentId),
            position: Value(channel.position),
            nickname: Value(channel.nickname),
          ),
        );
      }
      await (update(favoriteSettings)..where((t) => t.id.equals(1))).write(
        FavoriteSettingsCompanion(
          collapsedCategoryIdsJson: Value(
            _encodeStringList(collapsedCategoryIds),
          ),
          hideMuted: Value(hideMutedChannels),
          muted: Value(muted),
        ),
      );
    });
  }

  Future<void> clearAll() async {
    await delete(favoriteChannels).go();
    await delete(favoriteCategories).go();
    await delete(favoriteSettings).go();
  }

  Future<int> _nextChannelPosition(String? parentId) async {
    final rows = await _channelsForParent(parentId);
    if (rows.isEmpty) {
      return 0;
    }
    return rows.map((row) => row.position).reduce((a, b) => a > b ? a : b) + 1;
  }

  Future<List<FavoriteChannel>> _channelsForParent(String? parentId) {
    final query = select(favoriteChannels)
      ..orderBy([(t) => OrderingTerm.asc(t.position)]);
    if (parentId == null) {
      query.where((t) => t.parentId.isNull());
    } else {
      query.where((t) => t.parentId.equals(parentId));
    }
    return query.get();
  }

  Future<void> _normalizeChannelPositions(String? parentId) async {
    final rows = await _channelsForParent(parentId);
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].position == i) {
        continue;
      }
      await (update(favoriteChannels)
            ..where((t) => t.channelId.equals(rows[i].channelId)))
          .write(FavoriteChannelsCompanion(position: Value(i)));
    }
  }

  Future<int> _nextCategoryPosition() async {
    final rows = await getCategories();
    if (rows.isEmpty) {
      return 0;
    }
    return rows.map((row) => row.position).reduce((a, b) => a > b ? a : b) + 1;
  }

  Future<void> _normalizeCategoryPositions() async {
    final rows = await getCategories();
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].position == i) {
        continue;
      }
      await (update(favoriteCategories)..where((t) => t.id.equals(rows[i].id)))
          .write(FavoriteCategoriesCompanion(position: Value(i)));
    }
  }

  Future<void> _ensureSettings() async {
    await into(favoriteSettings).insert(
      const FavoriteSettingsCompanion(id: Value(1)),
      mode: InsertMode.insertOrIgnore,
    );
  }
}

List<String> favoriteSettingsCollapsedCategoryIds(FavoriteSetting settings) =>
    _decodeStringList(settings.collapsedCategoryIdsJson);

List<String> _decodeStringList(String value) {
  try {
    final decoded = jsonDecode(value);
    if (decoded is! List<dynamic>) {
      return const <String>[];
    }
    return decoded.map((entry) => entry.toString()).toSet().toList();
  } on Object {
    return const <String>[];
  }
}

String _encodeStringList(Iterable<String> values) {
  final seen = <String>{};
  final result = <String>[];
  for (final value in values) {
    final normalized = value.trim();
    if (normalized.isEmpty || !seen.add(normalized)) {
      continue;
    }
    result.add(normalized);
  }
  return jsonEncode(result);
}
