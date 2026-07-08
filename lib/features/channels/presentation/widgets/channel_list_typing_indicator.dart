import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/channel_typing_provider.dart';
import 'package:fluxer_app/features/chat/utils/typing_indicator_text.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_stack.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';

const double _kAvatarSize = 13;
const int _kMaxVisibleAvatars = 5;

/// Typing indicator shown at the end of a guild channel list row.
class ChannelListTypingIndicator extends ConsumerWidget {
  const ChannelListTypingIndicator({
    required this.channelId,
    required this.guildId,
    required this.isSelected,
    super.key,
  });

  final String channelId;
  final String guildId;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChannelTypingIndicatorMode mode = ref.watch(
      appearancePreferencesProvider.select((s) => s.channelTypingIndicatorMode),
    );
    if (mode == ChannelTypingIndicatorMode.hidden) {
      return const SizedBox.shrink();
    }
    final bool showSelectedChannelTypingIndicator = ref.watch(
      appearancePreferencesProvider.select(
        (s) => s.showSelectedChannelTypingIndicator,
      ),
    );
    if (isSelected && !showSelectedChannelTypingIndicator) {
      return const SizedBox.shrink();
    }
    final List<String> userIds = ref.watch(
      presentableTypingUsersInChannelProvider(channelId),
    );
    if (userIds.isEmpty) {
      return const SizedBox.shrink();
    }
    final colors = context.colors;
    final Color indicatorColor = isSelected
        ? colors.textPrimary
        : colors.textSecondary;
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: FluxerTooltip(
        richMessage: _TypingTooltipText(userIds: userIds, guildId: guildId),
        child: RepaintBoundary(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FluxerLoadingSpinner(color: indicatorColor),
              if (mode == ChannelTypingIndicatorMode.avatars) ...[
                const SizedBox(width: 4),
                _TypingAvatarStack(userIds: userIds, guildId: guildId),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _TypingAvatarStack extends ConsumerWidget {
  const _TypingAvatarStack({required this.userIds, required this.guildId});

  final List<String> userIds;
  final String guildId;

  GuildUserDisplay _resolveTypingUserDisplay({
    required WidgetRef ref,
    required String userId,
  }) {
    final user = ref.watch(userPresenceProvider(userId)).value;
    final String? friendNickname = ref
        .watch(friendNicknameProvider(userId))
        .value;
    final GuildUserDisplay? guildDisplay = ref
        .watch(guildUserDisplayProvider((userId, guildId)))
        .value;
    if (guildDisplay != null) {
      return guildDisplay;
    }
    if (user != null) {
      return resolveGuildUserDisplayFromRows(
        user: user,
        member: null,
        guildId: guildId,
        friendNickname: friendNickname,
      );
    }
    return fallbackTypingUserDisplay(userId);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final List<Widget> avatars = <Widget>[];
    for (final String userId in userIds) {
      final GuildUserDisplay display = _resolveTypingUserDisplay(
        ref: ref,
        userId: userId,
      );
      avatars.add(
        FluxerAvatar.user(
          userId: userId,
          imageUrl: display.avatarUrl,
          fallbackText: display.displayName,
          avatarColor: display.avatarColor,
          size: _kAvatarSize,
          showStatus: false,
        ),
      );
    }
    return FluxerAvatarStack(
      size: _kAvatarSize,
      maxVisible: _kMaxVisibleAvatars,
      outlineWidth: 1,
      avatars: avatars,
      overflowBuilder: (context, remaining) => DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors.backgroundSecondary,
        ),
        child: Center(
          child: Text(
            '+$remaining',
            style: TextStyle(
              color: colors.textPrimary,
              fontSize: _kAvatarSize * 0.4,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _TypingTooltipText extends ConsumerWidget {
  const _TypingTooltipText({required this.userIds, required this.guildId});

  final List<String> userIds;
  final String guildId;

  GuildUserDisplay _resolveTypingUserDisplay({
    required WidgetRef ref,
    required String userId,
  }) {
    final user = ref.watch(userPresenceProvider(userId)).value;
    final String? friendNickname = ref
        .watch(friendNicknameProvider(userId))
        .value;
    final GuildUserDisplay? guildDisplay = ref
        .watch(guildUserDisplayProvider((userId, guildId)))
        .value;
    if (guildDisplay != null) {
      return guildDisplay;
    }
    if (user != null) {
      return resolveGuildUserDisplayFromRows(
        user: user,
        member: null,
        guildId: guildId,
        friendNickname: friendNickname,
      );
    }
    return fallbackTypingUserDisplay(userId);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final baseStyle = context.textStyles.bodySmall.copyWith(
      color: colors.textChat,
    );
    final resolvedUsers = <({String userId, GuildUserDisplay display})>[];
    for (final String id in userIds) {
      resolvedUsers.add((
        userId: id,
        display: _resolveTypingUserDisplay(ref: ref, userId: id),
      ));
    }
    final int total = userIds.length;
    final String? bulkText = resolveTypingIndicatorBulkText(l10n, total);
    if (bulkText != null) {
      return Text(
        bulkText,
        style: baseStyle,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
      );
    }
    final names = resolvedUsers.take(total).toList();
    final String raw = typingIndicatorNamedTemplate(l10n, total);
    final List<String> parts = raw.split(kTypingIndicatorNamePlaceholder);
    final spans = <InlineSpan>[];
    for (int i = 0; i < parts.length; i++) {
      if (parts[i].isNotEmpty) {
        spans.add(TextSpan(text: parts[i]));
      }
      if (i < names.length) {
        final user = names[i];
        final Color? roleColor = ref
            .watch(memberRoleColorProvider((user.userId, guildId)))
            .value;
        spans.add(
          TextSpan(
            text: user.display.displayName,
            style: TextStyle(
              color: roleColor ?? colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }
    }
    return Text.rich(
      TextSpan(style: baseStyle, children: spans),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}
