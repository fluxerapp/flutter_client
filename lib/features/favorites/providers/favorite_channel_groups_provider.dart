import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/favorites/domain/favorite_guild_id.dart';
import 'package:fluxer_app/features/favorites/domain/resolved_favorite_entry.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';

/// Guild channel rows for the current favorites only.
final StreamProvider<List<Channel>> favoriteGuildChannelsProvider =
    StreamProvider.autoDispose<List<Channel>>((ref) {
      final List<String> ids = <String>[
        for (final db.FavoriteChannel favorite
            in ref.watch(favoriteChannelsProvider).value ??
                const <db.FavoriteChannel>[])
          if (!isFavoriteDmGuildId(favorite.guildId)) favorite.channelId,
      ];
      if (ids.isEmpty) {
        return Stream<List<Channel>>.value(const <Channel>[]);
      }
      return ref
          .watch(fluxerDatabaseProvider)
          .channelDao
          .watchChannelsByIds(ids)
          .map((rows) => rows.map(Channel.fromRow).toList())
          .distinct(listEquals);
    });

final Provider<List<ResolvedFavoriteEntry>> favoriteResolvedEntriesProvider =
    Provider.autoDispose<List<ResolvedFavoriteEntry>>((ref) {
      final favorites = ref.watch(favoriteChannelsProvider).value ?? const [];
      final channels =
          ref.watch(favoriteGuildChannelsProvider).value ?? const [];
      final dms = ref.watch(
        dmViewModelProvider.select((state) => state.conversations),
      );
      final guilds = ref.watch(guildListViewModelProvider).guilds;
      return resolveFavoriteEntries(
        favorites: favorites,
        channelById: {for (final channel in channels) channel.id: channel},
        dmById: {for (final dm in dms) dm.id: dm},
        guildById: {for (final guild in guilds) guild.id: guild},
      );
    });

List<ResolvedFavoriteEntry> resolveFavoriteEntries({
  required List<db.FavoriteChannel> favorites,
  required Map<String, Channel> channelById,
  required Map<String, DmConversation> dmById,
  required Map<String, Guild> guildById,
}) {
  return [
    for (final favorite in favorites)
      if (channelById[favorite.channelId] != null ||
          dmById[favorite.channelId] != null)
        ResolvedFavoriteEntry(
          favorite: favorite,
          channel: channelById[favorite.channelId],
          dm: dmById[favorite.channelId],
          guildId: _resolveFavoriteGuildId(favorite.guildId),
          guild: isFavoriteDmGuildId(favorite.guildId)
              ? null
              : guildById[favorite.guildId],
        ),
  ];
}

final Provider<List<FavoriteChannelGroup>> favoriteChannelGroupsProvider =
    Provider.autoDispose<List<FavoriteChannelGroup>>((ref) {
      final resolved = ref.watch(favoriteResolvedEntriesProvider);
      final categories =
          ref.watch(favoriteCategoriesProvider).value ?? const [];
      final byParent = <String?, List<ResolvedFavoriteEntry>>{};
      for (final entry in resolved) {
        byParent.putIfAbsent(entry.favorite.parentId, () => []).add(entry);
      }
      for (final entries in byParent.values) {
        entries.sort(
          (a, b) => a.favorite.position.compareTo(b.favorite.position),
        );
      }
      final groups = <FavoriteChannelGroup>[
        FavoriteChannelGroup(
          categoryId: null,
          title: '__root__',
          entries: byParent[null] ?? const [],
        ),
        for (final category in categories)
          FavoriteChannelGroup(
            categoryId: category.id,
            title: category.name,
            entries: byParent[category.id] ?? const [],
          ),
      ];
      final knownCategoryIds = categories.map((c) => c.id).toSet();
      final orphaned = resolved
          .where(
            (entry) =>
                entry.favorite.parentId != null &&
                !knownCategoryIds.contains(entry.favorite.parentId),
          )
          .toList();
      if (orphaned.isNotEmpty) {
        groups.add(
          FavoriteChannelGroup(
            categoryId: '__other__',
            title: '__other__',
            entries: orphaned,
          ),
        );
      }
      return groups
          .where(
            (group) => group.categoryId != null || group.entries.isNotEmpty,
          )
          .toList();
    });

String? _resolveFavoriteGuildId(String? guildId) {
  if (isFavoriteDmGuildId(guildId)) {
    return null;
  }
  return guildId;
}
