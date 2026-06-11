import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/quick_switcher/providers/recent_channel_visits_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/dm/domain/dm_unread_state.dart';
import 'package:fluxer_app/features/dm/providers/dm_mute_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';

class DmNavbarItem extends ConsumerStatefulWidget {
  final String channelId;
  final String recipientId;
  final String displayName;
  final int type;
  final int mentionCount;
  final bool hasUnread;
  final bool isSelected;
  final void Function(Offset position)? onContextMenu;

  const DmNavbarItem({
    required this.channelId,
    required this.recipientId,
    required this.displayName,
    required this.type,
    this.mentionCount = 0,
    this.hasUnread = false,
    this.isSelected = false,
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
      unreadCount: widget.hasUnread ? 1 : 0,
      mentionCount: widget.mentionCount,
      isMuted: isMuted,
      showFadedUnreadOnMutedChannels: showFadedOnMuted,
    );

    final isGroup = widget.type == 3;
    final recipient = isGroup
        ? null
        : ref.watch(userPresenceProvider(widget.recipientId)).value;
    final avatarImageUrl = isGroup
        ? null
        : FluxerMediaUrl.userAvatar(
            userId: widget.recipientId,
            hash: recipient?.avatar,
          );
    final avatarColor = recipient?.avatarColor;

    final indicatorHeight = widget.isSelected
        ? 40.0
        : _isHovered
        ? 20.0
        : unreadState.show
        ? 8.0
        : 0.0;
    final indicatorColor = colors.textPrimary.withValues(
      alpha: unreadState.faded && !widget.isSelected && !_isHovered ? 0.5 : 1.0,
    );

    final borderRadius = (widget.isSelected || _isHovered) ? 13.0 : 22.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
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
            message: widget.displayName,
            position: FluxerTooltipPosition.right,
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: GestureDetector(
                onTap: () {
                  ref
                      .read(recentChannelVisitsProvider.notifier)
                      .recordVisit(channelId: widget.channelId);
                  navigateToContent(
                    context,
                    RoutePaths.dmChannel(widget.channelId),
                  );
                },
                onSecondaryTapDown: (details) =>
                    widget.onContextMenu?.call(details.globalPosition),
                onLongPress: () => widget.onContextMenu?.call(Offset.zero),
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
                            borderRadius: BorderRadius.circular(borderRadius),
                          ),
                          child: isGroup
                              ? FluxerAvatarCluster(
                                  channelId: widget.channelId,
                                  size: 44,
                                )
                              : FluxerAvatar.user(
                                  fallbackText: widget.displayName,
                                  userId: widget.recipientId,
                                  imageUrl: avatarImageUrl,
                                  avatarColor: avatarColor,
                                  size: 44,
                                ),
                        ),
                      ),
                      if (widget.mentionCount > 0 &&
                          !widget.isSelected &&
                          unreadState.show)
                        Positioned(
                          bottom: -4,
                          right: -4,
                          child: Opacity(
                            opacity: unreadState.faded ? 0.5 : 1.0,
                            child: FluxerBadge.count(
                              count: widget.mentionCount,
                              cutoutColor: colors.backgroundSecondary,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
