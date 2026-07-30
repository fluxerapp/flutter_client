import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_limits.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  const Guild baseGuild = Guild(id: 'guild-1', name: 'Guild');

  WellKnownFluxerResponseLimits buildLimits({
    Map<String, num> overrides = const <String, num>{},
  }) {
    return WellKnownFluxerResponseLimits(
      version: WellKnownFluxerResponseLimitsVersionVersion.value2,
      traitDefinitions: const <String>[],
      defaultsHash: 'test',
      rules: <WellKnownFluxerResponseLimitsRules>[
        WellKnownFluxerResponseLimitsRules(id: 'default', overrides: overrides),
      ],
    );
  }

  test('unlimited emoji and sticker features return -1', () {
    final GuildExpressionLimits limits = resolveGuildExpressionLimits(
      guild: const Guild(
        id: 'guild-1',
        name: 'Guild',
        features: <String>[
          GuildFeatures.unlimitedEmoji,
          GuildFeatures.unlimitedStickers,
        ],
      ),
      limits: buildLimits(),
    );
    expect(limits.maxEmojis, -1);
    expect(limits.maxStickers, -1);
    expect(limits.hasUnlimitedEmojis, isTrue);
    expect(limits.hasUnlimitedStickers, isTrue);
  });

  test('guild limits resolve from well-known overrides above defaults', () {
    final GuildExpressionLimits limits = resolveGuildExpressionLimits(
      guild: baseGuild,
      limits: buildLimits(
        overrides: <String, num>{
          LimitKeys.maxGuildEmojis: 1000,
          LimitKeys.maxGuildStickers: 1000,
        },
      ),
    );
    expect(limits.maxEmojis, 1000);
    expect(limits.maxStickers, 1000);
    expect(limits.emojiMaxSizeBytes, 512 * 1024);
    expect(limits.stickerMaxSizeBytes, 512 * 1024);
  });

  test('guild limits fall back to defaults when overrides are lower', () {
    final GuildExpressionLimits limits = resolveGuildExpressionLimits(
      guild: baseGuild,
      limits: buildLimits(
        overrides: <String, num>{
          LimitKeys.maxGuildEmojis: 120,
          LimitKeys.maxGuildStickers: 45,
        },
      ),
    );
    expect(limits.maxEmojis, 500);
    expect(limits.maxStickers, 50);
  });

  test('formatExpressionSlotCount handles unlimited slots', () {
    expect(formatExpressionSlotCount(12, 50), '12 / 50');
    expect(formatExpressionSlotCount(12, -1), '12 / ∞');
  });

  test('formatExpressionFileSize formats bytes and kilobytes', () {
    expect(formatExpressionFileSize(512), '512 B');
    expect(formatExpressionFileSize(1536), '1.5 KB');
  });
}
