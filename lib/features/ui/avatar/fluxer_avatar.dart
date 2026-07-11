import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_cdn.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/avatar/avatar_status_layout.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_typing_status_indicator.dart';

const _kDefaultAvatarCount = 6;
String get _kStaticCdnUrl => fluxerStaticCdn;

const _kFallbackColors = [
  Color(0xFF5865F2),
  Color(0xFF57F287),
  Color(0xFFFEE75C),
  Color(0xFFEB459E),
  Color(0xFFED4245),
];

const Duration _kStatusTransitionDuration = Duration(milliseconds: 160);

enum _AvatarShape { circle, rounded }

enum _StatusCutoutShape { circle, typingPill }

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
       isTyping = false,
       avatarColor = null,
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
    this.isTyping = false,
    this.avatarColor,
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
       isTyping = false,
       avatarColor = null,
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
       isTyping = false,
       avatarColor = null,
       _userId = null;

  factory FluxerAvatar.fromUserRow(
    db.User user, {
    double size = 40,
    bool showStatus = true,
    bool isTyping = false,
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
      isTyping: isTyping,
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
  final bool isTyping;
  final int? avatarColor;
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
    if (avatarColor != null) {
      return Color(avatarColor!);
    }
    final text = fallbackText ?? '';
    return _kFallbackColors[text.hashCode.abs() % _kFallbackColors.length];
  }

  BorderRadius get _borderRadius => _shape == _AvatarShape.rounded
      ? BorderRadius.circular(size * 0.27)
      : BorderRadius.circular(size / 2);

  bool get _showsStatusBadge => isTyping || (showStatus && status != null);

  String get _resolvedStatus => status ?? 'offline';

  @override
  Widget build(BuildContext context) {
    final resolvedUrl = _resolvedImageUrl;
    final hasStatus = _showsStatusBadge;
    final iconData = icon;
    final double dpr = MediaQuery.devicePixelRatioOf(context);
    final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(size);
    final _StatusCutoutShape cutoutShape = isTyping
        ? _StatusCutoutShape.typingPill
        : _StatusCutoutShape.circle;

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
    } else if (resolvedUrl != null) {
      avatarContent = ClipRRect(
        borderRadius: _borderRadius,
        child: CachedNetworkImage(
          imageUrl: resolvedUrl,
          cacheKey: cacheKey,
          width: size,
          height: size,
          memCacheWidth: (size * dpr).round(),
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => _buildFallbackAvatar(context),
        ),
      );
    } else {
      avatarContent = _buildFallbackAvatar(context);
    }

    if (hasStatus) {
      avatarContent = ClipPath(
        clipper: _StatusCutoutClipper(
          avatarSize: size,
          cutoutRadius: layout.cutoutRadius,
          statusDotSize: layout.statusDotSize,
          cutoutShape: cutoutShape,
          typingCutoutRect: layout.typingCutoutRect,
        ),
        child: avatarContent,
      );
    }

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          avatarContent,
          if (hasStatus)
            AnimatedPositioned(
              duration: _kStatusTransitionDuration,
              curve: Curves.easeOut,
              right: isTyping ? layout.typingRight : layout.statusRight,
              bottom: isTyping ? layout.typingBottom : layout.statusBottom,
              child: isTyping
                  ? FluxerTypingStatusIndicator(
                      status: _resolvedStatus,
                      width: layout.typingWidth,
                      height: layout.typingHeight,
                    )
                  : FluxerStatusIndicator(
                      status: _resolvedStatus,
                      size: layout.statusDotSize,
                    ),
            ),
        ],
      ),
    );
  }

  Widget _buildFallbackAvatar(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: _borderRadius,
      ),
      child: _buildFallback(context),
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
    required this.cutoutShape,
    required this.typingCutoutRect,
  });

  final double avatarSize;
  final double cutoutRadius;
  final double statusDotSize;
  final _StatusCutoutShape cutoutShape;
  final RRect typingCutoutRect;

  @override
  Path getClip(Size size) {
    final Path path = Path()
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height));
    if (cutoutShape == _StatusCutoutShape.typingPill) {
      path.addRRect(typingCutoutRect);
    } else {
      final Offset center = Offset(
        avatarSize - statusDotSize / 2,
        avatarSize - statusDotSize / 2,
      );
      path.addOval(Rect.fromCircle(center: center, radius: cutoutRadius));
    }
    return path..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(covariant _StatusCutoutClipper oldClipper) =>
      avatarSize != oldClipper.avatarSize ||
      cutoutRadius != oldClipper.cutoutRadius ||
      statusDotSize != oldClipper.statusDotSize ||
      cutoutShape != oldClipper.cutoutShape ||
      typingCutoutRect != oldClipper.typingCutoutRect;
}
