import 'dart:convert';

import 'package:fluxer_app/core/database/daos/favorite_channels_dao.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/synced_preferences/generated/favorites.pb.dart'
    as pb;

class FavoritesLocalState {
  const FavoritesLocalState({
    required this.channels,
    required this.categories,
    required this.collapsedCategoryIds,
    required this.hideMutedChannels,
    required this.muted,
  });

  final List<db.FavoriteChannel> channels;
  final List<db.FavoriteCategory> categories;
  final List<String> collapsedCategoryIds;
  final bool hideMutedChannels;
  final bool muted;

  static const empty = FavoritesLocalState(
    channels: [],
    categories: [],
    collapsedCategoryIds: [],
    hideMutedChannels: false,
    muted: false,
  );
}

class FavoritesStateCodec {
  const FavoritesStateCodec._();

  static FavoritesLocalState decodeFavoritesFromWire(String encoded) {
    if (encoded.isEmpty) {
      return FavoritesLocalState.empty;
    }
    try {
      final bytes = base64Decode(encoded);
      final synced = pb.SyncedPreferences.fromBuffer(bytes);
      if (!synced.hasFavorites()) {
        return FavoritesLocalState.empty;
      }
      return _fromProto(synced.favorites);
    } on Object {
      return FavoritesLocalState.empty;
    }
  }

  static FavoritesLocalState decodeFavoritesStateBytes(List<int> bytes) {
    if (bytes.isEmpty) {
      return FavoritesLocalState.empty;
    }
    try {
      final state = pb.FavoritesState.fromBuffer(bytes);
      return _fromProto(state);
    } on Object {
      return FavoritesLocalState.empty;
    }
  }

  static String encodeFavoritesIntoWire({
    required String? currentWire,
    required FavoritesLocalState local,
  }) {
    pb.SyncedPreferences synced;
    if (currentWire != null && currentWire.isNotEmpty) {
      try {
        synced = pb.SyncedPreferences.fromBuffer(base64Decode(currentWire));
      } on Object {
        synced = pb.SyncedPreferences();
      }
    } else {
      synced = pb.SyncedPreferences();
    }
    synced.favorites = _toProto(local);
    return base64Encode(synced.writeToBuffer());
  }

  static bool statesEqual(FavoritesLocalState a, FavoritesLocalState b) {
    if (a.hideMutedChannels != b.hideMutedChannels || a.muted != b.muted) {
      return false;
    }
    if (!_stringSetsEqual(a.collapsedCategoryIds, b.collapsedCategoryIds)) {
      return false;
    }
    if (a.channels.length != b.channels.length ||
        a.categories.length != b.categories.length) {
      return false;
    }
    final sortedChannelsA = [...a.channels]
      ..sort((x, y) => x.position.compareTo(y.position));
    final sortedChannelsB = [...b.channels]
      ..sort((x, y) => x.position.compareTo(y.position));
    for (var i = 0; i < sortedChannelsA.length; i++) {
      final left = sortedChannelsA[i];
      final right = sortedChannelsB[i];
      if (left.channelId != right.channelId ||
          left.guildId != right.guildId ||
          left.parentId != right.parentId ||
          left.position != right.position ||
          left.nickname != right.nickname) {
        return false;
      }
    }
    final sortedCategoriesA = [...a.categories]
      ..sort((x, y) => x.position.compareTo(y.position));
    final sortedCategoriesB = [...b.categories]
      ..sort((x, y) => x.position.compareTo(y.position));
    for (var i = 0; i < sortedCategoriesA.length; i++) {
      final left = sortedCategoriesA[i];
      final right = sortedCategoriesB[i];
      if (left.id != right.id ||
          left.name != right.name ||
          left.position != right.position) {
        return false;
      }
    }
    return true;
  }

  static bool _stringSetsEqual(List<String> a, List<String> b) {
    if (a.length != b.length) {
      return false;
    }
    final setA = a.toSet();
    return setA.length == b.length && setA.containsAll(b);
  }

  static FavoritesLocalState mergeForMigration({
    required FavoritesLocalState local,
    required FavoritesLocalState server,
  }) {
    final seenChannels = <String>{};
    final channels = <db.FavoriteChannel>[];
    var position = 0;
    for (final channel in [...local.channels, ...server.channels]) {
      if (seenChannels.contains(channel.channelId)) {
        continue;
      }
      seenChannels.add(channel.channelId);
      channels.add(
        db.FavoriteChannel(
          channelId: channel.channelId,
          guildId: channel.guildId,
          parentId: channel.parentId,
          position: position++,
          nickname: channel.nickname,
        ),
      );
    }

    final seenCategories = <String>{};
    final categories = <db.FavoriteCategory>[];
    var categoryPosition = 0;
    for (final category in [...local.categories, ...server.categories]) {
      if (seenCategories.contains(category.id)) {
        continue;
      }
      seenCategories.add(category.id);
      categories.add(
        db.FavoriteCategory(
          id: category.id,
          name: category.name,
          position: categoryPosition++,
        ),
      );
    }

    final collapsed = {
      ...local.collapsedCategoryIds,
      ...server.collapsedCategoryIds,
    }.toList();

    return FavoritesLocalState(
      channels: channels,
      categories: categories,
      collapsedCategoryIds: collapsed,
      hideMutedChannels: local.hideMutedChannels,
      muted: local.muted,
    );
  }

  static Future<FavoritesLocalState> readFromDatabase(
    FavoriteChannelsDao dao,
  ) async {
    final channels = await dao.watchChannels().first;
    final categories = await dao.getCategories();
    final settings = await dao.getSettings();
    return FavoritesLocalState(
      channels: channels,
      categories: categories,
      collapsedCategoryIds: favoriteSettingsCollapsedCategoryIds(settings),
      hideMutedChannels: settings.hideMuted,
      muted: settings.muted,
    );
  }

  static FavoritesLocalState _fromProto(pb.FavoritesState state) {
    return FavoritesLocalState(
      channels: [
        for (final channel in state.channels)
          db.FavoriteChannel(
            channelId: channel.channelId,
            guildId: channel.guildId.isEmpty ? null : channel.guildId,
            parentId: channel.hasParentId() && channel.parentId.isNotEmpty
                ? channel.parentId
                : null,
            position: channel.position,
            nickname: channel.hasNickname() && channel.nickname.isNotEmpty
                ? channel.nickname
                : null,
          ),
      ],
      categories: [
        for (final category in state.categories)
          db.FavoriteCategory(
            id: category.id,
            name: category.name,
            position: category.position,
          ),
      ],
      collapsedCategoryIds: state.collapsedCategoryIds.toList(),
      hideMutedChannels: state.hideMutedChannels,
      muted: state.muted,
    );
  }

  static pb.FavoritesState _toProto(FavoritesLocalState local) {
    return pb.FavoritesState(
      channels: [
        for (final channel in local.channels)
          pb.FavoriteChannel(
            channelId: channel.channelId,
            guildId: channel.guildId ?? '',
            parentId: channel.parentId ?? '',
            position: channel.position,
            nickname: channel.nickname ?? '',
          ),
      ],
      categories: [
        for (final category in local.categories)
          pb.FavoriteCategory(
            id: category.id,
            name: category.name,
            position: category.position,
          ),
      ],
      collapsedCategoryIds: local.collapsedCategoryIds,
      hideMutedChannels: local.hideMutedChannels,
      muted: local.muted,
    );
  }
}
