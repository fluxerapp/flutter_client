import 'package:material_ui/material_ui.dart';

class FluxerMotionTheme extends ThemeExtension<FluxerMotionTheme> {
  const FluxerMotionTheme({
    required this.hover,
    required this.fast,
    required this.normal,
    required this.panel,
    required this.slow,
    required this.curve,
    required this.emphasizedCurve,
  });

  const FluxerMotionTheme.standard()
    : hover = const Duration(milliseconds: 70),
      fast = const Duration(milliseconds: 100),
      normal = const Duration(milliseconds: 150),
      panel = const Duration(milliseconds: 200),
      slow = const Duration(milliseconds: 300),
      curve = Curves.easeOut,
      emphasizedCurve = Curves.easeInOut;

  const FluxerMotionTheme.reduced()
    : hover = Duration.zero,
      fast = Duration.zero,
      normal = Duration.zero,
      panel = Duration.zero,
      slow = Duration.zero,
      curve = Curves.linear,
      emphasizedCurve = Curves.linear;

  // For timers / defaults that cannot use BuildContext.
  static const Duration hoverDuration = Duration(milliseconds: 70);
  static const Duration fastDuration = Duration(milliseconds: 100);
  static const Duration normalDuration = Duration(milliseconds: 150);
  static const Duration panelDuration = Duration(milliseconds: 200);
  static const Duration slowDuration = Duration(milliseconds: 300);

  final Duration hover;
  final Duration fast;
  final Duration normal;
  final Duration panel;
  final Duration slow;
  final Curve curve;
  final Curve emphasizedCurve;

  @override
  FluxerMotionTheme copyWith({
    Duration? hover,
    Duration? fast,
    Duration? normal,
    Duration? panel,
    Duration? slow,
    Curve? curve,
    Curve? emphasizedCurve,
  }) => FluxerMotionTheme(
    hover: hover ?? this.hover,
    fast: fast ?? this.fast,
    normal: normal ?? this.normal,
    panel: panel ?? this.panel,
    slow: slow ?? this.slow,
    curve: curve ?? this.curve,
    emphasizedCurve: emphasizedCurve ?? this.emphasizedCurve,
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
      curve: t < 0.5 ? curve : other.curve,
      emphasizedCurve: t < 0.5 ? emphasizedCurve : other.emphasizedCurve,
    );
  }

  static Duration _lerpDuration(Duration a, Duration b, double t) => Duration(
    milliseconds: (a.inMilliseconds + (b.inMilliseconds - a.inMilliseconds) * t)
        .round(),
  );
}
