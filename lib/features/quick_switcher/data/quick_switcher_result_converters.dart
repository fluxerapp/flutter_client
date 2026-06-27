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
      :final id,
      :final title,
      :final subtitle,
      :final userId,
      :final dmChannelId,
      :final avatar,
      :final avatarColor,
      :final status,
    ) =>
      QuickSwitcherUserResult(
        id: id,
        title: title,
        subtitle: subtitle,
        userId: userId,
        dmChannelId: dmChannelId,
        avatar: avatar,
        avatarColor: avatarColor,
        status: status,
      ),
    QuickSwitcherGroupDmCandidate(
      :final id,
      :final title,
      :final subtitle,
      :final channelId,
      :final icon,
      :final groupStatus,
      :final groupMembers,
    ) =>
      QuickSwitcherGroupDmResult(
        id: id,
        title: title,
        subtitle: subtitle,
        channelId: channelId,
        icon: icon,
        groupStatus: groupStatus,
        groupMembers: groupMembers,
      ),
    QuickSwitcherChannelCandidate(
      :final id,
      :final title,
      :final subtitle,
      :final channelId,
      :final guildId,
      :final guildName,
      :final guildIcon,
      isVoice: true,
    ) =>
      QuickSwitcherVoiceChannelResult(
        id: id,
        title: title,
        subtitle: _resolveChannelSubtitle(subtitle, l10n, viewContext),
        channelId: channelId,
        guildId: guildId,
        guildName: guildName,
        guildIcon: guildIcon,
      ),
    QuickSwitcherChannelCandidate(
      :final id,
      :final title,
      :final subtitle,
      :final channelId,
      :final guildId,
      :final guildName,
      :final guildIcon,
      isVoice: false,
    ) =>
      QuickSwitcherTextChannelResult(
        id: id,
        title: title,
        subtitle: _resolveChannelSubtitle(subtitle, l10n, viewContext),
        channelId: channelId,
        guildId: guildId,
        guildName: guildName,
        guildIcon: guildIcon,
      ),
    QuickSwitcherGuildCandidate(
      :final id,
      :final title,
      :final subtitle,
      :final guild,
    ) =>
      QuickSwitcherGuildResult(
        id: id,
        title: title,
        subtitle: subtitle,
        guild: guild,
      ),
    QuickSwitcherVirtualGuildCandidate(
      :final id,
      :final title,
      :final subtitle,
      :final virtualGuildType,
    ) =>
      QuickSwitcherVirtualGuildResult(
        id: id,
        title: title,
        subtitle: subtitle,
        virtualGuildType: virtualGuildType,
      ),
    QuickSwitcherSettingsCandidate(
      :final id,
      :final title,
      :final subtitle,
      :final target,
    ) =>
      QuickSwitcherSettingsResult(
        id: id,
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
  return QuickSwitcherHeaderResult(
    id: id,
    title: quickSwitcherHeaderTitle(type, l10n),
  );
}

String quickSwitcherHeaderTitle(
  QuickSwitcherResultType type,
  FluxerLocalizations l10n,
) => switch (type) {
  QuickSwitcherResultType.user => l10n.quickSwitcherSectionPeople,
  QuickSwitcherResultType.groupDm => l10n.quickSwitcherSectionGroupMessages,
  QuickSwitcherResultType.textChannel => l10n.quickSwitcherSectionTextChannels,
  QuickSwitcherResultType.voiceChannel =>
    l10n.quickSwitcherSectionVoiceChannels,
  QuickSwitcherResultType.guild ||
  QuickSwitcherResultType.virtualGuild => l10n.quickSwitcherSectionCommunities,
  QuickSwitcherResultType.settings => l10n.quickSwitcherSectionSettings,
  _ => '',
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

int findNextSelectableQuickSwitcherIndex({
  required List<QuickSwitcherResult> results,
  required int startIndex,
  required bool down,
}) {
  if (results.isEmpty) {
    return -1;
  }
  int index = startIndex;
  final int step = down ? 1 : -1;
  for (int i = 0; i < results.length; i++) {
    index += step;
    if (index < 0) {
      index = results.length - 1;
    }
    if (index >= results.length) {
      index = 0;
    }
    if (isQuickSwitcherExecutable(results[index])) {
      return index;
    }
  }
  return startIndex;
}
