import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show FutureProviderFamily;
import 'package:fluxer_app/core/deep_links/user_settings_deep_link.dart';
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
import 'package:fluxer_app/features/settings/utils/open_user_settings_deep_link.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_billing_nav.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_acronym.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
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
    final Channel? channel = ref.watch(
      channelByIdProvider(channelId).select((async) => async.value),
    );
    final colors = context.colors;
    final style = _mentionTextStyle(
      baseStyle ?? context.textStyles.messageText,
      colors.markupMentionText,
    );
    final l10n = FluxerLocalizations.of(context);
    if (channel != null && channel.type == ChannelType.guildCategory) {
      return Text(
        '#${channel.name}',
        style: baseStyle ?? context.textStyles.messageText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      );
    }
    final bool clickable =
        channel != null && isClickableChannelMention(channel);
    if (channel != null && !clickable) {
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
    return _MentionPill(
      onTap: clickable
          ? () => navigateToGuildChannelContent(
              context: context,
              ref: ref,
              guildId: channel.guildId,
              channel: channel,
            )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ChannelIcon(
            type: type,
            size: _mentionIconSize(style),
            color: colors.markupMentionText,
          ),
          SizedBox(width: _mentionInlineGap(style)),
          _MentionLabel(name, style: style),
        ],
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
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ChannelIcon(
          type: ChannelType.guildText,
          size: _mentionIconSize(style),
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
    final style = _mentionTextStyle(
      baseStyle ?? context.textStyles.messageText,
      colors.markupMentionText,
    );
    return _MentionPill(
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
  const CommandMention({required this.command, this.baseStyle, super.key});

  final String command;
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

const double _kMentionPillHorizontalPadding = 2;
const double _kMentionPillBorderRadius = 3;
const double _kMentionDividerOpacity = 0.64;
const double _kMentionPillLineHeight = 1.25;

double _mentionIconSize(TextStyle style) => style.fontSize ?? 16;

double _mentionInlineGap(TextStyle style) => _mentionIconSize(style) * 0.125;

double _mentionDividerSize(TextStyle style) => _mentionIconSize(style) * 0.7;

TextStyle _mentionTextStyle(TextStyle base, Color color) {
  final double? baseHeight = base.height;
  return base.copyWith(
    color: color,
    fontWeight: FontWeight.w500,
    height: baseHeight == null || baseHeight > _kMentionPillLineHeight
        ? _kMentionPillLineHeight
        : baseHeight,
  );
}

class _MentionPill extends StatefulWidget {
  const _MentionPill({
    required this.child,
    this.fillColor,
    this.pressedFillColor,
    this.ringColor,
    this.onTap,
  });

  final Widget child;
  final Color? fillColor;
  final Color? pressedFillColor;
  final Color? ringColor;
  final VoidCallback? onTap;

  @override
  State<_MentionPill> createState() => _MentionPillState();
}

class _MentionPillState extends State<_MentionPill> {
  var _active = false;

  void _setActive(bool active) {
    if (_active == active || !mounted) {
      return;
    }
    setState(() => _active = active);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final VoidCallback? onTap = widget.onTap;
    final Color? ringColor = widget.ringColor;
    final BorderRadius radius = BorderRadius.circular(
      _kMentionPillBorderRadius,
    );
    final Widget pill = AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      decoration: BoxDecoration(
        color: _active && onTap != null
            ? widget.pressedFillColor ?? colors.markupInteractiveHoverFill
            : widget.fillColor ?? colors.markupMentionFill,
        borderRadius: radius,
      ),
      foregroundDecoration: ringColor == null
          ? null
          : BoxDecoration(
              borderRadius: radius,
              border: Border.all(color: ringColor),
            ),
      padding: const EdgeInsets.symmetric(
        horizontal: _kMentionPillHorizontalPadding,
      ),
      child: widget.child,
    );
    if (onTap == null) {
      return pill;
    }
    return MouseRegion(
      onEnter: (_) => _setActive(true),
      onExit: (_) => _setActive(false),
      child: FluxerGestureDetector(
        onTap: onTap,
        onTapDown: (_) => _setActive(true),
        onTapUp: (_) => _setActive(false),
        onTapCancel: () => _setActive(false),
        child: pill,
      ),
    );
  }
}

class UserMention extends ConsumerWidget {
  const UserMention({
    required this.userId,
    this.channelId,
    this.guildId,
    this.baseStyle,
    super.key,
  });

  final String userId;
  final String? channelId;
  final String? guildId;
  final TextStyle? baseStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? resolvedGuildId =
        guildId ?? resolveGuildIdForChannel(ref, channelId);
    final String name = watchMentionUserDisplayName(
      ref: ref,
      userId: userId,
      channelId: channelId,
      guildId: guildId,
    );
    final colors = context.colors;
    final style = _mentionTextStyle(
      baseStyle ?? context.textStyles.messageText,
      colors.markupMentionText,
    );
    return _MentionPill(
      onTap: () => unawaited(
        FluxerUserProfileSheet.show(
          context,
          userId: userId,
          guildId: resolvedGuildId,
        ),
      ),
      child: Text(
        '@$name',
        style: style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
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
    final role = ref.watch(
      roleByIdProvider(roleId).select((async) {
        final value = async.value;
        return (
          isLoading: async.isLoading,
          name: value?.name,
          color: value?.color ?? 0,
        );
      }),
    );
    final colors = context.colors;
    final Color? roleColor = role.color == 0
        ? null
        : Color(role.color | 0xFF000000);
    final style = _mentionTextStyle(
      baseStyle ?? context.textStyles.messageText,
      roleColor ?? colors.markupMentionText,
    );
    final String name =
        role.name ??
        (role.isLoading
            ? ''
            : FluxerLocalizations.of(context).channelSettingsUnknownRole);
    return _MentionPill(
      fillColor: roleColor?.withValues(alpha: 0.1),
      ringColor: roleColor?.withValues(alpha: 0.3),
      child: Text(
        '@$name',
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

class SettingsJumpLinkMention extends ConsumerWidget {
  const SettingsJumpLinkMention({
    required this.target,
    this.baseStyle,
    super.key,
  });

  final UserSettingsDeepLinkTarget target;
  final TextStyle? baseStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final style = _mentionTextStyle(
      baseStyle ?? context.textStyles.messageText,
      colors.markupMentionText,
    );
    final iconSize = _mentionIconSize(style);

    final UserSettingsDeepLinkPresentation presentation =
        buildUserSettingsDeepLinkPresentation(
          isTouchPrimary: isTouchPrimaryInput(ref),
          l10n: l10n,
          target: target,
          showBilling: userSettingsShowBillingNav(ref),
        );

    void onTap() {
      unawaited(
        openUserSettingsDeepLink(
          context,
          ref,
          target,
          scrollFieldId: presentation.scrollFieldId,
        ),
      );
    }

    return _MentionPill(
      fillColor: colors.markupJumpLinkFill,
      pressedFillColor: colors.markupJumpLinkHoverFill,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(
            presentation.tabIcon,
            size: iconSize,
            color: colors.markupMentionText,
          ),
          SizedBox(width: _mentionInlineGap(style)),
          _MentionLabel(presentation.tabLabel, style: style),
          if (presentation.fieldLabel != null) ...[
            _MentionDivider(style: style),
            _MentionLabel(presentation.fieldLabel!, style: style),
          ],
        ],
      ),
    );
  }
}

class ChannelJumpLinkMention extends ConsumerWidget {
  const ChannelJumpLinkMention({required this.link, this.baseStyle, super.key});

  final ChannelJumpLink link;
  final TextStyle? baseStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMessage = link is MessageJumpLink;

    final channelAsync = link.isDm
        ? null
        : ref.watch(
            channelByIdProvider(link.channelId).select((async) {
              final Channel? channel = async.value;
              return (
                isLoading: async.isLoading,
                hasChannel: channel != null,
                name: channel?.name,
                type: channel?.type,
                guildId: channel?.guildId,
              );
            }),
          );
    final bool hasChannel = channelAsync?.hasChannel ?? false;
    final guildAsync = link.isDm
        ? null
        : ref.watch(
            _guildByIdProvider(
              channelAsync?.guildId ?? link.scope,
            ).select((async) => async.value),
          );
    final dmNameAsync = link.isDm
        ? ref.watch(
            _dmNameByChannelIdProvider(
              link.channelId,
            ).select((async) => async.value),
          )
        : null;
    final guild = guildAsync;
    final dmName = dmNameAsync ?? link.channelId;

    final colors = context.colors;
    final style = _mentionTextStyle(
      baseStyle ?? context.textStyles.messageText,
      colors.markupMentionText,
    );
    final iconSize = _mentionIconSize(style);

    void onTap() {
      unawaited(
        navigateToChannelJumpLink(
          container: ref.container,
          context: context,
          link: link,
          dismissCoveringPages: true,
        ),
      );
    }

    if (!link.isDm && !hasChannel && channelAsync?.isLoading == false) {
      final l10n = FluxerLocalizations.of(context);
      void onInaccessibleTap() {
        unawaited(showChannelAccessDeniedSheet(context));
      }

      return _MentionPill(
        fillColor: colors.markupJumpLinkFill,
        pressedFillColor: colors.markupJumpLinkHoverFill,
        onTap: onInaccessibleTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              PhosphorIconsFill.lock,
              size: iconSize,
              color: colors.markupMentionText,
            ),
            SizedBox(width: _mentionInlineGap(style)),
            _MentionLabel(l10n.messageJumpLinkNoAccess, style: style),
          ],
        ),
      );
    }

    return _MentionPill(
      fillColor: colors.markupJumpLinkFill,
      pressedFillColor: colors.markupJumpLinkHoverFill,
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
              _MentionDivider(style: style),
              PhosphorIcon(
                PhosphorIconsFill.chatCircle,
                size: iconSize,
                color: colors.markupMentionText,
              ),
            ],
          ] else ...[
            if (guild != null) ...[
              _GuildIcon(guild: guild, size: iconSize),
              SizedBox(width: _mentionInlineGap(style)),
              _MentionLabel(guild.name, style: style),
              _MentionDivider(style: style),
            ],
            if (isMessage)
              PhosphorIcon(
                PhosphorIconsFill.chatCircle,
                size: iconSize,
                color: colors.markupMentionText,
              )
            else ...[
              ChannelIcon(
                type: channelAsync?.type ?? ChannelType.guildText,
                size: iconSize,
                color: colors.markupMentionText,
              ),
              SizedBox(width: _mentionInlineGap(style)),
              _MentionLabel(channelAsync?.name ?? link.channelId, style: style),
            ],
          ],
        ],
      ),
    );
  }
}

class _MentionDivider extends StatelessWidget {
  const _MentionDivider({required this.style});

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final double gap = _mentionInlineGap(style);
    return Padding(
      padding: EdgeInsetsDirectional.only(start: gap, end: gap * 2),
      child: PhosphorIcon(
        PhosphorIconsBold.caretRight,
        size: _mentionDividerSize(style),
        color: context.colors.markupMentionText.withValues(
          alpha: _kMentionDividerOpacity,
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
          fadeInDuration: Duration.zero,
          fadeOutDuration: Duration.zero,
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
    final colors = context.colors;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: FluxerGuildAcronym(
        name: guild.name,
        color: colors.markupMentionText,
      ),
    );
  }
}
