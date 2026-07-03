import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/guilds/providers/invite_accept_provider.dart';
import 'package:fluxer_app/features/guilds/services/join_community_service.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_guild_badge.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/guild_name_abbreviation.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const String _foodPatternAsset = 'assets/images/i-like-food.svg';

Future<void> showInviteAcceptModal(
  BuildContext context, {
  required String code,
}) {
  return showDialog<void>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.35),
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      return _InviteAcceptModalDialog(code: code);
    },
  );
}

class _InviteAcceptModalDialog extends ConsumerWidget {
  const _InviteAcceptModalDialog({required this.code});

  final String code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double horizontalInset = isMobileLayout(context) ? 12 : 24;
    final double verticalInset = isMobileLayout(context) ? 12 : 24;
    final double maxWidth = 1040;
    final double maxHeight = 780;
    final double width = (mediaQuery.size.width - horizontalInset * 2).clamp(
      280,
      maxWidth,
    );
    final double height =
        (mediaQuery.size.height -
                mediaQuery.viewPadding.top -
                mediaQuery.viewPadding.bottom -
                verticalInset * 2)
            .clamp(420, maxHeight);
    return Center(
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: width,
          height: height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                InviteAcceptModalBody(code: code),
                Positioned(
                  top: 12,
                  right: 12,
                  child: _InviteAcceptCloseButton(
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InviteAcceptCloseButton extends StatelessWidget {
  const _InviteAcceptCloseButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.35),
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: IconButton(
        onPressed: onPressed,
        icon: PhosphorIcon(PhosphorIconsBold.x, color: Colors.white, size: 18),
        tooltip: FluxerLocalizations.of(context).uiClose,
      ),
    );
  }
}

class InviteAcceptModalBody extends ConsumerStatefulWidget {
  const InviteAcceptModalBody({required this.code, this.onClose, super.key});

  final String code;
  final VoidCallback? onClose;

  @override
  ConsumerState<InviteAcceptModalBody> createState() =>
      _InviteAcceptModalBodyState();
}

class _InviteAcceptModalBodyState extends ConsumerState<InviteAcceptModalBody> {
  bool _isAccepting = false;

  void _close() {
    if (widget.onClose != null) {
      widget.onClose!();
      return;
    }
    Navigator.of(context).maybePop();
  }

  Future<void> _acceptInvite() async {
    if (_isAccepting) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    setState(() => _isAccepting = true);
    try {
      await joinCommunityViaInvite(ref: ref, rawInput: widget.code, l10n: l10n);
      if (!mounted) {
        return;
      }
      _close();
    } on JoinCommunityException catch (e) {
      if (!mounted) {
        return;
      }
      setState(() => _isAccepting = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message)));
    } on Object {
      if (!mounted) {
        return;
      }
      setState(() => _isAccepting = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.addGuildJoinFailed)));
    }
  }

  void _navigateToGuild({required String guildId, required String channelId}) {
    final String path = RoutePaths.guildChannel(guildId, channelId);
    navigateToContentVia(ref, path);
    _close();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<InviteAcceptState> async = ref.watch(
      inviteAcceptProvider(widget.code),
    );
    return async.when(
      loading: () => _InviteAcceptBackground(
        splashUrl: null,
        child: const Center(child: FluxerLoadingSpinner()),
      ),
      error: (_, _) => _InviteAcceptBackground(
        splashUrl: null,
        child: _InviteAcceptCard(child: _InviteAcceptError(l10n: l10n)),
      ),
      data: (InviteAcceptState state) => switch (state) {
        InviteAcceptLoading() => _InviteAcceptBackground(
          splashUrl: null,
          child: const Center(child: FluxerLoadingSpinner()),
        ),
        InviteAcceptNotFound() => _InviteAcceptBackground(
          splashUrl: null,
          child: _InviteAcceptCard(child: _InviteAcceptError(l10n: l10n)),
        ),
        InviteAcceptGuild(:final invite) => _GuildInviteContent(
          invite: invite,
          l10n: l10n,
          isAccepting: _isAccepting,
          isAlreadyMember:
              ref.watch(guildByIdProvider(invite.guild.id)).value != null,
          onJoin: () => unawaited(_acceptInvite()),
          onGoTo: () => _navigateToGuild(
            guildId: invite.guild.id,
            channelId: invite.channel.id,
          ),
        ),
        InviteAcceptGroupDm(:final invite) => _InviteAcceptBackground(
          splashUrl: null,
          child: _InviteAcceptCard(
            child: _GroupDmInviteContent(
              invite: invite,
              l10n: l10n,
              isAccepting: _isAccepting,
              onJoin: () => unawaited(_acceptInvite()),
            ),
          ),
        ),
        InviteAcceptPack(:final invite) => _InviteAcceptBackground(
          splashUrl: null,
          child: _InviteAcceptCard(
            child: _PackInviteContent(
              invite: invite,
              l10n: l10n,
              isAccepting: _isAccepting,
              onInstall: () => unawaited(_acceptInvite()),
            ),
          ),
        ),
      },
    );
  }
}

class _InviteAcceptBackground extends StatelessWidget {
  const _InviteAcceptBackground({required this.splashUrl, required this.child});

  final String? splashUrl;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Color brandPrimary = context.colors.brandPrimary;
    return ColoredBox(
      color: brandPrimary,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          if (splashUrl != null)
            CachedNetworkImage(
              imageUrl: splashUrl!,
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
              errorBuilder: (_, _, _) =>
                  _InviteFoodPattern(color: brandPrimary),
            )
          else
            _InviteFoodPattern(color: brandPrimary),
          Center(
            child: Padding(padding: const EdgeInsets.all(24), child: child),
          ),
        ],
      ),
    );
  }
}

class _InviteFoodPattern extends StatelessWidget {
  const _InviteFoodPattern({required this.color});

  final Color color;
  static const double _tileSize = 260;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final int columns = (constraints.maxWidth / _tileSize).ceil() + 1;
          final int rows = (constraints.maxHeight / _tileSize).ceil() + 1;
          return Opacity(
            opacity: 0.06,
            child: ColorFiltered(
              colorFilter: const ColorFilter.matrix(<double>[
                -1,
                0,
                0,
                0,
                255,
                0,
                -1,
                0,
                0,
                255,
                0,
                0,
                -1,
                0,
                255,
                0,
                0,
                0,
                1,
                0,
              ]),
              child: Stack(
                children: <Widget>[
                  for (int row = 0; row < rows; row++)
                    for (int col = 0; col < columns; col++)
                      Positioned(
                        left: col * _tileSize,
                        top: row * _tileSize,
                        width: _tileSize,
                        height: _tileSize,
                        child: SvgPicture.asset(_foodPatternAsset),
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _InviteAcceptCard extends StatelessWidget {
  const _InviteAcceptCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Color cardColor = context.colors.backgroundSecondary.withValues(
      alpha: 0.86,
    );
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 560),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: context.colors.borderColor.withValues(alpha: 0.7),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.28),
                  blurRadius: 60,
                  offset: const Offset(0, 24),
                ),
              ],
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class _InviteAcceptError extends StatelessWidget {
  const _InviteAcceptError({required this.l10n});

  final FluxerLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: context.colors.backgroundTertiary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: PhosphorIcon(
                PhosphorIconsFill.question,
                size: 36,
                color: context.colors.textTertiaryMuted,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.inviteAcceptNotFoundTitle,
          textAlign: TextAlign.center,
          style: context.textStyles.heading.copyWith(
            color: context.colors.statusDanger,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.inviteAcceptNotFoundDescription,
          textAlign: TextAlign.center,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textSecondary,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

class _GuildInviteContent extends StatelessWidget {
  const _GuildInviteContent({
    required this.invite,
    required this.l10n,
    required this.isAccepting,
    required this.isAlreadyMember,
    required this.onJoin,
    required this.onGoTo,
  });

  final InviteResponseSchemaGuildInviteResponse invite;
  final FluxerLocalizations l10n;
  final bool isAccepting;
  final bool isAlreadyMember;
  final VoidCallback onJoin;
  final VoidCallback onGoTo;

  String? get _iconUrl {
    final String? icon = invite.guild.icon;
    if (icon == null) {
      return null;
    }
    return FluxerMediaUrl.guildIcon(guildId: invite.guild.id, hash: icon);
  }

  String? get _splashUrl {
    final String? splash = invite.guild.splash;
    if (splash == null) {
      return null;
    }
    return FluxerMediaUrl.guildSplash(guildId: invite.guild.id, hash: splash);
  }

  @override
  Widget build(BuildContext context) {
    final String onlineStr = _formatCount(invite.presenceCount);
    final String memberStr = _formatCount(invite.memberCount);
    return _InviteAcceptBackground(
      splashUrl: _splashUrl,
      child: _InviteAcceptCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _InviteGuildHeader(
              iconUrl: _iconUrl,
              guildName: invite.guild.name,
              features: invite.guild.features,
              subtitle: l10n.inviteAcceptTitle,
              onlineLabel: l10n.embedInviteOnline(onlineStr),
              membersLabel: l10n.embedInviteMembers(memberStr),
            ),
            const SizedBox(height: 16),
            Align(
              child: SizedBox(
                width: double.infinity,
                child: FluxerButton.primary(
                  onPressed: isAlreadyMember ? onGoTo : onJoin,
                  isLoading: isAccepting && !isAlreadyMember,
                  label: isAlreadyMember
                      ? l10n.inviteAcceptGoToButton
                      : l10n.inviteAcceptJoinButton,
                ),
              ),
            ),
          ],
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

class _InviteGuildHeader extends StatelessWidget {
  const _InviteGuildHeader({
    required this.iconUrl,
    required this.guildName,
    required this.features,
    required this.subtitle,
    required this.onlineLabel,
    required this.membersLabel,
  });

  final String? iconUrl;
  final String guildName;
  final List<String> features;
  final String subtitle;
  final String onlineLabel;
  final String membersLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _InviteGuildIcon(url: iconUrl, name: guildName, size: 80),
        const SizedBox(height: 12),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Text(
                guildName,
                textAlign: TextAlign.center,
                style: context.textStyles.heading.copyWith(fontSize: 20),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: FluxerGuildBadge(features: features),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const _StatDot(online: true),
            const SizedBox(width: 4),
            Text(
              onlineLabel,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textTertiaryMuted,
              ),
            ),
            const SizedBox(width: 16),
            const _StatDot(online: false),
            const SizedBox(width: 4),
            Text(
              membersLabel,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textTertiaryMuted,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _GroupDmInviteContent extends StatelessWidget {
  const _GroupDmInviteContent({
    required this.invite,
    required this.l10n,
    required this.isAccepting,
    required this.onJoin,
  });

  final InviteResponseSchemaGroupDmInviteResponse invite;
  final FluxerLocalizations l10n;
  final bool isAccepting;
  final VoidCallback onJoin;

  String? get _inviterAvatarUrl {
    final UserPartialResponse? inviter = invite.inviter;
    if (inviter == null || inviter.avatar == null) {
      return null;
    }
    return FluxerMediaUrl.userAvatar(userId: inviter.id, hash: inviter.avatar);
  }

  @override
  Widget build(BuildContext context) {
    final UserPartialResponse? inviter = invite.inviter;
    final String inviterName = inviter?.username ?? l10n.inviteAcceptSomeone;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: _InviteUserAvatar(
            url: _inviterAvatarUrl,
            name: inviterName,
            size: 80,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.inviteAcceptGroupDmDescription(inviterName),
          textAlign: TextAlign.center,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textSecondary,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.embedInviteMembers(
            _GuildInviteContent._formatCount(invite.memberCount),
          ),
          textAlign: TextAlign.center,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textTertiaryMuted,
          ),
        ),
        const SizedBox(height: 20),
        FluxerButton.primary(
          onPressed: onJoin,
          isLoading: isAccepting,
          label: l10n.inviteAcceptJoinGroupButton,
        ),
      ],
    );
  }
}

class _PackInviteContent extends StatelessWidget {
  const _PackInviteContent({
    required this.invite,
    required this.l10n,
    required this.isAccepting,
    required this.onInstall,
  });

  final InviteResponseSchemaPackInviteResponse invite;
  final FluxerLocalizations l10n;
  final bool isAccepting;
  final VoidCallback onInstall;

  bool get _isEmojiPack =>
      invite.pack.type == PackInviteResponsePackTypeType.emoji;

  @override
  Widget build(BuildContext context) {
    final PackInviteResponsePack pack = invite.pack;
    final String packTypeLabel = _isEmojiPack
        ? l10n.inviteAcceptEmojiPack
        : l10n.inviteAcceptStickerPack;
    final String installLabel = _isEmojiPack
        ? l10n.inviteAcceptInstallEmojiPack
        : l10n.inviteAcceptInstallStickerPack;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          pack.name,
          textAlign: TextAlign.center,
          style: context.textStyles.channelName,
        ),
        const SizedBox(height: 4),
        Text(
          packTypeLabel,
          textAlign: TextAlign.center,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textTertiaryMuted,
          ),
        ),
        if (pack.description != null &&
            pack.description!.isNotEmpty) ...<Widget>[
          const SizedBox(height: 12),
          Text(
            pack.description!,
            textAlign: TextAlign.center,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
              height: 1.4,
            ),
          ),
        ],
        const SizedBox(height: 12),
        Text(
          l10n.inviteAcceptPackInstallNote,
          textAlign: TextAlign.center,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textTertiaryMuted,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 20),
        FluxerButton.primary(
          onPressed: onInstall,
          isLoading: isAccepting,
          label: installLabel,
        ),
      ],
    );
  }
}

class _InviteGuildIcon extends StatelessWidget {
  const _InviteGuildIcon({
    required this.url,
    required this.name,
    required this.size,
  });

  final String? url;
  final String name;
  final double size;

  @override
  Widget build(BuildContext context) {
    final String initials = abbreviateGuildName(name);
    final int initialsLength = guildNameInitialsLength(name);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: context.colors.backgroundTertiary,
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.hardEdge,
      child: url != null
          ? CachedNetworkImage(
              imageUrl: url!,
              width: size,
              height: size,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => _InviteInitialsFallback(
                initials: initials,
                initialsLength: initialsLength,
                size: size,
              ),
            )
          : _InviteInitialsFallback(
              initials: initials,
              initialsLength: initialsLength,
              size: size,
            ),
    );
  }
}

class _InviteUserAvatar extends StatelessWidget {
  const _InviteUserAvatar({
    required this.url,
    required this.name,
    required this.size,
  });

  final String? url;
  final String name;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: context.colors.backgroundTertiary,
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.hardEdge,
      child: url != null
          ? CachedNetworkImage(
              imageUrl: url!,
              width: size,
              height: size,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => _InviteInitialsFallback(
                initials: name.isNotEmpty ? name[0].toUpperCase() : '?',
                initialsLength: 1,
                size: size,
              ),
            )
          : _InviteInitialsFallback(
              initials: name.isNotEmpty ? name[0].toUpperCase() : '?',
              initialsLength: 1,
              size: size,
            ),
    );
  }
}

class _InviteInitialsFallback extends StatelessWidget {
  const _InviteInitialsFallback({
    required this.initials,
    required this.initialsLength,
    required this.size,
  });

  final String initials;
  final int initialsLength;
  final double size;

  @override
  Widget build(BuildContext context) {
    final double fontSize = size >= 64
        ? (initialsLength <= 2 ? 28 : 22)
        : (initialsLength <= 2 ? 18 : 15);
    return Center(
      child: Text(
        initials,
        style: TextStyle(
          color: context.colors.textPrimary,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _StatDot extends StatelessWidget {
  const _StatDot({required this.online});

  final bool online;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: online
            ? context.colors.statusOnline
            : context.colors.textTertiaryMuted,
        shape: BoxShape.circle,
      ),
    );
  }
}
