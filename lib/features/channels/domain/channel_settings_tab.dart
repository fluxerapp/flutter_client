import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum ChannelSettingsTab { overview, permissions, invites, webhooks }

List<ChannelSettingsTab> visibleChannelSettingsTabs({
  required Channel channel,
  required int permissions,
}) {
  final bool canManageChannels = hasPermission(
    permissions,
    Permission.manageChannels,
  );
  final bool canUpdateRtcRegion =
      channel.type == ChannelType.guildVoice &&
      hasPermission(permissions, Permission.updateRtcRegion);
  final bool canManageRoles = hasPermission(
    permissions,
    Permission.manageRoles,
  );
  final bool canManageWebhooks = hasPermission(
    permissions,
    Permission.manageWebhooks,
  );
  final List<ChannelSettingsTab> tabs = <ChannelSettingsTab>[];
  if (canManageChannels || canUpdateRtcRegion) {
    tabs.add(ChannelSettingsTab.overview);
  }
  if (canManageRoles) {
    tabs.add(ChannelSettingsTab.permissions);
  }
  if (canManageChannels) {
    tabs.add(ChannelSettingsTab.invites);
  }
  if (canManageWebhooks && channel.type != ChannelType.guildLink) {
    tabs.add(ChannelSettingsTab.webhooks);
  }
  if (channel.type == ChannelType.guildCategory) {
    return tabs
        .where(
          (ChannelSettingsTab tab) =>
              tab == ChannelSettingsTab.overview ||
              tab == ChannelSettingsTab.permissions,
        )
        .toList();
  }
  return tabs;
}

bool canDeleteChannel({required int permissions}) {
  return hasPermission(permissions, Permission.manageChannels);
}

bool canAccessChannelSettings({
  required Channel channel,
  required int permissions,
}) {
  return visibleChannelSettingsTabs(
        channel: channel,
        permissions: permissions,
      ).isNotEmpty ||
      canDeleteChannel(permissions: permissions);
}

bool canAccessChannelSettingsTab({
  required Channel channel,
  required ChannelSettingsTab tab,
  required int permissions,
}) {
  return visibleChannelSettingsTabs(
    channel: channel,
    permissions: permissions,
  ).contains(tab);
}

ChannelSettingsTab resolveChannelSettingsTab({
  required ChannelSettingsTab requested,
  required List<ChannelSettingsTab> visibleTabs,
}) {
  if (visibleTabs.isEmpty) {
    return requested;
  }
  if (visibleTabs.contains(requested)) {
    return requested;
  }
  return visibleTabs.first;
}

IconData channelSettingsTabIcon(ChannelSettingsTab tab) {
  return switch (tab) {
    ChannelSettingsTab.overview => PhosphorIconsFill.gear,
    ChannelSettingsTab.permissions => PhosphorIconsFill.shield,
    ChannelSettingsTab.invites => PhosphorIconsFill.ticket,
    ChannelSettingsTab.webhooks => PhosphorIconsFill.webhooksLogo,
  };
}

String channelSettingsTabQuery(ChannelSettingsTab tab) {
  return switch (tab) {
    ChannelSettingsTab.overview => 'overview',
    ChannelSettingsTab.permissions => 'permissions',
    ChannelSettingsTab.invites => 'invites',
    ChannelSettingsTab.webhooks => 'webhooks',
  };
}

String channelSettingsTabLabel(
  FluxerLocalizations l10n,
  ChannelSettingsTab tab,
) {
  return switch (tab) {
    ChannelSettingsTab.overview => l10n.channelSettingsTabOverview,
    ChannelSettingsTab.permissions => l10n.channelSettingsTabPermissions,
    ChannelSettingsTab.invites => l10n.channelSettingsTabInvites,
    ChannelSettingsTab.webhooks => l10n.channelSettingsTabWebhooks,
  };
}

String channelSettingsTabTitle(
  FluxerLocalizations l10n,
  ChannelSettingsTab tab,
) {
  return switch (tab) {
    ChannelSettingsTab.permissions => l10n.channelSettingsPermissionsTitle,
    _ => channelSettingsTabLabel(l10n, tab),
  };
}

String? channelSettingsTabCategoryLabel(
  FluxerLocalizations l10n,
  ChannelSettingsTab tab,
) {
  return null;
}

String channelSettingsTabPath(String channelId, ChannelSettingsTab tab) {
  return switch (tab) {
    ChannelSettingsTab.overview => RoutePaths.channelSettingsOverviewPath(
      channelId,
    ),
    ChannelSettingsTab.permissions => RoutePaths.channelSettingsPermissionsPath(
      channelId,
    ),
    ChannelSettingsTab.invites => RoutePaths.channelSettingsInvitesPath(
      channelId,
    ),
    ChannelSettingsTab.webhooks => RoutePaths.channelSettingsWebhooksPath(
      channelId,
    ),
  };
}

String channelSettingsTabPathFromQuery(String channelId, String tabQuery) {
  return switch (tabQuery) {
    'overview' => RoutePaths.channelSettingsOverviewPath(channelId),
    'permissions' => RoutePaths.channelSettingsPermissionsPath(channelId),
    'invites' => RoutePaths.channelSettingsInvitesPath(channelId),
    'webhooks' => RoutePaths.channelSettingsWebhooksPath(channelId),
    _ => RoutePaths.channelSettingsPath(channelId),
  };
}

ChannelSettingsTab channelSettingsTabFromQuery(String? tabQuery) {
  return switch (tabQuery) {
    'permissions' => ChannelSettingsTab.permissions,
    'invites' => ChannelSettingsTab.invites,
    'webhooks' => ChannelSettingsTab.webhooks,
    _ => ChannelSettingsTab.overview,
  };
}

String channelSettingsModalTitle(
  FluxerLocalizations l10n, {
  required Channel channel,
}) {
  if (channel.isCategory) {
    return l10n.channelSettingsCategorySettingsTitle;
  }
  return l10n.channelDetailsChannelSettingsTitle;
}

String channelSettingsDeleteLabel(
  FluxerLocalizations l10n, {
  required Channel channel,
}) {
  if (channel.isCategory) {
    return l10n.channelSettingsDeleteCategory;
  }
  return l10n.channelSettingsDeleteChannel;
}
