import 'package:fluxer_app/features/settings/domain/guild/guild_ban_entry.dart';

class GuildBansState {
  const GuildBansState({
    required this.bans,
    required this.filteredIndices,
    required this.searchQuery,
    required this.debouncedSearchQuery,
    this.hasSuccessfulEmptyLoad = false,
    this.isUnbanningUserId,
  });

  final List<GuildBanEntry> bans;
  final List<int> filteredIndices;
  final String searchQuery;
  final String debouncedSearchQuery;
  final bool hasSuccessfulEmptyLoad;
  final String? isUnbanningUserId;

  GuildBanEntry banAtFilteredIndex(int index) => bans[filteredIndices[index]];

  GuildBansState copyWith({
    List<GuildBanEntry>? bans,
    List<int>? filteredIndices,
    String? searchQuery,
    String? debouncedSearchQuery,
    bool? hasSuccessfulEmptyLoad,
    String? isUnbanningUserId,
    bool clearIsUnbanningUserId = false,
  }) {
    return GuildBansState(
      bans: bans ?? this.bans,
      filteredIndices: filteredIndices ?? this.filteredIndices,
      searchQuery: searchQuery ?? this.searchQuery,
      debouncedSearchQuery: debouncedSearchQuery ?? this.debouncedSearchQuery,
      hasSuccessfulEmptyLoad:
          hasSuccessfulEmptyLoad ?? this.hasSuccessfulEmptyLoad,
      isUnbanningUserId: clearIsUnbanningUserId
          ? null
          : (isUnbanningUserId ?? this.isUnbanningUserId),
    );
  }
}
