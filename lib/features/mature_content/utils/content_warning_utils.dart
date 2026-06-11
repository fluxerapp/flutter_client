import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';

Channel? findParentCategory({
  required Channel channel,
  required List<Channel> guildChannels,
}) {
  if (channel.isCategory) {
    return null;
  }
  final String? parentId = channel.parentId;
  if (parentId == null) {
    return null;
  }
  for (final Channel candidate in guildChannels) {
    if (candidate.id == parentId && candidate.isCategory) {
      return candidate;
    }
  }
  return null;
}

EffectiveMatureContentResult resolveEffectiveChannelMatureContent({
  required Channel channel,
  required Guild? guild,
  Channel? parentCategory,
}) {
  if (channel.nsfwOverride != null) {
    return EffectiveMatureContentResult(
      value: channel.nsfwOverride!,
      source: EffectiveMatureSource.channel,
    );
  }
  if (parentCategory != null && parentCategory.nsfwOverride != null) {
    return EffectiveMatureContentResult(
      value: parentCategory.nsfwOverride!,
      source: EffectiveMatureSource.parent,
    );
  }
  if (guild != null) {
    return EffectiveMatureContentResult(
      value: guild.nsfw,
      source: EffectiveMatureSource.guild,
    );
  }
  return const EffectiveMatureContentResult(
    value: false,
    source: EffectiveMatureSource.none,
  );
}

bool getEffectiveChannelMatureContent({
  required Channel channel,
  required Guild? guild,
  Channel? parentCategory,
}) {
  return resolveEffectiveChannelMatureContent(
    channel: channel,
    guild: guild,
    parentCategory: parentCategory,
  ).value;
}

EffectiveContentWarning getEffectiveChannelContentWarning({
  required Channel channel,
  required Guild? guild,
  Channel? parentCategory,
}) {
  if (channel.contentWarningLevel != contentWarningLevelInherit) {
    return EffectiveContentWarning(
      level: channel.contentWarningLevel,
      text: channel.contentWarningText,
      source: EffectiveMatureSource.channel,
    );
  }
  if (parentCategory != null &&
      parentCategory.contentWarningLevel != contentWarningLevelInherit) {
    return EffectiveContentWarning(
      level: parentCategory.contentWarningLevel,
      text: parentCategory.contentWarningText,
      source: EffectiveMatureSource.parent,
    );
  }
  if (guild != null &&
      guild.contentWarningLevel != contentWarningLevelInherit) {
    return EffectiveContentWarning(
      level: guild.contentWarningLevel,
      text: guild.contentWarningText,
      source: EffectiveMatureSource.guild,
    );
  }
  return const EffectiveContentWarning(
    level: contentWarningLevelInherit,
    text: null,
    source: EffectiveMatureSource.none,
  );
}

EffectiveMatureSource resolveMoreSpecificGateSource(
  EffectiveMatureSource current,
  EffectiveMatureSource candidate,
) {
  const Map<EffectiveMatureSource, int> specificity = {
    EffectiveMatureSource.none: 0,
    EffectiveMatureSource.guild: 1,
    EffectiveMatureSource.parent: 2,
    EffectiveMatureSource.channel: 3,
  };
  final int currentRank = specificity[current] ?? 0;
  final int candidateRank = specificity[candidate] ?? 0;
  return candidateRank > currentRank ? candidate : current;
}

ResolvedMatureGateContext resolveMatureGateContext({
  required Channel? channel,
  required Guild? guild,
  Channel? parentCategory,
}) {
  final String? channelId = channel?.id;
  final String? guildId = guild?.id ?? channel?.guildId;
  String? categoryId;
  if (channel != null) {
    if (channel.isCategory) {
      categoryId = channel.id;
    } else {
      categoryId = parentCategory?.id;
    }
  }
  bool effectiveMatureContent = false;
  EffectiveMatureSource matureContentSource = EffectiveMatureSource.none;
  int effectiveWarningLevel = contentWarningLevelInherit;
  String? effectiveWarningText;
  EffectiveMatureSource warningSource = EffectiveMatureSource.none;
  if (channel != null) {
    final EffectiveMatureContentResult matureResult =
        resolveEffectiveChannelMatureContent(
          channel: channel,
          guild: guild,
          parentCategory: parentCategory,
        );
    final EffectiveContentWarning warning = getEffectiveChannelContentWarning(
      channel: channel,
      guild: guild,
      parentCategory: parentCategory,
    );
    effectiveMatureContent = matureResult.value;
    matureContentSource = matureResult.source;
    effectiveWarningLevel = warning.level;
    effectiveWarningText = warning.text;
    warningSource = warning.source;
  } else if (guild != null) {
    effectiveMatureContent = guild.nsfw;
    matureContentSource = EffectiveMatureSource.guild;
    effectiveWarningLevel = guild.contentWarningLevel;
    effectiveWarningText = guild.contentWarningText;
    if (guild.contentWarningLevel != contentWarningLevelInherit) {
      warningSource = EffectiveMatureSource.guild;
    }
  }
  EffectiveMatureSource sourceForScope = EffectiveMatureSource.none;
  if (effectiveMatureContent) {
    sourceForScope = matureContentSource;
  }
  if (effectiveWarningLevel == contentWarningLevelContentWarning) {
    sourceForScope = resolveMoreSpecificGateSource(
      sourceForScope,
      warningSource,
    );
  }
  MatureContentAgreementScope scope = MatureContentAgreementScope.channel;
  String? scopeId = channelId;
  switch (sourceForScope) {
    case EffectiveMatureSource.guild:
      scope = MatureContentAgreementScope.guild;
      scopeId = guildId;
    case EffectiveMatureSource.parent:
      scope = MatureContentAgreementScope.category;
      scopeId = categoryId;
    case EffectiveMatureSource.channel:
      scope = MatureContentAgreementScope.channel;
      if (channel != null && channel.isCategory) {
        scope = MatureContentAgreementScope.category;
        scopeId = channel.id;
      } else {
        scopeId = channelId;
      }
    case EffectiveMatureSource.none:
      scope = MatureContentAgreementScope.channel;
      scopeId = channelId;
  }
  return ResolvedMatureGateContext(
    channelId: channelId,
    categoryId: categoryId,
    guildId: guildId,
    effectiveMatureContent: effectiveMatureContent,
    matureContentSource: matureContentSource,
    effectiveWarningLevel: effectiveWarningLevel,
    effectiveWarningText: effectiveWarningText,
    warningSource: warningSource,
    scope: scope,
    scopeId: scopeId,
  );
}

bool isGatedMatureContent(ResolvedMatureGateContext context) {
  return context.effectiveMatureContent ||
      context.effectiveWarningLevel == contentWarningLevelContentWarning;
}
