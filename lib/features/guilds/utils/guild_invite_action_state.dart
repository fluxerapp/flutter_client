import 'package:fluxer_app/features/guilds/utils/guild_features.dart';

enum GuildInvitePrimaryAction { joinCommunity, goToCommunity, invitesDisabled }

class GuildInviteActionState {
  const GuildInviteActionState({
    required this.isMember,
    required this.isInvitesDisabled,
    required this.isRaidDetected,
  });

  final bool isMember;
  final bool isInvitesDisabled;
  final bool isRaidDetected;

  GuildInvitePrimaryAction get primaryAction {
    if (isInvitesDisabled && !isMember) {
      return GuildInvitePrimaryAction.invitesDisabled;
    }
    if (isMember) {
      return GuildInvitePrimaryAction.goToCommunity;
    }
    return GuildInvitePrimaryAction.joinCommunity;
  }

  bool get isActionDisabled =>
      primaryAction == GuildInvitePrimaryAction.invitesDisabled;

  String primaryActionLabel({
    required String joinLabel,
    required String goToLabel,
    required String disabledLabel,
  }) {
    switch (primaryAction) {
      case GuildInvitePrimaryAction.invitesDisabled:
        return disabledLabel;
      case GuildInvitePrimaryAction.goToCommunity:
        return goToLabel;
      case GuildInvitePrimaryAction.joinCommunity:
        return joinLabel;
    }
  }

  String? pausedStatusMessage({
    required String paused,
    required String raidPaused,
  }) {
    if (!isActionDisabled) {
      return null;
    }
    return isRaidDetected ? raidPaused : paused;
  }
}

GuildInviteActionState resolveGuildInviteActionState({
  required List<String> features,
  required bool isMember,
}) {
  return GuildInviteActionState(
    isMember: isMember,
    isInvitesDisabled: hasGuildFeature(features, GuildFeatures.invitesDisabled),
    isRaidDetected: hasGuildFeature(features, GuildFeatures.raidDetected),
  );
}
