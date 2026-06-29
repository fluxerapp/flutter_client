import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';

class GuildSettingsDetails {
  final Guild guild;
  final String? afkChannelId;
  final int afkTimeout;
  final String? systemChannelId;
  final int systemChannelFlags;
  final int explicitContentFilter;
  final int mfaLevel;
  final int defaultMessageNotifications;
  final int contentWarningLevel;
  final String? contentWarningText;
  final String? splash;
  final String? embedSplash;
  final int splashCardAlignment;
  final DateTime? messageHistoryCutoff;
  final List<String> features;

  const GuildSettingsDetails({
    required this.guild,
    this.afkChannelId,
    this.afkTimeout = 300,
    this.systemChannelId,
    this.systemChannelFlags = 0,
    this.explicitContentFilter = 0,
    this.mfaLevel = 0,
    this.defaultMessageNotifications = 0,
    this.contentWarningLevel = 0,
    this.contentWarningText,
    this.splash,
    this.embedSplash,
    this.splashCardAlignment = 0,
    this.messageHistoryCutoff,
    this.features = const <String>[],
  });

  bool get hideJoinMessages => (systemChannelFlags & (1 << 0)) != 0;

  bool get showContentWarning => contentWarningLevel > 0;

  bool get hasDetachedBanner =>
      hasGuildFeature(features, GuildFeatures.detachedBanner);

  bool get hasTextChannelFlexibleNames =>
      hasGuildFeature(features, GuildFeatures.textChannelFlexibleNames);

  bool get hasHideOwnerCrown =>
      hasGuildFeature(features, GuildFeatures.hideOwnerCrown);

  bool get hasInviteSplash =>
      hasGuildFeature(features, GuildFeatures.inviteSplash);
}
