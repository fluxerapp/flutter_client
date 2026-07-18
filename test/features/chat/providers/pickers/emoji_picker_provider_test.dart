import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';

void main() {
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
}
