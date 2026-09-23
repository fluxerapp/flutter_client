import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_order_repository.g.dart';

@Riverpod(keepAlive: true)
GuildOrderRepository guildOrderRepository(Ref ref) {
  final client = ref.watch(fluxerClientProvider);
  final repo = GuildOrderRepository(client);
  ref.onDispose(repo.dispose);
  return repo;
}

class GuildOrderRepository {
  GuildOrderRepository(this._client);

  final FluxerClient _client;
  Timer? _debounceTimer;

  void saveGuildFolders(List<GuildNavbarItem> items) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      unawaited(_persistFolders(items));
    });
  }

  Future<void> _persistFolders(List<GuildNavbarItem> items) async {
    try {
      final folders = _buildFolderPayload(items);
      await _client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(guildFolders: folders),
      );
    } on Exception catch (e, st) {
      talker.error('Failed to persist guild folder order', e, st);
    }
  }

  List<UserSettingsUpdateRequestGuildFolders> _buildFolderPayload(
    List<GuildNavbarItem> items,
  ) {
    final folders = <UserSettingsUpdateRequestGuildFolders>[];
    var ungrouped = <String>[];

    for (final item in items) {
      switch (item) {
        case GuildNavbarGuild(:final guild):
          ungrouped.add(guild.id);
        case GuildNavbarFolder():
          if (ungrouped.isNotEmpty) {
            folders.add(
              UserSettingsUpdateRequestGuildFolders(
                id: -1,
                guildIds: ungrouped,
              ),
            );
            ungrouped = [];
          }
          folders.add(
            UserSettingsUpdateRequestGuildFolders(
              id: item.id,
              guildIds: item.guilds.map((g) => g.id).toList(),
              name: item.name,
              color: item.color,
              flags: item.flags,
              icon: item.icon == null
                  ? GuildFolderIconType.folder
                  : GuildFolderIconType.fromJson(item.icon!),
            ),
          );
      }
    }

    if (ungrouped.isNotEmpty) {
      folders.add(
        UserSettingsUpdateRequestGuildFolders(id: -1, guildIds: ungrouped),
      );
    }

    return folders;
  }

  void dispose() {
    _debounceTimer?.cancel();
  }
}
