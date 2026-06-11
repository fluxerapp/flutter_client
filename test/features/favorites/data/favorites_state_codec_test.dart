import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/synced_preferences/favorites_state_codec.dart';
import 'package:test/test.dart';

void main() {
  group('FavoritesStateCodec', () {
    test('round-trips favorites state through wire blob', () {
      const local = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'channel-1',
            guildId: 'guild-1',
            position: 0,
            nickname: 'General',
          ),
        ],
        categories: [
          db.FavoriteCategory(id: 'cat-1', name: 'Work', position: 0),
        ],
        collapsedCategoryIds: ['cat-1'],
        hideMutedChannels: true,
        muted: false,
      );

      final encoded = FavoritesStateCodec.encodeFavoritesIntoWire(
        currentWire: null,
        local: local,
      );
      final decoded = FavoritesStateCodec.decodeFavoritesFromWire(encoded);

      expect(decoded.channels, hasLength(1));
      expect(decoded.channels.first.channelId, 'channel-1');
      expect(decoded.categories.first.name, 'Work');
      expect(decoded.collapsedCategoryIds, ['cat-1']);
      expect(decoded.hideMutedChannels, isTrue);
    });

    test('mergeForMigration deduplicates channels and categories', () {
      const local = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'channel-1',
            guildId: 'guild-1',
            position: 0,
          ),
          db.FavoriteChannel(
            channelId: 'channel-2',
            guildId: 'guild-1',
            position: 1,
          ),
        ],
        categories: [
          db.FavoriteCategory(id: 'cat-1', name: 'Local', position: 0),
        ],
        collapsedCategoryIds: ['cat-1'],
        hideMutedChannels: true,
        muted: false,
      );
      const server = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'channel-1',
            guildId: 'guild-1',
            position: 0,
            nickname: 'Server name',
          ),
          db.FavoriteChannel(
            channelId: 'channel-3',
            guildId: 'guild-2',
            position: 0,
          ),
        ],
        categories: [
          db.FavoriteCategory(id: 'cat-2', name: 'Server', position: 0),
        ],
        collapsedCategoryIds: ['cat-2'],
        hideMutedChannels: false,
        muted: true,
      );

      final merged = FavoritesStateCodec.mergeForMigration(
        local: local,
        server: server,
      );

      expect(merged.channels.map((c) => c.channelId), [
        'channel-1',
        'channel-2',
        'channel-3',
      ]);
      expect(merged.categories.map((c) => c.id), ['cat-1', 'cat-2']);
      expect(merged.collapsedCategoryIds, containsAll(['cat-1', 'cat-2']));
      expect(merged.hideMutedChannels, isTrue);
      expect(merged.muted, isFalse);
    });

    test('statesEqual compares favorites semantically', () {
      const left = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'channel-1',
            guildId: 'guild-1',
            position: 0,
            nickname: 'General',
          ),
        ],
        categories: [
          db.FavoriteCategory(id: 'cat-1', name: 'Work', position: 0),
        ],
        collapsedCategoryIds: ['cat-1'],
        hideMutedChannels: true,
        muted: false,
      );
      const right = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'channel-1',
            guildId: 'guild-1',
            position: 0,
            nickname: 'General',
          ),
        ],
        categories: [
          db.FavoriteCategory(id: 'cat-1', name: 'Work', position: 0),
        ],
        collapsedCategoryIds: ['cat-1'],
        hideMutedChannels: true,
        muted: false,
      );
      const different = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'channel-2',
            guildId: 'guild-1',
            position: 0,
          ),
        ],
        categories: [],
        collapsedCategoryIds: [],
        hideMutedChannels: false,
        muted: false,
      );

      expect(FavoritesStateCodec.statesEqual(left, right), isTrue);
      expect(FavoritesStateCodec.statesEqual(left, different), isFalse);
    });

    test('preserves wire blob when updating favorites field', () {
      const initial = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(
            channelId: 'initial',
            guildId: 'guild',
            position: 0,
          ),
        ],
        categories: [],
        collapsedCategoryIds: [],
        hideMutedChannels: false,
        muted: false,
      );
      final originalWire = FavoritesStateCodec.encodeFavoritesIntoWire(
        currentWire: null,
        local: initial,
      );

      final updated = FavoritesStateCodec.encodeFavoritesIntoWire(
        currentWire: originalWire,
        local: const FavoritesLocalState(
          channels: [
            db.FavoriteChannel(
              channelId: 'updated',
              guildId: 'guild',
              position: 0,
            ),
          ],
          categories: [],
          collapsedCategoryIds: [],
          hideMutedChannels: false,
          muted: false,
        ),
      );

      final decoded = FavoritesStateCodec.decodeFavoritesFromWire(updated);
      expect(decoded.channels.single.channelId, 'updated');
    });
  });
}
