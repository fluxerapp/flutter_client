import 'package:fluxer_app/features/favorites/domain/favorite_guild_id.dart';
import 'package:fluxer_app/features/favorites/domain/resolved_favorite_entry.dart';

bool isFavoriteDmEntry(ResolvedFavoriteEntry entry) {
  return entry.dm != null || isFavoriteDmGuildId(entry.guildId);
}

int favoriteEntryMentionCount(
  ResolvedFavoriteEntry entry,
  int rawMentionCount,
) {
  if (isFavoriteDmEntry(entry)) {
    return 0;
  }
  return rawMentionCount;
}

bool favoriteEntryShowsUnreadMessages(
  ResolvedFavoriteEntry entry, {
  required bool hasUnreadMessages,
}) {
  return !isFavoriteDmEntry(entry) && hasUnreadMessages;
}
