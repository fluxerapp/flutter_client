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
    this.initialsColor,
    this.initialsFontWeight = FontWeight.w600,
    this.size = 36,
    super.key,
  });

  final String name;
  final String? imageUrl;
  final bool isUnavailable;
  final bool isCircle;
  final Color? initialsColor;
  final FontWeight initialsFontWeight;
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
    final Color fallbackColor = initialsColor ?? colors.textTertiary;
    if (url == null) {
      return _LetterFallback(
        name: name,
        color: fallbackColor,
        fontWeight: initialsFontWeight,
        size: size,
      );
    }
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      errorBuilder: (BuildContext _, Object _, StackTrace? _) =>
          _LetterFallback(
            name: name,
            color: fallbackColor,
            fontWeight: initialsFontWeight,
            size: size,
          ),
    );
  }
}

class _LetterFallback extends StatelessWidget {
  const _LetterFallback({
    required this.name,
    required this.color,
    required this.fontWeight,
    required this.size,
  });

  final String name;
  final Color color;
  final FontWeight fontWeight;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        abbreviateGuildName(name),
        style: TextStyle(
          fontSize: _guildInitialsFontSize(guildNameInitialsLength(name), size),
          fontWeight: fontWeight,
          color: color,
          height: 1,
        ),
      ),
    );
  }
}

double _guildInitialsFontSize(int length, double size) {
  if (length <= 2) {
    return (size * 0.275).clamp(10, 22);
  }
  if (length <= kGuildIconInitialsMaxLength) {
    return (size * 0.225).clamp(9, 18);
  }
  return (size * 0.1875).clamp(8, 15);
}
