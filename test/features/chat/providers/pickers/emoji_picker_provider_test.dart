import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';

import '../../../../helpers/open_test_database.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await EmojiRegistry.preload();
  });

  group('guildEmojiEntriesForPicker', () {
    const guilds = <Guild>[
      Guild(id: '1', name: 'One'),
      Guild(id: '2', name: 'Two'),
    ];
    final emojis = <GuildEmojiEntry>[
      GuildEmojiEntry(id: 'a', name: 'one', animated: false, guildId: '1'),
      GuildEmojiEntry(id: 'b', name: 'two', animated: false, guildId: '2'),
    ];

    test('limits non-premium picker sections to the active guild', () {
      final result = guildEmojiEntriesForPicker(
        guilds: guilds,
        emojis: emojis,
        activeGuildId: '1',
        isPremium: false,
      );

      expect(result.keys.map((guild) => guild.id), ['1']);
      expect(result[guilds.first]!.map((emoji) => emoji.id), ['a']);
    });

    test('keeps premium picker sections in guild list order', () {
      final result = guildEmojiEntriesForPicker(
        guilds: guilds,
        emojis: emojis.reversed.toList(),
        activeGuildId: '1',
        isPremium: true,
      );

      expect(result.keys.map((guild) => guild.id), ['1', '2']);
      expect(result[guilds.first]!.map((emoji) => emoji.id), ['a']);
      expect(result[guilds.last]!.map((emoji) => emoji.id), ['b']);
    });

    test('preserves reordered guild input for premium picker sections', () {
      const reorderedGuilds = <Guild>[
        Guild(id: '2', name: 'Two'),
        Guild(id: '1', name: 'One'),
      ];
      final result = guildEmojiEntriesForPicker(
        guilds: reorderedGuilds,
        emojis: emojis,
        activeGuildId: '1',
        isPremium: true,
      );

      expect(result.keys.map((guild) => guild.id), ['2', '1']);
    });
  });

  test('lockedGuildEmojiEntriesForUpsell returns non-active guild emojis', () {
    const guilds = <Guild>[
      Guild(id: '1', name: 'One'),
      Guild(id: '2', name: 'Two'),
    ];
    final emojis = <GuildEmojiEntry>[
      GuildEmojiEntry(id: 'a', name: 'one', animated: false, guildId: '1'),
      GuildEmojiEntry(id: 'b', name: 'two', animated: false, guildId: '2'),
    ];

    final result = lockedGuildEmojiEntriesForUpsell(
      guilds: guilds,
      emojis: emojis,
      activeGuildId: '1',
      isPremium: false,
    );

    expect(result.map((emoji) => emoji.id), ['b']);
  });

  group('buildPickerFrecentEmojis', () {
    test('returns unicode emojis for unicode usage keys', () {
      final result = buildPickerFrecentEmojis(
        rankedUsageKeys: const ['unicode:thumbsup', 'unicode:heart'],
        availableCustomEmojisById: const {},
      );

      expect(result, hasLength(2));
      expect(result.every((item) => item is FrecentUnicodeEmoji), isTrue);
      expect(
        result.cast<FrecentUnicodeEmoji>().map(
          (item) => item.emoji.primaryName,
        ),
        ['thumbsup', 'heart'],
      );
    });

    test('returns mixed unicode and custom emojis', () {
      final custom = GuildEmojiEntry(
        id: 'custom-1',
        name: 'party',
        animated: false,
        guildId: 'g1',
      );
      final result = buildPickerFrecentEmojis(
        rankedUsageKeys: const ['unicode:thumbsup', 'custom:g1:custom-1'],
        availableCustomEmojisById: {'custom-1': custom},
      );

      expect(result, hasLength(2));
      expect(result.first, isA<FrecentUnicodeEmoji>());
      expect(result.last, isA<FrecentCustomEmoji>());
      expect((result.last as FrecentCustomEmoji).emoji.id, 'custom-1');
    });

    test('excludes custom emojis that are not available', () {
      final custom = GuildEmojiEntry(
        id: 'custom-1',
        name: 'party',
        animated: false,
        guildId: 'g1',
      );
      final result = buildPickerFrecentEmojis(
        rankedUsageKeys: const [
          'unicode:thumbsup',
          'custom:g1:missing',
          'custom:g1:custom-1',
        ],
        availableCustomEmojisById: {'custom-1': custom},
      );

      expect(result, hasLength(2));
      expect(
        result.whereType<FrecentCustomEmoji>().map((item) => item.emoji.id),
        ['custom-1'],
      );
    });

    test('respects the 42 item limit', () {
      final usageKeys = EmojiRegistry.allEmojis
          .take(50)
          .map((emoji) => 'unicode:${emoji.primaryName}')
          .toList();
      final result = buildPickerFrecentEmojis(
        rankedUsageKeys: usageKeys,
        availableCustomEmojisById: const {},
      );

      expect(result.length, kMaxFrecentEmojis);
    });

    test('skips malformed custom usage keys', () {
      final result = buildPickerFrecentEmojis(
        rankedUsageKeys: const ['custom:', 'unicode:thumbsup'],
        availableCustomEmojisById: const {},
      );

      expect(result, hasLength(1));
      expect(result.first, isA<FrecentUnicodeEmoji>());
    });
    test('resolves unicode usage keys stored as surrogates', () {
      final thumbsup = EmojiRegistry.entryByName('thumbsup')!;
      final result = buildPickerFrecentEmojis(
        rankedUsageKeys: ['unicode:${thumbsup.surrogates}'],
        availableCustomEmojisById: const {},
      );

      expect(result, hasLength(1));
      expect(
        (result.first as FrecentUnicodeEmoji).emoji.primaryName,
        'thumbsup',
      );
    });
  });

  group('rankedEmojiUsageKeysProvider', () {
    test('returns tracked usage keys ordered by frecency', () async {
      final db = openTestDatabase();
      await db.emojiUsageDao.trackUsage('unicode:thumbsup');
      await db.emojiUsageDao.trackUsage('custom:g1:custom-1');

      final container = ProviderContainer(
        overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
      );
      addTearDown(container.dispose);

      final result = await container.read(rankedEmojiUsageKeysProvider.future);

      expect(result, hasLength(2));
      expect(result, contains('unicode:thumbsup'));
      expect(result, contains('custom:g1:custom-1'));
    });
  });

  group('picker frecent integration', () {
    test('builds mixed unicode and custom emojis from ranked keys', () async {
      final db = openTestDatabase();
      await db.emojiUsageDao.trackUsage('unicode:thumbsup');
      await db.emojiUsageDao.trackUsage('custom:g1:custom-1');
      await db
          .into(db.guildEmojis)
          .insert(
            GuildEmojisCompanion.insert(
              id: 'custom-1',
              guildId: 'g1',
              name: 'party',
            ),
          );

      final container = ProviderContainer(
        overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
      );
      addTearDown(container.dispose);

      final keys = await container.read(rankedEmojiUsageKeysProvider.future);
      final custom = GuildEmojiEntry(
        id: 'custom-1',
        name: 'party',
        animated: false,
        guildId: 'g1',
      );
      final result = buildPickerFrecentEmojis(
        rankedUsageKeys: keys,
        availableCustomEmojisById: {custom.id: custom},
      );

      expect(result, hasLength(2));
      expect(result.first, isA<FrecentUnicodeEmoji>());
      expect(result.last, isA<FrecentCustomEmoji>());
    });
  });
}
