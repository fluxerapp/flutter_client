import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

enum GuildSettingsTab {
  overview,
  roles,
  channels,
  moderation,
  auditLog,
  emoji,
  stickers,
  webhooks,
  discovery,
  members,
  invites,
  bans,
}

const List<GuildSettingsTab> _comingSoonTabs = <GuildSettingsTab>[
  GuildSettingsTab.members,
];

bool isGuildSettingsTabComingSoon(GuildSettingsTab tab) {
  return _comingSoonTabs.contains(tab);
}

abstract final class GuildFeatureFlags {
  static const String banner = GuildFeatures.banner;
  static const String discoverable = 'DISCOVERABLE';
}

GuildAction guildSettingsTabToAction(GuildSettingsTab tab) {
  return switch (tab) {
    GuildSettingsTab.overview => GuildAction.settingsOverview,
    GuildSettingsTab.roles => GuildAction.settingsRoles,
    GuildSettingsTab.emoji => GuildAction.settingsEmoji,
    GuildSettingsTab.stickers => GuildAction.settingsStickers,
    GuildSettingsTab.moderation => GuildAction.settingsSafetyModeration,
    GuildSettingsTab.auditLog => GuildAction.settingsActivityLog,
    GuildSettingsTab.webhooks => GuildAction.settingsWebhooks,
    GuildSettingsTab.discovery => GuildAction.settingsDiscovery,
    GuildSettingsTab.members => GuildAction.settingsMembers,
    GuildSettingsTab.invites => GuildAction.settingsInviteLinks,
    GuildSettingsTab.bans => GuildAction.settingsBans,
    GuildSettingsTab.channels => GuildAction.settingsChannels,
  };
}

bool isGuildSettingsTabVisible({
  required GuildSettingsTab tab,
  required int permissions,
  required Guild? guild,
  required bool isTouchPrimary,
}) {
  if (tab == GuildSettingsTab.channels && !isTouchPrimary) {
    return false;
  }
  final GuildAction action = guildSettingsTabToAction(tab);
  return canAccessGuildSettingsTab(action, permissions);
}

bool isGuildBannerEnabled(Guild guild) {
  return hasGuildFeature(guild.features, GuildFeatures.banner);
}

bool isGuildInviteSplashEnabled(Guild guild) {
  return hasGuildFeature(guild.features, GuildFeatures.inviteSplash);
}

bool isGuildDiscoveryEnabled(Guild guild) {
  return guild.features.contains(GuildFeatureFlags.discoverable);
}

String? guildSettingsTabCategoryLabel(
  FluxerLocalizations l10n,
  GuildSettingsTab tab,
) {
  return switch (tab) {
    GuildSettingsTab.emoji ||
    GuildSettingsTab.stickers => l10n.guildSettingsCategoryExpressions,
    GuildSettingsTab.discovery => l10n.guildSettingsCategoryCommunity,
    GuildSettingsTab.webhooks => l10n.guildSettingsCategoryIntegrations,
    GuildSettingsTab.members ||
    GuildSettingsTab.invites ||
    GuildSettingsTab.bans => l10n.guildSettingsCategoryPeople,
    _ => null,
  };
}

GuildSettingsTab guildSettingsTabFromIndex(int index) {
  const List<GuildSettingsTab> tabs = GuildSettingsTab.values;
  if (index < 0 || index >= tabs.length) {
    return GuildSettingsTab.overview;
  }
  return tabs[index];
}

String guildSettingsTabQuery(GuildSettingsTab tab) {
  return switch (tab) {
    GuildSettingsTab.overview => 'overview',
    GuildSettingsTab.roles => 'roles',
    GuildSettingsTab.channels => 'channels',
    GuildSettingsTab.emoji => 'emoji',
    GuildSettingsTab.stickers => 'stickers',
    GuildSettingsTab.moderation => 'moderation',
    GuildSettingsTab.auditLog => 'audit-log',
    GuildSettingsTab.webhooks => 'webhooks',
    GuildSettingsTab.discovery => 'discovery',
    GuildSettingsTab.members => 'members',
    GuildSettingsTab.invites => 'invites',
    GuildSettingsTab.bans => 'bans',
  };
}

GuildSettingsTab guildSettingsTabFromQuery(String? tabQuery) {
  return switch (tabQuery) {
    'roles' => GuildSettingsTab.roles,
    'channels' => GuildSettingsTab.channels,
    'emoji' => GuildSettingsTab.emoji,
    'stickers' => GuildSettingsTab.stickers,
    'moderation' => GuildSettingsTab.moderation,
    'audit-log' => GuildSettingsTab.auditLog,
    'webhooks' => GuildSettingsTab.webhooks,
    'discovery' => GuildSettingsTab.discovery,
    'members' => GuildSettingsTab.members,
    'invites' => GuildSettingsTab.invites,
    'bans' => GuildSettingsTab.bans,
    _ => GuildSettingsTab.overview,
  };
}

GuildSettingsTab? guildSettingsTabForAction(GuildAction action) {
  return switch (action) {
    GuildAction.settingsOverview => GuildSettingsTab.overview,
    GuildAction.settingsRoles => GuildSettingsTab.roles,
    GuildAction.settingsChannels => GuildSettingsTab.channels,
    GuildAction.settingsEmoji => GuildSettingsTab.emoji,
    GuildAction.settingsStickers => GuildSettingsTab.stickers,
    GuildAction.settingsSafetyModeration => GuildSettingsTab.moderation,
    GuildAction.settingsActivityLog => GuildSettingsTab.auditLog,
    GuildAction.settingsWebhooks => GuildSettingsTab.webhooks,
    GuildAction.settingsDiscovery => GuildSettingsTab.discovery,
    GuildAction.settingsMembers => GuildSettingsTab.members,
    GuildAction.settingsInviteLinks => GuildSettingsTab.invites,
    GuildAction.settingsBans => GuildSettingsTab.bans,
    _ => null,
  };
}

bool isGuildSettingsActionComingSoon(GuildAction action) {
  final GuildSettingsTab? tab = guildSettingsTabForAction(action);
  if (tab == null) {
    return false;
  }
  return isGuildSettingsTabComingSoon(tab);
}

String guildSettingsTabPath(String guildId, GuildSettingsTab tab) {
  return switch (tab) {
    GuildSettingsTab.overview => RoutePaths.guildSettingsOverviewPath(guildId),
    GuildSettingsTab.roles => RoutePaths.guildSettingsRolesPath(guildId),
    GuildSettingsTab.emoji => RoutePaths.guildSettingsEmojiPath(guildId),
    GuildSettingsTab.stickers => RoutePaths.guildSettingsStickersPath(guildId),
    GuildSettingsTab.moderation => RoutePaths.guildSettingsModerationPath(
      guildId,
    ),
    GuildSettingsTab.auditLog => RoutePaths.guildSettingsAuditLogPath(guildId),
    GuildSettingsTab.webhooks => RoutePaths.guildSettingsWebhooksPath(guildId),
    GuildSettingsTab.discovery => RoutePaths.guildSettingsDiscoveryPath(
      guildId,
    ),
    GuildSettingsTab.members => RoutePaths.guildSettingsMembersPath(guildId),
    GuildSettingsTab.invites => RoutePaths.guildSettingsInvitesPath(guildId),
    GuildSettingsTab.bans => RoutePaths.guildSettingsBansPath(guildId),
    GuildSettingsTab.channels => RoutePaths.guildSettingsChannelsPath(guildId),
  };
}

String guildSettingsTabPathFromQuery(String guildId, String tabQuery) {
  return switch (tabQuery) {
    'overview' => RoutePaths.guildSettingsOverviewPath(guildId),
    'roles' => RoutePaths.guildSettingsRolesPath(guildId),
    'emoji' => RoutePaths.guildSettingsEmojiPath(guildId),
    'stickers' => RoutePaths.guildSettingsStickersPath(guildId),
    'moderation' => RoutePaths.guildSettingsModerationPath(guildId),
    'audit-log' => RoutePaths.guildSettingsAuditLogPath(guildId),
    'webhooks' => RoutePaths.guildSettingsWebhooksPath(guildId),
    'discovery' => RoutePaths.guildSettingsDiscoveryPath(guildId),
    'members' => RoutePaths.guildSettingsMembersPath(guildId),
    'invites' => RoutePaths.guildSettingsInvitesPath(guildId),
    'bans' => RoutePaths.guildSettingsBansPath(guildId),
    'channels' => RoutePaths.guildSettingsChannelsPath(guildId),
    _ => RoutePaths.guildSettingsPath(guildId),
  };
}

List<GuildSettingsTab> visibleGuildSettingsTabs({
  required int permissions,
  required Guild? guild,
  required bool isTouchPrimary,
}) {
  return GuildSettingsTab.values
      .where(
        (GuildSettingsTab tab) => isGuildSettingsTabVisible(
          tab: tab,
          permissions: permissions,
          guild: guild,
          isTouchPrimary: isTouchPrimary,
        ),
      )
      .toList();
}

List<GuildSettingsTab> visibleGuildSettingsTabsForRef({
  required WidgetRef ref,
  required int permissions,
  required Guild? guild,
}) {
  return visibleGuildSettingsTabs(
    permissions: permissions,
    guild: guild,
    isTouchPrimary: isTouchPrimaryInput(ref),
  );
}

bool canOpenGuildSettings({
  required int permissions,
  required Guild? guild,
  required bool isTouchPrimary,
}) {
  return visibleGuildSettingsTabs(
    permissions: permissions,
    guild: guild,
    isTouchPrimary: isTouchPrimary,
  ).isNotEmpty;
}

bool canOpenGuildSettingsForRef({
  required WidgetRef ref,
  required int permissions,
  required Guild? guild,
}) {
  return canOpenGuildSettings(
    permissions: permissions,
    guild: guild,
    isTouchPrimary: isTouchPrimaryInput(ref),
  );
}
