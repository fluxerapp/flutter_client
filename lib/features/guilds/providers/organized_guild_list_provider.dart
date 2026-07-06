import 'dart:convert';

import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/features/guilds/data/guild_order_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
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
    final _FolderGuildLocation? sourceLocation = _findGuildInFolders(
      items,
      sourceId,
    );
    final int targetIndexBefore = _findTopLevelIndex(items, targetId);
    final bool targetIsSourceFolder =
        sourceLocation != null &&
        targetIndexBefore == sourceLocation.folderIndex;
    final int? guildCountInSourceFolderBefore = sourceLocation == null
        ? null
        : (items[sourceLocation.folderIndex] as GuildNavbarFolder)
              .guilds
              .length;

    GuildNavbarItem? movingItem;
    int? removedTopLevelSourceIndex;

    final int sourceTopIndex = _findTopLevelIndex(items, sourceId);
    if (sourceTopIndex != -1) {
      movingItem = items.removeAt(sourceTopIndex);
      removedTopLevelSourceIndex = sourceTopIndex;
    } else if (sourceLocation != null) {
      movingItem = GuildNavbarGuild(guild: sourceLocation.guild);
      _removeGuildFromFolderAt(
        items,
        sourceLocation.folderIndex,
        sourceLocation.guildIndex,
      );
    } else {
      return;
    }

    final int insertIndex;
    if (targetIsSourceFolder) {
      insertIndex = _insertIndexForSourceFolderTarget(
        folderIndex: sourceLocation.folderIndex,
        guildCountBeforeMove: guildCountInSourceFolderBefore!,
        insertAfter: insertAfter,
        items: items,
        targetId: targetId,
      );
    } else {
      final int targetIndex = _findTopLevelIndex(items, targetId);
      if (targetIndex == -1) {
        return;
      }
      final int adjustedTarget =
          removedTopLevelSourceIndex != null &&
              removedTopLevelSourceIndex < targetIndex
          ? targetIndex - 1
          : targetIndex;
      insertIndex = insertAfter ? adjustedTarget + 1 : adjustedTarget;
    }

    items.insert(insertIndex.clamp(0, items.length), movingItem);

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
    if (_isGuildInFolder(state, guildId, folderId)) {
      return;
    }

    final items = [...state];

    Guild? sourceGuild;
    final _FolderGuildLocation? location = _findGuildInFolders(items, guildId);
    if (location != null) {
      sourceGuild = location.guild;
      _removeGuildFromFolderAt(
        items,
        location.folderIndex,
        location.guildIndex,
      );
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

  void moveIntoFolderAtPosition({
    required String guildId,
    required int folderId,
    required String referenceGuildId,
    required bool insertAfter,
  }) {
    if (guildId == referenceGuildId) {
      return;
    }

    final items = [...state];
    final int folderIndexBefore = _findTopLevelIndex(
      items,
      folderId.toString(),
    );
    if (folderIndexBefore == -1) {
      return;
    }
    final GuildNavbarItem folderItemBefore = items[folderIndexBefore];
    if (folderItemBefore is! GuildNavbarFolder) {
      return;
    }
    final int referenceIndexBefore = folderItemBefore.guilds.indexWhere(
      (Guild g) => g.id == referenceGuildId,
    );
    if (referenceIndexBefore == -1) {
      return;
    }

    Guild? sourceGuild;
    int? sourceFolderIndex;
    int? sourceGuildIndex;

    final int sourceTopIndex = _findTopLevelIndex(items, guildId);
    if (sourceTopIndex != -1) {
      final GuildNavbarItem sourceItem = items.removeAt(sourceTopIndex);
      if (sourceItem is! GuildNavbarGuild) {
        return;
      }
      sourceGuild = sourceItem.guild;
    } else {
      final _FolderGuildLocation? location = _findGuildInFolders(
        items,
        guildId,
      );
      if (location == null) {
        return;
      }
      sourceGuild = location.guild;
      sourceFolderIndex = location.folderIndex;
      sourceGuildIndex = location.guildIndex;
      _removeGuildFromFolderAt(
        items,
        location.folderIndex,
        location.guildIndex,
      );
    }

    final int folderIndex = _findTopLevelIndex(items, folderId.toString());
    if (folderIndex == -1) {
      return;
    }
    final GuildNavbarFolder folderItem =
        items[folderIndex] as GuildNavbarFolder;
    var referenceIndex = folderItem.guilds.indexWhere(
      (Guild g) => g.id == referenceGuildId,
    );
    if (referenceIndex == -1) {
      return;
    }
    if (sourceFolderIndex == folderIndex &&
        sourceGuildIndex != null &&
        sourceGuildIndex < referenceIndex) {
      referenceIndex -= 1;
    }

    final int insertIndex = insertAfter ? referenceIndex + 1 : referenceIndex;
    final List<Guild> guilds = [...folderItem.guilds];
    guilds.insert(insertIndex.clamp(0, guilds.length), sourceGuild);

    items[folderIndex] = GuildNavbarFolder(
      id: folderItem.id,
      name: folderItem.name,
      color: folderItem.color,
      flags: folderItem.flags,
      icon: folderItem.icon,
      guilds: guilds,
    );

    state = items;
    _persist();
  }

  void applyDragDrop({
    required String sourceId,
    required String targetId,
    required bool targetIsFolder,
    required DropPosition position,
  }) {
    switch (position) {
      case DropPosition.before:
        if (!targetIsFolder && _findGuildInFolders(state, targetId) != null) {
          final _FolderGuildLocation location = _findGuildInFolders(
            state,
            targetId,
          )!;
          final int folderId =
              (state[location.folderIndex] as GuildNavbarFolder).id;
          moveIntoFolderAtPosition(
            guildId: sourceId,
            folderId: folderId,
            referenceGuildId: targetId,
            insertAfter: false,
          );
          return;
        }
        reorder(sourceId: sourceId, targetId: targetId, insertAfter: false);
      case DropPosition.after:
        if (!targetIsFolder && _findGuildInFolders(state, targetId) != null) {
          final _FolderGuildLocation location = _findGuildInFolders(
            state,
            targetId,
          )!;
          final int folderId =
              (state[location.folderIndex] as GuildNavbarFolder).id;
          moveIntoFolderAtPosition(
            guildId: sourceId,
            folderId: folderId,
            referenceGuildId: targetId,
            insertAfter: true,
          );
          return;
        }
        reorder(sourceId: sourceId, targetId: targetId, insertAfter: true);
      case DropPosition.combine:
        if (targetIsFolder) {
          moveIntoFolder(guildId: sourceId, folderId: int.parse(targetId));
        } else {
          combineIntoFolder(sourceGuildId: sourceId, targetGuildId: targetId);
        }
    }
  }

  void _persist() {
    ref.read(guildOrderRepositoryProvider).saveGuildFolders(state);
  }

  static int _insertIndexForSourceFolderTarget({
    required int folderIndex,
    required int guildCountBeforeMove,
    required bool insertAfter,
    required List<GuildNavbarItem> items,
    required String targetId,
  }) {
    if (guildCountBeforeMove <= 1) {
      return folderIndex.clamp(0, items.length);
    }
    final int folderIndexAfterMove = _findTopLevelIndex(items, targetId);
    if (folderIndexAfterMove == -1) {
      return insertAfter ? folderIndex + 1 : folderIndex;
    }
    return insertAfter ? folderIndexAfterMove + 1 : folderIndexAfterMove;
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

  static _FolderGuildLocation? _findGuildInFolders(
    List<GuildNavbarItem> items,
    String guildId,
  ) {
    for (var i = 0; i < items.length; i++) {
      final GuildNavbarItem item = items[i];
      if (item is GuildNavbarFolder) {
        final int guildIndex = item.guilds.indexWhere(
          (Guild g) => g.id == guildId,
        );
        if (guildIndex != -1) {
          return _FolderGuildLocation(
            folderIndex: i,
            guildIndex: guildIndex,
            guild: item.guilds[guildIndex],
          );
        }
      }
    }
    return null;
  }

  static void _removeGuildFromFolderAt(
    List<GuildNavbarItem> items,
    int folderIndex,
    int guildIndex,
  ) {
    final GuildNavbarItem item = items[folderIndex];
    if (item is! GuildNavbarFolder) {
      return;
    }
    final List<Guild> remainingGuilds = [...item.guilds]..removeAt(guildIndex);
    if (remainingGuilds.isEmpty) {
      items.removeAt(folderIndex);
    } else if (remainingGuilds.length == 1) {
      items[folderIndex] = GuildNavbarGuild(guild: remainingGuilds.first);
    } else {
      items[folderIndex] = GuildNavbarFolder(
        id: item.id,
        name: item.name,
        color: item.color,
        flags: item.flags,
        icon: item.icon,
        guilds: remainingGuilds,
      );
    }
  }

  static bool _isGuildInFolder(
    List<GuildNavbarItem> items,
    String guildId,
    int folderId,
  ) {
    for (final GuildNavbarItem item in items) {
      if (item is GuildNavbarFolder && item.id == folderId) {
        return item.guilds.any((Guild g) => g.id == guildId);
      }
    }
    return false;
  }
}

class _FolderGuildLocation {
  const _FolderGuildLocation({
    required this.folderIndex,
    required this.guildIndex,
    required this.guild,
  });

  final int folderIndex;
  final int guildIndex;
  final Guild guild;
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
