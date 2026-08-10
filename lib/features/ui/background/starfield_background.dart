import 'dart:async' show unawaited;
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StarfieldBackground extends StatefulWidget {
  const StarfieldBackground({this.child, super.key});

  static const Color cutoutColor = Color(0xFF080616);
  static const Color cutoutSymbolColor = Color(0xFFE2DAFF);

  static const Color _gradientStart = Color(0xFF05040D);
  static const Color _gradientMid = Color(0xFF080616);
  static const Color _gradientEnd = Color(0xFF0D0A1C);

  final Widget? child;

  @override
  State<StarfieldBackground> createState() => _StarfieldBackgroundState();
}

class _StarfieldBackgroundState extends State<StarfieldBackground>
    with TickerProviderStateMixin {
  static const Duration _fineDriftDuration = Duration(seconds: 90);
  static const Duration _coarseDriftDuration = Duration(seconds: 120);

  late final AnimationController _fineDrift;
  late final AnimationController _coarseDrift;

  @override
  void initState() {
    super.initState();
    _fineDrift = AnimationController(vsync: this, duration: _fineDriftDuration);
    _coarseDrift = AnimationController(
      vsync: this,
      duration: _coarseDriftDuration,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncDrift();
  }

  void _syncDrift() {
    final AppLifecycleState? lifecycle =
        SchedulerBinding.instance.lifecycleState;
    final bool foreground =
        lifecycle == null || lifecycle == AppLifecycleState.resumed;
    final bool shouldAnimate =
        foreground && !MediaQuery.disableAnimationsOf(context);
    if (shouldAnimate) {
      if (!_fineDrift.isAnimating) {
        unawaited(_fineDrift.repeat(reverse: true));
      }
      if (!_coarseDrift.isAnimating) {
        unawaited(_coarseDrift.repeat(reverse: true));
      }
    } else {
      _fineDrift.stop();
      _coarseDrift.stop();
    }
  }

  @override
  void dispose() {
    _fineDrift.dispose();
    _coarseDrift.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.8, -1),
              end: Alignment(0.9, 1),
              colors: [
                StarfieldBackground._gradientStart,
                StarfieldBackground._gradientMid,
                StarfieldBackground._gradientEnd,
              ],
              stops: [0.0, 0.46, 1.0],
            ),
          ),
        ),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(-0.44, -0.8),
              radius: 0.85,
              colors: [Color(0x287A57BF), Color(0x007A57BF)],
              stops: [0.0, 0.7],
            ),
          ),
        ),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.64, 0.68),
              radius: 0.75,
              colors: [Color(0x245B4197), Color(0x005B4197)],
              stops: [0.0, 0.72],
            ),
          ),
        ),
        AnimatedBuilder(
          animation: Listenable.merge(<Listenable>[_fineDrift, _coarseDrift]),
          builder: (BuildContext context, Widget? child) {
            return CustomPaint(
              painter: _StarfieldPainter(
                fineProgress: Curves.easeInOut.transform(_fineDrift.value),
                coarseProgress: Curves.easeInOut.transform(
                  1 - _coarseDrift.value,
                ),
              ),
            );
          },
        ),
        if (widget.child != null) widget.child!,
      ],
    );
  }
}

class _StarSpec {
  const _StarSpec(this.x, this.y, this.radius, this.color);

  final double x;
  final double y;
  final double radius;
  final Color color;
}

class _StarfieldPainter extends CustomPainter {
  _StarfieldPainter({required this.fineProgress, required this.coarseProgress});

  final double fineProgress;
  final double coarseProgress;

  static const List<_StarSpec> _fineStars = <_StarSpec>[
    _StarSpec(0.04, 0.12, 0.5, Color(0x5CFFFFFF)),
    _StarSpec(0.06, 0.08, 1, Color(0x6BEEE8FF)),
    _StarSpec(0.09, 0.68, 0.5, Color(0x57D5CAFF)),
    _StarSpec(0.11, 0.88, 0.5, Color(0x4DFFFFFF)),
    _StarSpec(0.14, 0.28, 0.5, Color(0x61E2DAFF)),
    _StarSpec(0.18, 0.58, 1, Color(0x47FFFFFF)),
    _StarSpec(0.21, 0.15, 0.5, Color(0x5CFFFFFF)),
    _StarSpec(0.24, 0.34, 0.5, Color(0x47D3C7FF)),
    _StarSpec(0.26, 0.53, 0.5, Color(0x4DFFFFFF)),
    _StarSpec(0.29, 0.74, 1, Color(0x57EDE7FF)),
    _StarSpec(0.33, 0.07, 0.5, Color(0x57FFFFFF)),
    _StarSpec(0.35, 0.38, 0.5, Color(0x61E2DAFF)),
    _StarSpec(0.39, 0.66, 0.5, Color(0x47FFFFFF)),
    _StarSpec(0.42, 0.09, 1, Color(0x5CFFFFFF)),
    _StarSpec(0.46, 0.48, 0.5, Color(0x47D3C7FF)),
    _StarSpec(0.48, 0.82, 0.5, Color(0x4DFFFFFF)),
    _StarSpec(0.53, 0.24, 0.5, Color(0x57E2DAFF)),
    _StarSpec(0.58, 0.92, 0.5, Color(0x4DD3C7FF)),
    _StarSpec(0.61, 0.62, 1, Color(0x57FFFFFF)),
    _StarSpec(0.64, 0.31, 0.5, Color(0x42D3C7FF)),
    _StarSpec(0.68, 0.18, 0.5, Color(0x52FFFFFF)),
    _StarSpec(0.71, 0.86, 0.5, Color(0x47FFFFFF)),
    _StarSpec(0.73, 0.47, 0.5, Color(0x57E2DAFF)),
    _StarSpec(0.81, 0.11, 1, Color(0x61FFFFFF)),
    _StarSpec(0.87, 0.78, 0.5, Color(0x57FFFFFF)),
    _StarSpec(0.91, 0.64, 0.5, Color(0x57FFFFFF)),
    _StarSpec(0.94, 0.35, 0.5, Color(0x4DE2DAFF)),
    _StarSpec(0.97, 0.92, 1, Color(0x47FFFFFF)),
  ];

  static const List<_StarSpec> _coarseStars = <_StarSpec>[
    _StarSpec(0.07, 0.36, 1, Color(0x4DE2DAFF)),
    _StarSpec(0.09, 0.42, 1.5, Color(0x57E2DAFF)),
    _StarSpec(0.16, 0.80, 1, Color(0x3DFFFFFF)),
    _StarSpec(0.19, 0.66, 1, Color(0x47FFFFFF)),
    _StarSpec(0.27, 0.24, 1.5, Color(0x42D5CAFF)),
    _StarSpec(0.32, 0.20, 1, Color(0x57E2DAFF)),
    _StarSpec(0.37, 0.90, 1, Color(0x3DFFFFFF)),
    _StarSpec(0.45, 0.70, 1.5, Color(0x42FFFFFF)),
    _StarSpec(0.51, 0.14, 1, Color(0x47EDE7FF)),
    _StarSpec(0.57, 0.33, 1, Color(0x52E2DAFF)),
    _StarSpec(0.66, 0.52, 1.5, Color(0x3DD5CAFF)),
    _StarSpec(0.72, 0.86, 1, Color(0x4DFFFFFF)),
    _StarSpec(0.84, 0.25, 1, Color(0x52E2DAFF)),
    _StarSpec(0.89, 0.46, 1.5, Color(0x42EDE7FF)),
    _StarSpec(0.96, 0.56, 1, Color(0x42FFFFFF)),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    _paintLayer(
      canvas,
      size,
      stars: _fineStars,
      progress: fineProgress,
      glowSigma: 1.4,
    );
    _paintLayer(
      canvas,
      size,
      stars: _coarseStars,
      progress: coarseProgress,
      glowSigma: 2.4,
    );
  }

  void _paintLayer(
    Canvas canvas,
    Size size, {
    required List<_StarSpec> stars,
    required double progress,
    required double glowSigma,
  }) {
    const Offset drift = Offset(-16, 12);
    final Offset offset = Offset(drift.dx * progress, drift.dy * progress);
    final Paint paint = Paint()..isAntiAlias = true;
    for (final _StarSpec star in stars) {
      final Offset center = Offset(
        star.x * size.width,
        star.y * size.height,
      ).translate(offset.dx, offset.dy);
      paint
        ..color = star.color
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, glowSigma);
      canvas.drawCircle(center, math.max(star.radius, 0.6), paint);
      paint.maskFilter = null;
      canvas.drawCircle(center, star.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _StarfieldPainter oldDelegate) {
    return oldDelegate.fineProgress != fineProgress ||
        oldDelegate.coarseProgress != coarseProgress;
  }
}
