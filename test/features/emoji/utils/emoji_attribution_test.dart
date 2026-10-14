import 'package:fluxer_app/features/emoji/domain/emoji_attribution.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:test/test.dart';

void main() {
  group('resolveEmojiAttribution', () {
    const memberGuildIds = {'guild-1', 'guild-2'};
    const guild = Guild(
      id: 'guild-1',
      name: 'Test Community',
      ownerId: 'owner',
    );

    test('returns default for unicode emoji', () {
      final attribution = resolveEmojiAttribution(
        memberGuildIds: memberGuildIds,
      );

      expect(attribution.type, EmojiAttributionType.defaultEmoji);
      expect(attribution.guild, isNull);
    });

    test('returns customGuild when the emoji is from the current guild', () {
      final attribution = resolveEmojiAttribution(
        memberGuildIds: memberGuildIds,
        currentGuildId: 'guild-1',
        emojiId: 'emoji-1',
        guildId: 'guild-1',
        guild: guild,
      );

      expect(attribution.type, EmojiAttributionType.customGuild);
      expect(attribution.guild, guild);
      expect(attribution.isVerified, isFalse);
    });

    test('returns customCommunity when the emoji is from another guild', () {
      final attribution = resolveEmojiAttribution(
        memberGuildIds: memberGuildIds,
        currentGuildId: 'guild-2',
        emojiId: 'emoji-1',
        guildId: 'guild-1',
        guild: guild,
      );

      expect(attribution.type, EmojiAttributionType.customCommunity);
      expect(attribution.guild, guild);
    });

    test('returns customCommunity outside a guild', () {
      final attribution = resolveEmojiAttribution(
        memberGuildIds: memberGuildIds,
        emojiId: 'emoji-1',
        guildId: 'guild-1',
        guild: guild,
      );

      expect(attribution.type, EmojiAttributionType.customCommunity);
      expect(attribution.guild, guild);
    });

    test(
      'returns customInviteRequired when guildId is known but user is not a member',
      () {
        final attribution = resolveEmojiAttribution(
          memberGuildIds: memberGuildIds,
          emojiId: 'emoji-1',
          guildId: 'guild-3',
        );

        expect(attribution.type, EmojiAttributionType.customInviteRequired);
        expect(attribution.guild, isNull);
      },
    );

    test('returns customCommunity when guild cannot be resolved', () {
      final attribution = resolveEmojiAttribution(
        memberGuildIds: memberGuildIds,
        emojiId: 'emoji-1',
        guildId: 'guild-1',
      );

      expect(attribution.type, EmojiAttributionType.customCommunity);
      expect(attribution.guild, isNull);
    });

    test('returns customInviteRequired when source community is unknown', () {
      final attribution = resolveEmojiAttribution(
        memberGuildIds: memberGuildIds,
        emojiId: 'emoji-1',
      );

      expect(attribution.type, EmojiAttributionType.customInviteRequired);
      expect(attribution.guild, isNull);
    });
  });
}
