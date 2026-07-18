import 'package:flutter/material.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/utils/channel_invite_capability.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/mature_content/utils/content_warning_utils.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum ChannelMenuAction {
  openChat,
  markAsRead,
  toggleFavorite,
  invitePeople,
  openLink,
  copyLink,
  mute,
  notificationSettings,
  editChannel,
  duplicateChannel,
  debugChannel,
  resetMatureContentAgree,
  copyChannelId,
  deleteChannel,
  deleteMyMessages,
}

class ChannelMenuEntry {
  const ChannelMenuEntry({
    required this.label,
    required this.action,
    this.icon,
    this.isDanger = false,
    this.hint,
    this.enabled = true,
  });

  final String label;
  final ChannelMenuAction action;
  final PhosphorIconData? icon;
  final bool isDanger;
  final String? hint;
  final bool enabled;
}

typedef ChannelMenuGroup = List<ChannelMenuEntry>;

class ChannelMenuState {
  const ChannelMenuState({
    required this.isTextChannel,
    required this.isVoiceChannel,
    required this.isLinkChannel,
    required this.showOpenChat,
    required this.showMarkAsRead,
    required this.showFavorites,
    required this.isFavorite,
    required this.canInvite,
    required this.useVanityInvite,
    required this.canOpenLink,
    required this.showMute,
    required this.isMuted,
    required this.showNotificationSettings,
    required this.showEditChannel,
    required this.showDuplicateChannel,
    required this.showDebugChannel,
    required this.showResetMatureContent,
    required this.showDeleteChannel,
    required this.showDeleteMyMessages,
    this.mutedHint,
    this.vanityUrlCode,
  });

  final bool isTextChannel;
  final bool isVoiceChannel;
  final bool isLinkChannel;
  final bool showOpenChat;
  final bool showMarkAsRead;
  final bool showFavorites;
  final bool isFavorite;
  final bool canInvite;
  final bool useVanityInvite;
  final bool canOpenLink;
  final bool showMute;
  final bool isMuted;
  final bool showNotificationSettings;
  final bool showEditChannel;
  final bool showDuplicateChannel;
  final bool showDebugChannel;
  final bool showResetMatureContent;
  final bool showDeleteChannel;
  final bool showDeleteMyMessages;
  final String? mutedHint;
  final String? vanityUrlCode;
}

ChannelMenuState resolveChannelMenuState({
  required Channel channel,
  required Guild? guild,
  required Channel? parentCategory,
  required int? permissionBits,
  required bool hasUnread,
  required bool showFavorites,
  required bool isFavorite,
  required bool isMuted,
  required bool developerMode,
  required bool nsfwAllowed,
  required bool hasAgreedToMatureContent,
  required bool voiceChannelJoinRequiresDoubleClick,
  String? vanityUrlCode,
  String? mutedHint,
}) {
  final bool isTextChannel = channel.type == ChannelType.guildText;
  final bool isVoiceChannel = channel.type == ChannelType.guildVoice;
  final bool isLinkChannel = channel.type == ChannelType.guildLink;
  final bool isGuildChannel = isTextChannel || isVoiceChannel || isLinkChannel;
  final int bits = permissionBits ?? 0;
  final bool canManageChannels = hasPermission(bits, Permission.manageChannels);
  final bool canUpdateRtcRegion =
      isVoiceChannel && hasPermission(bits, Permission.updateRtcRegion);
  final bool canEditChannel = canManageChannels || canUpdateRtcRegion;
  final bool channelIsNsfw =
      isGuildChannel &&
      getEffectiveChannelMatureContent(
        channel: channel,
        guild: guild,
        parentCategory: parentCategory,
      );
  final bool nsfwBlockedForMinor = channelIsNsfw && !nsfwAllowed;
  final ChannelInviteCapability inviteCapability =
      resolveChannelInviteCapability(
        permissionBits: permissionBits,
        channel: channel,
        guildId: channel.guildId,
        vanityUrlCode: vanityUrlCode,
      );
  final bool showOpenChat =
      isVoiceChannel && !voiceChannelJoinRequiresDoubleClick;
  final bool canOpenLink = isLinkChannel && (channel.url?.isNotEmpty ?? false);
  final bool showMute = isTextChannel || isVoiceChannel;
  return ChannelMenuState(
    isTextChannel: isTextChannel,
    isVoiceChannel: isVoiceChannel,
    isLinkChannel: isLinkChannel,
    showOpenChat: showOpenChat,
    showMarkAsRead: isGuildChannel && hasUnread,
    showFavorites: showFavorites,
    isFavorite: isFavorite,
    canInvite: inviteCapability.canInvite,
    useVanityInvite: inviteCapability.useVanityUrl,
    vanityUrlCode: inviteCapability.vanityUrlCode,
    canOpenLink: canOpenLink,
    showMute: showMute,
    isMuted: isMuted,
    mutedHint: mutedHint,
    showNotificationSettings: isGuildChannel,
    showEditChannel: canEditChannel && !nsfwBlockedForMinor,
    showDuplicateChannel: canManageChannels && !nsfwBlockedForMinor,
    showDebugChannel: developerMode,
    showResetMatureContent: developerMode && hasAgreedToMatureContent,
    showDeleteChannel: canManageChannels,
    showDeleteMyMessages: isTextChannel || isVoiceChannel,
  );
}

List<ChannelMenuGroup> buildChannelMenuGroups({
  required FluxerLocalizations l10n,
  required ChannelMenuState state,
}) {
  if (!state.isTextChannel && !state.isVoiceChannel && !state.isLinkChannel) {
    return const <ChannelMenuGroup>[];
  }
  final List<ChannelMenuGroup> groups = <ChannelMenuGroup>[];
  if (state.showOpenChat) {
    groups.add(<ChannelMenuEntry>[
      ChannelMenuEntry(
        label: l10n.channelMenuOpenChat,
        icon: PhosphorIconsFill.chatCircle,
        action: ChannelMenuAction.openChat,
      ),
    ]);
  }
  final List<ChannelMenuEntry> metaItems = <ChannelMenuEntry>[];
  if (state.showMarkAsRead) {
    metaItems.add(
      ChannelMenuEntry(
        label: l10n.dmMarkAsRead,
        icon: PhosphorIconsFill.envelopeOpen,
        action: ChannelMenuAction.markAsRead,
      ),
    );
  }
  if (state.showFavorites) {
    metaItems.add(
      ChannelMenuEntry(
        label: state.isFavorite
            ? l10n.favoritesRemoveFromFavorites
            : l10n.favoritesAddToFavorites,
        icon: state.isFavorite
            ? PhosphorIconsFill.star
            : PhosphorIconsBold.star,
        action: ChannelMenuAction.toggleFavorite,
      ),
    );
  }
  if (metaItems.isNotEmpty) {
    groups.add(metaItems);
  }
  final List<ChannelMenuEntry> inviteItems = <ChannelMenuEntry>[];
  if (state.canInvite) {
    inviteItems.add(
      ChannelMenuEntry(
        label: l10n.channelDetailsInvitePeople,
        icon: PhosphorIconsFill.userPlus,
        action: ChannelMenuAction.invitePeople,
      ),
    );
  }
  if (state.canOpenLink) {
    inviteItems.add(
      ChannelMenuEntry(
        label: l10n.matureContentOpenLinkButton,
        icon: PhosphorIconsFill.arrowSquareOut,
        action: ChannelMenuAction.openLink,
      ),
    );
  }
  inviteItems.add(
    ChannelMenuEntry(
      label: l10n.channelDetailsCopyLink,
      icon: PhosphorIconsFill.link,
      action: ChannelMenuAction.copyLink,
    ),
  );
  groups.add(inviteItems);
  final List<ChannelMenuEntry> notificationItems = <ChannelMenuEntry>[];
  if (state.showMute) {
    notificationItems.add(
      ChannelMenuEntry(
        label: state.isMuted
            ? l10n.notificationUnmuteChannel
            : l10n.notificationMuteChannel,
        icon: state.isMuted
            ? PhosphorIconsFill.bell
            : PhosphorIconsFill.bellSlash,
        hint: state.mutedHint,
        action: ChannelMenuAction.mute,
      ),
    );
  }
  if (state.showNotificationSettings) {
    notificationItems.add(
      ChannelMenuEntry(
        label: l10n.notificationSettings,
        icon: PhosphorIconsFill.bell,
        action: ChannelMenuAction.notificationSettings,
      ),
    );
  }
  groups.add(notificationItems);
  if (state.showEditChannel || state.showDuplicateChannel) {
    final List<ChannelMenuEntry> manageItems = <ChannelMenuEntry>[];
    if (state.showEditChannel) {
      manageItems.add(
        ChannelMenuEntry(
          label: l10n.channelDetailsEditChannel,
          icon: PhosphorIconsFill.pencilSimple,
          action: ChannelMenuAction.editChannel,
        ),
      );
    }
    if (state.showDuplicateChannel) {
      manageItems.add(
        ChannelMenuEntry(
          label: l10n.channelMenuDuplicateChannel,
          icon: PhosphorIconsFill.copy,
          action: ChannelMenuAction.duplicateChannel,
        ),
      );
    }
    if (manageItems.isNotEmpty) {
      groups.add(manageItems);
    }
  }
  final List<ChannelMenuEntry> debugItems = <ChannelMenuEntry>[];
  if (state.showDebugChannel) {
    debugItems.add(
      ChannelMenuEntry(
        label: l10n.dmDebugChannel,
        icon: PhosphorIconsFill.bugBeetle,
        action: ChannelMenuAction.debugChannel,
      ),
    );
  }
  if (state.showResetMatureContent) {
    debugItems.add(
      ChannelMenuEntry(
        label: l10n.channelMenuResetMatureContentAgreeState,
        icon: PhosphorIconsFill.bugBeetle,
        action: ChannelMenuAction.resetMatureContentAgree,
      ),
    );
  }
  debugItems.add(
    ChannelMenuEntry(
      label: l10n.dmCopyChannelId,
      icon: PhosphorIconsFill.copy,
      action: ChannelMenuAction.copyChannelId,
    ),
  );
  groups.add(debugItems);
  final List<ChannelMenuEntry> destructiveItems = <ChannelMenuEntry>[];
  if (state.showDeleteChannel) {
    destructiveItems.add(
      ChannelMenuEntry(
        label: l10n.channelDetailsDeleteChannel,
        icon: PhosphorIconsFill.trash,
        isDanger: true,
        action: ChannelMenuAction.deleteChannel,
      ),
    );
  }
  if (state.showDeleteMyMessages) {
    destructiveItems.add(
      ChannelMenuEntry(
        label: l10n.channelMenuDeleteMyMessagesConfirm,
        icon: PhosphorIconsFill.trash,
        isDanger: true,
        action: ChannelMenuAction.deleteMyMessages,
      ),
    );
  }
  if (destructiveItems.isNotEmpty) {
    groups.add(destructiveItems);
  }
  return groups;
}

List<Widget> channelMenuGroupsToWidgets({
  required BuildContext context,
  required List<ChannelMenuGroup> groups,
  required ChannelMenuState menuState,
  required void Function(ChannelMenuAction action) onAction,
}) {
  final List<Widget> widgets = <Widget>[];
  for (int groupIndex = 0; groupIndex < groups.length; groupIndex++) {
    if (groupIndex > 0) {
      widgets.add(const FluxerMenuDivider());
    }
    for (final ChannelMenuEntry entry in groups[groupIndex]) {
      final Color? iconColor =
          entry.action == ChannelMenuAction.toggleFavorite &&
              menuState.isFavorite
          ? context.colors.statusIdle
          : null;
      widgets.add(
        FluxerMenuItem(
          label: entry.label,
          icon: entry.icon,
          iconColor: iconColor,
          hint: entry.hint,
          enabled: entry.enabled,
          isDanger: entry.isDanger,
          onPressed: () => onAction(entry.action),
        ),
      );
    }
  }
  return widgets;
}

List<ChannelMenuAction> flattenChannelMenuActions(
  List<ChannelMenuGroup> groups,
) {
  return <ChannelMenuAction>[
    for (final ChannelMenuGroup group in groups)
      for (final ChannelMenuEntry entry in group) entry.action,
  ];
}

List<String> flattenChannelMenuLabels(List<ChannelMenuGroup> groups) {
  return <String>[
    for (final ChannelMenuGroup group in groups)
      for (final ChannelMenuEntry entry in group) entry.label,
  ];
}

bool channelMenuEntryIsDanger(
  List<ChannelMenuGroup> groups,
  ChannelMenuAction action,
) {
  for (final ChannelMenuGroup group in groups) {
    for (final ChannelMenuEntry entry in group) {
      if (entry.action == action) {
        return entry.isDanger;
      }
    }
  }
  return false;
}
