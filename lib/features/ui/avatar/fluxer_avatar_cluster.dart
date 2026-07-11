import 'dart:math' as math;

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/media/fluxer_media_cdn.dart';
import 'package:fluxer_app/features/ui/avatar/avatar_status_layout.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_typing_status_indicator.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kAccentColors = [
  Color(0xFF5865F2),
  Color(0xFF57F287),
  Color(0xFFFEE75C),
  Color(0xFFEB459E),
  Color(0xFFED4245),
  Color(0xFF9B59B6),
];

const _kDefaultAvatarCount = 6;
String get _kStaticCdnUrl => fluxerStaticCdn;
const _kAvatarBorderSize = 2.0;
const Duration _kStatusTransitionDuration = Duration(milliseconds: 160);

enum _ClusterStatusCutoutShape { circle, typingPill }

@visibleForTesting
bool avatarClusterGeometryChanged({
  required Offset ownCenter,
  required double ownRadius,
  required List<Rect> cutouts,
  required Offset oldOwnCenter,
  required double oldOwnRadius,
  required List<Rect> oldCutouts,
}) {
  return ownCenter != oldOwnCenter ||
      ownRadius != oldOwnRadius ||
      !listEquals(cutouts, oldCutouts);
}

class AvatarClusterMember {
  final String userId;
  final String? imageUrl;
  final String fallbackText;

  const AvatarClusterMember({
    required this.userId,
    required this.fallbackText,
    this.imageUrl,
  });

  String get resolvedImageUrl {
    if (imageUrl != null) {
      return imageUrl!;
    }
    final parsedUserId = BigInt.tryParse(userId);
    final index = parsedUserId != null
        ? parsedUserId % BigInt.from(_kDefaultAvatarCount)
        : BigInt.from(userId.hashCode.abs() % _kDefaultAvatarCount);
    return '$_kStaticCdnUrl/avatars/$index.png';
  }
}

class FluxerAvatarCluster extends StatelessWidget {
  const FluxerAvatarCluster({
    required this.channelId,
    this.iconUrl,
    this.status,
    this.isTyping = false,
    this.members = const [],
    this.size = 32,
    super.key,
  });

  final String channelId;
  final String? iconUrl;
  final String? status;
  final bool isTyping;
  final List<AvatarClusterMember> members;
  final double size;

  Color get _accentColor {
    if (channelId.isEmpty) {
      return _kAccentColors[0];
    }
    var hash = 0;
    for (var i = 0; i < channelId.length; i++) {
      hash = ((hash << 5) - hash + channelId.codeUnitAt(i)).toSigned(32);
    }
    return _kAccentColors[hash.abs() % _kAccentColors.length];
  }

  bool get _showsTypingIndicator => isTyping && status != null;

  bool get _showsStatusBadge => status != null;

  @override
  Widget build(BuildContext context) {
    Widget avatar;
    if (iconUrl != null) {
      avatar = _buildCustomIcon();
    } else if (members.length >= 2) {
      avatar = _buildCluster(context);
    } else {
      avatar = _buildFallback();
    }

    if (!_showsStatusBadge) {
      return avatar;
    }

    final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(size);
    final _ClusterStatusCutoutShape cutoutShape = _showsTypingIndicator
        ? _ClusterStatusCutoutShape.typingPill
        : _ClusterStatusCutoutShape.circle;

    avatar = ClipPath(
      clipper: _ClusterStatusCutoutClipper(
        avatarSize: size,
        cutoutRadius: layout.cutoutRadius,
        statusDotSize: layout.statusDotSize,
        cutoutShape: cutoutShape,
        typingCutoutRect: layout.typingCutoutRect,
      ),
      child: avatar,
    );

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          avatar,
          AnimatedPositioned(
            duration: _kStatusTransitionDuration,
            curve: Curves.easeOut,
            right: _showsTypingIndicator
                ? layout.typingRight
                : layout.statusRight,
            bottom: _showsTypingIndicator
                ? layout.typingBottom
                : layout.statusBottom,
            child: _showsTypingIndicator
                ? FluxerTypingStatusIndicator(
                    status: status!,
                    width: layout.typingWidth,
                    height: layout.typingHeight,
                  )
                : FluxerStatusIndicator(
                    status: status!,
                    size: layout.statusDotSize,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomIcon() {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.antiAlias,
      child: CachedNetworkImage(
        imageUrl: iconUrl!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _buildFallback(),
      ),
    );
  }

  Widget _buildFallback() {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: _accentColor),
      alignment: Alignment.center,
      child: PhosphorIcon(
        PhosphorIconsFill.usersThree,
        size: size * 0.55,
        color: Colors.white,
      ),
    );
  }

  Widget _buildCluster(BuildContext context) {
    final count = math.min(members.length, 3);
    final displayMembers = members.take(count).toList();

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          for (var i = 0; i < count; i++)
            _buildClusterAvatar(displayMembers[i], i, count),
        ],
      ),
    );
  }

  Widget _buildClusterAvatar(AvatarClusterMember member, int index, int count) {
    final pos = _getPosition(count, index);
    final avatar = _buildMemberCircle(member, pos.avatarSize);

    final cutouts = <_CircleCutout>[];
    for (var j = index + 1; j < count; j++) {
      final other = _getPosition(count, j);
      cutouts.add(
        _CircleCutout(
          cx: other.left - pos.left + other.avatarSize / 2,
          cy: other.top - pos.top + other.avatarSize / 2,
          radius: other.avatarSize / 2 + _kAvatarBorderSize,
        ),
      );
    }

    if (cutouts.isEmpty) {
      return Positioned(top: pos.top, left: pos.left, child: avatar);
    }

    return Positioned(
      top: pos.top,
      left: pos.left,
      child: ClipPath(
        clipper: _ClusterOverlapClipper(
          ownCenter: Offset(pos.avatarSize / 2, pos.avatarSize / 2),
          ownRadius: pos.avatarSize / 2,
          cutouts: cutouts,
        ),
        child: avatar,
      ),
    );
  }

  Widget _buildMemberCircle(AvatarClusterMember member, double avatarSize) {
    final text = member.fallbackText;
    final initial = (text.isNotEmpty) ? text[0].toUpperCase() : '?';
    final fallbackColor =
        _kAccentColors[text.hashCode.abs() % _kAccentColors.length];

    return ClipOval(
      child: SizedBox(
        width: avatarSize,
        height: avatarSize,
        child: CachedNetworkImage(
          imageUrl: member.resolvedImageUrl,
          width: avatarSize,
          height: avatarSize,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => Container(
            color: fallbackColor,
            alignment: Alignment.center,
            child: Text(
              initial,
              style: TextStyle(
                color: Colors.white,
                fontSize: avatarSize * 0.4,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _AvatarPosition _getPosition(int count, int index) {
    if (count == 2) {
      final avatarSize = size * 0.7;
      final inset = math.min(size * 0.06, avatarSize * 0.18);
      if (index == 0) {
        return _AvatarPosition(top: inset, left: 0, avatarSize: avatarSize);
      }
      return _AvatarPosition(
        top: size - avatarSize - inset,
        left: size - avatarSize,
        avatarSize: avatarSize,
      );
    }

    final avatarSize = size * 0.68;
    final inset = math.min(size * 0.04, avatarSize * 0.12);
    final topRow = inset;
    final bottomRow = size - avatarSize - inset;

    if (index == 0) {
      return _AvatarPosition(top: topRow, left: 0, avatarSize: avatarSize);
    }
    if (index == 1) {
      return _AvatarPosition(
        top: topRow,
        left: size - avatarSize,
        avatarSize: avatarSize,
      );
    }
    return _AvatarPosition(
      top: bottomRow,
      left: (size - avatarSize) / 2,
      avatarSize: avatarSize,
    );
  }
}

class _AvatarPosition {
  final double top;
  final double left;
  final double avatarSize;

  const _AvatarPosition({
    required this.top,
    required this.left,
    required this.avatarSize,
  });
}

class _CircleCutout {
  final double cx;
  final double cy;
  final double radius;

  const _CircleCutout({
    required this.cx,
    required this.cy,
    required this.radius,
  });

  Rect get oval => Rect.fromCircle(center: Offset(cx, cy), radius: radius);
}

class _ClusterStatusCutoutClipper extends CustomClipper<Path> {
  const _ClusterStatusCutoutClipper({
    required this.avatarSize,
    required this.cutoutRadius,
    required this.statusDotSize,
    required this.cutoutShape,
    required this.typingCutoutRect,
  });

  final double avatarSize;
  final double cutoutRadius;
  final double statusDotSize;
  final _ClusterStatusCutoutShape cutoutShape;
  final RRect typingCutoutRect;

  @override
  Path getClip(Size size) {
    final Path path = Path()
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height));
    if (cutoutShape == _ClusterStatusCutoutShape.typingPill) {
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
  bool shouldReclip(covariant _ClusterStatusCutoutClipper oldClipper) =>
      avatarSize != oldClipper.avatarSize ||
      cutoutRadius != oldClipper.cutoutRadius ||
      statusDotSize != oldClipper.statusDotSize ||
      cutoutShape != oldClipper.cutoutShape ||
      typingCutoutRect != oldClipper.typingCutoutRect;
}

class _ClusterOverlapClipper extends CustomClipper<Path> {
  const _ClusterOverlapClipper({
    required this.ownCenter,
    required this.ownRadius,
    required this.cutouts,
  });

  final Offset ownCenter;
  final double ownRadius;
  final List<_CircleCutout> cutouts;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..addOval(Rect.fromCircle(center: ownCenter, radius: ownRadius));
    for (final c in cutouts) {
      path.addOval(c.oval);
    }
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(covariant _ClusterOverlapClipper oldClipper) =>
      avatarClusterGeometryChanged(
        ownCenter: ownCenter,
        ownRadius: ownRadius,
        cutouts: cutouts.map((cutout) => cutout.oval).toList(growable: false),
        oldOwnCenter: oldClipper.ownCenter,
        oldOwnRadius: oldClipper.ownRadius,
        oldCutouts: oldClipper.cutouts
            .map((cutout) => cutout.oval)
            .toList(growable: false),
      );
}
