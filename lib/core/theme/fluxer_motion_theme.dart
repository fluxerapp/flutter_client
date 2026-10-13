import 'dart:math' as math;

import 'package:fluxer_app/material_ui.dart';

class FluxerSpringCurve extends Curve {
  const FluxerSpringCurve({
    required this.stiffness,
    required this.damping,
    required this.duration,
  });

  final double stiffness;
  final double damping;
  final Duration duration;

  @override
  double transformInternal(double t) {
    final double seconds =
        t * duration.inMicroseconds / Duration.microsecondsPerSecond;
    final double omega = math.sqrt(stiffness);
    final double zeta = damping / (2 * omega);
    if (zeta >= 1) {
      return 1 - math.exp(-omega * seconds) * (1 + omega * seconds);
    }
    final double dampedOmega = omega * math.sqrt(1 - zeta * zeta);
    final double decay = math.exp(-zeta * omega * seconds);
    return 1 -
        decay *
            (math.cos(dampedOmega * seconds) +
                zeta * omega / dampedOmega * math.sin(dampedOmega * seconds));
  }
}

class FluxerMotionTheme extends ThemeExtension<FluxerMotionTheme> {
  const FluxerMotionTheme({
    required this.hover,
    required this.fast,
    required this.normal,
    required this.panel,
    required this.slow,
    required this.push,
    required this.pop,
    required this.sheet,
    required this.curve,
    required this.emphasizedCurve,
    required this.pushCurve,
    required this.sheetCurve,
  });

  const FluxerMotionTheme.standard()
    : hover = const Duration(milliseconds: 70),
      fast = const Duration(milliseconds: 100),
      normal = const Duration(milliseconds: 150),
      panel = const Duration(milliseconds: 200),
      slow = const Duration(milliseconds: 300),
      push = pushDuration,
      pop = popDuration,
      sheet = sheetDuration,
      curve = Curves.easeOut,
      emphasizedCurve = Curves.easeInOut,
      pushCurve = standardPushCurve,
      sheetCurve = standardSheetCurve;

  const FluxerMotionTheme.reduced()
    : hover = Duration.zero,
      fast = Duration.zero,
      normal = Duration.zero,
      panel = Duration.zero,
      slow = Duration.zero,
      push = Duration.zero,
      pop = Duration.zero,
      sheet = Duration.zero,
      curve = Curves.linear,
      emphasizedCurve = Curves.linear,
      pushCurve = Curves.linear,
      sheetCurve = Curves.linear;

  static const Duration hoverDuration = Duration(milliseconds: 70);
  static const Duration fastDuration = Duration(milliseconds: 100);
  static const Duration normalDuration = Duration(milliseconds: 150);
  static const Duration panelDuration = Duration(milliseconds: 200);
  static const Duration slowDuration = Duration(milliseconds: 300);
  static const Duration pushDuration = Duration(milliseconds: 230);
  static const Duration popDuration = Duration(milliseconds: 180);
  static const Duration sheetDuration = Duration(milliseconds: 400);
  static const double sheetSpringStiffness = 540;
  static const double sheetSpringDamping = 35;
  static const Curve standardPushCurve = Cubic(0.35, 0.7, 0.3, 1);
  static const Curve standardSheetCurve = FluxerSpringCurve(
    stiffness: sheetSpringStiffness,
    damping: sheetSpringDamping,
    duration: sheetDuration,
  );

  final Duration hover;
  final Duration fast;
  final Duration normal;
  final Duration panel;
  final Duration slow;
  final Duration push;
  final Duration pop;
  final Duration sheet;
  final Curve curve;
  final Curve emphasizedCurve;
  final Curve pushCurve;
  final Curve sheetCurve;

  @override
  FluxerMotionTheme copyWith({
    Duration? hover,
    Duration? fast,
    Duration? normal,
    Duration? panel,
    Duration? slow,
    Duration? push,
    Duration? pop,
    Duration? sheet,
    Curve? curve,
    Curve? emphasizedCurve,
    Curve? pushCurve,
    Curve? sheetCurve,
  }) => FluxerMotionTheme(
    hover: hover ?? this.hover,
    fast: fast ?? this.fast,
    normal: normal ?? this.normal,
    panel: panel ?? this.panel,
    slow: slow ?? this.slow,
    push: push ?? this.push,
    pop: pop ?? this.pop,
    sheet: sheet ?? this.sheet,
    curve: curve ?? this.curve,
    emphasizedCurve: emphasizedCurve ?? this.emphasizedCurve,
    pushCurve: pushCurve ?? this.pushCurve,
    sheetCurve: sheetCurve ?? this.sheetCurve,
  );

  @override
  FluxerMotionTheme lerp(FluxerMotionTheme? other, double t) {
    if (other is! FluxerMotionTheme) {
      return this;
    }
    return FluxerMotionTheme(
      hover: _lerpDuration(hover, other.hover, t),
      fast: _lerpDuration(fast, other.fast, t),
      normal: _lerpDuration(normal, other.normal, t),
      panel: _lerpDuration(panel, other.panel, t),
      slow: _lerpDuration(slow, other.slow, t),
      push: _lerpDuration(push, other.push, t),
      pop: _lerpDuration(pop, other.pop, t),
      sheet: _lerpDuration(sheet, other.sheet, t),
      curve: t < 0.5 ? curve : other.curve,
      emphasizedCurve: t < 0.5 ? emphasizedCurve : other.emphasizedCurve,
      pushCurve: t < 0.5 ? pushCurve : other.pushCurve,
      sheetCurve: t < 0.5 ? sheetCurve : other.sheetCurve,
    );
  }

  static Duration _lerpDuration(Duration a, Duration b, double t) => Duration(
    milliseconds: (a.inMilliseconds + (b.inMilliseconds - a.inMilliseconds) * t)
        .round(),
  );
}
