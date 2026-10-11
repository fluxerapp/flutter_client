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
  20: _StatusConfig(statusSize: 10, cutoutRadius: 6, cutoutCenter: 17),
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
    cutoutCenter: 72,
  ),
  120: _StatusConfig(
    statusSize: 24,
    cutoutRadius: 24 / 2 + 24 * _kLargeStatusCutoutGutterRatio,
    cutoutCenter: 108,
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

final List<int> _kStatusSizes = _kStatusConfig.keys.toList()..sort();

_StatusConfig _getStatusConfig(double avatarSize) {
  final List<int> sizes = _kStatusSizes;
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

double mobilePhoneWidth(double statusDotSize) => statusDotSize;

double mobilePhoneHeight(double phoneWidth) =>
    (phoneWidth / kMobileAspectRatio).roundToDouble() + kMobilePhoneExtraHeight;

double statusCutoutGap({
  required double statusDotSize,
  required double cutoutRadius,
}) {
  return math.max(0, cutoutRadius - statusDotSize / 2);
}

class AvatarStatusLayout {
  const AvatarStatusLayout({
    required this.statusDotSize,
    required this.cutoutRadius,
    required this.statusGap,
    required this.statusCutoutCenter,
    required this.dotRect,
    required this.typingRect,
    required this.phoneRect,
  });

  final double statusDotSize;
  final double cutoutRadius;
  final double statusGap;
  final Offset statusCutoutCenter;
  final RRect dotRect;
  final RRect typingRect;
  final RRect phoneRect;

  factory AvatarStatusLayout.forAvatarSize(double avatarSize) {
    final _StatusConfig config = _getStatusConfig(avatarSize);
    final double statusDotSize = config.statusSize;
    final double cutoutRadius = config.cutoutRadius;
    final Offset center = Offset(config.cutoutCenter, config.cutoutCenter);
    final double statusGap = statusCutoutGap(
      statusDotSize: statusDotSize,
      cutoutRadius: cutoutRadius,
    );
    final double typingWidth = (statusDotSize * kTypingWidthMultiplier)
        .roundToDouble();
    final double bridgeShift =
        (typingWidth - statusDotSize) * kTypingBridgeRightShiftRatio;
    final double typingRight = center.dx + statusDotSize / 2 + bridgeShift;
    final double phoneWidth = mobilePhoneWidth(statusDotSize);
    final double phoneHeight = mobilePhoneHeight(phoneWidth);
    return AvatarStatusLayout(
      statusDotSize: statusDotSize,
      cutoutRadius: cutoutRadius,
      statusGap: statusGap,
      statusCutoutCenter: center,
      dotRect: RRect.fromRectAndRadius(
        Rect.fromCircle(center: center, radius: statusDotSize / 2),
        Radius.circular(statusDotSize / 2),
      ),
      typingRect: RRect.fromRectAndRadius(
        Rect.fromLTRB(
          typingRight - typingWidth,
          center.dy - statusDotSize / 2,
          typingRight,
          center.dy + statusDotSize / 2,
        ),
        Radius.circular(statusDotSize / 2),
      ),
      phoneRect: RRect.fromRectAndRadius(
        Rect.fromCenter(center: center, width: phoneWidth, height: phoneHeight),
        Radius.circular(phoneWidth * kMobileCornerRadius),
      ),
    );
  }
}
