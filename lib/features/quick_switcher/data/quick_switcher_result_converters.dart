import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_candidate.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_types.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

QuickSwitcherResult candidateToQuickSwitcherResult(
  QuickSwitcherCandidate candidate,
  FluxerLocalizations l10n, {
  String? viewContext,
}) {
  return switch (candidate) {
    QuickSwitcherUserCandidate(
      :final title,
      :final subtitle,
      :final userId,
      :final dmChannelId,
      :final avatar,
      :final avatarColor,
    ) =>
      QuickSwitcherUserResult(
        title: title,
        subtitle: subtitle,
        userId: userId,
        dmChannelId: dmChannelId,
        avatar: avatar,
        avatarColor: avatarColor,
      ),
    QuickSwitcherGroupDmCandidate(
      :final title,
      :final subtitle,
      :final channelId,
      :final icon,
      :final groupStatus,
      :final groupMembers,
    ) =>
      QuickSwitcherGroupDmResult(
        title: title,
        subtitle: subtitle,
        channelId: channelId,
        icon: icon,
        groupStatus: groupStatus,
        groupMembers: groupMembers,
      ),
    QuickSwitcherChannelCandidate(
      :final title,
      :final subtitle,
      :final channelId,
      :final guildId,
      isVoice: true,
    ) =>
      QuickSwitcherVoiceChannelResult(
        title: title,
        subtitle: _resolveChannelSubtitle(subtitle, l10n, viewContext),
        channelId: channelId,
        guildId: guildId,
      ),
    QuickSwitcherChannelCandidate(
      :final title,
      :final subtitle,
      :final channelId,
      :final guildId,
      :final channelType,
      isVoice: false,
    ) =>
      QuickSwitcherTextChannelResult(
        title: title,
        subtitle: _resolveChannelSubtitle(subtitle, l10n, viewContext),
        channelId: channelId,
        guildId: guildId,
        channelType: channelType,
      ),
    QuickSwitcherGuildCandidate(:final title, :final subtitle, :final guild) =>
      QuickSwitcherGuildResult(title: title, subtitle: subtitle, guild: guild),
    QuickSwitcherVirtualGuildCandidate(
      :final title,
      :final subtitle,
      :final virtualGuildType,
    ) =>
      QuickSwitcherVirtualGuildResult(
        title: title,
        subtitle: subtitle,
        virtualGuildType: virtualGuildType,
      ),
    QuickSwitcherSettingsCandidate(
      :final title,
      :final subtitle,
      :final target,
    ) =>
      QuickSwitcherSettingsResult(
        title: title,
        subtitle: subtitle,
        target: target,
      ),
  };
}

QuickSwitcherHeaderResult createQuickSwitcherHeader(
  String id,
  QuickSwitcherResultType type,
  FluxerLocalizations l10n,
) {
  return QuickSwitcherHeaderResult(title: quickSwitcherHeaderTitle(type, l10n));
}

String quickSwitcherHeaderTitle(
  QuickSwitcherResultType type,
  FluxerLocalizations l10n,
) => switch (type) {
  QuickSwitcherResultType.user => l10n.quickSwitcherSectionPeople,
  QuickSwitcherResultType.groupDm => l10n.quickSwitcherSectionGroupMessages,
  QuickSwitcherResultType.textChannel => l10n.quickSwitcherSectionTextChannels,
  QuickSwitcherResultType.thread => l10n.quickSwitcherSectionThreads,
  QuickSwitcherResultType.voiceChannel =>
    l10n.quickSwitcherSectionVoiceChannels,
  QuickSwitcherResultType.guild ||
  QuickSwitcherResultType.virtualGuild => l10n.quickSwitcherSectionCommunities,
  QuickSwitcherResultType.settings => l10n.quickSwitcherSectionSettings,
};

String? _resolveChannelSubtitle(
  String? subtitle,
  FluxerLocalizations l10n,
  String? viewContext,
) {
  // visit.guildId is set when the channel was opened from favorites.
  if (viewContext == 'favorites') {
    return l10n.quickSwitcherFavoritesLabel;
  }
  return subtitle;
}

int getFirstSelectableQuickSwitcherIndex(List<QuickSwitcherResult> results) {
  for (int i = 0; i < results.length; i++) {
    if (isQuickSwitcherExecutable(results[i])) {
      return i;
    }
  }
  return -1;
}
