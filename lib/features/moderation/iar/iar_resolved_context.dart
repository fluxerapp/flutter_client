// Snapshot of derived state the IAR sheet needs.
//
// Mirrors the web `IARResolvedContext`. Mobile differs from the web in a few
// places: no full `User` model (author lives on `Message`), and no
// `isClaimed`/`verified` account-gate concept yet. Those gaps are tracked
// inline.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/moderation/iar/iar_flow.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';

/// Lightweight view of the reported user. The web has a full `User` domain
/// model; mobile only carries author fields on the `Message` row.
class IarReportedUser {
  const IarReportedUser({
    required this.id,
    required this.displayName,
    this.avatar,
    this.avatarColor,
    this.isBot = false,
  });

  final String id;
  final String displayName;
  final String? avatar;
  final int? avatarColor;
  final bool isBot;
}

/// Pre-computed answers to every question the IAR sheet asks while rendering.
///
/// All fields are derived synchronously from providers at the moment
/// [resolveIarContext] runs; the sheet's `build` method calls the resolver on
/// each rebuild so reactivity flows through `ref.watch`.
class IarResolvedContext {
  const IarResolvedContext({
    required this.title,
    required this.reportedUser,
    required this.isReportedUserBlocked,
    required this.leaveableGuildId,
    required this.hasCommunityContext,
    required this.dmChannelId,
    required this.dmDisplayName,
    required this.isFocusedOnDmWithUser,
    required this.isLeaveableGuildOwner,
    required this.canDeleteReportedMessage,
    required this.banGuildId,
    required this.canBanReportedUser,
    required this.isDmChannel,
  });

  /// Modal/sheet header title (context-dependent: "Report message", etc).
  final String title;

  /// User the report is being filed against, if any (null when the user is
  /// reporting their own message).
  final IarReportedUser? reportedUser;

  /// True when the reported user is already in the current user's block list.
  final bool isReportedUserBlocked;

  /// Guild the user could leave to resolve this report (null in DMs or when
  /// reporting their own community).
  final String? leaveableGuildId;

  /// True when there is a guild context we can route the user toward
  /// community-mod tools.
  final bool hasCommunityContext;

  /// DM channel id with the reported user, if any (the channel the message
  /// lives in for direct messages, or a separate DM with the same user).
  final String? dmChannelId;

  /// Display name to use in the close-DM action card copy.
  final String dmDisplayName;

  /// True when the user is currently viewing the DM with the reported user.
  final bool isFocusedOnDmWithUser;

  /// True when the current user owns [leaveableGuildId]. Owners cannot leave
  /// without transferring ownership, so the leave card is suppressed.
  final bool isLeaveableGuildOwner;

  /// True when the user has `MANAGE_MESSAGES` on the reported message's
  /// channel and the channel is not a DM.
  final bool canDeleteReportedMessage;

  /// Guild id we would open the ban dialog against, if any.
  final String? banGuildId;

  /// True when the user has `BAN_MEMBERS` in [banGuildId] and the target is
  /// not the guild owner.
  final bool canBanReportedUser;

  /// True when the reported message's channel is a DM/group DM.
  final bool isDmChannel;
}

/// Computes the resolved context from the current provider graph.
///
/// MUST be called from a build phase: the implementation calls `ref.watch` so
/// the consumer rebuilds when underlying state (blocklist, active channel,
/// permissions) changes.
IarResolvedContext resolveIarContext(
  WidgetRef ref,
  FluxerLocalizations l10n,
  IarContext context,
) {
  return switch (context) {
    IarMessageContext(:final message, :final guildId) => _resolveMessageContext(
      ref,
      l10n,
      message.channelId,
      message.authorId,
      message.authorName,
      message.authorAvatar,
      message.authorAvatarColor,
      message.authorIsBot,
      guildId,
    ),
    // The multi-step flow is message-only (and currently has no caller); user
    // reports always use the simple sheet, so this branch is unreachable.
    IarUserContext() => throw UnsupportedError(
      'User reports use showSimpleIarReportSheet, not the multi-step flow.',
    ),
    IarGuildContext() => throw UnsupportedError(
      'Guild reports use showSimpleIarReportSheet, not the multi-step flow.',
    ),
  };
}

IarResolvedContext _resolveMessageContext(
  WidgetRef ref,
  FluxerLocalizations l10n,
  String channelId,
  String authorId,
  String authorName,
  String? authorAvatar,
  int? authorAvatarColor,
  bool authorIsBot,
  String? messageGuildId,
) {
  final String? currentUserId = ref.watch(currentUserIdProvider);
  final Set<String> blockedIds = ref.watch(blockedUserIdsProvider);
  final List<DmConversation> dmConvos = ref.watch(
    dmViewModelProvider.select((s) => s.conversations),
  );
  final ChannelListState channelList = ref.watch(channelListViewModelProvider);
  final String? activeChannelId = ref.watch(activeChannelIdProvider);
  ref.watch(channelPermissionCacheProvider);

  final DmConversation? messageChannelDm = findDmById(dmConvos, channelId);
  final bool isDmChannel = messageChannelDm != null;
  final String? resolvedGuildId = isDmChannel
      ? null
      : (messageGuildId ?? findChannelById(channelList, channelId)?.guildId);

  final bool isSelfReport = currentUserId != null && currentUserId == authorId;
  final IarReportedUser? reportedUser = isSelfReport
      ? null
      : IarReportedUser(
          id: authorId,
          displayName: authorName,
          avatar: authorAvatar,
          avatarColor: authorAvatarColor,
          isBot: authorIsBot,
        );

  // The DM channel for the reported user: either the message's own channel
  // (when reporting a DM message) or a separate 1:1 DM with that author.
  DmConversation? dmWithUser;
  if (messageChannelDm != null && !messageChannelDm.isGroup) {
    dmWithUser = messageChannelDm;
  } else if (reportedUser != null) {
    for (final convo in dmConvos) {
      if (!convo.isGroup && convo.recipientId == reportedUser.id) {
        dmWithUser = convo;
        break;
      }
    }
  }

  final String? leaveableGuildId =
      (resolvedGuildId == null || resolvedGuildId.isEmpty)
      ? null
      : resolvedGuildId;

  final Guild? leaveableGuild = leaveableGuildId == null
      ? null
      : ref.watch(guildByIdProvider(leaveableGuildId)).asData?.value;
  final bool isLeaveableGuildOwner =
      leaveableGuild != null &&
      currentUserId != null &&
      leaveableGuild.ownerId == currentUserId;

  // Permissions on the reported channel come from the synchronous cache. The
  // outer call already watches `channelPermissionCacheProvider` so any cache
  // update rebuilds the consumer.
  final int? channelPermissionBits = channelId.isEmpty || isDmChannel
      ? null
      : ref
            .read(channelPermissionCacheProvider.notifier)
            .getChannelBits(channelId);
  final bool canDeleteReportedMessage =
      !isDmChannel &&
      channelPermissionBits != null &&
      hasPermission(channelPermissionBits, Permission.manageMessages);
  final bool canBanReportedUser =
      leaveableGuildId != null &&
      reportedUser != null &&
      !isLeaveableGuildOwner &&
      channelPermissionBits != null &&
      hasPermission(channelPermissionBits, Permission.banMembers) &&
      leaveableGuild?.ownerId != reportedUser.id;

  return IarResolvedContext(
    title: l10n.iarReportMessageTitle,
    reportedUser: reportedUser,
    isReportedUserBlocked:
        reportedUser != null && blockedIds.contains(reportedUser.id),
    leaveableGuildId: leaveableGuildId,
    hasCommunityContext: leaveableGuildId != null,
    dmChannelId: dmWithUser?.id,
    dmDisplayName: reportedUser?.displayName ?? l10n.iarThisUserFallback,
    isFocusedOnDmWithUser:
        dmWithUser != null && activeChannelId == dmWithUser.id,
    isLeaveableGuildOwner: isLeaveableGuildOwner,
    canDeleteReportedMessage: canDeleteReportedMessage,
    banGuildId: leaveableGuildId,
    canBanReportedUser: canBanReportedUser,
    isDmChannel: isDmChannel,
  );
}
