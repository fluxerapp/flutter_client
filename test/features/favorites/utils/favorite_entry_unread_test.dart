import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/favorites/domain/favorite_guild_id.dart';
import 'package:fluxer_app/features/favorites/domain/resolved_favorite_entry.dart';
import 'package:fluxer_app/features/favorites/utils/favorite_entry_unread.dart';
import 'package:test/test.dart';

void main() {
  group('favorite entry unread', () {
    test('dm entries ignore mention and unread pings', () {
      const entry = ResolvedFavoriteEntry(
        favorite: db.FavoriteChannel(
          channelId: 'dm-1',
          guildId: favoriteDmGuildId,
          position: 0,
        ),
        channel: null,
        dm: null,
        guildId: favoriteDmGuildId,
        guild: null,
      );

      expect(isFavoriteDmEntry(entry), isTrue);
      expect(favoriteEntryMentionCount(entry, 3), 0);
      expect(
        favoriteEntryShowsUnreadMessages(entry, hasUnreadMessages: true),
        isFalse,
      );
    });

    test('guild channel entries keep unread pings', () {
      const entry = ResolvedFavoriteEntry(
        favorite: db.FavoriteChannel(
          channelId: 'ch-1',
          guildId: 'guild-1',
          position: 0,
        ),
        channel: null,
        dm: null,
        guildId: 'guild-1',
        guild: null,
      );

      expect(isFavoriteDmEntry(entry), isFalse);
      expect(favoriteEntryMentionCount(entry, 2), 2);
      expect(
        favoriteEntryShowsUnreadMessages(entry, hasUnreadMessages: true),
        isTrue,
      );
      expect(
        favoriteEntryShowsUnreadMessages(entry, hasUnreadMessages: false),
        isFalse,
      );
    });
  });
}
