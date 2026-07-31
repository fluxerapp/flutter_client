import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show FutureProviderFamily;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/utils/channel_mention_utils.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_access_denied_sheet.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/utils/group_dm_display_name.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/role_providers.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_app/shared/utils/guild_name_abbreviation.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelMention extends ConsumerWidget {
  const ChannelMention({
    required this.channelId,
    this.fallback,
    this.baseStyle,
    super.key,
  });

  final String channelId;
  final MessageChannelMention? fallback;
  final TextStyle? baseStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(channelByIdProvider(channelId));
    final colors = context.colors;
    final style = (baseStyle ?? const TextStyle()).copyWith(
      color: colors.markupMentionText,
      fontWeight: FontWeight.w500,
    );
    final l10n = FluxerLocalizations.of(context);
    final channel = async.value;
    if (channel != null && channel.type == ChannelType.guildCategory) {
      return Text(
        '#${channel.name}',
        style: style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      );
    }
    if (channel != null && !isClickableChannelMention(channel)) {
      return _buildUnknownMentionPill(
        context,
        style,
        l10n.mentionUnknownChannel,
      );
    }
    final String name =
        channel?.name ?? fallback?.name ?? l10n.mentionUnknownChannel;
    final ChannelType type =
        channel?.type ??
        (fallback == null
            ? ChannelType.guildText
            : ChannelType.fromWire(fallback!.type));
    final bool canNavigate =
        channel != null && isClickableChannelMention(channel);
    return GestureDetector(
      onTap: canNavigate
          ? () => navigateToGuildChannelContent(
              context: context,
              ref: ref,
              guildId: channel.guildId,
              channel: channel,
            )
          : null,
      child: _MentionPill(
        baseStyle: style,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ChannelIcon(
              type: type,
              size: (style.fontSize ?? 14) * 0.9,
              color: colors.markupMentionText,
            ),
            SizedBox(width: _mentionInlineGap(style)),
            _MentionLabel(name, style: style),
          ],
        ),
      ),
    );
  }
}

Widget _buildUnknownMentionPill(
  BuildContext context,
  TextStyle style,
  String label,
) {
  final colors = context.colors;
  return _MentionPill(
    baseStyle: style,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ChannelIcon(
          type: ChannelType.guildText,
          size: (style.fontSize ?? 14) * 0.9,
          color: colors.markupMentionText,
        ),
        SizedBox(width: _mentionInlineGap(style)),
        _MentionLabel(label, style: style),
      ],
    ),
  );
}

class TextMention extends StatelessWidget {
  const TextMention({required this.label, this.baseStyle, super.key});

  final String label;
  final TextStyle? baseStyle;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final style = (baseStyle ?? const TextStyle()).copyWith(
      color: colors.markupMentionText,
      fontWeight: FontWeight.w500,
    );
    return _MentionPill(
      baseStyle: style,
      child: Text(
        label,
        style: style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );
  }
}

class CommandMention extends StatelessWidget {
  const CommandMention({
    required this.command,
    required this.applicationId,
    this.baseStyle,
    super.key,
  });

  final String command;
  final String applicationId;
  final TextStyle? baseStyle;

  @override
  Widget build(BuildContext context) {
    final List<String> segments = command.split(' ');
    final String label = '/${segments.join(' ')}';
    return TextMention(label: label, baseStyle: baseStyle);
  }
}

class GuildNavigationMention extends StatelessWidget {
  const GuildNavigationMention({
    required this.type,
    this.navigationId,
    this.baseStyle,
    super.key,
  });

  final FluxerGuildNavigationType type;
  final String? navigationId;
  final TextStyle? baseStyle;

  @override
  Widget build(BuildContext context) {
    final String label = switch (type) {
      FluxerGuildNavigationType.customize => '<id:customize>',
      FluxerGuildNavigationType.browse => '<id:browse>',
      FluxerGuildNavigationType.guide => '<id:guide>',
      FluxerGuildNavigationType.linkedRoles =>
        navigationId == null
            ? '<id:linked-roles>'
            : '<id:linked-roles:$navigationId>',
    };
    return TextMention(label: label, baseStyle: baseStyle);
  }
}

/// Mention pill metrics scale with [TextStyle.fontSize] (baseline 14px).
double _mentionPillHorizontalPadding(TextStyle style) =>
    (style.fontSize ?? 14) * (3.2 / 14);

double _mentionPillBorderRadius(TextStyle style) =>
    (style.fontSize ?? 14) * (4 / 14);

double _mentionInlineGap(TextStyle style) => (style.fontSize ?? 14) * (2 / 14);

class _MentionPill extends StatelessWidget {
  const _MentionPill({
    required this.child,
    required this.baseStyle,
    this.fillColor,
  });

  final Widget child;
  final TextStyle baseStyle;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: fillColor ?? colors.markupMentionFill,
        borderRadius: BorderRadius.circular(
          _mentionPillBorderRadius(baseStyle),
        ),
        border: Border.all(color: colors.markupMentionBorder),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: _mentionPillHorizontalPadding(baseStyle),
      ),
      child: child,
    );
  }
}

class UserMention extends ConsumerWidget {
  const UserMention({
    required this.userId,
    this.channelId,
    this.baseStyle,
    super.key,
  });

  final String userId;
  final String? channelId;
  final TextStyle? baseStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? guildId = resolveGuildIdForChannel(ref, channelId);
    final String name = watchMentionUserDisplayName(
      ref: ref,
      userId: userId,
      channelId: channelId,
    );
    final colors = context.colors;
    final style = (baseStyle ?? const TextStyle()).copyWith(
      color: colors.markupMentionText,
      fontWeight: FontWeight.w500,
    );
    return GestureDetector(
      onTap: () => unawaited(
        FluxerUserProfileSheet.show(context, userId: userId, guildId: guildId),
      ),
      child: _MentionPill(
        baseStyle: style,
        child: Text(
          '@$name',
          style: style,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
      ),
    );
  }
}

class RoleMention extends ConsumerWidget {
  const RoleMention({required this.roleId, this.baseStyle, super.key});

  final String roleId;
  final TextStyle? baseStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(roleByIdProvider(roleId));
    final colors = context.colors;
    final role = async.value;

    final hasColor = (role?.color ?? 0) != 0;
    final roleColor = hasColor ? Color(role!.color | 0xFF000000) : null;
    // 0.1 opacity fill matching web app
    final fillColor = roleColor?.withValues(alpha: 0.1);

    final style = (baseStyle ?? const TextStyle()).copyWith(
      color: roleColor ?? colors.markupMentionText,
      fontWeight: FontWeight.w500,
    );

    return _MentionPill(
      baseStyle: style,
      fillColor: fillColor,
      child: Text(
        '@${role?.name ?? roleId}',
        style: style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );
  }
}

final FutureProviderFamily<Guild?, String> _guildByIdProvider = FutureProvider
    .autoDispose
    .family<Guild?, String>((ref, id) async {
      final db = ref.watch(fluxerDatabaseProvider);
      final row = await db.guildDao.getServerById(id);
      return row == null ? null : Guild.fromRow(row);
    });

// temporary solution :)
final FutureProviderFamily<String?, String> _dmNameByChannelIdProvider =
    FutureProvider.autoDispose.family<String?, String>((ref, channelId) async {
      final db = ref.watch(fluxerDatabaseProvider);
      final row = await db.dmChannelDao.getDmChannelById(channelId);
      if (row == null) {
        return null;
      }
      if (isDmGroupType(row.type)) {
        final conversation = await ref
            .read(dmRepositoryProvider)
            .conversationFromChannelRow(row);
        return resolveGroupDmDisplayName(dm: conversation);
      }
      final user = await db.userDao.getUserById(row.recipientId);
      if (user == null) {
        return null;
      }
      final relationship = await db.relationshipDao.getRelationship(
        row.recipientId,
      );
      return resolveDisplayName(
        friendNickname: relationship?.nickname,
        globalName: user.globalName,
        username: user.username,
      );
    });

class ChannelJumpLinkMention extends ConsumerWidget {
  const ChannelJumpLinkMention({
    required this.link,
    required this.url,
    this.baseStyle,
    super.key,
  });

  final ChannelJumpLink link;
  final String url;
  final TextStyle? baseStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMessage = link is MessageJumpLink;

    final channelAsync = link.isDm
        ? null
        : ref.watch(channelByIdProvider(link.channelId));
    final channel = channelAsync?.value;
    final guildAsync = link.isDm
        ? null
        : ref.watch(_guildByIdProvider(channel?.guildId ?? link.scope));
    final dmNameAsync = link.isDm
        ? ref.watch(_dmNameByChannelIdProvider(link.channelId))
        : null;
    final guild = guildAsync?.value;
    final dmName = dmNameAsync?.value ?? link.channelId;

    final colors = context.colors;
    final style = (baseStyle ?? const TextStyle()).copyWith(
      color: colors.markupMentionText,
      fontWeight: FontWeight.w500,
    );
    final iconSize = (style.fontSize ?? 14) * 0.9;

    void onTap() {
      unawaited(
        navigateToChannelJumpLink(
          container: ref.container,
          context: context,
          link: link,
        ),
      );
    }

    if (!link.isDm && channel == null && channelAsync?.isLoading == false) {
      final l10n = FluxerLocalizations.of(context);
      void onInaccessibleTap() {
        unawaited(showChannelAccessDeniedSheet(context));
      }

      return _JumpLinkPill(
        baseStyle: style,
        onTap: onInaccessibleTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              PhosphorIconsFill.lock,
              size: iconSize,
              color: colors.markupMentionText,
            ),
            SizedBox(width: iconSize * 0.2),
            _MentionLabel(l10n.messageJumpLinkNoAccess, style: style),
          ],
        ),
      );
    }

    return _JumpLinkPill(
      baseStyle: style,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (link.isDm) ...[
            if (isMessage)
              _MentionLabel(dmName, style: style)
            else
              _MentionLabel('# $dmName', style: style),
            if (isMessage) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: iconSize * 0.1),
                child: PhosphorIcon(
                  PhosphorIconsBold.caretRight,
                  size: iconSize * 0.6,
                  color: colors.markupMentionText,
                ),
              ),
              PhosphorIcon(
                PhosphorIconsFill.chatCircle,
                size: iconSize,
                color: colors.markupMentionText,
              ),
            ],
          ] else ...[
            if (guild != null) ...[
              _GuildIcon(guild: guild, size: iconSize),
              SizedBox(width: iconSize * 0.2),
              _MentionLabel(guild.name, style: style),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: iconSize * 0.1),
                child: PhosphorIcon(
                  PhosphorIconsBold.caretRight,
                  size: iconSize * 0.6,
                  color: colors.markupMentionText,
                ),
              ),
            ],
            if (isMessage)
              PhosphorIcon(
                PhosphorIconsFill.chatCircle,
                size: iconSize,
                color: colors.markupMentionText,
              )
            else ...[
              ChannelIcon(
                type: channel?.type ?? ChannelType.guildText,
                size: iconSize,
                color: colors.markupMentionText,
              ),
              SizedBox(width: iconSize * 0.2),
              _MentionLabel(channel?.name ?? link.channelId, style: style),
            ],
          ],
        ],
      ),
    );
  }
}

class _JumpLinkPill extends StatefulWidget {
  const _JumpLinkPill({
    required this.child,
    required this.baseStyle,
    this.onTap,
  });

  final Widget child;
  final TextStyle baseStyle;
  final VoidCallback? onTap;

  @override
  State<_JumpLinkPill> createState() => _JumpLinkPillState();
}

class _JumpLinkPillState extends State<_JumpLinkPill> {
  var _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: _hovered
                ? colors.markupJumpLinkHoverFill
                : colors.markupJumpLinkFill,
            borderRadius: BorderRadius.circular(
              _mentionPillBorderRadius(widget.baseStyle),
            ),
            border: Border.all(color: colors.markupMentionBorder),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: _mentionPillHorizontalPadding(widget.baseStyle),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

class _MentionLabel extends StatelessWidget {
  const _MentionLabel(this.text, {required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        text,
        style: style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );
  }
}

class _GuildIcon extends StatelessWidget {
  const _GuildIcon({required this.guild, required this.size});

  final Guild guild;
  final double size;

  @override
  Widget build(BuildContext context) {
    final url = guild.iconUrl;
    if (url != null) {
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: url,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => _GuildInitials(guild: guild, size: size),
        ),
      );
    }
    return _GuildInitials(guild: guild, size: size);
  }
}

class _GuildInitials extends StatelessWidget {
  const _GuildInitials({required this.guild, required this.size});

  final Guild guild;
  final double size;

  @override
  Widget build(BuildContext context) {
    final initials = abbreviateGuildName(guild.name);
    final initialsLength = guildNameInitialsLength(guild.name);
    final colors = context.colors;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          fontSize: _guildMentionInitialsFontSize(initialsLength, size),
          fontWeight: FontWeight.w700,
          color: colors.markupMentionText,
          height: 1,
        ),
      ),
    );
  }
}

double _guildMentionInitialsFontSize(int initialsLength, double size) {
  if (initialsLength <= 2) {
    return size * 0.6;
  }
  if (initialsLength <= kGuildIconInitialsMaxLength) {
    return size * 0.45;
  }
  return size * 0.35;
}
