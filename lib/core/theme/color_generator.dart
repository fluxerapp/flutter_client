import 'package:flutter/animation.dart';
import 'package:flutter/painting.dart';

class ScaleCurves {
  ScaleCurves._();

  static const Curve easeIn = _QuadraticEaseIn();
  static const Curve easeOut = _QuadraticEaseOut();
  static const Curve easeInOut = _QuadraticEaseInOut();
}

class _QuadraticEaseIn extends Curve {
  const _QuadraticEaseIn();

  @override
  double transformInternal(double t) {
    return t * t;
  }
}

class _QuadraticEaseOut extends Curve {
  const _QuadraticEaseOut();

  @override
  double transformInternal(double t) {
    return 1 - (1 - t) * (1 - t);
  }
}

class _QuadraticEaseInOut extends Curve {
  const _QuadraticEaseInOut();

  @override
  double transformInternal(double t) {
    if (t < 0.5) {
      return 2 * t * t;
    }
    return 1 - 2 * (1 - t) * (1 - t);
  }
}

class ColorFamily {
  const ColorFamily({
    required this.hue,
    required this.saturation,
    this.useSaturationFactor = true,
  });

  final double hue;
  final double saturation;
  final bool useSaturationFactor;
}

class ScaleStop {
  const ScaleStop({required this.name, this.position = -1});

  final String name;
  final double position;
}

class ColorScale {
  const ColorScale({
    required this.family,
    required this.lightnessStart,
    required this.lightnessEnd,
    required this.curve,
    required this.stops,
  });

  final ColorFamily family;
  final double lightnessStart;
  final double lightnessEnd;
  final Curve curve;
  final List<ScaleStop> stops;

  Color colorAt(double position, {double saturationFactor = 1.0}) {
    final t = curve.transform(position.clamp(0.0, 1.0));
    final lightness = lightnessStart + (lightnessEnd - lightnessStart) * t;
    final saturation = family.useSaturationFactor
        ? family.saturation * saturationFactor
        : family.saturation;

    return HSLColor.fromAHSL(
      1,
      family.hue % 360,
      (saturation / 100).clamp(0.0, 1.0),
      (lightness / 100).clamp(0.0, 1.0),
    ).toColor();
  }

  Map<String, Color> build({double saturationFactor = 1.0}) {
    final result = <String, Color>{};
    final count = stops.length;

    for (var i = 0; i < count; i++) {
      final stop = stops[i];
      final position = stop.position < 0
          ? (count > 1 ? i / (count - 1) : 0.0)
          : stop.position;

      result[stop.name] = colorAt(position, saturationFactor: saturationFactor);
    }

    return result;
  }
}

Color generateTone({
  required double hue,
  required double saturation,
  required double lightness,
  double opacity = 1.0,
}) {
  return HSLColor.fromAHSL(
    opacity.clamp(0.0, 1.0),
    hue % 360,
    (saturation / 100).clamp(0.0, 1.0),
    (lightness / 100).clamp(0.0, 1.0),
  ).toColor();
}
