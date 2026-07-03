import 'dart:async';

import 'package:fluxer_app/features/settings/domain/guild/guild_ban_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_bans_state.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_repository_provider.dart';
import 'package:fluxer_app/features/settings/utils/guild_bans_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_bans_provider.g.dart';

const Duration _kSearchDebounce = Duration(milliseconds: 300);

@riverpod
class GuildBans extends _$GuildBans {
  Timer? _searchDebounce;

  @override
  Future<GuildBansState> build(String guildId) {
    ref.onDispose(() => _searchDebounce?.cancel());
    return _loadState();
  }

  void setSearchQuery(String query) {
    final GuildBansState? current = state.value;
    if (current == null) {
      return;
    }
    state = AsyncData<GuildBansState>(current.copyWith(searchQuery: query));
    _searchDebounce?.cancel();
    _searchDebounce = Timer(_kSearchDebounce, () {
      final GuildBansState? latest = state.value;
      if (latest == null) {
        return;
      }
      final List<int> indices = GuildBansUtils.filterBanIndices(
        latest.bans,
        query,
      );
      state = AsyncData<GuildBansState>(
        latest.copyWith(debouncedSearchQuery: query, filteredIndices: indices),
      );
    });
  }

  Future<void> reload() async {
    state = const AsyncLoading<GuildBansState>();
    state = AsyncData<GuildBansState>(await _loadState());
  }

  Future<void> unban(String userId) async {
    final GuildBansState? current = state.value;
    if (current == null || current.isUnbanningUserId != null) {
      return;
    }
    state = AsyncData<GuildBansState>(
      current.copyWith(isUnbanningUserId: userId),
    );
    try {
      await ref
          .read(guildSettingsRepositoryProvider)
          .unbanMember(guildId: guildId, userId: userId);
      final List<GuildBanEntry> updatedBans = current.bans
          .where((GuildBanEntry entry) => entry.userId != userId)
          .toList();
      final List<int> indices = GuildBansUtils.filterBanIndices(
        updatedBans,
        current.debouncedSearchQuery,
      );
      state = AsyncData<GuildBansState>(
        current.copyWith(
          bans: updatedBans,
          filteredIndices: indices,
          hasSuccessfulEmptyLoad: updatedBans.isEmpty,
          clearIsUnbanningUserId: true,
        ),
      );
    } on Object {
      state = AsyncData<GuildBansState>(
        current.copyWith(clearIsUnbanningUserId: true),
      );
      rethrow;
    }
  }

  Future<GuildBansState> _loadState() async {
    final List<GuildBanResponse> response = await ref
        .read(guildSettingsRepositoryProvider)
        .listBans(guildId);
    final List<GuildBanEntry> bans = GuildBansUtils.sortBanEntries(
      response.map(GuildBanEntry.fromResponse).toList(),
    );
    return GuildBansState(
      bans: bans,
      filteredIndices: GuildBansUtils.filterBanIndices(bans, ''),
      searchQuery: '',
      debouncedSearchQuery: '',
      hasSuccessfulEmptyLoad: bans.isEmpty,
    );
  }
}
