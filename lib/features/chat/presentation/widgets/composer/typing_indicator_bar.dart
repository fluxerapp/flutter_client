import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/channel_typing_provider.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/chat_loading_spinner.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/chat_spinner_debug.dart';
import 'package:fluxer_app/features/chat/utils/typing_indicator_text.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/blocked_users_view_model.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_stack.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:material_ui/material_ui.dart' as material;

const double _kAvatarSize = 12;
const int _kMaxVisibleAvatars = 5;
const double _kStatusFontSize = 12;

/// Floating pill shown over the chat area when other users are typing.
class TypingIndicatorBar extends ConsumerWidget {
  const TypingIndicatorBar({this.compact = false, super.key});

  final bool compact;

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
    return IgnorePointer(
      child: _TypingPill(userIds: activeUserIds, compact: compact),
    );
  }
}

class _TypingPill extends ConsumerWidget {
  const _TypingPill({required this.userIds, required this.compact});

  final List<String> userIds;
  final bool compact;

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
    final guildId = ref.watch(contextualGuildIdProvider);
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
    final l10n = FluxerLocalizations.of(context);
    final String typingLabel = _typingLabel(l10n, total, resolvedUsers);
    final Color surfaceColor = composerStatusSurfaceColor(context);
    final Widget indicator = ChatLoadingSpinner(
      reason: ChatSpinnerReason.typing,
      color: compact ? colors.textSecondary : colors.textChat,
    );
    final Widget avatarStack = ColoredBox(
      color: compact ? Colors.transparent : surfaceColor,
      child: FluxerAvatarStack(
        size: _kAvatarSize,
        maxVisible: _kMaxVisibleAvatars,
        overlap: -4,
        outlineWidth: 1,
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
    );
    final Widget content = SizedBox(
      height: WideComposerLayout.statusLineHeight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          indicator,
          SizedBox(width: compact ? 8 : 6),
          avatarStack,
          SizedBox(width: compact ? 8 : 8),
          Flexible(
            child: _buildText(context, ref, total, resolvedUsers, guildId),
          ),
        ],
      ),
    );
    final Widget body = compact
        ? content
        : ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: WideComposerLayout.typingMaxWidth,
            ),
            child: content,
          );
    return Semantics(
      liveRegion: true,
      label: typingLabel,
      child: ExcludeSemantics(child: body),
    );
  }

  String _typingLabel(
    FluxerLocalizations l10n,
    int total,
    List<({String userId, GuildUserDisplay display})> resolved,
  ) {
    final String? bulkText = resolveTypingIndicatorBulkText(l10n, total);
    if (bulkText != null) {
      return bulkText;
    }
    final names = resolved
        .take(total)
        .map((user) => user.display.displayName)
        .toList();
    final raw = typingIndicatorNamedTemplate(l10n, total);
    final parts = raw.split(kTypingIndicatorNamePlaceholder);
    final buffer = StringBuffer();
    for (int i = 0; i < parts.length; i++) {
      buffer.write(parts[i]);
      if (i < names.length) {
        buffer.write(names[i]);
      }
    }
    return buffer.toString();
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
    final Color surfaceColor = composerStatusSurfaceColor(context);
    final List<Shadow>? shadows = compact
        ? null
        : wideComposerStatusTextShadows(surfaceColor);
    final baseStyle = context.textStyles.timestamp.copyWith(
      color: compact ? colors.textSecondary : colors.textPrimaryMuted,
      fontSize: _kStatusFontSize,
      fontWeight: FontWeight.w600,
      shadows: shadows,
    );
    final bulkText = resolveTypingIndicatorBulkText(l10n, total);
    if (bulkText != null) {
      return _statusLabelText(text: bulkText, style: baseStyle);
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
            : ref.watch(memberRoleColorProvider((user.userId, guildId)));
        spans.add(
          TextSpan(
            text: user.display.displayName,
            style: baseStyle.copyWith(
              color: roleColor ?? colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }
    }
    return _statusLabelText(
      textSpan: TextSpan(style: baseStyle, children: spans),
      style: baseStyle,
    );
  }

  Widget _statusLabelText({
    required TextStyle style,
    String? text,
    InlineSpan? textSpan,
  }) {
    assert(text != null || textSpan != null);
    if (textSpan != null) {
      return material.Text.rich(
        textSpan,
        style: style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textScaler: TextScaler.noScaling,
      );
    }
    return material.Text(
      text!,
      style: style,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textScaler: TextScaler.noScaling,
    );
  }
}
