import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_emoji_settings_entry.dart';

enum GuildEmojiSettingsLoadStatus { loading, success, error }

class GuildEmojiSettingsState {
  const GuildEmojiSettingsState({
    required this.loadStatus,
    required this.emojis,
    required this.searchQuery,
    required this.debouncedSearchQuery,
    required this.filteredIndices,
    this.renamingEmojiId,
    this.deletingEmojiId,
    this.uploadingCount,
  });

  final GuildEmojiSettingsLoadStatus loadStatus;
  final List<GuildEmojiSettingsEntry> emojis;
  final String searchQuery;
  final String debouncedSearchQuery;
  final List<int> filteredIndices;
  final String? renamingEmojiId;
  final String? deletingEmojiId;
  final int? uploadingCount;

  GuildEmojiSettingsEntry emojiAtFilteredIndex(int index) {
    return emojis[filteredIndices[index]];
  }

  GuildEmojiSettingsState copyWith({
    GuildEmojiSettingsLoadStatus? loadStatus,
    List<GuildEmojiSettingsEntry>? emojis,
    String? searchQuery,
    String? debouncedSearchQuery,
    List<int>? filteredIndices,
    String? renamingEmojiId,
    String? deletingEmojiId,
    int? uploadingCount,
    bool clearRenamingEmojiId = false,
    bool clearDeletingEmojiId = false,
    bool clearUploadingCount = false,
  }) {
    return GuildEmojiSettingsState(
      loadStatus: loadStatus ?? this.loadStatus,
      emojis: emojis ?? this.emojis,
      searchQuery: searchQuery ?? this.searchQuery,
      debouncedSearchQuery: debouncedSearchQuery ?? this.debouncedSearchQuery,
      filteredIndices: filteredIndices ?? this.filteredIndices,
      renamingEmojiId: clearRenamingEmojiId
          ? null
          : (renamingEmojiId ?? this.renamingEmojiId),
      deletingEmojiId: clearDeletingEmojiId
          ? null
          : (deletingEmojiId ?? this.deletingEmojiId),
      uploadingCount: clearUploadingCount
          ? null
          : (uploadingCount ?? this.uploadingCount),
    );
  }
}
