import 'dart:async' show unawaited;
import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/features/ui/background/starfield_background.dart';
import 'package:fluxer_app/features/ui/icons/fluxer_brand_logo.dart';

/// Expands the brand circle over the live splash, then fades to the shell
class SplashRevealOverlay {
  SplashRevealOverlay._();

  static const double logoSize = 85;
  static const double pulseScale = 0.8;
  static const double expandScale = 500;
  static const double pulseEndFraction = 0.08;
  static const Duration totalDuration = Duration(milliseconds: 1200);
  static const int maxTickMicros = 32000;
  static const double fadeSpan = 0.12;
  static const double markFadeStartScale = 5;
  static const double markFadeEndScale = 11;

  static Duration get pulseDuration {
    final double linear = math.pow(pulseEndFraction, 1 / 3).toDouble();
    return Duration(
      milliseconds: (totalDuration.inMilliseconds * linear).round(),
    );
  }

  static Duration get expandDuration => totalDuration - pulseDuration;

  static void show({
    required BuildContext context,
    required Color coverColor,
    required Color logoBrandColor,
    required Color logoBrandSymbolColor,
    required Offset logoCenterGlobal,
    VoidCallback? onComplete,
  }) {
    final OverlayState overlay = Overlay.of(context, rootOverlay: true);
    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (BuildContext overlayContext) {
        return _SplashRevealOverlayWidget(
          coverColor: coverColor,
          logoBrandColor: logoBrandColor,
          logoBrandSymbolColor: logoBrandSymbolColor,
          logoCenterGlobal: logoCenterGlobal,
          onComplete: () {
            entry.remove();
            onComplete?.call();
          },
        );
      },
    );
    overlay.insert(entry);
  }
}

class _SplashRevealOverlayWidget extends StatefulWidget {
  const _SplashRevealOverlayWidget({
    required this.coverColor,
    required this.logoBrandColor,
    required this.logoBrandSymbolColor,
    required this.logoCenterGlobal,
    required this.onComplete,
  });

  final Color coverColor;
  final Color logoBrandColor;
  final Color logoBrandSymbolColor;
  final Offset logoCenterGlobal;
  final VoidCallback onComplete;

  @override
  State<_SplashRevealOverlayWidget> createState() =>
      _SplashRevealOverlayWidgetState();
}

class _SplashRevealOverlayWidgetState extends State<_SplashRevealOverlayWidget>
    with SingleTickerProviderStateMixin {
  Ticker? _ticker;
  Duration _lastElapsed = Duration.zero;
  double _progress = 0;
  double? _mountProgress;
  Size _viewport = Size.zero;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _ticker != null) {
        return;
      }
      _ticker = createTicker(_onTick);
      unawaited(_ticker!.start());
    });
  }

  @override
  void dispose() {
    _ticker?.dispose();
    super.dispose();
  }

  void _onTick(Duration elapsed) {
    final int dt = (elapsed - _lastElapsed).inMicroseconds.clamp(
      0,
      SplashRevealOverlay.maxTickMicros,
    );
    _lastElapsed = elapsed;

    final double next =
        (_progress + dt / SplashRevealOverlay.totalDuration.inMicroseconds)
            .clamp(0.0, 1.0);

    if (_isExpandPhase(next)) {
      final double expandProgress = _expandPhaseProgress(next);
      final double scale = _scaleFor(next);
      if (_mountProgress == null &&
          _viewport.width > 0 &&
          _circleCoversScreen(scale)) {
        _mountProgress = expandProgress;
      }
    }

    setState(() => _progress = next);
    if (next >= 1) {
      _ticker?.stop();
      widget.onComplete();
    }
  }

  bool _isExpandPhase([double? progress]) {
    return (progress ?? _progress) > SplashRevealOverlay.pulseEndFraction;
  }

  double _expandPhaseProgress(double progress) {
    if (progress <= SplashRevealOverlay.pulseEndFraction) {
      return 0;
    }
    return ((progress - SplashRevealOverlay.pulseEndFraction) /
            (1 - SplashRevealOverlay.pulseEndFraction))
        .clamp(0.0, 1.0);
  }

  bool _circleCoversScreen(double scale) {
    final Offset center = _localCenter();
    final double radius = (SplashRevealOverlay.logoSize / 2) * scale;
    return radius >= maxRevealRadius(_viewport, center);
  }

  double _scaleFor(double progress) {
    if (progress <= SplashRevealOverlay.pulseEndFraction) {
      final double t = Curves.easeInCubic.transform(
        progress / SplashRevealOverlay.pulseEndFraction,
      );
      return lerpDouble(1, SplashRevealOverlay.pulseScale, t)!;
    }
    final double expandT = _expandPhaseProgress(progress);
    return lerpDouble(
      SplashRevealOverlay.pulseScale,
      SplashRevealOverlay.expandScale,
      Curves.easeInCubic.transform(expandT),
    )!;
  }

  double _coverOpacity() {
    final double? mountProgress = _mountProgress;
    if (mountProgress == null) {
      return 1;
    }
    final double expandProgress = _expandPhaseProgress(_progress);
    final double u =
        ((expandProgress - mountProgress) / SplashRevealOverlay.fadeSpan).clamp(
          0.0,
          1.0,
        );
    return 1 - Curves.easeOut.transform(u);
  }

  double _markOpacity(double scale, double coverOpacity) {
    if (scale <= SplashRevealOverlay.markFadeStartScale) {
      return coverOpacity;
    }
    if (scale >= SplashRevealOverlay.markFadeEndScale) {
      return 0;
    }
    final double t =
        (scale - SplashRevealOverlay.markFadeStartScale) /
        (SplashRevealOverlay.markFadeEndScale -
            SplashRevealOverlay.markFadeStartScale);
    return coverOpacity * (1 - Curves.easeOut.transform(t));
  }

  Offset _localCenter() {
    final RenderObject? renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) {
      return widget.logoCenterGlobal;
    }
    return renderObject.globalToLocal(widget.logoCenterGlobal);
  }

  @override
  Widget build(BuildContext context) {
    _viewport = MediaQuery.sizeOf(context);
    final Offset center = _localCenter();
    final bool expandPhase = _isExpandPhase();
    final double scale = _scaleFor(_progress);
    final double coverOpacity = expandPhase ? _coverOpacity() : 1;
    const double logoHalf = SplashRevealOverlay.logoSize / 2;

    late final Color logoFill;
    late final Color logoSymbol;
    late final double logoOpacity;

    if (!expandPhase) {
      final double t = Curves.easeInCubic.transform(
        _progress / SplashRevealOverlay.pulseEndFraction,
      );
      logoFill = Color.lerp(widget.logoBrandColor, widget.coverColor, t)!;
      logoSymbol = Color.lerp(
        widget.logoBrandSymbolColor,
        StarfieldBackground.cutoutSymbolColor,
        t,
      )!;
      logoOpacity = 1;
    } else {
      logoFill = widget.coverColor;
      logoSymbol = StarfieldBackground.cutoutSymbolColor;
      logoOpacity = _markOpacity(scale, coverOpacity);
    }

    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (!expandPhase) const StarfieldBackground(),
          if (expandPhase)
            CustomPaint(
              painter: _SplashRevealPainter(
                coverColor: widget.coverColor,
                logoSize: SplashRevealOverlay.logoSize,
                center: center,
                scale: scale,
                opacity: coverOpacity,
                paintBackdrop: true,
              ),
            ),
          if (logoOpacity > 0)
            Positioned(
              left: center.dx - logoHalf,
              top: center.dy - logoHalf,
              width: SplashRevealOverlay.logoSize,
              height: SplashRevealOverlay.logoSize,
              child: Opacity(
                opacity: logoOpacity,
                child: Transform.scale(
                  scale: scale,
                  child: RepaintBoundary(
                    child: FluxerBrandLogo(
                      size: SplashRevealOverlay.logoSize,
                      backgroundColor: logoFill,
                      symbolColor: logoSymbol,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SplashRevealPainter extends CustomPainter {
  _SplashRevealPainter({
    required this.coverColor,
    required this.logoSize,
    required this.center,
    required this.scale,
    required this.opacity,
    required this.paintBackdrop,
  });

  final Color coverColor;
  final double logoSize;
  final Offset center;
  final double scale;
  final double opacity;
  final bool paintBackdrop;

  @override
  void paint(Canvas canvas, Size size) {
    if (opacity <= 0) {
      return;
    }

    final Paint paint = Paint()
      ..color = coverColor.withValues(alpha: opacity)
      ..isAntiAlias = true;

    if (paintBackdrop) {
      canvas.drawRect(Offset.zero & size, paint);
    }

    canvas.drawCircle(center, (logoSize / 2) * scale, paint);
  }

  @override
  bool shouldRepaint(covariant _SplashRevealPainter oldDelegate) {
    return oldDelegate.scale != scale ||
        oldDelegate.opacity != opacity ||
        oldDelegate.center != center ||
        oldDelegate.paintBackdrop != paintBackdrop ||
        oldDelegate.coverColor != coverColor;
  }
}

double maxRevealRadius(Size size, Offset center) {
  return <Offset>[
    Offset.zero,
    Offset(size.width, 0),
    Offset(0, size.height),
    Offset(size.width, size.height),
  ].map((Offset corner) => (corner - center).distance).reduce(math.max);
}
