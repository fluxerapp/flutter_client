import 'dart:async' show unawaited;
import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/core/theme/color_utils.dart';
import 'package:fluxer_app/features/ui/background/starfield_background.dart';
import 'package:fluxer_app/features/ui/icons/fluxer_brand_logo.dart';

/// Expands the brand circle over the live splash, then fades to the shell
class SplashRevealOverlay {
  SplashRevealOverlay._();

  /// TEMP: Testing not using the logo zoom
  static const bool useLogoZoomTransition = true;

  static const double logoSize = 85;
  static const double pulseScale = 0.8;
  static const double expandScale = 500;
  static const double pulseEndFraction = 0.08;
  static const double shellStartScale = 1.1;
  static const Duration totalDuration = Duration(milliseconds: 1200);
  static const Duration fadeOnlyDuration = Duration(milliseconds: 350);
  static const Duration reducedMotionDuration = Duration(milliseconds: 300);
  static const int maxTickMicros = 32000;

  static const double layerFadeStart = 0.1;
  static const double layerFadeEnd = 0.2;

  static final Color silhouetteSymbolColor = ColorUtils.dim(
    StarfieldBackground.cutoutSymbolColor,
    0.5,
  );

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
    bool? animationsEnabled,
  }) {
    final bool enabled =
        animationsEnabled ?? !MediaQuery.disableAnimationsOf(context);

    final OverlayState overlay = Overlay.of(context, rootOverlay: true);
    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (BuildContext overlayContext) {
        return _SplashRevealOverlayWidget(
          coverColor: coverColor,
          logoBrandColor: logoBrandColor,
          logoBrandSymbolColor: logoBrandSymbolColor,
          logoCenterGlobal: logoCenterGlobal,
          reducedMotion: !enabled,
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
    required this.reducedMotion,
    required this.onComplete,
  });

  final Color coverColor;
  final Color logoBrandColor;
  final Color logoBrandSymbolColor;
  final Offset logoCenterGlobal;
  final bool reducedMotion;
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

  Duration get _duration {
    if (widget.reducedMotion) {
      return SplashRevealOverlay.reducedMotionDuration;
    }
    if (!SplashRevealOverlay.useLogoZoomTransition) {
      return SplashRevealOverlay.fadeOnlyDuration;
    }
    return SplashRevealOverlay.totalDuration;
  }

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

    final double next = (_progress + dt / _duration.inMicroseconds).clamp(
      0.0,
      1.0,
    );

    setState(() => _progress = next);
    if (next >= 1) {
      _ticker?.stop();
      widget.onComplete();
    }
  }

  bool _isExpandPhase([double? progress]) {
    if (widget.reducedMotion || !SplashRevealOverlay.useLogoZoomTransition) {
      return false;
    }
    return (progress ?? _progress) > SplashRevealOverlay.pulseEndFraction;
  }

  Offset _localCenter() {
    final RenderObject? renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) {
      return widget.logoCenterGlobal;
    }
    return renderObject.globalToLocal(widget.logoCenterGlobal);
  }

  ({Color fill, Color symbol}) _logoColors(double t) {
    final Color fill = Color.lerp(widget.logoBrandColor, widget.coverColor, t)!;
    final Color symbol = Color.lerp(
      widget.logoBrandSymbolColor,
      SplashRevealOverlay.silhouetteSymbolColor,
      t,
    )!;
    return (fill: fill, symbol: symbol);
  }

  @override
  Widget build(BuildContext context) {
    final Offset center = _localCenter();
    final bool expandPhase = _isExpandPhase();
    final double scale = splashRevealLogoScale(
      _progress,
      reducedMotion: widget.reducedMotion,
    );
    final double coverOpacity = splashRevealLayerOpacity(
      _progress,
      reducedMotion: widget.reducedMotion,
    );
    const double logoHalf = SplashRevealOverlay.logoSize / 2;

    late final Color logoFill;
    late final Color logoSymbol;

    if (widget.reducedMotion) {
      final (:Color fill, :Color symbol) = _logoColors(
        Curves.easeOut.transform(_progress),
      );
      logoFill = fill;
      logoSymbol = symbol;
    } else if (!expandPhase) {
      final (:Color fill, :Color symbol) = _logoColors(
        Curves.easeInCubic.transform(
          (_progress / SplashRevealOverlay.pulseEndFraction).clamp(0.0, 1.0),
        ),
      );
      logoFill = fill;
      logoSymbol = symbol;
    } else {
      logoFill = widget.coverColor;
      logoSymbol = SplashRevealOverlay.silhouetteSymbolColor;
    }

    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (!expandPhase && coverOpacity > 0)
            Opacity(opacity: coverOpacity, child: const StarfieldBackground()),
          if (expandPhase && coverOpacity > 0)
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
          if (coverOpacity > 0)
            Positioned(
              left: center.dx - logoHalf,
              top: center.dy - logoHalf,
              width: SplashRevealOverlay.logoSize,
              height: SplashRevealOverlay.logoSize,
              child: Opacity(
                opacity: coverOpacity,
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

double splashRevealExpandPhaseProgress(double progress) {
  if (progress <= SplashRevealOverlay.pulseEndFraction) {
    return 0;
  }
  return ((progress - SplashRevealOverlay.pulseEndFraction) /
          (1 - SplashRevealOverlay.pulseEndFraction))
      .clamp(0.0, 1.0);
}

double splashRevealLogoScale(double progress, {required bool reducedMotion}) {
  if (reducedMotion) {
    return 1;
  }
  if (progress <= SplashRevealOverlay.pulseEndFraction) {
    final double t = Curves.easeInCubic.transform(
      progress / SplashRevealOverlay.pulseEndFraction,
    );
    return lerpDouble(1, SplashRevealOverlay.pulseScale, t)!;
  }
  if (!SplashRevealOverlay.useLogoZoomTransition) {
    return SplashRevealOverlay.pulseScale;
  }
  final double expandT = splashRevealExpandPhaseProgress(progress);
  return lerpDouble(
    SplashRevealOverlay.pulseScale,
    SplashRevealOverlay.expandScale,
    Curves.easeInCubic.transform(expandT),
  )!;
}

double splashRevealLayerOpacity(
  double progress, {
  required bool reducedMotion,
}) {
  final double p = progress.clamp(0.0, 1.0);
  if (reducedMotion) {
    return 1 - Curves.easeOut.transform(p);
  }
  if (!SplashRevealOverlay.useLogoZoomTransition) {
    if (p <= SplashRevealOverlay.pulseEndFraction) {
      return 1;
    }
    final double fadeT =
        ((p - SplashRevealOverlay.pulseEndFraction) /
                (1 - SplashRevealOverlay.pulseEndFraction))
            .clamp(0.0, 1.0);
    return 1 - Curves.easeOut.transform(fadeT);
  }
  final double eased = Curves.easeInCubic.transform(p);
  if (eased <= SplashRevealOverlay.layerFadeStart) {
    return 1;
  }
  if (eased >= SplashRevealOverlay.layerFadeEnd) {
    return 0;
  }
  final double t =
      (eased - SplashRevealOverlay.layerFadeStart) /
      (SplashRevealOverlay.layerFadeEnd - SplashRevealOverlay.layerFadeStart);
  return 1 - Curves.easeOut.transform(t);
}

double splashRevealShellScale(double progress, {required bool reducedMotion}) {
  if (reducedMotion || !SplashRevealOverlay.useLogoZoomTransition) {
    return 1;
  }
  final double t = Curves.easeInOutCubic.transform(progress.clamp(0.0, 1.0));
  return lerpDouble(SplashRevealOverlay.shellStartScale, 1, t)!;
}
