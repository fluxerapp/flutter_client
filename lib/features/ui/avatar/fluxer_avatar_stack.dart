import 'dart:math' as math;

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

/// Horizontal overlap stack of avatar widgets, mirroring the web app's
/// `AvatarStack` primitive (Discord-style typing indicator stack, voice
/// "speaking" pile, etc.).
///
/// Each non-trailing avatar is clipped with a circular cutout where the
/// next slot will sit, leaving a [outlineWidth]-wide ring of background
/// visible between the two -- matching the web look.
class FluxerAvatarStack extends StatelessWidget {
  const FluxerAvatarStack({
    required this.avatars,
    this.size = 28,
    this.maxVisible,
    this.overlap,
    this.outlineWidth,
    this.overflowBuilder,
    super.key,
  });

  final List<Widget> avatars;
  final double size;

  /// Cap on total visible slots (avatars + overflow chip). When null, all
  /// avatars render with no overflow.
  final int? maxVisible;

  /// Negative value to overlap adjacent avatars by. Defaults to
  /// `round(-0.35 * size)`, matching the web `AvatarStack` default.
  final double? overlap;

  /// Width of the visual gap between overlapping slots. The next slot's
  /// footprint plus this width is cut out of the previous avatar's right
  /// edge, revealing the parent background as a ring. Set to 0 to disable
  /// the cutout. Defaults to `clamp(1, 3, round(size * 0.05))`, matching
  /// the web outline.
  final double? outlineWidth;

  /// Optional builder for the overflow chip; receives the count of
  /// avatars that did not fit.
  final Widget Function(BuildContext context, int remaining)? overflowBuilder;

  @override
  Widget build(BuildContext context) {
    if (avatars.isEmpty) {
      return const SizedBox.shrink();
    }

    final effectiveOverlap = overlap ?? (-0.35 * size).roundToDouble();
    final step = size + effectiveOverlap;
    final effectiveOutline =
        outlineWidth ??
        math.min(3, math.max(1, (size * 0.05).round())).toDouble();
    final cap = maxVisible;

    final List<Widget> visibleAvatars;
    final int remaining;
    if (cap == null || avatars.length <= cap) {
      visibleAvatars = avatars;
      remaining = 0;
    } else {
      visibleAvatars = avatars.take(cap - 1).toList(growable: false);
      remaining = avatars.length - visibleAvatars.length;
    }

    final hasOverflow = remaining > 0;
    final slotCount = visibleAvatars.length + (hasOverflow ? 1 : 0);
    final stackWidth = size + step * (slotCount - 1);

    final cutoutClipper = effectiveOutline > 0
        ? _StackCutoutClipper(
            avatarSize: size,
            cutoutCenterX: step + size / 2,
            cutoutRadius: size / 2 + effectiveOutline,
          )
        : null;

    Widget wrapSlot(Widget child, {required bool isLastSlot}) {
      final wrapped = SizedBox.square(dimension: size, child: child);
      if (isLastSlot || cutoutClipper == null) {
        return wrapped;
      }
      return ClipPath(clipper: cutoutClipper, child: wrapped);
    }

    return SizedBox(
      width: stackWidth,
      height: size,
      child: Stack(
        children: [
          for (var i = 0; i < visibleAvatars.length; i++)
            Positioned(
              left: i * step,
              child: wrapSlot(
                visibleAvatars[i],
                isLastSlot: !hasOverflow && i == visibleAvatars.length - 1,
              ),
            ),
          if (hasOverflow)
            Positioned(
              left: visibleAvatars.length * step,
              child: wrapSlot(
                overflowBuilder?.call(context, remaining) ??
                    _DefaultOverflowChip(remaining: remaining, size: size),
                isLastSlot: true,
              ),
            ),
        ],
      ),
    );
  }
}

class _StackCutoutClipper extends CustomClipper<Path> {
  const _StackCutoutClipper({
    required this.avatarSize,
    required this.cutoutCenterX,
    required this.cutoutRadius,
  });

  final double avatarSize;
  final double cutoutCenterX;
  final double cutoutRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..addOval(Rect.fromLTWH(0, 0, avatarSize, avatarSize))
      ..addOval(
        Rect.fromCircle(
          center: Offset(cutoutCenterX, avatarSize / 2),
          radius: cutoutRadius,
        ),
      )
      ..fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(covariant _StackCutoutClipper oldClipper) =>
      avatarSize != oldClipper.avatarSize ||
      cutoutCenterX != oldClipper.cutoutCenterX ||
      cutoutRadius != oldClipper.cutoutRadius;
}

class _DefaultOverflowChip extends StatelessWidget {
  const _DefaultOverflowChip({required this.remaining, required this.size});

  final int remaining;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors.backgroundModifierSelected,
      ),
      child: Center(
        child: Text(
          '+$remaining',
          style: context.textStyles.smallText.copyWith(
            color: colors.textPrimary,
            fontSize: size * 0.4,
          ),
        ),
      ),
    );
  }
}
