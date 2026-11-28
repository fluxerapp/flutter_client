import 'dart:math' as math;

enum FluxerModalSize {
  small,
  medium,
  large,
  xlarge;

  double desktopWidth(double viewportWidth) => switch (this) {
    FluxerModalSize.small => 440,
    FluxerModalSize.medium => 600,
    FluxerModalSize.large => 800,
    FluxerModalSize.xlarge => math.min(1472, viewportWidth - 40),
  };
}
