import 'dart:convert';
import 'dart:typed_data';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_guild_badge.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/guild_name_abbreviation.dart';

class GuildInviteEmbedPreview extends StatelessWidget {
  const GuildInviteEmbedPreview({
    required this.guildName,
    required this.features,
    required this.onlineCount,
    required this.memberCount,
    required this.l10n,
    this.iconDataUri,
    this.iconNetworkUrl,
    this.splashDataUri,
    this.splashNetworkUrl,
    super.key,
  });

  final String guildName;
  final List<String> features;
  final int onlineCount;
  final int memberCount;
  final FluxerLocalizations l10n;
  final String? iconDataUri;
  final String? iconNetworkUrl;
  final String? splashDataUri;
  final String? splashNetworkUrl;

  static const double _splashAspectRatio = 16 / 9;

  @override
  Widget build(BuildContext context) {
    final Widget? splash = _buildSplash();
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
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
          children: <Widget>[
            ?splash,
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 48,
                    child: Center(child: _buildIcon(context)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                guildName,
                                style: context.textStyles.channelName.copyWith(
                                  fontSize: 15,
                                  letterSpacing: -0.1,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: FluxerGuildBadge(features: features),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        _buildStats(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1, thickness: 1, color: context.colors.borderColor),
            Padding(
              padding: const EdgeInsets.all(12),
              child: FluxerButton.primary(label: l10n.embedInviteJoin),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStats(BuildContext context) {
    return Row(
      children: <Widget>[
        _StatDot(online: true, color: context.colors.statusOnline),
        const SizedBox(width: 4),
        Text(
          l10n.embedInviteOnline(_formatCount(onlineCount)),
          style: context.textStyles.timestamp.copyWith(
            color: context.colors.textTertiaryMuted,
          ),
        ),
        const SizedBox(width: 10),
        _StatDot(online: false, color: context.colors.textTertiaryMuted),
        const SizedBox(width: 4),
        Text(
          l10n.embedInviteMembers(_formatCount(memberCount)),
          style: context.textStyles.timestamp.copyWith(
            color: context.colors.textTertiaryMuted,
          ),
        ),
      ],
    );
  }

  Widget? _buildSplash() {
    final Uint8List? splashBytes = _decodeDataUri(splashDataUri);
    if (splashBytes != null) {
      return AspectRatio(
        aspectRatio: _splashAspectRatio,
        child: Image.memory(
          splashBytes,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    }
    final String? splashUrl = splashNetworkUrl;
    if (splashUrl == null) {
      return null;
    }
    return AspectRatio(
      aspectRatio: _splashAspectRatio,
      child: CachedNetworkImage(
        imageUrl: splashUrl,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    final Uint8List? iconBytes = _decodeDataUri(iconDataUri);
    if (iconBytes != null) {
      return ClipOval(
        child: Image.memory(
          iconBytes,
          width: 44,
          height: 44,
          fit: BoxFit.cover,
        ),
      );
    }
    final String? iconUrl = iconNetworkUrl;
    if (iconUrl != null) {
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: iconUrl,
          width: 44,
          height: 44,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => _buildIconFallback(context),
        ),
      );
    }
    return _buildIconFallback(context);
  }

  Widget _buildIconFallback(BuildContext context) {
    final String initials = abbreviateGuildName(guildName);
    final int initialsLength = guildNameInitialsLength(guildName);
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: context.colors.backgroundTertiary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          initials,
          style: context.textStyles.smallText.copyWith(
            color: context.colors.textPrimary,
            fontSize: _guildInviteInitialsFontSize(initialsLength),
          ),
        ),
      ),
    );
  }

  Uint8List? _decodeDataUri(String? dataUri) {
    if (dataUri == null) {
      return null;
    }
    final int commaIndex = dataUri.indexOf(',');
    if (commaIndex < 0) {
      return null;
    }
    try {
      return base64Decode(dataUri.substring(commaIndex + 1));
    } on FormatException {
      return null;
    }
  }

  static String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    }
    if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return '$count';
  }

  static double _guildInviteInitialsFontSize(int initialsLength) {
    if (initialsLength <= 2) {
      return 18;
    }
    if (initialsLength <= kGuildIconInitialsMaxLength) {
      return 15;
    }
    return 12;
  }
}

class _StatDot extends StatelessWidget {
  const _StatDot({required this.online, required this.color});

  final bool online;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
