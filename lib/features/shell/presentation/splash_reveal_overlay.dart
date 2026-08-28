import 'dart:ui' show lerpDouble;

import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/core/theme/color_utils.dart';
import 'package:fluxer_app/features/ui/background/starfield_background.dart';
import 'package:fluxer_app/features/ui/icons/instance_branding_image.dart';
import 'package:fluxer_app/material_ui.dart';

class SplashRevealOverlay {
  SplashRevealOverlay._();

  static const double logoSize = 85;
  static const double pulseScale = 0.8;
  static const double fadeEndScale = 0.45;
  static const double expandScale = 500;
  static const double pulseEndFraction = 0.08;
  static const double shellStartScale = 1.1;
  static const double symbolViewBox = 512;
  static const Duration totalDuration = Duration(milliseconds: 800);
  static const Duration fadeOnlyDuration = Duration(milliseconds: 350);
  static const Duration reducedMotionDuration = Duration(milliseconds: 300);
  static const int maxTickMicros = 32000;

  static final Color silhouetteSymbolColor = ColorUtils.dim(
    StarfieldBackground.cutoutSymbolColor,
    0.3,
  );

  static void show({
    required BuildContext context,
    required Color coverColor,
    required Color logoBrandColor,
    required Color logoBrandSymbolColor,
    required Offset logoCenterGlobal,
    required bool useLogoZoomTransition,
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
          useLogoZoomTransition: useLogoZoomTransition,
          reducedMotion: !enabled,
          onComplete: () {
            if (entry.mounted) {
              entry.remove();
            }
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
    required this.useLogoZoomTransition,
    required this.reducedMotion,
    required this.onComplete,
  });

  final Color coverColor;
  final Color logoBrandColor;
  final Color logoBrandSymbolColor;
  final Offset logoCenterGlobal;
  final bool useLogoZoomTransition;
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
    if (!widget.useLogoZoomTransition) {
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
      _ticker!.start();
    });
  }

  @override
  void dispose() {
    _ticker?.dispose();
    super.dispose();
  }

  void _onTick(Duration elapsed) {
    if (!mounted) {
      return;
    }
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

  bool _isExpandPhase() {
    if (widget.reducedMotion || !widget.useLogoZoomTransition) {
      return false;
    }
    return _progress > SplashRevealOverlay.pulseEndFraction;
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
      useLogoZoomTransition: widget.useLogoZoomTransition,
    );
    final double coverOpacity = splashRevealLayerOpacity(
      _progress,
      reducedMotion: widget.reducedMotion,
    );

    if (coverOpacity <= 0) {
      return const IgnorePointer();
    }

    if (expandPhase) {
      return IgnorePointer(
        child: CustomPaint(
          painter: _SplashRevealPainter(
            coverColor: widget.coverColor,
            symbolColor: SplashRevealOverlay.silhouetteSymbolColor,
            center: center,
            scale: scale,
            opacity: coverOpacity,
            symbolOpacity: splashRevealSymbolOpacity(_progress),
          ),
          child: const SizedBox.expand(),
        ),
      );
    }

    const double logoHalf = SplashRevealOverlay.logoSize / 2;
    late final Color logoFill;
    late final Color logoSymbol;
    if (widget.reducedMotion) {
      final (:Color fill, :Color symbol) = _logoColors(
        Curves.easeOut.transform(_progress),
      );
      logoFill = fill;
      logoSymbol = symbol;
    } else {
      final (:Color fill, :Color symbol) = _logoColors(
        Curves.easeInCubic.transform(
          (_progress / SplashRevealOverlay.pulseEndFraction).clamp(0.0, 1.0),
        ),
      );
      logoFill = fill;
      logoSymbol = symbol;
    }

    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(opacity: coverOpacity, child: const StarfieldBackground()),
          Positioned(
            left: center.dx - logoHalf,
            top: center.dy - logoHalf,
            width: SplashRevealOverlay.logoSize,
            height: SplashRevealOverlay.logoSize,
            child: Opacity(
              opacity: coverOpacity,
              child: Transform.scale(
                scale: scale,
                child: InstanceBrandMark(
                  size: SplashRevealOverlay.logoSize,
                  backgroundColor: logoFill,
                  symbolColor: logoSymbol,
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
    required this.symbolColor,
    required this.center,
    required this.scale,
    required this.opacity,
    required this.symbolOpacity,
  });

  final Color coverColor;
  final Color symbolColor;
  final Offset center;
  final double scale;
  final double opacity;
  final double symbolOpacity;

  @override
  void paint(Canvas canvas, Size size) {
    if (opacity <= 0 && symbolOpacity <= 0) {
      return;
    }

    const double symbolScale =
        SplashRevealOverlay.logoSize / SplashRevealOverlay.symbolViewBox;
    canvas
      ..clipRect(Offset.zero & size)
      ..drawRect(
        Offset.zero & size,
        Paint()
          ..color = coverColor.withValues(alpha: opacity)
          ..isAntiAlias = true,
      )
      ..save()
      ..translate(center.dx, center.dy)
      ..scale(scale)
      ..translate(
        -SplashRevealOverlay.logoSize / 2,
        -SplashRevealOverlay.logoSize / 2,
      )
      ..scale(symbolScale)
      ..drawPath(
        splashRevealSymbolPath(),
        Paint()
          ..color = symbolColor.withValues(alpha: symbolOpacity)
          ..style = PaintingStyle.fill
          ..isAntiAlias = true,
      )
      ..restore();
  }

  @override
  bool shouldRepaint(covariant _SplashRevealPainter oldDelegate) {
    return oldDelegate.scale != scale ||
        oldDelegate.opacity != opacity ||
        oldDelegate.symbolOpacity != symbolOpacity ||
        oldDelegate.center != center ||
        oldDelegate.coverColor != coverColor ||
        oldDelegate.symbolColor != symbolColor;
  }
}

const String _kFluxerSymbolPathData =
    'M121.272 233.143c-13.443 0-24.6738-10.866-23.0194-24.208 1.7884-14.418 5.4904-26.692 11.1064-36.821 8.685-15.39 19.962-26.59 33.828-33.6 14.019-7.009 28.8-10.514 44.343-10.514 15.543 0 29.638 3.505 42.286 10.514 12.8 6.857 27.657 17.372 44.571 31.543 11.429 9.6 20.419 16.457 26.972 20.572 6.704 3.961 14.171 5.942 22.4 5.942 13.257 0 23.695-4.723 31.314-14.171 3.633-4.505 6.348-10.015 8.145-16.53 3.686-13.366 14.025-25.07 27.889-25.07 13.392 0 24.638 10.739 23.095 24.042-1.681 14.49-5.391 26.819-11.129 36.987-8.686 15.39-20.038 26.59-34.057 33.6-14.019 7.009-28.8 10.514-44.343 10.514-15.543 0-29.714-3.276-42.514-9.829-12.8-6.704-27.581-17.447-44.343-32.228-10.972-9.6-19.886-16.381-26.743-20.343-6.857-4.114-14.4-6.172-22.629-6.172-12.343 0-22.552 4.267-30.628 12.8-4.204 4.442-7.252 10.452-9.143 18.031-3.337 13.367-13.623 24.941-27.401 24.941Zm0 138.057c-13.443 0-24.6738-10.866-23.0194-24.207 1.7884-14.419 5.4904-26.693 11.1064-36.822 8.685-15.39 19.962-26.59 33.828-33.6 14.019-7.009 28.8-10.514 44.343-10.514 15.543 0 29.638 3.505 42.286 10.514 12.8 6.858 27.657 17.372 44.571 31.543 11.429 9.6 20.419 16.457 26.972 20.572 6.704 3.962 14.171 5.943 22.4 5.943 13.257 0 23.695-4.724 31.314-14.172 3.633-4.505 6.348-10.015 8.145-16.53 3.686-13.366 14.025-25.07 27.889-25.07 13.392 0 24.638 10.74 23.095 24.042-1.681 14.49-5.391 26.819-11.129 36.987-8.686 15.39-20.038 26.59-34.057 33.6-14.019 7.009-28.8 10.514-44.343 10.514-15.543 0-29.714-3.276-42.514-9.829-12.8-6.704-27.581-17.447-44.343-32.228-10.972-9.6-19.886-16.381-26.743-20.343-6.857-4.114-14.4-6.171-22.629-6.171-12.343 0-22.552 4.266-30.628 12.8-4.204 4.441-7.252 10.451-9.143 18.03-3.337 13.367-13.623 24.941-27.401 24.941Z';

Path? _symbolPath;

Path splashRevealSymbolPath() {
  return _symbolPath ??= _parseSplashRevealSvgPath(_kFluxerSymbolPathData);
}

Path _parseSplashRevealSvgPath(String source) {
  final Path path = Path();
  final List<double> args = <double>[];
  String command = 'M';
  double cx = 0;
  double cy = 0;
  double startX = 0;
  double startY = 0;

  void apply() {
    switch (command) {
      case 'M':
      case 'm':
        final bool relative = command == 'm';
        for (int i = 0; i + 1 < args.length; i += 2) {
          if (relative) {
            cx += args[i];
            cy += args[i + 1];
          } else {
            cx = args[i];
            cy = args[i + 1];
          }
          if (i == 0) {
            path.moveTo(cx, cy);
            startX = cx;
            startY = cy;
          } else {
            path.lineTo(cx, cy);
          }
        }
      case 'C':
      case 'c':
        final bool relative = command == 'c';
        for (int i = 0; i + 5 < args.length; i += 6) {
          final double x1 = relative ? cx + args[i] : args[i];
          final double y1 = relative ? cy + args[i + 1] : args[i + 1];
          final double x2 = relative ? cx + args[i + 2] : args[i + 2];
          final double y2 = relative ? cy + args[i + 3] : args[i + 3];
          final double x = relative ? cx + args[i + 4] : args[i + 4];
          final double y = relative ? cy + args[i + 5] : args[i + 5];
          path.cubicTo(x1, y1, x2, y2, x, y);
          cx = x;
          cy = y;
        }
      case 'Z':
      case 'z':
        path.close();
        cx = startX;
        cy = startY;
    }
    args.clear();
  }

  final Iterable<RegExpMatch> tokens = RegExp(
    r'([MmZzCc])|([+-]?(?:\d+\.?\d*|\.\d+)(?:[eE][+-]?\d+)?)',
  ).allMatches(source);
  for (final RegExpMatch token in tokens) {
    final String? nextCommand = token.group(1);
    if (nextCommand != null) {
      apply();
      command = nextCommand;
      continue;
    }
    args.add(double.parse(token.group(2)!));
  }
  apply();
  return path;
}

double splashRevealFadePhaseProgress(double progress) {
  if (progress <= SplashRevealOverlay.pulseEndFraction) {
    return 0;
  }
  return ((progress - SplashRevealOverlay.pulseEndFraction) /
          (1 - SplashRevealOverlay.pulseEndFraction))
      .clamp(0.0, 1.0);
}

double splashRevealLogoScale(
  double progress, {
  required bool reducedMotion,
  required bool useLogoZoomTransition,
}) {
  if (reducedMotion) {
    return 1;
  }
  if (progress <= SplashRevealOverlay.pulseEndFraction) {
    final double t = Curves.easeInCubic.transform(
      progress / SplashRevealOverlay.pulseEndFraction,
    );
    return lerpDouble(1, SplashRevealOverlay.pulseScale, t)!;
  }
  if (!useLogoZoomTransition) {
    final double fadeT = splashRevealFadePhaseProgress(progress);
    return lerpDouble(
      SplashRevealOverlay.pulseScale,
      SplashRevealOverlay.fadeEndScale,
      Curves.easeOut.transform(fadeT),
    )!;
  }
  final double expandT = splashRevealFadePhaseProgress(progress);
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
  if (p <= SplashRevealOverlay.pulseEndFraction) {
    return 1;
  }
  final double fadeT = splashRevealFadePhaseProgress(p);
  return 1 - Curves.easeOut.transform(fadeT);
}

/// Symbol silhouette opacity during the zoom expand.
///
/// The strokes outgrow the viewport around the midpoint of the expansion, so
/// the fade completes inside that visible window: solid as the growth starts,
/// clearly dissolving while the waves still fit on screen, gone before they
/// fly past the edges. The cover clears independently and faster
/// ([splashRevealLayerOpacity]) so the app shows through behind the waves.
double splashRevealSymbolOpacity(double progress) {
  const double fadeWindow = 0.5;
  final double windowT = (splashRevealFadePhaseProgress(progress) / fadeWindow)
      .clamp(0.0, 1.0);
  return 1 - Curves.easeInOut.transform(windowT);
}

double splashRevealShellScale(
  double progress, {
  required bool reducedMotion,
  required bool useLogoZoomTransition,
}) {
  if (reducedMotion || !useLogoZoomTransition) {
    return 1;
  }
  final double t = Curves.easeInOutCubic.transform(progress.clamp(0.0, 1.0));
  return lerpDouble(SplashRevealOverlay.shellStartScale, 1, t)!;
}
