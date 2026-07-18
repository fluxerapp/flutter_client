import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';

void main() {
  group('StickerEntry', () {
    test('decodes row tags and builds sized URLs', () {
      final sticker = StickerEntry.fromRow(
        const db.GuildSticker(
          id: 'sticker-1',
          guildId: 'guild-1',
          name: 'party_blob',
          description: 'A celebratory blob',
          tagsJson: '["party","blob"]',
          animated: true,
        ),
      );

      expect(sticker.tags, ['party', 'blob']);
      expect(
        sticker.urlForSize(320),
        FluxerMediaUrl.sticker(id: 'sticker-1', animated: true),
      );
      expect(sticker.cacheKeyForSize(160), 'sticker_sticker-1_a_160');
    });

    test('treats malformed tags as empty', () {
      final sticker = StickerEntry.fromRow(
        const db.GuildSticker(
          id: 'sticker-1',
          guildId: 'guild-1',
          name: 'party_blob',
          description: 'A celebratory blob',
          tagsJson: 'not json',
          animated: false,
        ),
      );

      expect(sticker.tags, isEmpty);
    });
  });

  group('sticker picker grouping', () {
    const guilds = <Guild>[
      Guild(id: '1', name: 'One'),
      Guild(id: '2', name: 'Two'),
    ];
    const stickers = <StickerEntry>[
      StickerEntry(
        id: 'a',
        guildId: '1',
        name: 'alpha',
        description: 'first sticker',
        tags: ['hello'],
        animated: false,
      ),
      StickerEntry(
        id: 'b',
        guildId: '2',
        name: 'beta',
        description: 'second sticker',
        tags: ['wave'],
        animated: false,
      ),
    ];

    test('limits non-premium picker sections to the active guild', () {
      final result = guildStickerEntriesForPicker(
        guilds: guilds,
        stickers: stickers,
        activeGuildId: '1',
        isPremium: false,
      );

      expect(result.keys.map((guild) => guild.id), ['1']);
      expect(result[guilds.first]!.map((sticker) => sticker.id), ['a']);
    });

    test('keeps premium picker sections in guild list order', () {
      final result = guildStickerEntriesForPicker(
        guilds: guilds,
        stickers: stickers.reversed.toList(),
        activeGuildId: '1',
        isPremium: true,
      );

      expect(result.keys.map((guild) => guild.id), ['1', '2']);
      expect(result[guilds.first]!.map((sticker) => sticker.id), ['a']);
      expect(result[guilds.last]!.map((sticker) => sticker.id), ['b']);
    });

    test('preserves reordered guild input for premium picker sections', () {
      const reorderedGuilds = <Guild>[
        Guild(id: '2', name: 'Two'),
        Guild(id: '1', name: 'One'),
      ];
      final result = guildStickerEntriesForPicker(
        guilds: reorderedGuilds,
        stickers: stickers,
        activeGuildId: '1',
        isPremium: true,
      );

      expect(result.keys.map((guild) => guild.id), ['2', '1']);
    });

    test('sorts stickers within guilds by newest snowflake first', () {
      const guild = Guild(id: '1', name: 'One');
      const unordered = <StickerEntry>[
        StickerEntry(
          id: '100',
          guildId: '1',
          name: 'oldest',
          description: '',
          tags: [],
          animated: false,
        ),
        StickerEntry(
          id: '300',
          guildId: '1',
          name: 'newest',
          description: '',
          tags: [],
          animated: false,
        ),
        StickerEntry(
          id: '200',
          guildId: '1',
          name: 'middle',
          description: '',
          tags: [],
          animated: false,
        ),
      ];

      final result = guildStickerEntriesForPicker(
        guilds: const [guild],
        stickers: unordered,
        activeGuildId: '1',
        isPremium: true,
      );

      expect(result[guild]!.map((sticker) => sticker.id), [
        '300',
        '200',
        '100',
      ]);
    });

    test(
      'lockedGuildStickerEntriesForUpsell returns non-active guild stickers',
      () {
        final result = lockedGuildStickerEntriesForUpsell(
          guilds: guilds,
          stickers: stickers,
          activeGuildId: '1',
          isPremium: false,
        );

        expect(result.map((sticker) => sticker.id), ['b']);
      },
    );
  });

  group('searchStickerEntries', () {
    const stickers = <StickerEntry>[
      StickerEntry(
        id: 'a',
        guildId: '1',
        name: 'party_blob',
        description: 'A celebratory blob',
        tags: ['dance'],
        animated: false,
      ),
      StickerEntry(
        id: 'b',
        guildId: '1',
        name: 'sleepy_cat',
        description: 'A quiet cat',
        tags: ['nap'],
        animated: false,
      ),
    ];

    test('matches sticker names descriptions and tags case-insensitively', () {
      expect(searchStickerEntries(stickers, 'PARTY').map((s) => s.id), ['a']);
      expect(searchStickerEntries(stickers, 'quiet').map((s) => s.id), ['b']);
      expect(searchStickerEntries(stickers, 'nap').map((s) => s.id), ['b']);
    });

    test('returns all stickers for blank queries', () {
      expect(searchStickerEntries(stickers, '  ').map((s) => s.id), ['a', 'b']);
    });
  });
}
