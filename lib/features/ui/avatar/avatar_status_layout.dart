import 'dart:math' as math;
import 'dart:ui';

const double kTypingWidthMultiplier = 1.8;
const double kTypingBridgeRightShiftRatio = 0.35;

const double kMobileAspectRatio = 0.75;
const double kMobileCornerRadius = 0.12;
const double kMobilePhoneExtraHeight = 2;

const double kMinAvatarSizeForStatus = 16;

const double _kLargeStatusCutoutGutterRatio = 0.2;

class _StatusConfig {
  const _StatusConfig({
    required this.statusSize,
    required this.cutoutRadius,
    required this.cutoutCenter,
  });

  final double statusSize;
  final double cutoutRadius;
  final double cutoutCenter;
}

const Map<int, _StatusConfig> _kStatusConfig = <int, _StatusConfig>{
  16: _StatusConfig(statusSize: 10, cutoutRadius: 5, cutoutCenter: 13),
  20: _StatusConfig(statusSize: 10, cutoutRadius: 5, cutoutCenter: 17),
  24: _StatusConfig(statusSize: 10, cutoutRadius: 7, cutoutCenter: 20),
  32: _StatusConfig(statusSize: 10, cutoutRadius: 8, cutoutCenter: 27),
  36: _StatusConfig(statusSize: 10, cutoutRadius: 8, cutoutCenter: 30),
  40: _StatusConfig(statusSize: 12, cutoutRadius: 9, cutoutCenter: 34),
  44: _StatusConfig(statusSize: 14, cutoutRadius: 10, cutoutCenter: 38),
  48: _StatusConfig(statusSize: 14, cutoutRadius: 10, cutoutCenter: 42),
  56: _StatusConfig(statusSize: 16, cutoutRadius: 11, cutoutCenter: 49),
  80: _StatusConfig(
    statusSize: 16,
    cutoutRadius: 16 / 2 + 16 * _kLargeStatusCutoutGutterRatio,
    cutoutCenter: 68,
  ),
  120: _StatusConfig(
    statusSize: 24,
    cutoutRadius: 24 / 2 + 24 * _kLargeStatusCutoutGutterRatio,
    cutoutCenter: 100,
  ),
};

bool isMobileOnlineStatus({
  required bool isMobileStatus,
  required String status,
  required bool isTyping,
  required double size,
}) {
  return isMobileStatus &&
      status == 'online' &&
      !isTyping &&
      size > kMinAvatarSizeForStatus;
}

double _interpolate(double from, double to, double progress) {
  return from + (to - from) * progress;
}

_StatusConfig _getStatusConfig(double avatarSize) {
  final List<int> sizes = _kStatusConfig.keys.toList()..sort();
  final int firstSize = sizes.first;
  final int lastSize = sizes.last;
  if (avatarSize <= firstSize) {
    final double scale = avatarSize / firstSize;
    final _StatusConfig config = _kStatusConfig[firstSize]!;
    return _StatusConfig(
      statusSize: config.statusSize * scale,
      cutoutRadius: config.cutoutRadius * scale,
      cutoutCenter: config.cutoutCenter * scale,
    );
  }
  if (avatarSize >= lastSize) {
    final double scale = avatarSize / lastSize;
    final _StatusConfig config = _kStatusConfig[lastSize]!;
    return _StatusConfig(
      statusSize: config.statusSize * scale,
      cutoutRadius: config.cutoutRadius * scale,
      cutoutCenter: config.cutoutCenter * scale,
    );
  }
  final int upperSize = sizes.firstWhere((int size) => size > avatarSize);
  final int lowerSize = sizes[sizes.indexOf(upperSize) - 1];
  final double progress = (avatarSize - lowerSize) / (upperSize - lowerSize);
  final _StatusConfig from = _kStatusConfig[lowerSize]!;
  final _StatusConfig to = _kStatusConfig[upperSize]!;
  return _StatusConfig(
    statusSize: _interpolate(from.statusSize, to.statusSize, progress),
    cutoutRadius: _interpolate(from.cutoutRadius, to.cutoutRadius, progress),
    cutoutCenter: _interpolate(from.cutoutCenter, to.cutoutCenter, progress),
  );
}

double avatarStatusDotSize(double avatarSize) {
  return _getStatusConfig(avatarSize).statusSize;
}

double avatarStatusCutoutRadius(double avatarSize) {
  return _getStatusConfig(avatarSize).cutoutRadius;
}

double avatarStatusCutoutCenter(double avatarSize) {
  return _getStatusConfig(avatarSize).cutoutCenter;
}

double mobilePhoneWidth(double statusDotSize) => statusDotSize;

double mobilePhoneHeight(double phoneWidth) =>
    (phoneWidth / kMobileAspectRatio).roundToDouble() + kMobilePhoneExtraHeight;

double mobileStatusBorderWidth({
  required double statusDotSize,
  required double cutoutRadius,
}) {
  return math.max(0, cutoutRadius - statusDotSize / 2);
}

class AvatarStatusLayout {
  const AvatarStatusLayout({
    required this.statusDotSize,
    required this.cutoutRadius,
    required this.statusRight,
    required this.statusBottom,
    required this.mobileStatusRight,
    required this.mobileStatusBottom,
    required this.typingWidth,
    required this.typingHeight,
    required this.typingRight,
    required this.typingBottom,
    required this.statusCutoutCenter,
    required this.typingCutoutRect,
    required this.phoneWidth,
    required this.phoneHeight,
    required this.phoneCutoutRect,
  });

  final double statusDotSize;
  final double cutoutRadius;
  final double statusRight;
  final double statusBottom;
  final double mobileStatusRight;
  final double mobileStatusBottom;
  final double typingWidth;
  final double typingHeight;
  final double typingRight;
  final double typingBottom;
  final Offset statusCutoutCenter;
  final RRect typingCutoutRect;
  final double phoneWidth;
  final double phoneHeight;
  final RRect phoneCutoutRect;

  factory AvatarStatusLayout.forAvatarSize(double avatarSize) {
    final _StatusConfig config = _getStatusConfig(avatarSize);
    final double statusDotSize = config.statusSize;
    final double cutoutRadius = config.cutoutRadius;
    final double cutoutCenter = config.cutoutCenter;
    final double typingWidth = (statusDotSize * kTypingWidthMultiplier)
        .roundToDouble();
    final double typingHeight = statusDotSize;
    final double typingExtension = typingWidth - statusDotSize;
    final double bridgeShift = typingExtension * kTypingBridgeRightShiftRatio;
    final double typingRight = -bridgeShift;
    const double statusRight = 0;
    const double statusBottom = 0;
    const double typingBottom = 0;
    final Offset statusCutoutCenter = Offset(cutoutCenter, cutoutCenter);
    final double typingLeft = avatarSize - typingWidth - typingRight;
    final double typingTop = avatarSize - typingHeight;
    final RRect typingCutoutRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(typingLeft, typingTop, typingWidth, typingHeight),
      Radius.circular(cutoutRadius),
    );
    final double phoneWidth = mobilePhoneWidth(statusDotSize);
    final double phoneHeight = mobilePhoneHeight(phoneWidth);
    final double borderWidth = mobileStatusBorderWidth(
      statusDotSize: statusDotSize,
      cutoutRadius: cutoutRadius,
    );
    final double phoneLeft = cutoutCenter - phoneWidth / 2;
    final double phoneTop = cutoutCenter - phoneHeight / 2;
    final double cutoutPhoneLeft = phoneLeft - borderWidth;
    final double cutoutPhoneTop = phoneTop - borderWidth;
    final double cutoutPhoneWidth = phoneWidth + borderWidth * 2;
    final double cutoutPhoneHeight = phoneHeight + borderWidth * 2;
    final RRect phoneCutoutRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        cutoutPhoneLeft,
        cutoutPhoneTop,
        cutoutPhoneWidth,
        cutoutPhoneHeight,
      ),
      Radius.circular(phoneWidth * kMobileCornerRadius + borderWidth),
    );
    final double mobileStatusRight = avatarSize - cutoutCenter - phoneWidth / 2;
    final double mobileStatusBottom =
        avatarSize - cutoutCenter - phoneHeight / 2;
    return AvatarStatusLayout(
      statusDotSize: statusDotSize,
      cutoutRadius: cutoutRadius,
      statusRight: statusRight,
      statusBottom: statusBottom,
      mobileStatusRight: mobileStatusRight,
      mobileStatusBottom: mobileStatusBottom,
      typingWidth: typingWidth,
      typingHeight: typingHeight,
      typingRight: typingRight,
      typingBottom: typingBottom,
      statusCutoutCenter: statusCutoutCenter,
      typingCutoutRect: typingCutoutRect,
      phoneWidth: phoneWidth,
      phoneHeight: phoneHeight,
      phoneCutoutRect: phoneCutoutRect,
    );
  }
}
