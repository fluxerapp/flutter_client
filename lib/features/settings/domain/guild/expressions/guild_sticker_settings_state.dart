import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_entry.dart';

enum GuildStickerSettingsLoadStatus { loading, success, error }

enum GuildStickerDensity { cozy, compact }

class GuildStickerSettingsState {
  const GuildStickerSettingsState({
    required this.loadStatus,
    required this.stickers,
    required this.searchQuery,
    required this.debouncedSearchQuery,
    required this.filteredIndices,
    required this.density,
    this.deletingStickerId,
    this.isSavingSticker = false,
  });

  final GuildStickerSettingsLoadStatus loadStatus;
  final List<GuildStickerSettingsEntry> stickers;
  final String searchQuery;
  final String debouncedSearchQuery;
  final List<int> filteredIndices;
  final GuildStickerDensity density;
  final String? deletingStickerId;
  final bool isSavingSticker;

  GuildStickerSettingsEntry stickerAtFilteredIndex(int index) {
    return stickers[filteredIndices[index]];
  }

  GuildStickerSettingsState copyWith({
    GuildStickerSettingsLoadStatus? loadStatus,
    List<GuildStickerSettingsEntry>? stickers,
    String? searchQuery,
    String? debouncedSearchQuery,
    List<int>? filteredIndices,
    GuildStickerDensity? density,
    String? deletingStickerId,
    bool? isSavingSticker,
    bool clearDeletingStickerId = false,
  }) {
    return GuildStickerSettingsState(
      loadStatus: loadStatus ?? this.loadStatus,
      stickers: stickers ?? this.stickers,
      searchQuery: searchQuery ?? this.searchQuery,
      debouncedSearchQuery: debouncedSearchQuery ?? this.debouncedSearchQuery,
      filteredIndices: filteredIndices ?? this.filteredIndices,
      density: density ?? this.density,
      deletingStickerId: clearDeletingStickerId
          ? null
          : (deletingStickerId ?? this.deletingStickerId),
      isSavingSticker: isSavingSticker ?? this.isSavingSticker,
    );
  }
}
