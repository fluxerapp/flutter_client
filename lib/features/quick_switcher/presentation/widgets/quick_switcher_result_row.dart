import 'package:flutter/material.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_result_unread_state.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_types.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// Web bottom sheet: 2rem slot, 24px avatars, ~1.75rem channel glyphs.
const double _kLeadingSlotSize = 32;
const double _kAvatarRenderSize = 24;
const double _kChannelIconSize = 28;
const double _kPhosphorIconSize = 28;

class QuickSwitcherResultRow extends StatelessWidget {
  const QuickSwitcherResultRow({
    required this.result,
    required this.onTap,
    this.unreadState = const QuickSwitcherResultUnreadState(),
    super.key,
  });

  final QuickSwitcherResult result;
  final VoidCallback onTap;
  final QuickSwitcherResultUnreadState unreadState;

  @override
  Widget build(BuildContext context) {
    if (result is QuickSwitcherHeaderResult) {
      return const SizedBox.shrink();
    }
    final bool isHighlighted = unreadState.shouldHighlight;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: context.layout.radiusMd,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Row(
            children: <Widget>[
              _buildLeading(context, isHighlighted: isHighlighted),
              const SizedBox(width: 8),
              Expanded(
                child: _buildText(context, isHighlighted: isHighlighted),
              ),
              if (unreadState.mentionCount > 0)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: FluxerBadge.count(count: unreadState.mentionCount),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeading(BuildContext context, {required bool isHighlighted}) {
    final Color mutedColor = context.colors.textPrimaryMuted;
    final Color iconColor = isHighlighted
        ? context.colors.textSecondary
        : mutedColor;
    return SizedBox(
      width: _kLeadingSlotSize,
      height: _kLeadingSlotSize,
      child: Center(
        child: switch (result) {
          QuickSwitcherUserResult(
            :final userId,
            :final avatar,
            :final avatarColor,
            :final status,
            :final title,
          ) =>
            FluxerAvatar.user(
              fallbackText: title,
              userId: userId,
              imageUrl: FluxerMediaUrl.userAvatar(userId: userId, hash: avatar),
              avatarColor: avatarColor,
              status: status,
              size: _kAvatarRenderSize,
            ),
          QuickSwitcherGroupDmResult(
            :final channelId,
            :final icon,
            :final groupStatus,
            :final groupMembers,
          ) =>
            FluxerAvatarCluster(
              channelId: channelId,
              iconUrl: icon != null && icon.isNotEmpty
                  ? FluxerMediaUrl.guildIcon(guildId: channelId, hash: icon)
                  : null,
              status: groupStatus,
              members: groupMembers
                  .take(3)
                  .map(
                    (GroupMemberInfo member) => AvatarClusterMember(
                      userId: member.id,
                      imageUrl: FluxerMediaUrl.userAvatar(
                        userId: member.id,
                        hash: member.avatar,
                      ),
                      fallbackText: member.name,
                    ),
                  )
                  .toList(),
            ),
          QuickSwitcherTextChannelResult() => ChannelIcon(
            type: ChannelType.text,
            size: _kChannelIconSize,
            color: iconColor,
          ),
          QuickSwitcherVoiceChannelResult() => ChannelIcon(
            type: ChannelType.voice,
            size: _kChannelIconSize,
            color: iconColor,
          ),
          QuickSwitcherGuildResult(:final guild) => FluxerGuildIconAvatar(
            name: guild.name,
            imageUrl: guild.iconUrl,
            isCircle: true,
            size: _kAvatarRenderSize,
          ),
          QuickSwitcherVirtualGuildResult(:final virtualGuildType) =>
            _phosphorIcon(
              virtualGuildType == QuickSwitcherVirtualGuildType.favorites
                  ? PhosphorIconsFill.star
                  : PhosphorIconsFill.house,
              color: iconColor,
            ),
          QuickSwitcherSettingsResult(:final target) => _phosphorIcon(
            _settingsIcon(target),
            color: iconColor,
          ),
          QuickSwitcherLinkResult() => _phosphorIcon(
            PhosphorIconsBold.arrowRight,
            color: iconColor,
          ),
          QuickSwitcherHeaderResult() => const SizedBox.shrink(),
        },
      ),
    );
  }

  Widget _buildText(BuildContext context, {required bool isHighlighted}) {
    final colors = context.colors;
    final String title = switch (result) {
      QuickSwitcherUserResult(:final title) => title,
      QuickSwitcherGroupDmResult(:final title) => title,
      QuickSwitcherTextChannelResult(:final title) => title,
      QuickSwitcherVoiceChannelResult(:final title) => title,
      QuickSwitcherGuildResult(:final title) => title,
      QuickSwitcherVirtualGuildResult(:final title) => title,
      QuickSwitcherSettingsResult(:final title) => title,
      QuickSwitcherLinkResult(:final title) => title,
      QuickSwitcherHeaderResult(:final title) => title,
    };
    final String? subtitle = switch (result) {
      QuickSwitcherUserResult(:final subtitle) => subtitle,
      QuickSwitcherGroupDmResult(:final subtitle) => subtitle,
      QuickSwitcherTextChannelResult(:final subtitle) => subtitle,
      QuickSwitcherVoiceChannelResult(:final subtitle) => subtitle,
      QuickSwitcherGuildResult(:final subtitle) => subtitle,
      QuickSwitcherVirtualGuildResult(:final subtitle) => subtitle,
      QuickSwitcherSettingsResult(:final subtitle) => subtitle,
      QuickSwitcherLinkResult(:final subtitle) => subtitle,
      QuickSwitcherHeaderResult() => null,
    };
    final Color titleColor = isHighlighted
        ? colors.textSecondary
        : colors.textPrimary;
    final Color subtitleColor = isHighlighted
        ? colors.textSecondary.withValues(alpha: 0.8)
        : colors.textPrimaryMuted.withValues(alpha: 0.8);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            height: 18 / 15,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (subtitle != null && subtitle.isNotEmpty) ...<Widget>[
          const SizedBox(height: 1),
          Text(
            subtitle,
            style: TextStyle(
              color: subtitleColor,
              fontSize: 13,
              height: 16 / 13,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }

  Widget _phosphorIcon(IconData icon, {required Color color}) {
    return PhosphorIcon(icon, size: _kPhosphorIconSize, color: color);
  }

  IconData _settingsIcon(QuickSwitcherSettingsTarget target) =>
      switch (target) {
        QuickSwitcherSettingsTarget.userSettings => PhosphorIconsFill.userGear,
        QuickSwitcherSettingsTarget.notifications => PhosphorIconsFill.bell,
        QuickSwitcherSettingsTarget.bookmarks => PhosphorIconsFill.bookmark,
        QuickSwitcherSettingsTarget.mentions => PhosphorIconsFill.at,
      };
}
