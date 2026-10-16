import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/favorites/domain/favorite_guild_id.dart';

void main() {
  group('resolveFavoriteGuildId', () {
    test('uses guild id for server channels', () {
      expect(
        resolveFavoriteGuildId(channelGuildId: 'guild-1', isDm: false),
        'guild-1',
      );
    });

    test('uses @me for direct messages', () {
      expect(
        resolveFavoriteGuildId(channelGuildId: null, isDm: true),
        favoriteDmGuildId,
      );
    });

    test('prefers channel guild id when present for dms', () {
      expect(
        resolveFavoriteGuildId(channelGuildId: 'guild-1', isDm: true),
        'guild-1',
      );
    });
  });

  group('favoriteChannelGuildId', () {
    test('prefers the live channel guild over the stored one', () {
      expect(
        favoriteChannelGuildId(storedGuildId: 'old', channelGuildId: 'new'),
        'new',
      );
    });

    test('falls back to the stored guild when the channel is unknown', () {
      expect(
        favoriteChannelGuildId(storedGuildId: 'old', channelGuildId: null),
        'old',
      );
    });

    test('returns null for direct message favorites', () {
      expect(
        favoriteChannelGuildId(
          storedGuildId: favoriteDmGuildId,
          channelGuildId: '',
        ),
        isNull,
      );
    });
  });

  group('isFavoriteDmGuildId', () {
    test('treats missing and @me ids as direct messages', () {
      expect(isFavoriteDmGuildId(null), isTrue);
      expect(isFavoriteDmGuildId(''), isTrue);
      expect(isFavoriteDmGuildId('  '), isTrue);
      expect(isFavoriteDmGuildId(favoriteDmGuildId), isTrue);
    });

    test('treats real guild ids as communities', () {
      expect(isFavoriteDmGuildId('guild-1'), isFalse);
    });
  });
}
