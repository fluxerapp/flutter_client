import 'dart:ui';

const double kTypingWidthMultiplier = 1.8;
const double kTypingBridgeRightShiftRatio = 0.35;

double avatarStatusDotSize(double avatarSize) {
  if (avatarSize <= 36) {
    return 10;
  }
  if (avatarSize <= 40) {
    return 12;
  }
  if (avatarSize <= 48) {
    return 14;
  }
  if (avatarSize <= 80) {
    return 16;
  }
  return 24;
}

double avatarStatusCutoutRadius(double avatarSize) {
  if (avatarSize <= 20) {
    return 5;
  }
  if (avatarSize <= 24) {
    return 7;
  }
  if (avatarSize <= 36) {
    return 8;
  }
  if (avatarSize <= 40) {
    return 9;
  }
  if (avatarSize <= 48) {
    return 10;
  }
  if (avatarSize <= 56) {
    return 11;
  }
  if (avatarSize <= 80) {
    return 14;
  }
  return 20;
}

class AvatarStatusLayout {
  const AvatarStatusLayout({
    required this.statusDotSize,
    required this.cutoutRadius,
    required this.statusRight,
    required this.statusBottom,
    required this.typingWidth,
    required this.typingHeight,
    required this.typingRight,
    required this.typingBottom,
    required this.statusCutoutCenter,
    required this.typingCutoutRect,
  });

  final double statusDotSize;
  final double cutoutRadius;
  final double statusRight;
  final double statusBottom;
  final double typingWidth;
  final double typingHeight;
  final double typingRight;
  final double typingBottom;
  final Offset statusCutoutCenter;
  final RRect typingCutoutRect;

  factory AvatarStatusLayout.forAvatarSize(double avatarSize) {
    final double statusDotSize = avatarStatusDotSize(avatarSize);
    final double cutoutRadius = avatarStatusCutoutRadius(avatarSize);
    final double typingWidth = (statusDotSize * kTypingWidthMultiplier)
        .roundToDouble();
    final double typingHeight = statusDotSize;
    final double typingExtension = typingWidth - statusDotSize;
    final double bridgeShift = typingExtension * kTypingBridgeRightShiftRatio;
    final double typingRight = -bridgeShift;
    const double statusRight = 0;
    const double statusBottom = 0;
    const double typingBottom = 0;
    final Offset statusCutoutCenter = Offset(
      avatarSize - statusDotSize / 2,
      avatarSize - statusDotSize / 2,
    );
    final double typingLeft = avatarSize - typingWidth - typingRight;
    final double typingTop = avatarSize - typingHeight;
    final RRect typingCutoutRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(typingLeft, typingTop, typingWidth, typingHeight),
      Radius.circular(cutoutRadius),
    );
    return AvatarStatusLayout(
      statusDotSize: statusDotSize,
      cutoutRadius: cutoutRadius,
      statusRight: statusRight,
      statusBottom: statusBottom,
      typingWidth: typingWidth,
      typingHeight: typingHeight,
      typingRight: typingRight,
      typingBottom: typingBottom,
      statusCutoutCenter: statusCutoutCenter,
      typingCutoutRect: typingCutoutRect,
    );
  }
}
