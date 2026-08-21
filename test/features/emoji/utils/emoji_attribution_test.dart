import 'package:fluxer_app/features/emoji/domain/emoji_attribution.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:test/test.dart';

void main() {
  group('resolveEmojiAttribution', () {
    const memberGuildIds = {'guild-1', 'guild-2'};
    const guild = Guild(id: 'guild-1', name: 'Test Community', ownerId: 'owner');

    test('returns default for unicode emoji', () {
      final attribution = resolveEmojiAttribution(
        memberGuildIds: memberGuildIds,
      );

      expect(attribution.type, EmojiAttributionType.defaultEmoji);
      expect(attribution.guild, isNull);
    });

    test('returns customGuild when guild is resolved', () {
      final attribution = resolveEmojiAttribution(
        memberGuildIds: memberGuildIds,
        emojiId: 'emoji-1',
        guildId: 'guild-1',
        guild: guild,
      );

      expect(attribution.type, EmojiAttributionType.customGuild);
      expect(attribution.guild, guild);
      expect(attribution.isVerified, isFalse);
    });

    test('returns customInviteRequired when guildId is known but user is not a member', () {
      final attribution = resolveEmojiAttribution(
        memberGuildIds: memberGuildIds,
        emojiId: 'emoji-1',
        guildId: 'guild-3',
      );

      expect(attribution.type, EmojiAttributionType.customInviteRequired);
      expect(attribution.guild, isNull);
    });

    test('returns customUnknown when guild cannot be resolved', () {
      final attribution = resolveEmojiAttribution(
        memberGuildIds: memberGuildIds,
        emojiId: 'emoji-1',
        guildId: 'guild-1',
      );

      expect(attribution.type, EmojiAttributionType.customUnknown);
      expect(attribution.guild, isNull);
    });
  });
}
