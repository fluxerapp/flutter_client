import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_permission_spec.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

List<GuildPermissionCategorySpec> generateChannelPermissionSpec(
  FluxerLocalizations l10n,
  ChannelType channelType,
) {
  final bool includeVoicePermissions =
      channelType == ChannelType.guildVoice ||
      channelType == ChannelType.guildCategory;
  return <GuildPermissionCategorySpec>[
    GuildPermissionCategorySpec(
      title: l10n.permissionCategoryChannelAccess,
      permissions: <GuildPermissionEntry>[
        _channelEntry(l10n, Permission.viewChannel),
        _channelEntry(l10n, Permission.viewChannelMembers),
      ],
    ),
    GuildPermissionCategorySpec(
      title: l10n.permissionCategoryChannelManagement,
      permissions: <GuildPermissionEntry>[
        _channelEntry(l10n, Permission.createInstantInvite),
        _channelEntry(l10n, Permission.manageChannels),
        _channelEntry(l10n, Permission.manageRoles),
        _channelEntry(l10n, Permission.manageWebhooks),
      ],
    ),
    GuildPermissionCategorySpec(
      title: l10n.permissionCategoryMessagesMedia,
      permissions: <GuildPermissionEntry>[
        _channelEntry(l10n, Permission.sendMessages),
        _channelEntry(l10n, Permission.manageMessages),
        _channelEntry(l10n, Permission.pinMessages),
        _channelEntry(l10n, Permission.embedLinks),
        _channelEntry(l10n, Permission.attachFiles),
        _channelEntry(l10n, Permission.readMessageHistory),
        _channelEntry(l10n, Permission.mentionEveryone),
        _channelEntry(l10n, Permission.useExternalEmojis),
        _channelEntry(l10n, Permission.useExternalStickers),
        _channelEntry(l10n, Permission.addReactions),
        _channelEntry(l10n, Permission.bypassSlowmode),
      ],
    ),
    if (includeVoicePermissions)
      GuildPermissionCategorySpec(
        title: l10n.permissionCategoryAudioVideo,
        permissions: <GuildPermissionEntry>[
          _channelEntry(l10n, Permission.connect),
          _channelEntry(l10n, Permission.speak),
          _channelEntry(l10n, Permission.stream),
          _channelEntry(l10n, Permission.useVad),
          _channelEntry(l10n, Permission.prioritySpeaker),
          _channelEntry(l10n, Permission.muteMembers),
          _channelEntry(l10n, Permission.deafenMembers),
          _channelEntry(l10n, Permission.moveMembers),
          _channelEntry(l10n, Permission.updateRtcRegion),
        ],
      ),
  ];
}

GuildPermissionEntry _channelEntry(
  FluxerLocalizations l10n,
  Permission permission,
) {
  return GuildPermissionEntry(
    title: channelPermissionTitle(l10n, permission),
    description: channelPermissionDescription(l10n, permission),
    flag: permission,
  );
}

String channelPermissionTitle(FluxerLocalizations l10n, Permission permission) {
  return switch (permission) {
    Permission.manageChannels => l10n.permissionManageChannel,
    Permission.manageRoles => l10n.permissionManagePermissions,
    _ => permissionTitle(l10n, permission),
  };
}

String? channelPermissionDescription(
  FluxerLocalizations l10n,
  Permission permission,
) {
  return switch (permission) {
    Permission.manageChannels => l10n.permissionManageChannelDescription,
    Permission.manageRoles => l10n.permissionManagePermissionsDescription,
    Permission.manageWebhooks =>
      l10n.permissionManageWebhooksChannelDescription,
    Permission.viewChannelMembers =>
      l10n.permissionViewChannelMembersChannelDescription,
    Permission.createInstantInvite =>
      l10n.permissionCreateInviteLinksChannelDescription,
    _ => permissionDescription(l10n, permission),
  };
}
