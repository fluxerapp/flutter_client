import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/ui/avatar/avatar_status_layout.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_mobile_online_status_indicator.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_typing_status_indicator.dart';

const _kFallbackColors = [
  Color(0xFF5865F2),
  Color(0xFF57F287),
  Color(0xFFFEE75C),
  Color(0xFFEB459E),
  Color(0xFFED4245),
];

const Duration _kStatusTransitionDuration = Duration(milliseconds: 160);

enum _AvatarShape { circle, rounded }

enum _StatusCutoutShape { circle, typingPill, mobilePhone }

class FluxerAvatar extends StatelessWidget {
  const FluxerAvatar({
    this.imageUrl,
    this.fallbackText,
    this.size = 32,
    super.key,
  }) : _shape = _AvatarShape.circle,
       status = null,
       showStatus = false,
       isTyping = false,
       isMobileStatus = false,
       avatarColor = null,
       userId = null,
       icon = null,
       iconColor = null,
       iconBackgroundColor = null;

  const FluxerAvatar.user({
    required this.userId,
    this.imageUrl,
    this.fallbackText,
    this.status,
    this.size = 40,
    this.showStatus = true,
    this.isTyping = false,
    this.isMobileStatus = false,
    this.avatarColor,
    super.key,
  }) : _shape = _AvatarShape.circle,
       icon = null,
       iconColor = null,
       iconBackgroundColor = null;

  const FluxerAvatar.guild({
    this.imageUrl,
    this.fallbackText,
    this.size = 44,
    super.key,
  }) : _shape = _AvatarShape.rounded,
       status = null,
       showStatus = false,
       isTyping = false,
       isMobileStatus = false,
       avatarColor = null,
       userId = null,
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
       fallbackText = null,
       status = null,
       showStatus = false,
       isTyping = false,
       isMobileStatus = false,
       avatarColor = null,
       userId = null;

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
      isMobileStatus: user.mobile,
      avatarColor: user.avatarColor,
      userId: user.id,
    );
  }

  static Widget userPresence({
    required String userId,
    String? imageUrl,
    String? fallbackText,
    double size = 40,
    bool showStatus = true,
    bool isTyping = false,
    int? avatarColor,
    Key? key,
  }) {
    return _FluxerUserPresenceAvatar(
      key: key,
      userId: userId,
      imageUrl: imageUrl,
      fallbackText: fallbackText,
      size: size,
      showStatus: showStatus,
      isTyping: isTyping,
      avatarColor: avatarColor,
    );
  }

  final String? imageUrl;
  final String? fallbackText;
  final double size;
  final String? status;
  final bool showStatus;
  final bool isTyping;
  final bool isMobileStatus;
  final int? avatarColor;
  final String? userId;
  final _AvatarShape _shape;
  final IconData? icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;

  bool get _isUserAvatar => userId != null;

  String? get _defaultAvatarUrl =>
      userId == null ? null : FluxerMediaUrl.defaultAvatar(userId: userId!);

  String? get _resolvedImageUrl => imageUrl ?? _defaultAvatarUrl;

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

  bool _isMobileOnline() {
    return isMobileOnlineStatus(
      isMobileStatus: isMobileStatus,
      status: _resolvedStatus,
      isTyping: isTyping,
      size: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    final resolvedUrl = _resolvedImageUrl;
    final hasStatus = _showsStatusBadge;
    final iconData = icon;
    final bool isMobileOnline = _isMobileOnline();
    final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(size);
    final _StatusCutoutShape cutoutShape = isTyping
        ? _StatusCutoutShape.typingPill
        : isMobileOnline
        ? _StatusCutoutShape.mobilePhone
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
      avatarContent = buildFluxerNetworkAvatarImage(
        context: context,
        size: size,
        imageUrl: resolvedUrl,
        customImageUrl: imageUrl,
        defaultImageUrl: _defaultAvatarUrl,
        borderRadius: _borderRadius,
        onFinalError: _isUserAvatar
            ? () => SizedBox(width: size, height: size)
            : () => _buildLetterFallbackAvatar(context),
      );
    } else if (_isUserAvatar) {
      avatarContent = SizedBox(width: size, height: size);
    } else {
      avatarContent = _buildLetterFallbackAvatar(context);
    }

    if (hasStatus) {
      avatarContent = ClipPath(
        clipper: _StatusCutoutClipper(
          cutoutRadius: layout.cutoutRadius,
          statusCutoutCenter: layout.statusCutoutCenter,
          cutoutShape: cutoutShape,
          typingCutoutRect: layout.typingCutoutRect,
          phoneCutoutRect: layout.phoneCutoutRect,
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
              right: isTyping
                  ? layout.typingRight
                  : isMobileOnline
                  ? size - layout.phoneCutoutRect.right
                  : layout.statusRight,
              bottom: isTyping
                  ? layout.typingBottom
                  : isMobileOnline
                  ? size - layout.phoneCutoutRect.bottom
                  : layout.statusBottom,
              child: isTyping
                  ? FluxerTypingStatusIndicator(
                      status: _resolvedStatus,
                      width: layout.typingWidth,
                      height: layout.typingHeight,
                    )
                  : isMobileOnline
                  ? FluxerMobileOnlineStatusIndicator(
                      width: layout.phoneCutoutRect.width,
                      height: layout.phoneCutoutRect.height,
                      borderWidth: mobileStatusBorderWidth(
                        statusDotSize: layout.statusDotSize,
                        cutoutRadius: layout.cutoutRadius,
                      ),
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

  Widget _buildLetterFallbackAvatar(BuildContext context) {
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
        style: context.textStyles.smallText.copyWith(
          color: context.colors.textPrimary,
          fontSize: size * 0.4,
        ),
      ),
    );
  }
}

class _StatusCutoutClipper extends CustomClipper<Path> {
  const _StatusCutoutClipper({
    required this.cutoutRadius,
    required this.statusCutoutCenter,
    required this.cutoutShape,
    required this.typingCutoutRect,
    required this.phoneCutoutRect,
  });

  final double cutoutRadius;
  final Offset statusCutoutCenter;
  final _StatusCutoutShape cutoutShape;
  final RRect typingCutoutRect;
  final RRect phoneCutoutRect;

  @override
  Path getClip(Size size) {
    final Path path = Path()
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height));
    switch (cutoutShape) {
      case _StatusCutoutShape.typingPill:
        path.addRRect(typingCutoutRect);
      case _StatusCutoutShape.mobilePhone:
        path.addRRect(phoneCutoutRect);
      case _StatusCutoutShape.circle:
        path.addOval(
          Rect.fromCircle(center: statusCutoutCenter, radius: cutoutRadius),
        );
    }
    return path..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(covariant _StatusCutoutClipper oldClipper) =>
      cutoutRadius != oldClipper.cutoutRadius ||
      statusCutoutCenter != oldClipper.statusCutoutCenter ||
      cutoutShape != oldClipper.cutoutShape ||
      typingCutoutRect != oldClipper.typingCutoutRect ||
      phoneCutoutRect != oldClipper.phoneCutoutRect;
}

class _FluxerUserPresenceAvatar extends ConsumerWidget {
  const _FluxerUserPresenceAvatar({
    required this.userId,
    this.imageUrl,
    this.fallbackText,
    this.size = 40,
    this.showStatus = true,
    this.isTyping = false,
    this.avatarColor,
    super.key,
  });

  final String userId;
  final String? imageUrl;
  final String? fallbackText;
  final double size;
  final bool showStatus;
  final bool isTyping;
  final int? avatarColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenceUser = ref.watch(userPresenceProvider(userId)).value;
    return FluxerAvatar.user(
      imageUrl: imageUrl,
      fallbackText: fallbackText,
      status: presenceUser?.status,
      size: size,
      showStatus: showStatus,
      isTyping: isTyping,
      isMobileStatus: presenceUser?.mobile ?? false,
      avatarColor: avatarColor,
      userId: userId,
    );
  }
}

Widget buildFluxerNetworkAvatarImage({
  required BuildContext context,
  required double size,
  required String imageUrl,
  String? customImageUrl,
  String? defaultImageUrl,
  BorderRadius? borderRadius,
  Widget Function()? onFinalError,
}) {
  final double devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
  final BorderRadius resolvedBorderRadius =
      borderRadius ?? BorderRadius.circular(size / 2);
  final Widget emptyFallback =
      onFinalError?.call() ?? SizedBox(width: size, height: size);

  Widget networkImage(String url, {required Widget Function() onError}) {
    return ClipRRect(
      borderRadius: resolvedBorderRadius,
      child: CachedNetworkImage(
        imageUrl: url,
        width: size,
        height: size,
        memCacheWidth: (size * devicePixelRatio).round(),
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => onError(),
      ),
    );
  }

  return networkImage(
    imageUrl,
    onError: () {
      if (customImageUrl != null &&
          defaultImageUrl != null &&
          imageUrl != defaultImageUrl) {
        return networkImage(defaultImageUrl, onError: () => emptyFallback);
      }
      return emptyFallback;
    },
  );
}
