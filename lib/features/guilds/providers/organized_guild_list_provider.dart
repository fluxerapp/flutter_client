import 'dart:convert';

import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/features/guilds/data/guild_order_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/models/user_settings_response_guild_folders.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'organized_guild_list_provider.g.dart';

sealed class GuildNavbarItem {
  const GuildNavbarItem();
}

class GuildNavbarFolder extends GuildNavbarItem {
  const GuildNavbarFolder({
    required this.id,
    required this.guilds,
    this.name,
    this.color,
    this.flags = 0,
    this.icon,
  });

  final int id;
  final String? name;
  final int? color;
  final int flags;
  final String? icon;
  final List<Guild> guilds;

  /// Whether to show the folder icon instead of the 2x2 grid when collapsed.
  bool get showIconWhenCollapsed => (flags & 1) != 0;
}

class GuildNavbarGuild extends GuildNavbarItem {
  const GuildNavbarGuild({required this.guild});
  final Guild guild;
}

List<GuildNavbarItem> computeOrganizedGuildList({
  required List<Guild> guilds,
  required List<UserSettingsResponseGuildFolders> folders,
}) {
  if (folders.isEmpty) {
    return guilds.map((Guild g) => GuildNavbarGuild(guild: g)).toList();
  }
  final guildMap = <String, Guild>{for (final Guild g in guilds) g.id: g};
  final placedGuildIds = <String>{};
  final items = <GuildNavbarItem>[];
  for (final folder in folders) {
    final folderGuilds = folder.guildIds
        .map((String id) => guildMap[id])
        .whereType<Guild>()
        .toList();
    if (folderGuilds.isEmpty) {
      continue;
    }
    for (final guild in folderGuilds) {
      placedGuildIds.add(guild.id);
    }
    // Web app uses UNCATEGORIZED_FOLDER_ID = -1.
    // Gateway may send null or -1 for uncategorized entries.
    if (folder.id == null || folder.id == -1) {
      for (final guild in folderGuilds) {
        items.add(GuildNavbarGuild(guild: guild));
      }
    } else {
      items.add(
        GuildNavbarFolder(
          id: folder.id!,
          name: folder.name,
          color: folder.color,
          flags: folder.flags ?? 0,
          icon: folder.icon?.json,
          guilds: folderGuilds,
        ),
      );
    }
  }
  final unplacedGuilds = guilds
      .where((Guild g) => !placedGuildIds.contains(g.id) && !g.isUnavailable)
      .toList();
  if (unplacedGuilds.isEmpty) {
    return items;
  }
  final prefix = <GuildNavbarItem>[
    for (var i = unplacedGuilds.length - 1; i >= 0; i--)
      GuildNavbarGuild(guild: unplacedGuilds[i]),
  ];
  return [...prefix, ...items];
}

@Riverpod(keepAlive: true)
Stream<List<UserSettingsResponseGuildFolders>> guildFolders(Ref ref) async* {
  final db = ref.watch(fluxerDatabaseProvider);
  final UserSettingsViewState userState = ref.watch(
    userSettingsViewModelProvider,
  );

  if (userState.userId.isEmpty) {
    yield [];
    return;
  }

  await for (final settings in db.userSettingsDao.watchSettings(
    userState.userId,
  )) {
    if (settings == null) {
      yield [];
      continue;
    }

    final data = jsonDecode(settings.data) as Map<String, dynamic>;
    final foldersJson = data['guild_folders'] as List<dynamic>? ?? [];
    yield foldersJson
        .map(
          (e) => UserSettingsResponseGuildFolders.fromJson(
            e as Map<String, Object?>,
          ),
        )
        .toList();
  }
}

@Riverpod(keepAlive: true)
class OrganizedGuildList extends _$OrganizedGuildList {
  @override
  List<GuildNavbarItem> build() {
    final folders = ref.watch(guildFoldersProvider).value ?? [];
    final GuildListViewState guildState = ref.watch(guildListViewModelProvider);
    return computeOrganizedGuildList(
      guilds: guildState.guilds,
      folders: folders,
    );
  }

  void reorder({
    required String sourceId,
    required String targetId,
    required bool insertAfter,
  }) {
    final items = [...state];
    final sourceIndex = _findTopLevelIndex(items, sourceId);
    final targetIndex = _findTopLevelIndex(items, targetId);
    if (sourceIndex == -1 || targetIndex == -1) {
      return;
    }

    final item = items.removeAt(sourceIndex);
    final adjustedTarget = sourceIndex < targetIndex
        ? targetIndex - 1
        : targetIndex;
    final insertIndex = insertAfter ? adjustedTarget + 1 : adjustedTarget;
    items.insert(insertIndex, item);

    state = items;
    _persist();
  }

  void combineIntoFolder({
    required String sourceGuildId,
    required String targetGuildId,
  }) {
    final items = [...state];
    final sourceIndex = _findTopLevelIndex(items, sourceGuildId);
    final targetIndex = _findTopLevelIndex(items, targetGuildId);
    if (sourceIndex == -1 || targetIndex == -1) {
      return;
    }

    final sourceItem = items[sourceIndex];
    final targetItem = items[targetIndex];
    if (sourceItem is! GuildNavbarGuild || targetItem is! GuildNavbarGuild) {
      return;
    }

    // Generate a folder ID from the two guild IDs to keep it deterministic.
    final folderId =
        (sourceGuildId.hashCode ^ targetGuildId.hashCode).abs() % 0x7FFFFFFF;

    final folder = GuildNavbarFolder(
      id: folderId,
      guilds: [targetItem.guild, sourceItem.guild],
    );

    // Remove higher index first to avoid shifting.
    final first = sourceIndex < targetIndex ? sourceIndex : targetIndex;
    if (sourceIndex > targetIndex) {
      items
        ..removeAt(sourceIndex)
        ..removeAt(targetIndex);
    } else {
      items
        ..removeAt(targetIndex)
        ..removeAt(sourceIndex);
    }
    items.insert(first < items.length ? first : items.length, folder);

    state = items;
    _persist();
  }

  void moveIntoFolder({required String guildId, required int folderId}) {
    final items = [...state];

    // Check if the guild is inside another folder first.
    Guild? sourceGuild;
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      if (item is GuildNavbarFolder) {
        final guildIndex = item.guilds.indexWhere((g) => g.id == guildId);
        if (guildIndex != -1) {
          sourceGuild = item.guilds[guildIndex];
          final remainingGuilds = [...item.guilds]..removeAt(guildIndex);
          if (remainingGuilds.isEmpty) {
            items.removeAt(i);
          } else if (remainingGuilds.length == 1) {
            // Dissolve folder into a standalone guild.
            items[i] = GuildNavbarGuild(guild: remainingGuilds.first);
          } else {
            items[i] = GuildNavbarFolder(
              id: item.id,
              name: item.name,
              color: item.color,
              flags: item.flags,
              icon: item.icon,
              guilds: remainingGuilds,
            );
          }
          break;
        }
      }
    }

    // If not found in a folder, look for a top-level guild.
    if (sourceGuild == null) {
      final sourceIndex = _findTopLevelIndex(items, guildId);
      if (sourceIndex == -1) {
        return;
      }

      final sourceItem = items[sourceIndex];
      if (sourceItem is! GuildNavbarGuild) {
        return;
      }

      sourceGuild = sourceItem.guild;
      items.removeAt(sourceIndex);
    }

    final folderIndex = _findTopLevelIndex(items, folderId.toString());
    if (folderIndex == -1) {
      return;
    }

    final folderItem = items[folderIndex];
    if (folderItem is! GuildNavbarFolder) {
      return;
    }

    items[folderIndex] = GuildNavbarFolder(
      id: folderItem.id,
      name: folderItem.name,
      color: folderItem.color,
      flags: folderItem.flags,
      icon: folderItem.icon,
      guilds: [...folderItem.guilds, sourceGuild],
    );

    state = items;
    _persist();
  }

  void _persist() {
    ref.read(guildOrderRepositoryProvider).saveGuildFolders(state);
  }

  static int _findTopLevelIndex(List<GuildNavbarItem> items, String id) {
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      switch (item) {
        case GuildNavbarGuild(:final guild):
          if (guild.id == id) {
            return i;
          }
        case GuildNavbarFolder():
          if (item.id.toString() == id) {
            return i;
          }
      }
    }
    return -1;
  }
}

@Riverpod(keepAlive: true)
class FolderExpandedState extends _$FolderExpandedState {
  bool _isApplyingRemote = false;

  @override
  Set<int> build() => {};

  Future<void> applySynced(Set<int> value) async {
    _isApplyingRemote = true;
    try {
      state = Set<int>.from(value);
    } finally {
      _isApplyingRemote = false;
    }
  }

  void toggle(int folderId) {
    if (state.contains(folderId)) {
      state = Set.of(state)..remove(folderId);
    } else {
      state = {...state, folderId};
    }
    _markDirtyIfNeeded();
  }

  void _markDirtyIfNeeded() {
    if (_isApplyingRemote) {
      return;
    }
    ref
        .read(syncedPreferencesStoreProvider)
        .markDirty(SyncedPreferenceField.guildFolders);
  }
}
