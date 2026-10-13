import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/accessibility/domain/text_scale.dart';
import 'package:fluxer_app/features/accessibility/presentation/allow_image_frame_animation.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_status_badge.dart';
import 'package:fluxer_app/material_ui.dart';

const _kFallbackColors = [
  Color(0xFF5865F2),
  Color(0xFF57F287),
  Color(0xFFFEE75C),
  Color(0xFFEB459E),
  Color(0xFFED4245),
];

class FluxerAvatar extends StatelessWidget {
  const FluxerAvatar({
    this.imageUrl,
    this.fallbackText,
    this.size = 32,
    super.key,
  }) : status = null,
       showStatus = false,
       isTyping = false,
       isMobileStatus = false,
       avatarColor = null,
       userId = null,
       icon = null,
       iconColor = null,
       iconBackgroundColor = null,
       fadeInDuration = Duration.zero;

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
    this.fadeInDuration = Duration.zero,
    super.key,
  }) : icon = null,
       iconColor = null,
       iconBackgroundColor = null;

  const FluxerAvatar.icon({
    required IconData this.icon,
    this.size = 40,
    this.iconColor,
    this.iconBackgroundColor,
    super.key,
  }) : imageUrl = null,
       fallbackText = null,
       status = null,
       showStatus = false,
       isTyping = false,
       isMobileStatus = false,
       avatarColor = null,
       userId = null,
       fadeInDuration = Duration.zero;

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
  final IconData? icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final Duration fadeInDuration;

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

  BorderRadius get _borderRadius => BorderRadius.circular(size / 2);

  @override
  Widget build(BuildContext context) {
    final iconData = icon;
    final String? resolvedUrl = _resolvedImageUrl;

    final Widget avatarContent;
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
    } else if (_isUserAvatar) {
      avatarContent = FluxerNetworkAvatarImage(
        size: size,
        imageUrl: resolvedUrl,
        fallbackImageUrl: _defaultAvatarUrl,
        placeholderColor: avatarColor == null ? null : Color(avatarColor!),
        fadeInDuration: fadeInDuration,
      );
    } else if (resolvedUrl != null) {
      avatarContent = FluxerNetworkAvatarImage(
        size: size,
        imageUrl: resolvedUrl,
        borderRadius: _borderRadius,
        errorBuilder: () => _buildLetterFallbackAvatar(context),
      );
    } else {
      avatarContent = _buildLetterFallbackAvatar(context);
    }

    if (!_isUserAvatar) {
      return avatarContent;
    }
    return FluxerAvatarStatusBadge(
      size: size,
      status: showStatus ? status : null,
      isTyping: isTyping,
      isMobileStatus: isMobileStatus,
      child: avatarContent,
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
        textScaler: kIconInitialsTextScaler,
        style: context.textStyles.smallText.copyWith(
          color: context.colors.textPrimary,
          fontSize: size * 0.4,
        ),
      ),
    );
  }
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
    final presenceUser = watchLastKnownUserPresence(ref, userId);
    final String? selfStatus = ref.watch(currentUserIdProvider) == userId
        ? ref.watch(userSettingsStatusProvider)?.status
        : null;
    return FluxerAvatar.user(
      imageUrl: imageUrl,
      fallbackText: fallbackText,
      status: presenceUser?.status ?? selfStatus ?? 'offline',
      size: size,
      showStatus: showStatus,
      isTyping: isTyping,
      isMobileStatus: presenceUser?.mobile ?? false,
      avatarColor: avatarColor,
      userId: userId,
    );
  }
}

class FluxerNetworkAvatarImage extends StatelessWidget {
  const FluxerNetworkAvatarImage({
    required this.size,
    required this.imageUrl,
    this.fallbackImageUrl,
    this.borderRadius,
    this.placeholderColor,
    this.errorBuilder,
    this.fadeInDuration = Duration.zero,
    super.key,
  });

  final double size;
  final String? imageUrl;
  final String? fallbackImageUrl;
  final BorderRadius? borderRadius;
  final Color? placeholderColor;
  final Widget Function()? errorBuilder;
  final Duration fadeInDuration;

  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    Widget placeholder() => SizedBox.square(
      dimension: size,
      child: ColoredBox(
        color: placeholderColor ?? context.colors.backgroundModifierAccent,
      ),
    );
    Widget finalError() => errorBuilder?.call() ?? placeholder();

    Widget networkImage(String url, {required Widget Function() onError}) {
      final bool animated = url.contains('animated=true');
      final Widget image = CachedNetworkImage(
        imageUrl: url,
        width: size,
        height: size,
        memCacheWidth: animated ? null : (size * devicePixelRatio).round(),
        fit: BoxFit.cover,
        fadeInDuration: fadeInDuration,
        fadeInCurve: Curves.linear,
        fadeOutDuration: Duration.zero,
        useOldImageOnUrlChange: true,
        placeholder: (_, _) => placeholder(),
        errorBuilder: (_, _, _) => onError(),
      );
      return animated ? AllowImageFrameAnimation(child: image) : image;
    }

    final String? url = imageUrl;
    final String? fallbackUrl = fallbackImageUrl;
    final Widget image = url == null
        ? finalError()
        : networkImage(
            url,
            onError: () => fallbackUrl != null && url != fallbackUrl
                ? networkImage(fallbackUrl, onError: finalError)
                : finalError(),
          );
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(size / 2),
      child: image,
    );
  }
}
