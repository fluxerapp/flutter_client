import 'dart:math';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/shared/utils/guild_name_abbreviation.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kCornerRatio = 0.32;
const double _kUnavailableIconSize = 22;

/// Rounded-square server icon used by inbox-style notification cards.
///
/// Renders one of three states:
/// - Unavailable guild placeholder when [isUnavailable] is true.
/// - Network image with letter fallback when [imageUrl] is provided.
/// - Letter-only fallback otherwise.
class FluxerGuildIconAvatar extends StatelessWidget {
  const FluxerGuildIconAvatar({
    required this.name,
    this.imageUrl,
    this.isUnavailable = false,
    this.isCircle = false,
    this.size = 36,
    super.key,
  });

  final String name;
  final String? imageUrl;
  final bool isUnavailable;
  final bool isCircle;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final BorderRadius radius = BorderRadius.circular(
      isCircle ? size / 2 : size * _kCornerRatio,
    );
    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.serverIconBackground,
          borderRadius: radius,
        ),
        child: ClipRRect(borderRadius: radius, child: _buildContent(context)),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final colors = context.colors;
    if (isUnavailable) {
      return Center(
        child: PhosphorIcon(
          PhosphorIconsRegular.exclamationMark,
          color: colors.textOnBrandPrimary,
          size: _kUnavailableIconSize,
        ),
      );
    }
    final String? url = imageUrl;
    if (url == null) {
      return _LetterFallback(name: name, color: colors.textPrimary, size: size);
    }
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      errorBuilder: (BuildContext _, Object _, StackTrace? _) =>
          _LetterFallback(name: name, color: colors.textPrimary, size: size),
    );
  }
}

class _LetterFallback extends StatelessWidget {
  const _LetterFallback({
    required this.name,
    required this.color,
    required this.size,
  });

  final String name;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        abbreviateGuildName(name),
        style: TextStyle(
          fontSize: _guildInitialsFontSize(guildNameInitialsLength(name), size),
          fontWeight: FontWeight.w700,
          color: color,
          height: 1,
        ),
      ),
    );
  }
}

double _guildInitialsFontSize(int length, double size) {
  if (length <= 2) {
    return min(13, size * 0.55);
  }
  if (length <= kGuildIconInitialsMaxLength) {
    return min(11, size * 0.45);
  }
  return min(9, size * 0.35);
}
