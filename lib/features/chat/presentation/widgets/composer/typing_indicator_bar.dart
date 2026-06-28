import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/channel_typing_provider.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/chat_loading_spinner.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/chat_spinner_debug.dart';
import 'package:fluxer_app/features/chat/utils/typing_indicator_text.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/blocked_users_view_model.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_stack.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';

const double _kAvatarSize = 12;
const int _kMaxVisibleAvatars = 5;

/// Floating pill shown over the chat area when other users are typing.
class TypingIndicatorBar extends ConsumerWidget {
  const TypingIndicatorBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String channelId = ref.watch(
      chatViewModelProvider.select((s) => s.channelId),
    );
    if (channelId.isEmpty) {
      return const SizedBox.shrink();
    }
    final List<String> userIds = ref.watch(
      typingUsersInChannelProvider(channelId),
    );
    if (userIds.isEmpty) {
      return const SizedBox.shrink();
    }
    final blocked = ref.watch(blockedUsersViewModelProvider).value;
    final Set<String> blockedIds = blocked == null
        ? const <String>{}
        : {for (final f in blocked) f.id};
    final List<String> activeUserIds = blockedIds.isEmpty
        ? userIds
        : <String>[
            for (final String id in userIds)
              if (!blockedIds.contains(id)) id,
          ];
    if (activeUserIds.isEmpty) {
      return const SizedBox.shrink();
    }
    return IgnorePointer(child: _TypingPill(userIds: activeUserIds));
  }
}

class _TypingPill extends ConsumerWidget {
  const _TypingPill({required this.userIds});

  final List<String> userIds;

  GuildUserDisplay _resolveTypingUserDisplay({
    required WidgetRef ref,
    required String userId,
    required String? guildId,
  }) {
    final user = ref.watch(userPresenceProvider(userId)).value;
    final String? friendNickname = ref
        .watch(friendNicknameProvider(userId))
        .value;
    if (guildId != null) {
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
    final GuildUserDisplay? dbDisplay = ref
        .watch(guildUserDisplayFromDbProvider((userId, null)))
        .value;
    if (dbDisplay != null) {
      return dbDisplay;
    }
    if (user != null) {
      return resolveGuildUserDisplayFromRows(
        user: user,
        member: null,
        guildId: null,
        friendNickname: friendNickname,
      );
    }
    return fallbackTypingUserDisplay(userId);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final guildId = ref.watch(activeGuildIdProvider);
    final resolvedUsers = <({String userId, GuildUserDisplay display})>[];
    for (final id in userIds) {
      resolvedUsers.add((
        userId: id,
        display: _resolveTypingUserDisplay(
          ref: ref,
          userId: id,
          guildId: guildId,
        ),
      ));
    }
    final total = userIds.length;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: colors.chatInputBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.userAreaDividerColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ChatLoadingSpinner(
            reason: ChatSpinnerReason.typing,
            color: colors.textSecondary,
          ),
          const SizedBox(width: 8),
          FluxerAvatarStack(
            size: _kAvatarSize,
            maxVisible: _kMaxVisibleAvatars,
            avatars: [
              for (final user in resolvedUsers)
                FluxerAvatar.user(
                  userId: user.userId,
                  imageUrl: user.display.avatarUrl,
                  fallbackText: user.display.displayName,
                  avatarColor: user.display.avatarColor,
                  size: _kAvatarSize,
                  showStatus: false,
                ),
            ],
          ),
          const SizedBox(width: 8),
          Flexible(
            child: _buildText(context, ref, total, resolvedUsers, guildId),
          ),
        ],
      ),
    );
  }

  Widget _buildText(
    BuildContext context,
    WidgetRef ref,
    int total,
    List<({String userId, GuildUserDisplay display})> resolved,
    String? guildId,
  ) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final baseStyle = context.textStyles.timestamp.copyWith(
      color: colors.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );
    final bulkText = resolveTypingIndicatorBulkText(l10n, total);
    if (bulkText != null) {
      return Text(
        bulkText,
        style: baseStyle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }
    final names = resolved.take(total).toList();
    final raw = typingIndicatorNamedTemplate(l10n, total);
    final parts = raw.split(kTypingIndicatorNamePlaceholder);
    final spans = <InlineSpan>[];
    for (int i = 0; i < parts.length; i++) {
      if (parts[i].isNotEmpty) {
        spans.add(TextSpan(text: parts[i]));
      }
      if (i < names.length) {
        final user = names[i];
        final roleColor = guildId == null
            ? null
            : ref.watch(memberRoleColorProvider((user.userId, guildId))).value;
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
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
