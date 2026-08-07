import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/invite_embed_context_menu.dart';
import 'package:fluxer_app/features/chat/providers/messages/invite_embed_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_guild_badge.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/guild_name_abbreviation.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Guild invite embed card.
class EmbedInvite extends ConsumerWidget {
  const EmbedInvite({required this.code, super.key});

  final String code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final async = ref.watch(inviteEmbedProvider(code));

    return async.when(
      loading: () => _InviteCard(
        icon: _SkeletonCircle(),
        title: const _SkeletonBar(width: 120),
        stats: const _SkeletonBar(width: 160),
        footer: FluxerButton.primary(label: l10n.embedInviteJoin),
      ),
      error: (_, _) => _InviteNotFound(l10n: l10n),
      data: (state) => switch (state) {
        InviteEmbedLoading() => _InviteCard(
          icon: _SkeletonCircle(),
          title: const _SkeletonBar(width: 120),
          stats: const _SkeletonBar(width: 160),
          footer: FluxerButton.primary(label: l10n.embedInviteJoin),
        ),
        InviteEmbedNotFound() => _InviteNotFound(l10n: l10n),
        InviteEmbedGuild(:final invite) => _GuildInviteCard(
          invite: invite,
          code: code,
          l10n: l10n,
          ref: ref,
          isAlreadyMember:
              ref.watch(guildByIdProvider(invite.guild.id)).value != null,
        ),
      },
    );
  }
}

class _GuildInviteCard extends StatelessWidget {
  const _GuildInviteCard({
    required this.invite,
    required this.code,
    required this.l10n,
    required this.ref,
    required this.isAlreadyMember,
  });

  final InviteResponseSchemaGuildInviteResponse invite;
  final String code;
  final FluxerLocalizations l10n;
  final WidgetRef ref;
  final bool isAlreadyMember;

  String? get _iconUrl {
    final icon = invite.guild.icon;
    if (icon == null) {
      return null;
    }
    return FluxerMediaUrl.guildIcon(guildId: invite.guild.id, hash: icon);
  }

  String? get _splashUrl {
    final splash = invite.guild.embedSplash;
    if (splash == null) {
      return null;
    }
    return FluxerMediaUrl.guildEmbedSplash(
      guildId: invite.guild.id,
      hash: splash,
    );
  }

  double? get _splashAspectRatio {
    final w = invite.guild.embedSplashWidth?.toDouble();
    final h = invite.guild.embedSplashHeight?.toDouble();
    if (w != null && h != null && w > 0 && h > 0) {
      return w / h;
    }
    return null;
  }

  Future<void> _showContextMenu(BuildContext context, Offset position) async {
    final InviteEmbedContextMenuAction? action =
        await showInviteEmbedContextMenu(
          context,
          position: position,
          canCopyGuildId: true,
          canCopyChannelId: true,
          canReport: true,
        );
    if (action == null || !context.mounted) {
      return;
    }
    await handleInviteEmbedContextMenuAction(
      context: context,
      action: action,
      guildId: invite.guild.id,
      guildName: invite.guild.name,
      inviteCode: code,
      channelId: invite.channel.id,
    );
  }

  void _onJoin(BuildContext context) {
    if (isAlreadyMember) {
      ref
          .read(fluxerRouterProvider)
          .go(RoutePaths.guildChannel(invite.guild.id, invite.channel.id));
      return;
    }
    unawaited(
      ref
          .read(fluxerClientProvider)
          .invites
          .acceptInvite(inviteCode: code)
          .then((_) {
            ref
                .read(fluxerRouterProvider)
                .go(
                  RoutePaths.guildChannel(invite.guild.id, invite.channel.id),
                );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final onlineStr = _formatCount(invite.presenceCount);
    final memberStr = _formatCount(invite.memberCount);

    return GestureDetector(
      onSecondaryTapDown: (TapDownDetails details) {
        unawaited(_showContextMenu(context, details.globalPosition));
      },
      onLongPressStart: (LongPressStartDetails details) {
        unawaited(_showContextMenu(context, details.globalPosition));
      },
      child: _InviteCard(
        splashUrl: _splashUrl,
        splashAspectRatio: _splashAspectRatio,
        icon: _GuildIcon(url: _iconUrl, name: invite.guild.name),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                invite.guild.name,
                style: context.textStyles.channelName.copyWith(
                  color: context.colors.textPrimary,
                  fontSize: 15,
                  letterSpacing: -0.1,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: FluxerGuildBadge(features: invite.guild.features),
            ),
          ],
        ),
        stats: Row(
          children: [
            const _StatDot(online: true),
            const SizedBox(width: 4),
            Text(
              l10n.embedInviteOnline(onlineStr),
              style: context.textStyles.embedFooter.copyWith(
                color: context.colors.textTertiaryMuted,
              ),
            ),
            const SizedBox(width: 10),
            const _StatDot(online: false),
            const SizedBox(width: 4),
            Text(
              l10n.embedInviteMembers(memberStr),
              style: context.textStyles.embedFooter.copyWith(
                color: context.colors.textTertiaryMuted,
              ),
            ),
          ],
        ),
        footer: FluxerButton.primary(
          onPressed: () => _onJoin(context),
          label: isAlreadyMember ? l10n.embedInviteGoTo : l10n.embedInviteJoin,
        ),
      ),
    );
  }

  static String _formatCount(int n) {
    if (n >= 1000000) {
      return '${(n / 1000000).toStringAsFixed(1)}M';
    }
    if (n >= 1000) {
      return '${(n / 1000).toStringAsFixed(1)}K';
    }
    return '$n';
  }
}

class _InviteNotFound extends StatelessWidget {
  const _InviteNotFound({required this.l10n});

  final FluxerLocalizations l10n;

  @override
  Widget build(BuildContext context) => _InviteCard(
    icon: Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: context.colors.backgroundTertiary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: PhosphorIcon(
          PhosphorIconsFill.question,
          size: 22,
          color: context.colors.textTertiaryMuted,
        ),
      ),
    ),
    title: Text(
      l10n.embedInviteUnknownTitle,
      style: context.textStyles.channelName.copyWith(
        color: context.colors.statusDanger,
        fontSize: 15,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    ),
    stats: Text(
      l10n.embedInviteUnknownSubtitle,
      style: context.textStyles.embedFooter.copyWith(
        color: context.colors.textTertiaryMuted,
      ),
    ),
    footer: FluxerButton.primary(label: l10n.embedInviteUnavailable),
  );
}

class _InviteCard extends StatelessWidget {
  const _InviteCard({
    required this.icon,
    required this.title,
    required this.stats,
    required this.footer,
    this.splashUrl,
    this.splashAspectRatio,
  });

  final Widget icon;
  final Widget title;
  final Widget stats;
  final Widget footer;
  final String? splashUrl;

  final double? splashAspectRatio;

  Widget _buildSplash() {
    final url = splashUrl;
    if (url == null) {
      return const SizedBox.shrink();
    }
    final ratio = splashAspectRatio;
    final image = CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      width: double.infinity,
      errorBuilder: (_, _, _) => const SizedBox.shrink(),
    );
    if (ratio != null && ratio > 0) {
      return AspectRatio(aspectRatio: ratio, child: image);
    }
    return SizedBox(height: 60, child: image);
  }

  @override
  Widget build(BuildContext context) => Container(
    constraints: const BoxConstraints(maxWidth: 360),
    decoration: BoxDecoration(
      color: context.colors.backgroundSecondary,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: context.colors.borderColor),
    ),
    clipBehavior: Clip.hardEdge,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (splashUrl != null) _buildSplash(),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              SizedBox(width: 48, child: Center(child: icon)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [title, const SizedBox(height: 4), stats],
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: context.colors.borderColor),
        Padding(padding: const EdgeInsets.all(12), child: footer),
      ],
    ),
  );
}

class _GuildIcon extends StatelessWidget {
  const _GuildIcon({required this.url, required this.name});

  final String? url;
  final String name;

  @override
  Widget build(BuildContext context) {
    final fallbackColor = context.colors.backgroundTertiary;
    final initials = abbreviateGuildName(name);
    final initialsLength = guildNameInitialsLength(name);

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(color: fallbackColor, shape: BoxShape.circle),
      clipBehavior: Clip.hardEdge,
      child: url != null
          ? CachedNetworkImage(
              imageUrl: url!,
              width: 44,
              height: 44,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) =>
                  _Fallback(initials: initials, initialsLength: initialsLength),
            )
          : _Fallback(initials: initials, initialsLength: initialsLength),
    );
  }
}

class _Fallback extends StatelessWidget {
  const _Fallback({required this.initials, required this.initialsLength});

  final String initials;
  final int initialsLength;

  @override
  Widget build(BuildContext context) => Center(
    child: Text(
      initials,
      style: context.textStyles.smallText.copyWith(
        color: context.colors.textPrimary,
        fontSize: _guildInviteInitialsFontSize(initialsLength),
      ),
    ),
  );
}

double _guildInviteInitialsFontSize(int initialsLength) {
  if (initialsLength <= 2) {
    return 18;
  }
  if (initialsLength <= kGuildIconInitialsMaxLength) {
    return 15;
  }
  return 12;
}

class _StatDot extends StatelessWidget {
  const _StatDot({required this.online});

  final bool online;

  Color _color(BuildContext context) =>
      online ? context.colors.statusOnline : context.colors.textTertiaryMuted;

  @override
  Widget build(BuildContext context) => Container(
    width: 8,
    height: 8,
    decoration: BoxDecoration(color: _color(context), shape: BoxShape.circle),
  );
}

class _SkeletonCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    width: 44,
    height: 44,
    decoration: BoxDecoration(
      color: context.colors.backgroundTertiary,
      shape: BoxShape.circle,
    ),
  );
}

class _SkeletonBar extends StatelessWidget {
  const _SkeletonBar({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: 12,
    decoration: BoxDecoration(
      color: context.colors.backgroundTertiary,
      borderRadius: BorderRadius.circular(4),
    ),
  );
}
