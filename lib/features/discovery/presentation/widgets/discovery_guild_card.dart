import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_hash.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/discovery/domain/discovery_category_labels.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_guild_context_menu.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_join_error_dialog.dart';
import 'package:fluxer_app/features/discovery/providers/discovery_controller.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/moderation/iar/iar_report_guild.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_icon_avatar.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_guild_badge.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const String _discoverableFeature = 'DISCOVERABLE';
const double _discoveryGuildIconSize = 48;

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
    final String onlineCount = NumberFormat.decimalPattern(
      Localizations.localeOf(context).toString(),
    ).format(guild.onlineCount);
    final num memberCount = guild.memberCount;
    final bool isMobile = isMobileLayout(context);
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
                          guild.id,
                        ),
                      );
                    },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(
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
                                    FluxerGuildBadge(features: badgeFeatures),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (categoryLabel != null) ...<Widget>[
                          SizedBox(height: layout.s2),
                          Text(
                            categoryLabel.toUpperCase(),
                            style: textStyles.label.copyWith(
                              color: colors.textTertiaryMuted,
                              letterSpacing: 0.4,
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
              Positioned(
                top: layout.s1,
                right: layout.s1,
                child: _DiscoveryCardMenuButton(
                  tooltip: l10n.chatMessageMore,
                  onPressed: (Offset position) {
                    unawaited(
                      _showContextMenu(context, ref, position, guild.id),
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
    String guildId,
  ) async {
    final DiscoveryGuildCardAction? action =
        await showDiscoveryGuildContextMenu(context, position: position);
    if (action == null || !context.mounted) {
      return;
    }
    await handleDiscoveryGuildCardAction(
      context: context,
      action: action,
      guildId: guildId,
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
        await showReportGuildFlow(
          context,
          guildId: guild.id,
          guildName: guild.name,
        );
    }
  }

  Future<void> _handleJoin({
    required BuildContext context,
    required WidgetRef ref,
    required String guildId,
  }) async {
    try {
      await ref.read(discoveryControllerProvider.notifier).joinGuild(guildId);
      if (!context.mounted) {
        return;
      }
      context.go(RoutePaths.guild(guildId));
    } on DioException catch (error) {
      if (!context.mounted) {
        return;
      }
      await DiscoveryJoinErrorDialog.show(context, error: error);
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
