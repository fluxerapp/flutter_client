import 'dart:async';

import 'package:flutter/foundation.dart' show listEquals;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/utils/navigation/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/domain/dm_unread_state.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/dm/providers/dm_mute_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/dm/providers/unread_dm_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar.dart'
    show GuildNavbarIconShape, GuildNavbarPill;
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart'
    show kGuildNavbarWidth;
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/navigation/shell_chat_back.dart'
    show shellShowsConcurrentChannelList;
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/navigation_item_semantics.dart';

class DmNavbarItem extends ConsumerStatefulWidget {
  final String channelId;
  final String recipientId;
  final String displayName;
  final int type;
  final void Function(Offset position)? onContextMenu;

  const DmNavbarItem({
    required this.channelId,
    required this.recipientId,
    required this.displayName,
    required this.type,
    this.onContextMenu,
    super.key,
  });

  @override
  ConsumerState<DmNavbarItem> createState() => _DmNavbarItemState();
}

class _DmNavbarItemState extends ConsumerState<DmNavbarItem> {
  bool _isHovered = false;

  Future<void> _navigateToDm() async {
    await navigateToDmChannelContent(
      context: context,
      ref: ref,
      channelId: widget.channelId,
    );
  }

  @override
  Widget build(BuildContext context) {
    final (int mentionCount, bool hasUnread) = ref.watch(
      unreadDmChannelsProvider.select(
        (s) => (
          s.mentionCountFor(widget.channelId),
          s.hasUnread(widget.channelId),
        ),
      ),
    );
    final bool isSelected =
        shellShowsConcurrentChannelList(context) &&
        ref.watch(
          activeChannelIdProvider.select((id) => id == widget.channelId),
        );
    final colors = context.colors;

    final isMuted =
        ref
            .watch(mutedDmChannelIdsProvider)
            .value
            ?.contains(widget.channelId) ??
        false;
    final showFadedOnMuted = ref.watch(
      appearancePreferencesProvider.select(
        (s) => s.showFadedUnreadOnMutedChannels,
      ),
    );
    final unreadState = computeDmUnreadIndicator(
      unreadCount: hasUnread ? 1 : 0,
      mentionCount: mentionCount,
      isMuted: isMuted,
      showFadedUnreadOnMutedChannels: showFadedOnMuted,
    );

    final isGroup = isDmGroupType(widget.type);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? currentUserId = isGroup
        ? ref.watch(currentUserIdProvider)
        : null;
    final _DmNavbarConversationView? conversation = ref.watch(
      dmViewModelProvider.select(
        (state) => _conversationView(
          state.conversations,
          l10n: l10n,
          currentUserId: currentUserId,
        ),
      ),
    );
    final String? friendNickname = isGroup
        ? null
        : ref.watch(friendNicknameProvider(widget.recipientId)).value;
    final String displayName =
        friendNickname ?? conversation?.displayName ?? widget.displayName;
    final avatarImageUrl = isGroup
        ? null
        : FluxerMediaUrl.userAvatar(
            userId: widget.recipientId,
            hash: conversation?.recipientAvatar,
          );

    final double indicatorHeight = isSelected
        ? GuildNavbarPill.selectedHeight
        : _isHovered
        ? GuildNavbarPill.hoverHeight
        : unreadState.show
        ? GuildNavbarPill.unreadHeight
        : 0;
    final bool showBadge = mentionCount > 0 && unreadState.show;
    final String semanticLabel = navigationItemSemanticLabel(
      l10n: FluxerLocalizations.of(context),
      name: displayName,
      isSelected: isSelected,
      hasUnread: unreadState.show && mentionCount == 0,
      mentionCount: showBadge ? mentionCount : 0,
      isMuted: isMuted,
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: GuildNavbarIconShape.itemSpacingOf(context) / 2,
      ),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Semantics(
          button: true,
          selected: isSelected,
          label: semanticLabel,
          child: ExcludeSemantics(
            child: FluxerGestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => unawaited(_navigateToDm()),
              onSecondaryTapDown: (details) =>
                  widget.onContextMenu?.call(details.globalPosition),
              onLongPress: () => widget.onContextMenu?.call(Offset.zero),
              child: SizedBox(
                width: kGuildNavbarWidth,
                height: GuildNavbarIconShape.sizeOf(context),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    PositionedDirectional(
                      start: 0,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: GuildNavbarPill(
                          height: indicatorHeight,
                          faded:
                              unreadState.faded && !isSelected && !_isHovered,
                        ),
                      ),
                    ),
                    FluxerTooltip(
                      message: displayName,
                      position: FluxerTooltipPosition.right,
                      child: SizedBox.square(
                        dimension: GuildNavbarIconShape.sizeOf(context),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            if (isGroup && conversation != null)
                              GroupDmAvatar(
                                iconUrl: conversation.groupIconUrl,
                                members: conversation.groupMembers,
                                size: GuildNavbarIconShape.sizeOf(context),
                              )
                            else if (isGroup)
                              FluxerAvatarCluster(
                                size: GuildNavbarIconShape.sizeOf(context),
                              )
                            else
                              FluxerAvatar.user(
                                fallbackText: displayName,
                                userId: widget.recipientId,
                                imageUrl: avatarImageUrl,
                                showStatus: false,
                                size: GuildNavbarIconShape.sizeOf(context),
                              ),
                            if (showBadge)
                              PositionedDirectional(
                                bottom: GuildNavbarPill.badgeInset,
                                end: GuildNavbarPill.badgeInset,
                                child: Opacity(
                                  opacity: unreadState.faded ? 0.5 : 1.0,
                                  child: FluxerBadgeEntrance(
                                    child: FluxerBadge.count(
                                      count: mentionCount,
                                      cutoutColor:
                                          colors.serverSidebarBackground,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _DmNavbarConversationView? _conversationView(
    List<DmConversation> conversations, {
    required FluxerLocalizations l10n,
    required String? currentUserId,
  }) {
    for (final DmConversation conversation in conversations) {
      if (conversation.id == widget.channelId) {
        final String displayName = conversation.displayNameWith(
          null,
          l10n: l10n,
          currentUserId: currentUserId,
        );
        if (!conversation.isGroup) {
          return _DmNavbarConversationView(
            displayName: displayName,
            recipientAvatar: conversation.recipientAvatar,
          );
        }
        return _DmNavbarConversationView(
          displayName: displayName,
          groupIconUrl: FluxerMediaUrl.guildIcon(
            guildId: conversation.id,
            hash: conversation.icon,
          ),
          groupMembers: conversation.groupMembers,
        );
      }
    }
    return null;
  }
}

@immutable
class _DmNavbarConversationView {
  const _DmNavbarConversationView({
    required this.displayName,
    this.recipientAvatar,
    this.groupIconUrl,
    this.groupMembers = const <GroupMemberInfo>[],
  });

  final String displayName;
  final String? recipientAvatar;
  final String? groupIconUrl;
  final List<GroupMemberInfo> groupMembers;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _DmNavbarConversationView &&
            other.recipientAvatar == recipientAvatar &&
            other.displayName == displayName &&
            other.groupIconUrl == groupIconUrl &&
            listEquals(other.groupMembers, groupMembers);
  }

  @override
  int get hashCode => Object.hash(
    displayName,
    recipientAvatar,
    groupIconUrl,
    Object.hashAll(groupMembers),
  );
}
