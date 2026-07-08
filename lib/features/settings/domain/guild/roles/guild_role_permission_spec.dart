import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class GuildPermissionEntry {
  const GuildPermissionEntry({
    required this.title,
    required this.flag,
    this.description,
  });

  final String title;
  final String? description;
  final Permission flag;
}

class GuildPermissionCategorySpec {
  const GuildPermissionCategorySpec({
    required this.title,
    required this.permissions,
  });

  final String title;
  final List<GuildPermissionEntry> permissions;
}

List<GuildPermissionCategorySpec> generateGuildPermissionSpec(
  FluxerLocalizations l10n,
) {
  return <GuildPermissionCategorySpec>[
    GuildPermissionCategorySpec(
      title: l10n.permissionCategoryCommunityWide,
      permissions: <GuildPermissionEntry>[
        _entry(l10n, Permission.administrator),
        _entry(l10n, Permission.viewAuditLog),
        _entry(l10n, Permission.manageGuild),
        _entry(l10n, Permission.manageRoles),
        _entry(l10n, Permission.manageChannels),
        _entry(l10n, Permission.kickMembers),
        _entry(l10n, Permission.banMembers),
        _entry(l10n, Permission.createInstantInvite),
        _entry(l10n, Permission.changeNickname),
        _entry(l10n, Permission.manageNicknames),
        _entry(l10n, Permission.createExpressions),
        _entry(l10n, Permission.manageExpressions),
        _entry(l10n, Permission.manageWebhooks),
      ],
    ),
    GuildPermissionCategorySpec(
      title: l10n.permissionCategoryChannelAccess,
      permissions: <GuildPermissionEntry>[
        _entry(l10n, Permission.viewChannel),
        _entry(l10n, Permission.viewChannelMembers),
      ],
    ),
    GuildPermissionCategorySpec(
      title: l10n.permissionCategoryMessagesMedia,
      permissions: <GuildPermissionEntry>[
        _entry(l10n, Permission.sendMessages),
        _entry(l10n, Permission.sendTtsMessages),
        _entry(l10n, Permission.manageMessages),
        _entry(l10n, Permission.pinMessages),
        _entry(l10n, Permission.embedLinks),
        _entry(l10n, Permission.attachFiles),
        _entry(l10n, Permission.readMessageHistory),
        _entry(l10n, Permission.mentionEveryone),
        _entry(l10n, Permission.useExternalEmojis),
        _entry(l10n, Permission.useExternalStickers),
        _entry(l10n, Permission.addReactions),
        _entry(l10n, Permission.bypassSlowmode),
      ],
    ),
    GuildPermissionCategorySpec(
      title: l10n.permissionCategoryModeration,
      permissions: <GuildPermissionEntry>[
        _entry(l10n, Permission.moderateMembers),
      ],
    ),
    GuildPermissionCategorySpec(
      title: l10n.permissionCategoryAudioVideo,
      permissions: <GuildPermissionEntry>[
        _entry(l10n, Permission.connect),
        _entry(l10n, Permission.speak),
        _entry(l10n, Permission.stream),
        _entry(l10n, Permission.useVad),
        _entry(l10n, Permission.prioritySpeaker),
        _entry(l10n, Permission.muteMembers),
        _entry(l10n, Permission.deafenMembers),
        _entry(l10n, Permission.moveMembers),
        _entry(l10n, Permission.updateRtcRegion),
      ],
    ),
  ];
}

GuildPermissionEntry _entry(FluxerLocalizations l10n, Permission permission) {
  return GuildPermissionEntry(
    title: permissionTitle(l10n, permission),
    description: permissionDescription(l10n, permission),
    flag: permission,
  );
}

String permissionTitle(FluxerLocalizations l10n, Permission permission) {
  return switch (permission) {
    Permission.administrator => l10n.permissionAdministrator,
    Permission.viewAuditLog => l10n.permissionViewActivityLog,
    Permission.manageGuild => l10n.permissionManageCommunity,
    Permission.manageRoles => l10n.permissionManageRoles,
    Permission.manageChannels => l10n.permissionManageChannels,
    Permission.kickMembers => l10n.permissionKickMembers,
    Permission.banMembers => l10n.permissionBanMembers,
    Permission.createInstantInvite => l10n.permissionCreateInviteLinks,
    Permission.changeNickname => l10n.permissionChangeOwnNickname,
    Permission.manageNicknames => l10n.permissionManageNicknames,
    Permission.createExpressions => l10n.permissionCreateEmojiStickers,
    Permission.manageExpressions => l10n.permissionManageEmojiStickers,
    Permission.manageWebhooks => l10n.permissionManageWebhooks,
    Permission.sendMessages => l10n.permissionSendMessages,
    Permission.sendTtsMessages => l10n.permissionSendTtsMessages,
    Permission.manageMessages => l10n.permissionManageMessages,
    Permission.pinMessages => l10n.permissionPinMessages,
    Permission.embedLinks => l10n.permissionEmbedLinks,
    Permission.attachFiles => l10n.permissionAttachFiles,
    Permission.readMessageHistory => l10n.permissionReadMessageHistory,
    Permission.mentionEveryone => l10n.permissionMentionEveryone,
    Permission.useExternalEmojis => l10n.permissionUseExternalEmoji,
    Permission.useExternalStickers => l10n.permissionUseExternalStickers,
    Permission.addReactions => l10n.permissionAddReactions,
    Permission.bypassSlowmode => l10n.permissionBypassSlowmode,
    Permission.moderateMembers => l10n.permissionTimeOutMembers,
    Permission.viewChannel => l10n.permissionViewChannel,
    Permission.viewChannelMembers => l10n.permissionViewChannelMembers,
    Permission.connect => l10n.permissionConnect,
    Permission.speak => l10n.permissionSpeak,
    Permission.stream => l10n.permissionStreamVideo,
    Permission.useVad => l10n.permissionUseVoiceActivity,
    Permission.prioritySpeaker => l10n.permissionPrioritySpeaker,
    Permission.muteMembers => l10n.permissionMuteMembers,
    Permission.deafenMembers => l10n.permissionDeafenMembers,
    Permission.moveMembers => l10n.permissionMoveMembers,
    Permission.updateRtcRegion => l10n.permissionSetVoiceRegion,
  };
}

String? permissionDescription(FluxerLocalizations l10n, Permission permission) {
  return switch (permission) {
    Permission.administrator => l10n.permissionAdministratorDescription,
    Permission.viewAuditLog => l10n.permissionViewActivityLogDescription,
    Permission.manageGuild => l10n.permissionManageCommunityDescription,
    Permission.manageRoles => l10n.permissionManageRolesDescription,
    Permission.manageChannels => l10n.permissionManageChannelsDescription,
    Permission.changeNickname => l10n.permissionChangeOwnNicknameDescription,
    Permission.manageNicknames => l10n.permissionManageNicknamesDescription,
    Permission.createExpressions =>
      l10n.permissionCreateEmojiStickersDescription,
    Permission.manageExpressions =>
      l10n.permissionManageEmojiStickersDescription,
    Permission.manageWebhooks => l10n.permissionManageWebhooksDescription,
    Permission.sendTtsMessages => l10n.permissionSendTtsMessagesDescription,
    Permission.manageMessages => l10n.permissionManageMessagesDescription,
    Permission.mentionEveryone => l10n.permissionMentionEveryoneDescription,
    Permission.useExternalEmojis => l10n.permissionUseExternalEmojiDescription,
    Permission.addReactions => l10n.permissionAddReactionsDescription,
    Permission.bypassSlowmode => l10n.permissionBypassSlowmodeDescription,
    Permission.moderateMembers => l10n.permissionTimeOutMembersDescription,
    Permission.viewChannelMembers =>
      l10n.permissionViewChannelMembersDescription,
    Permission.useVad => l10n.permissionUseVoiceActivityDescription,
    Permission.moveMembers => l10n.permissionMoveMembersDescription,
    _ => null,
  };
}

List<GuildPermissionCategorySpec> filterGuildPermissionSpec({
  required List<GuildPermissionCategorySpec> specs,
  required String query,
}) {
  final String normalizedQuery = query.trim().toLowerCase();
  if (normalizedQuery.isEmpty) {
    return specs;
  }
  return specs
      .map((GuildPermissionCategorySpec spec) {
        final List<GuildPermissionEntry> filteredPermissions = spec.permissions
            .where((GuildPermissionEntry entry) {
              final bool titleMatch = entry.title.toLowerCase().contains(
                normalizedQuery,
              );
              final String? description = entry.description;
              final bool descriptionMatch =
                  description != null &&
                  description.toLowerCase().contains(normalizedQuery);
              return titleMatch || descriptionMatch;
            })
            .toList();
        if (filteredPermissions.isEmpty) {
          return null;
        }
        return GuildPermissionCategorySpec(
          title: spec.title,
          permissions: filteredPermissions,
        );
      })
      .whereType<GuildPermissionCategorySpec>()
      .toList();
}
