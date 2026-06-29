import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/utils/content_warning_utils.dart';

void main() {
  const Guild guild = Guild(
    id: 'guild-1',
    name: 'Guild',
    nsfw: true,
    contentWarningLevel: contentWarningLevelContentWarning,
    contentWarningText: 'Guild warning',
  );

  Channel buildChannel({
    String id = 'channel-1',
    String? parentId,
    ChannelType type = ChannelType.guildText,
    bool? nsfwOverride,
    int contentWarningLevel = contentWarningLevelInherit,
    String? contentWarningText,
  }) {
    return Channel(
      id: id,
      guildId: guild.id,
      name: 'Channel',
      type: type,
      parentId: parentId,
      nsfwOverride: nsfwOverride,
      contentWarningLevel: contentWarningLevel,
      contentWarningText: contentWarningText,
    );
  }

  test('inherits mature flag from guild when channel override is null', () {
    final Channel channel = buildChannel();
    final EffectiveMatureContentResult result =
        resolveEffectiveChannelMatureContent(channel: channel, guild: guild);
    expect(result.value, isTrue);
    expect(result.source, EffectiveMatureSource.guild);
  });

  test('channel nsfw override takes precedence over guild', () {
    final Channel channel = buildChannel(nsfwOverride: false);
    final EffectiveMatureContentResult result =
        resolveEffectiveChannelMatureContent(channel: channel, guild: guild);
    expect(result.value, isFalse);
    expect(result.source, EffectiveMatureSource.channel);
  });

  test('parent category nsfw override sits between channel and guild', () {
    final Channel category = buildChannel(
      id: 'category-1',
      type: ChannelType.guildCategory,
      nsfwOverride: true,
    );
    final Channel channel = buildChannel(parentId: category.id);
    final EffectiveMatureContentResult result =
        resolveEffectiveChannelMatureContent(
          channel: channel,
          guild: guild,
          parentCategory: category,
        );
    expect(result.value, isTrue);
    expect(result.source, EffectiveMatureSource.parent);
  });

  test('content warning inherits from guild when channel inherits', () {
    final Channel channel = buildChannel();
    final EffectiveContentWarning warning = getEffectiveChannelContentWarning(
      channel: channel,
      guild: guild,
    );
    expect(warning.level, contentWarningLevelContentWarning);
    expect(warning.text, 'Guild warning');
    expect(warning.source, EffectiveMatureSource.guild);
  });

  test('channel content warning overrides inherited guild warning', () {
    final Channel channel = buildChannel(
      contentWarningLevel: contentWarningLevelContentWarning,
      contentWarningText: 'Channel warning',
    );
    final EffectiveContentWarning warning = getEffectiveChannelContentWarning(
      channel: channel,
      guild: guild,
    );
    expect(warning.text, 'Channel warning');
    expect(warning.source, EffectiveMatureSource.channel);
  });

  test(
    'resolveMatureGateContext scopes consent to guild for guild-level mature',
    () {
      final Channel channel = buildChannel();
      final ResolvedMatureGateContext context = resolveMatureGateContext(
        channel: channel,
        guild: guild,
      );
      expect(context.effectiveMatureContent, isTrue);
      expect(context.scope, MatureContentAgreementScope.guild);
      expect(context.scopeId, guild.id);
    },
  );
}
