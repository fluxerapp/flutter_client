import 'dart:math' as math;

import 'package:flutter/painting.dart';

enum VoicePipCorner { topLeft, topRight, bottomLeft, bottomRight }

const double kVoicePipEdgeMargin = 8;
const double kVoicePipFlingVelocity = 280;
const Size kVoicePipCompactSize = Size.square(100);
const double kVoiceTileAvatarSize = 72;

double voiceTileAvatarSize(double shortestSide) {
  return (shortestSide * 0.56).clamp(32.0, kVoiceTileAvatarSize);
}

Size voicePipCardSize({
  required Size viewport,
  required bool isScreenShare,
  required bool hasVideo,
  double? aspectRatio,
}) {
  if (!isScreenShare && !hasVideo) {
    return kVoicePipCompactSize;
  }
  final double maxWidth = viewport.width < 600 ? 168 : 240;
  final double maxHeight = viewport.height * 0.38;
  final double aspect = aspectRatio ?? (isScreenShare ? 16 / 9 : 3 / 4);
  double width = maxWidth;
  double height = width / aspect;
  if (height > maxHeight) {
    height = maxHeight;
    width = height * aspect;
  }
  return Size(width, height);
}

Rect voicePipSafeRect({
  required Size viewport,
  required EdgeInsets insets,
  double margin = kVoicePipEdgeMargin,
}) {
  return Rect.fromLTRB(
    insets.left + margin,
    insets.top + margin,
    math.max(insets.left + margin, viewport.width - insets.right - margin),
    math.max(insets.top + margin, viewport.height - insets.bottom - margin),
  );
}

Offset voicePipOriginForCorner({
  required VoicePipCorner corner,
  required Rect safeRect,
  required Size cardSize,
}) {
  final double maxLeft = math.max(
    safeRect.left,
    safeRect.right - cardSize.width,
  );
  final double maxTop = math.max(
    safeRect.top,
    safeRect.bottom - cardSize.height,
  );
  switch (corner) {
    case VoicePipCorner.topLeft:
      return Offset(safeRect.left, safeRect.top);
    case VoicePipCorner.topRight:
      return Offset(maxLeft, safeRect.top);
    case VoicePipCorner.bottomLeft:
      return Offset(safeRect.left, maxTop);
    case VoicePipCorner.bottomRight:
      return Offset(maxLeft, maxTop);
  }
}

Offset voicePipDefaultOrigin({required Rect safeRect, required Size cardSize}) {
  return voicePipOriginForCorner(
    corner: VoicePipCorner.bottomRight,
    safeRect: safeRect,
    cardSize: cardSize,
  );
}

Offset voicePipSnapToNearestEdge({
  required Offset origin,
  required Size cardSize,
  required Rect safeRect,
}) {
  final Offset clamped = voicePipClampOrigin(
    origin: origin,
    cardSize: cardSize,
    safeRect: safeRect,
  );
  final double left = safeRect.left;
  final double top = safeRect.top;
  final double right = math.max(left, safeRect.right - cardSize.width);
  final double bottom = math.max(top, safeRect.bottom - cardSize.height);
  final double distLeft = (clamped.dx - left).abs();
  final double distRight = (clamped.dx - right).abs();
  final double distTop = (clamped.dy - top).abs();
  final double distBottom = (clamped.dy - bottom).abs();
  final double nearestHorizontal = math.min(distLeft, distRight);
  final double nearestVertical = math.min(distTop, distBottom);
  if (nearestHorizontal <= nearestVertical) {
    return Offset(distLeft <= distRight ? left : right, clamped.dy);
  }
  return Offset(clamped.dx, distTop <= distBottom ? top : bottom);
}

Offset voicePipOriginAfterRelease({
  required Offset origin,
  required Size cardSize,
  required Rect safeRect,
  Offset velocity = Offset.zero,
}) {
  Offset next = origin;
  if (velocity.distance >= kVoicePipFlingVelocity) {
    next += velocity * (1 / 12);
  }
  return voicePipSnapToNearestEdge(
    origin: next,
    cardSize: cardSize,
    safeRect: safeRect,
  );
}

Offset voicePipClampOrigin({
  required Offset origin,
  required Size cardSize,
  required Rect safeRect,
}) {
  final double minLeft = safeRect.left;
  final double minTop = safeRect.top;
  final double maxLeft = math.max(minLeft, safeRect.right - cardSize.width);
  final double maxTop = math.max(minTop, safeRect.bottom - cardSize.height);
  return Offset(
    origin.dx.clamp(minLeft, maxLeft),
    origin.dy.clamp(minTop, maxTop),
  );
}

bool voicePipShouldPlayMoveHaptic({
  required bool alreadyPlayed,
  required Offset delta,
}) {
  return !alreadyPlayed && delta.distanceSquared > 0;
}
