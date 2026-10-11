import 'dart:ui' show lerpDouble;

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/avatar/avatar_status_layout.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_mobile_online_status_indicator.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_typing_status_indicator.dart';
import 'package:fluxer_app/material_ui.dart';

const Duration kAvatarStatusTransitionDuration = Duration(milliseconds: 160);

enum _BadgeKind { none, dot, typing, phone }

class FluxerAvatarStatusBadge extends StatefulWidget {
  const FluxerAvatarStatusBadge({
    required this.size,
    required this.child,
    this.status,
    this.isTyping = false,
    this.isMobileStatus = false,
    super.key,
  });

  final double size;
  final Widget child;
  final String? status;
  final bool isTyping;
  final bool isMobileStatus;

  @override
  State<FluxerAvatarStatusBadge> createState() =>
      _FluxerAvatarStatusBadgeState();
}

class _FluxerAvatarStatusBadgeState extends State<FluxerAvatarStatusBadge> {
  late _BadgeKind _shownKind;
  late String _shownStatus;

  @override
  void initState() {
    super.initState();
    _shownKind = _targetKind;
    _shownStatus = widget.status ?? 'online';
  }

  @override
  void didUpdateWidget(FluxerAvatarStatusBadge oldWidget) {
    super.didUpdateWidget(oldWidget);
    final _BadgeKind kind = _targetKind;
    if (kind != _BadgeKind.none) {
      _shownKind = kind;
      _shownStatus = widget.status ?? 'online';
    }
  }

  _BadgeKind get _targetKind {
    if (widget.size <= kMinAvatarSizeForStatus) {
      return _BadgeKind.none;
    }
    if (widget.isTyping) {
      return _BadgeKind.typing;
    }
    final String? status = widget.status;
    if (status == null) {
      return _BadgeKind.none;
    }
    return isMobileOnlineStatus(
          isMobileStatus: widget.isMobileStatus,
          status: status,
          isTyping: false,
          size: widget.size,
        )
        ? _BadgeKind.phone
        : _BadgeKind.dot;
  }

  @override
  Widget build(BuildContext context) {
    final AvatarStatusLayout layout = AvatarStatusLayout.forAvatarSize(
      widget.size,
    );
    final _BadgeKind kind = _targetKind;
    final _StatusBadgeGeometry target = _StatusBadgeGeometry(
      rect: switch (kind) {
        _BadgeKind.none => RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: layout.statusCutoutCenter,
            width: 0,
            height: 0,
          ),
          Radius.zero,
        ),
        _BadgeKind.dot => layout.dotRect,
        _BadgeKind.typing => layout.typingRect,
        _BadgeKind.phone => layout.phoneRect,
      },
      gap: kind == _BadgeKind.none ? 0 : layout.statusGap,
      color: _badgeColor(context, kind),
    );
    return TweenAnimationBuilder<_StatusBadgeGeometry>(
      tween: _StatusBadgeGeometryTween(end: target),
      duration: kAvatarStatusTransitionDuration,
      curve: Curves.easeOut,
      child: widget.child,
      builder:
          (BuildContext context, _StatusBadgeGeometry geometry, Widget? child) {
            final bool visible = geometry.rect.width > 0.01;
            return SizedBox.square(
              dimension: widget.size,
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  ClipPath(
                    clipper: _StatusCutoutClipper(
                      geometry.rect.inflate(geometry.gap),
                    ),
                    clipBehavior: visible ? Clip.antiAlias : Clip.none,
                    child: child,
                  ),
                  if (visible)
                    Positioned.fromRect(
                      rect: geometry.rect.outerRect,
                      child: _buildIndicator(layout, geometry.color),
                    ),
                ],
              ),
            );
          },
    );
  }

  Color _badgeColor(BuildContext context, _BadgeKind kind) {
    if (_shownKind == _BadgeKind.none) {
      return const Color(0x00000000);
    }
    final Color color = _shownKind == _BadgeKind.phone
        ? context.colors.statusOnline
        : resolveStatusColor(context, _shownStatus);
    return kind == _BadgeKind.none ? color.withValues(alpha: 0) : color;
  }

  Widget _buildIndicator(AvatarStatusLayout layout, Color color) {
    return switch (_shownKind) {
      _BadgeKind.typing => FluxerTypingStatusIndicator(
        status: _shownStatus,
        width: layout.typingRect.width,
        height: layout.typingRect.height,
        color: color,
      ),
      _BadgeKind.phone => FluxerMobileOnlineStatusIndicator(
        width: layout.phoneRect.width,
        height: layout.phoneRect.height,
        color: color,
      ),
      _BadgeKind.dot || _BadgeKind.none => FluxerStatusIndicator(
        status: _shownStatus,
        size: layout.statusDotSize,
        color: color,
      ),
    };
  }
}

@immutable
class _StatusBadgeGeometry {
  const _StatusBadgeGeometry({
    required this.rect,
    required this.gap,
    required this.color,
  });

  final RRect rect;
  final double gap;
  final Color color;

  @override
  bool operator ==(Object other) =>
      other is _StatusBadgeGeometry &&
      other.rect == rect &&
      other.gap == gap &&
      other.color == color;

  @override
  int get hashCode => Object.hash(rect, gap, color);
}

class _StatusBadgeGeometryTween extends Tween<_StatusBadgeGeometry> {
  _StatusBadgeGeometryTween({super.end});

  @override
  _StatusBadgeGeometry lerp(double t) {
    final _StatusBadgeGeometry from = begin!;
    final _StatusBadgeGeometry to = end!;
    return _StatusBadgeGeometry(
      rect: RRect.lerp(from.rect, to.rect, t)!,
      gap: lerpDouble(from.gap, to.gap, t)!,
      color: Color.lerp(from.color, to.color, t)!,
    );
  }
}

class _StatusCutoutClipper extends CustomClipper<Path> {
  const _StatusCutoutClipper(this.cutout);

  final RRect cutout;

  @override
  Path getClip(Size size) {
    final Path avatar = Path()..addRect(Offset.zero & size);
    if (cutout.width <= 0) {
      return avatar;
    }
    return Path.combine(
      PathOperation.difference,
      avatar,
      Path()..addRRect(cutout),
    );
  }

  @override
  bool shouldReclip(_StatusCutoutClipper oldClipper) =>
      cutout != oldClipper.cutout;
}
