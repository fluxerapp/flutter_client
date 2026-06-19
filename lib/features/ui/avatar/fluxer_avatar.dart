import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_cdn.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';

const _kDefaultAvatarCount = 6;
String get _kStaticCdnUrl => fluxerStaticCdn;

const _kFallbackColors = [
  Color(0xFF5865F2),
  Color(0xFF57F287),
  Color(0xFFFEE75C),
  Color(0xFFEB459E),
  Color(0xFFED4245),
];

enum _AvatarShape { circle, rounded }

class FluxerAvatar extends StatelessWidget {
  const FluxerAvatar({
    this.imageUrl,
    this.fallbackText,
    this.size = 32,
    this.cacheKey,
    super.key,
  }) : _shape = _AvatarShape.circle,
       status = null,
       showStatus = false,
       avatarColor = null,
       roleColor = null,
       _userId = null,
       icon = null,
       iconColor = null,
       iconBackgroundColor = null;

  const FluxerAvatar.user({
    this.imageUrl,
    this.fallbackText,
    this.status,
    this.size = 40,
    this.showStatus = true,
    this.avatarColor,
    this.roleColor,
    this.cacheKey,
    String? userId,
    super.key,
  }) : _shape = _AvatarShape.circle,
       _userId = userId,
       icon = null,
       iconColor = null,
       iconBackgroundColor = null;

  const FluxerAvatar.guild({
    this.imageUrl,
    this.fallbackText,
    this.size = 44,
    this.cacheKey,
    super.key,
  }) : _shape = _AvatarShape.rounded,
       status = null,
       showStatus = false,
       avatarColor = null,
       roleColor = null,
       _userId = null,
       icon = null,
       iconColor = null,
       iconBackgroundColor = null;

  /// Icon centered on a colored disc — use for channel-type avatars.
  const FluxerAvatar.icon({
    required IconData this.icon,
    this.size = 40,
    this.iconColor,
    this.iconBackgroundColor,
    super.key,
  }) : _shape = _AvatarShape.circle,
       imageUrl = null,
       cacheKey = null,
       fallbackText = null,
       status = null,
       showStatus = false,
       avatarColor = null,
       roleColor = null,
       _userId = null;

  factory FluxerAvatar.fromUserRow(
    db.User user, {
    double size = 40,
    bool showStatus = true,
  }) {
    final String? url = FluxerMediaUrl.userAvatar(
      userId: user.id,
      hash: user.avatar,
    );
    return FluxerAvatar.user(
      imageUrl: url,
      fallbackText: user.globalName ?? user.username,
      status: user.status,
      size: size,
      showStatus: showStatus,
      avatarColor: user.avatarColor,
      userId: user.id,
    );
  }

  final String? imageUrl;
  final String? cacheKey;
  final String? fallbackText;
  final double size;
  final String? status;
  final bool showStatus;
  final int? avatarColor;
  final int? roleColor;
  final _AvatarShape _shape;
  final String? _userId;
  final IconData? icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;

  String? get _resolvedImageUrl {
    if (imageUrl != null) {
      return imageUrl;
    }
    final userId = _userId;
    if (userId == null || userId.isEmpty) {
      return null;
    }
    final index = BigInt.parse(userId) % BigInt.from(_kDefaultAvatarCount);
    return '$_kStaticCdnUrl/avatars/$index.png';
  }

  Color get _backgroundColor {
    if (roleColor != null) {
      return Color(roleColor!);
    }
    if (avatarColor != null) {
      return Color(avatarColor!);
    }
    final text = fallbackText ?? '';
    return _kFallbackColors[text.hashCode.abs() % _kFallbackColors.length];
  }

  double get _statusDotSize {
    if (size <= 36) {
      return 10;
    }
    if (size <= 40) {
      return 12;
    }
    if (size <= 48) {
      return 14;
    }
    if (size <= 80) {
      return 16;
    }
    return 24;
  }

  double get _cutoutRadius {
    if (size <= 20) {
      return 5;
    }
    if (size <= 24) {
      return 7;
    }
    if (size <= 36) {
      return 8;
    }
    if (size <= 40) {
      return 9;
    }
    if (size <= 48) {
      return 10;
    }
    if (size <= 56) {
      return 11;
    }
    if (size <= 80) {
      return 14;
    }
    return 20;
  }

  BorderRadius get _borderRadius => _shape == _AvatarShape.rounded
      ? BorderRadius.circular(size * 0.27)
      : BorderRadius.circular(size / 2);

  @override
  Widget build(BuildContext context) {
    final resolvedUrl = _resolvedImageUrl;
    final hasStatus = showStatus && status != null;
    final iconData = icon;
    final double dpr = MediaQuery.devicePixelRatioOf(context);

    Widget avatarContent;
    if (iconData != null) {
      avatarContent = Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: iconBackgroundColor ?? context.colors.backgroundTertiary,
          borderRadius: _borderRadius,
        ),
        child: Center(
          child: Icon(
            iconData,
            size: size * 0.5,
            color: iconColor ?? context.colors.textPrimary,
          ),
        ),
      );
    } else {
      avatarContent = Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: _borderRadius,
        ),
        child: ClipRRect(
          borderRadius: _borderRadius,
          child: resolvedUrl != null
              ? CachedNetworkImage(
                  imageUrl: resolvedUrl,
                  cacheKey: cacheKey,
                  width: size,
                  height: size,
                  memCacheWidth: (size * dpr).round(),
                  memCacheHeight: (size * dpr).round(),
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => _buildFallback(context),
                )
              : _buildFallback(context),
        ),
      );
    }

    if (hasStatus) {
      avatarContent = ClipPath(
        clipper: _StatusCutoutClipper(
          avatarSize: size,
          cutoutRadius: _cutoutRadius,
          statusDotSize: _statusDotSize,
        ),
        child: avatarContent,
      );
    }

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          avatarContent,
          if (hasStatus)
            Positioned(
              right: 0,
              bottom: 0,
              child: FluxerStatusIndicator(
                status: status!,
                size: _statusDotSize,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFallback(BuildContext context) {
    final text = fallbackText;
    final initial = (text != null && text.isNotEmpty)
        ? text[0].toUpperCase()
        : '?';
    return Center(
      child: Text(
        initial,
        style: TextStyle(
          color: context.colors.textPrimary,
          fontSize: size * 0.4,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _StatusCutoutClipper extends CustomClipper<Path> {
  const _StatusCutoutClipper({
    required this.avatarSize,
    required this.cutoutRadius,
    required this.statusDotSize,
  });

  final double avatarSize;
  final double cutoutRadius;
  final double statusDotSize;

  @override
  Path getClip(Size size) {
    final center = Offset(
      avatarSize - statusDotSize / 2,
      avatarSize - statusDotSize / 2,
    );

    return Path()
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addOval(Rect.fromCircle(center: center, radius: cutoutRadius))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(covariant _StatusCutoutClipper oldClipper) =>
      avatarSize != oldClipper.avatarSize ||
      cutoutRadius != oldClipper.cutoutRadius ||
      statusDotSize != oldClipper.statusDotSize;
}
