import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_hash.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/discovery/domain/discovery_category_labels.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_guild_context_menu.dart';
import 'package:fluxer_app/features/discovery/providers/discovery_controller.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/moderation/domain/iar_context.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_icon_avatar.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_guild_badge.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';
import 'package:fluxer_dart/export.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

const String _discoverableFeature = 'DISCOVERABLE';
const double _discoveryGuildIconSize = 48;
const double _kDesktopBannerHeight = 120;
const double _kDesktopIconSize = 56;
const List<Color> _kDesktopBannerTints = <Color>[
  Color(0xFFA99ADF),
  Color(0xFF93B7E0),
  Color(0xFF8FC9C6),
  Color(0xFF9AC9A4),
  Color(0xFFBFCB92),
  Color(0xFFDFC194),
  Color(0xFFE0A894),
  Color(0xFFDD9CAA),
  Color(0xFFCD9AC9),
  Color(0xFF9BA4DD),
];

Color _discoveryBannerTint(String guildId) {
  final BigInt? id = BigInt.tryParse(guildId);
  if (id == null) {
    return _kDesktopBannerTints.first;
  }
  return _kDesktopBannerTints[(id % BigInt.from(_kDesktopBannerTints.length))
      .toInt()];
}

String? _discoveryGuildIconUrl({
  required String guildId,
  required String? iconHash,
}) {
  if (iconHash == null || iconHash.isEmpty) {
    return null;
  }
  return FluxerMediaUrl.guildIcon(
    guildId: guildId,
    hash: iconHash,
    animated: isAnimatedMediaHash(iconHash),
  );
}

class DiscoveryGuildCard extends ConsumerWidget {
  const DiscoveryGuildCard({required this.guild, super.key});

  final DiscoveryGuildListResponseGuilds guild;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final DiscoveryState discoveryState = ref.watch(
      discoveryControllerProvider,
    );
    final List<Guild> memberGuilds = ref
        .watch(guildListViewModelProvider)
        .guilds;
    final bool isAlreadyMember = memberGuilds.any(
      (Guild g) => g.id == guild.id,
    );
    final bool singleCommunity = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.singleCommunity),
    );
    final bool isJoining = discoveryState.joiningGuildIds.contains(guild.id);
    final String? categoryLabel = discoveryCategoryLabel(
      l10n,
      guild.categoryType.toInt(),
    );
    final List<String> badgeFeatures = guild.features
        .where((String feature) => feature != _discoverableFeature)
        .toList();
    final String? iconUrl = _discoveryGuildIconUrl(
      guildId: guild.id,
      iconHash: guild.icon,
    );
    final IarGuildContext reportTarget = IarGuildContext(
      guildId: guild.id,
      name: guild.name,
      iconUrl: iconUrl,
    );
    final String onlineCount = NumberFormat.decimalPattern(
      Localizations.localeOf(context).toString(),
    ).format(guild.onlineCount);
    final num memberCount = guild.memberCount;
    final bool isMobile = isMobileLayout(context);
    if (!isMobile && usesDesktopPointerUi(context)) {
      return _DiscoveryGuildDesktopCard(
        guild: guild,
        iconUrl: iconUrl,
        badgeFeatures: badgeFeatures,
        onlineLabel: l10n.discoveryOnlineCount(onlineCount),
        membersLabel: l10n.discoveryMemberCount(memberCount),
        onTap: isJoining
            ? null
            : () {
                if (isAlreadyMember) {
                  context.go(RoutePaths.guild(guild.id));
                  return;
                }
                if (singleCommunity) {
                  return;
                }
                unawaited(
                  _handleJoin(context: context, ref: ref, guildId: guild.id),
                );
              },
        onContextMenu: (Offset position) =>
            unawaited(_showContextMenu(context, ref, position, reportTarget)),
      );
    }
    return Material(
      color: colors.backgroundSecondary,
      borderRadius: layout.radiusMd,
      clipBehavior: Clip.antiAlias,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: colors.backgroundModifierAccent),
          borderRadius: layout.radiusMd,
        ),
        child: Stack(
          children: <Widget>[
            FluxerGestureDetector(
              onSecondaryTapDown: isMobile
                  ? null
                  : (TapDownDetails details) {
                      unawaited(
                        _showContextMenu(
                          context,
                          ref,
                          details.globalPosition,
                          reportTarget,
                        ),
                      );
                    },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      layout.s3,
                      layout.s3,
                      isMobile ? layout.s8 : layout.s3,
                      layout.s3,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            FluxerGuildIconAvatar(
                              name: guild.name,
                              imageUrl: iconUrl,
                              size: _discoveryGuildIconSize,
                            ),
                            SizedBox(width: layout.s2),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Flexible(
                                    child: Text(
                                      guild.name,
                                      style: textStyles.channelName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  if (badgeFeatures.isNotEmpty) ...<Widget>[
                                    const SizedBox(width: 4),
                                    FluxerGuildBadge(
                                      features: badgeFeatures,
                                      badgeIds: guild.badgeIds,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (categoryLabel != null) ...<Widget>[
                          SizedBox(height: layout.s2),
                          Text(
                            categoryLabel,
                            style: textStyles.label.copyWith(
                              color: colors.textTertiaryMuted,
                            ),
                          ),
                        ],
                        SizedBox(height: layout.s2),
                        Text(
                          guild.description?.trim().isNotEmpty ?? false
                              ? guild.description!.trim()
                              : l10n.discoveryNoDescription,
                          style: textStyles.bodySmall.copyWith(
                            color: colors.textSecondary,
                            height: 1.4,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(layout.s3),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: colors.backgroundModifierAccent),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _DiscoveryStatRow(
                                dotColor: colors.statusOnline,
                                label: l10n.discoveryOnlineCount(onlineCount),
                              ),
                              const SizedBox(height: 4),
                              _DiscoveryStatRow(
                                dotColor: colors.textTertiaryMuted,
                                label: l10n.discoveryMemberCount(memberCount),
                              ),
                            ],
                          ),
                        ),
                        if (!singleCommunity || isAlreadyMember)
                          FluxerButton.primary(
                            label: isAlreadyMember
                                ? l10n.discoveryJoined
                                : l10n.discoveryJoinCommunity,
                            fitContent: true,
                            isLoading: isJoining,
                            onPressed: isAlreadyMember || isJoining
                                ? null
                                : () => unawaited(
                                    _handleJoin(
                                      context: context,
                                      ref: ref,
                                      guildId: guild.id,
                                    ),
                                  ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isMobile)
              PositionedDirectional(
                top: layout.s1,
                end: layout.s1,
                child: _DiscoveryCardMenuButton(
                  tooltip: l10n.chatMessageMore,
                  onPressed: (Offset position) {
                    unawaited(
                      _showContextMenu(context, ref, position, reportTarget),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _showContextMenu(
    BuildContext context,
    WidgetRef ref,
    Offset position,
    IarGuildContext guild,
  ) async {
    final DiscoveryGuildCardAction? action =
        await showDiscoveryGuildContextMenu(context, position: position);
    if (action == null || !context.mounted) {
      return;
    }
    await handleDiscoveryGuildCardAction(
      context: context,
      action: action,
      guild: guild,
    );
    if (!context.mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    switch (action) {
      case DiscoveryGuildCardAction.copyId:
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.copiedToClipboard,
                variant: FluxerToastVariant.success,
              ),
            );
      case DiscoveryGuildCardAction.report:
        return;
    }
  }

  Future<void> _handleJoin({
    required BuildContext context,
    required WidgetRef ref,
    required String guildId,
  }) async {
    try {
      if (ref.read(instanceRuntimeConfigProvider).singleCommunity) {
        return;
      }
      await ref.read(discoveryControllerProvider.notifier).joinGuild(guildId);
      if (!context.mounted) {
        return;
      }
      context.go(RoutePaths.guild(guildId));
    } on Object catch (error) {
      if (!context.mounted) {
        return;
      }
      await showApiError(context, ApiErrorAction.joinDiscoveryCommunity, error);
    }
  }
}

class _DiscoveryCardMenuButton extends StatelessWidget {
  const _DiscoveryCardMenuButton({
    required this.tooltip,
    required this.onPressed,
  });

  final String tooltip;
  final ValueChanged<Offset> onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Tooltip(
      message: tooltip,
      child: IconButton(
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints.tightFor(width: 32, height: 32),
        icon: PhosphorIcon(
          PhosphorIconsBold.dotsThree,
          size: 18,
          color: colors.textSecondary,
        ),
        onPressed: () {
          final RenderBox box = context.findRenderObject()! as RenderBox;
          final Offset position = box.localToGlobal(
            Offset(box.size.width, box.size.height),
          );
          onPressed(position);
        },
      ),
    );
  }
}

class _DiscoveryStatRow extends StatelessWidget {
  const _DiscoveryStatRow({required this.dotColor, required this.label});

  final Color dotColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            label,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _DiscoveryGuildDesktopCard extends StatelessWidget {
  const _DiscoveryGuildDesktopCard({
    required this.guild,
    required this.iconUrl,
    required this.badgeFeatures,
    required this.onlineLabel,
    required this.membersLabel,
    required this.onTap,
    required this.onContextMenu,
  });

  final DiscoveryGuildListResponseGuilds guild;
  final String? iconUrl;
  final List<String> badgeFeatures;
  final String onlineLabel;
  final String membersLabel;
  final VoidCallback? onTap;
  final ValueChanged<Offset> onContextMenu;

  @override
  Widget build(BuildContext context) {
    return FluxerTappable(
      onTap: onTap,
      onSecondaryTapUp: (TapUpDetails details) =>
          onContextMenu(details.globalPosition),
      button: true,
      semanticLabel: guild.name,
      builder: (BuildContext context, Set<WidgetState> states) =>
          _buildCard(context, hovered: states.contains(WidgetState.hovered)),
    );
  }

  Widget _buildCard(BuildContext context, {required bool hovered}) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final l10n = FluxerLocalizations.of(context);
    final Color surface = hovered
        ? colors.backgroundSecondaryAlt
        : colors.backgroundSecondary;
    final String? bannerUrl = FluxerMediaUrl.guildBanner(
      guildId: guild.id,
      hash: guild.banner,
    );
    final String? description = guild.description?.trim();
    final Duration duration = context.motion.normal;
    return AnimatedContainer(
      duration: duration,
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: surface,
        borderRadius: context.layout.radiusLg,
        border: Border.all(
          color: hovered
              ? colors.backgroundModifierAccentFocus
              : colors.backgroundModifierAccent,
        ),
        boxShadow: hovered
            ? const <BoxShadow>[
                BoxShadow(
                  color: Color(0x14000000),
                  offset: Offset(0, 6),
                  blurRadius: 18,
                ),
              ]
            : const <BoxShadow>[],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: _kDesktopBannerHeight,
                  child: bannerUrl == null
                      ? ColoredBox(color: _discoveryBannerTint(guild.id))
                      : Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            ColoredBox(color: colors.backgroundTertiary),
                            CachedNetworkImage(
                              imageUrl: bannerUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) =>
                                  const SizedBox.shrink(),
                            ),
                            const DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: <Color>[
                                    Color(0x0A000000),
                                    Color(0x6B000000),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                guild.name,
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                style: textStyles.bodyMedium.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.25,
                                  color: colors.textPrimary,
                                ),
                              ),
                            ),
                            if (badgeFeatures.isNotEmpty) ...<Widget>[
                              const SizedBox(width: 4),
                              FluxerGuildBadge(
                                features: badgeFeatures,
                                badgeIds: guild.badgeIds,
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      ConstrainedBox(
                        constraints: const BoxConstraints(minHeight: 84),
                        child: Text(
                          description == null || description.isEmpty
                              ? l10n.discoveryNoDescription
                              : description,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: textStyles.bodySmall.copyWith(
                            fontSize: 14,
                            height: 1.5,
                            color: colors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: colors.backgroundModifierAccent),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: _DiscoveryDesktopStat(
                          dotColor: colors.statusOnline,
                          label: onlineLabel,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: _DiscoveryDesktopStat(
                          dotColor: colors.textTertiarySecondary,
                          label: membersLabel,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            PositionedDirectional(
              top: _kDesktopBannerHeight - 28 - 3,
              start: 16 - 3,
              child: IgnorePointer(
                child: AnimatedContainer(
                  duration: duration,
                  curve: Curves.easeOut,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: surface,
                    border: Border.all(color: surface, width: 3),
                  ),
                  child: FluxerGuildIconAvatar(
                    name: guild.name,
                    imageUrl: iconUrl,
                    isCircle: true,
                    size: _kDesktopIconSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DiscoveryDesktopStat extends StatelessWidget {
  const _DiscoveryDesktopStat({required this.dotColor, required this.label});

  final Color dotColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            label,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: context.textStyles.timestamp.copyWith(
              fontSize: 12,
              height: 1.2,
              fontWeight: FontWeight.w400,
              color: context.colors.textTertiary,
            ),
          ),
        ),
      ],
    );
  }
}
