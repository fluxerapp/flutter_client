import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/channel_typing_provider.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/domain/dm_unread_state.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/dm/providers/dm_mute_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/dm/providers/unread_dm_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

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

class _DmNavbarItemState extends ConsumerState<DmNavbarItem>
    with AutomaticKeepAliveClientMixin {
  bool _isHovered = false;

  @override
  bool get wantKeepAlive => true;

  Future<void> _navigateToDm() async {
    await navigateToDmChannelContent(
      context: context,
      ref: ref,
      channelId: widget.channelId,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final (int mentionCount, bool hasUnread, bool isPendingRemoval) = ref.watch(
      unreadDmChannelsProvider.select(
        (s) => (
          s.mentionCountFor(widget.channelId),
          s.hasUnread(widget.channelId),
          s.isPendingRemoval(widget.channelId),
        ),
      ),
    );
    final bool isSelected = ref.watch(
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
      userSettingsViewModelProvider.select(
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
    final DmConversation? groupDm = isGroup
        ? ref.watch(
            dmViewModelProvider.select(
              (state) => _findConversation(state.conversations),
            ),
          )
        : null;
    final recipient = isGroup
        ? null
        : ref.watch(userPresenceProvider(widget.recipientId)).value;
    final String displayName = isGroup
        ? groupDm?.displayNameWith(
                null,
                l10n: FluxerLocalizations.of(context),
                currentUserId: ref.watch(currentUserIdProvider),
              ) ??
              widget.displayName
        : ref.watch(friendNicknameProvider(widget.recipientId)).value ??
              widget.displayName;
    final avatarImageUrl = isGroup
        ? null
        : FluxerMediaUrl.userAvatar(
            userId: widget.recipientId,
            hash: recipient?.avatar,
          );
    final avatarColor = recipient?.avatarColor;
    final bool isTyping = !isGroup
        ? ref.watch(
            isUserTypingInChannelProvider(widget.channelId, widget.recipientId),
          )
        : groupDm != null && ref.watch(dmAvatarIsTypingProvider(groupDm));
    final bool showPresence = !isGroup && widget.recipientId != fluxerBotUserId;

    final indicatorHeight = isSelected
        ? 40.0
        : _isHovered
        ? 20.0
        : unreadState.show
        ? 8.0
        : 0.0;
    final indicatorColor = colors.textPrimary.withValues(
      alpha: unreadState.faded && !isSelected && !_isHovered ? 0.5 : 1.0,
    );

    final borderRadius = (isSelected || _isHovered) ? 13.0 : 22.0;

    return AnimatedOpacity(
      opacity: isPendingRemoval ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeOut,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => unawaited(_navigateToDm()),
            onSecondaryTapDown: (details) =>
                widget.onContextMenu?.call(details.globalPosition),
            onLongPress: () => widget.onContextMenu?.call(Offset.zero),
            child: SizedBox(
              width: 60,
              height: 48,
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOutCubic,
                    width: 6,
                    height: indicatorHeight,
                    decoration: BoxDecoration(
                      color: indicatorColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  FluxerTooltip(
                    message: displayName,
                    position: FluxerTooltipPosition.right,
                    child: SizedBox(
                      width: 48,
                      height: 48,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Center(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeOutCubic,
                              width: 44,
                              height: 44,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  borderRadius,
                                ),
                              ),
                              child: isGroup
                                  ? groupDm != null
                                        ? groupDmAvatarCluster(
                                            dm: groupDm,
                                            size: 44,
                                            status: groupDm.groupStatus,
                                            isTyping: isTyping,
                                          )
                                        : FluxerAvatarCluster(
                                            channelId: widget.channelId,
                                            size: 44,
                                          )
                                  : FluxerAvatar.userPresence(
                                      fallbackText: displayName,
                                      userId: widget.recipientId,
                                      imageUrl: avatarImageUrl,
                                      avatarColor: avatarColor,
                                      showStatus: showPresence || isTyping,
                                      isTyping: isTyping,
                                      size: 44,
                                    ),
                            ),
                          ),
                          if (mentionCount > 0 &&
                              !isSelected &&
                              unreadState.show)
                            Positioned(
                              bottom: -4,
                              right: -4,
                              child: Opacity(
                                opacity: unreadState.faded ? 0.5 : 1.0,
                                child: FluxerBadge.count(
                                  count: mentionCount,
                                  cutoutColor: colors.backgroundSecondary,
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
    );
  }

  DmConversation? _findConversation(List<DmConversation> conversations) {
    for (final conversation in conversations) {
      if (conversation.id == widget.channelId) {
        return conversation;
      }
    }
    return null;
  }
}
