import 'dart:math' as math;

import 'package:fluxer_app/features/ui/animation/animation_controller_visibility_extension.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:visibility_detector/visibility_detector.dart';

const int kFluxerTypingDotCount = 3;
const double kFluxerTypingDotSize = 6;
const double kFluxerTypingDotSpacing = 2;
const Duration kFluxerTypingDotDuration = Duration(milliseconds: 1400);
const List<double> kFluxerTypingDotDelays = <double>[0, 0.2 / 1.4, 0.4 / 1.4];

double fluxerTypingDotsWidth({
  double dotSize = kFluxerTypingDotSize,
  double dotSpacing = kFluxerTypingDotSpacing,
}) {
  return kFluxerTypingDotCount * dotSize +
      (kFluxerTypingDotCount - 1) * dotSpacing;
}

double fluxerTypingDotWave(double progress, double delay) {
  final double phase = (progress - delay) % 1;
  return (math.cos(phase * 2 * math.pi) + 1) / 2;
}

class FluxerTypingDots extends StatefulWidget {
  const FluxerTypingDots({
    required this.color,
    this.dotSize = kFluxerTypingDotSize,
    this.dotSpacing = kFluxerTypingDotSpacing,
    super.key,
  });

  final Color color;
  final double dotSize;
  final double dotSpacing;

  @override
  State<FluxerTypingDots> createState() => _FluxerTypingDotsState();
}

class _FluxerTypingDotsState extends State<FluxerTypingDots>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late final AnimationController _controller;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = AnimationController(
      vsync: this,
      duration: kFluxerTypingDotDuration,
    );
    _controller.syncWithVisibility(isVisible: _isVisible);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _controller.syncWithVisibility(isVisible: _isVisible);
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    final bool visible = info.visibleFraction > 0;
    if (_isVisible == visible) {
      return;
    }
    _isVisible = visible;
    _controller.syncWithVisibility(isVisible: _isVisible);
  }

  @override
  Widget build(BuildContext context) {
    final bool animationsEnabled = !MediaQuery.disableAnimationsOf(context);
    _controller.syncWithVisibility(
      isVisible: _isVisible,
      animationsEnabled: animationsEnabled,
    );

    return VisibilityDetector(
      key: ObjectKey(this),
      onVisibilityChanged: _onVisibilityChanged,
      child: SizedBox(
        width: fluxerTypingDotsWidth(
          dotSize: widget.dotSize,
          dotSpacing: widget.dotSpacing,
        ),
        height: widget.dotSize,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return CustomPaint(
              painter: FluxerTypingDotsPainter(
                progress: _controller.value,
                color: widget.color,
                dotSize: widget.dotSize,
                dotSpacing: widget.dotSpacing,
              ),
            );
          },
        ),
      ),
    );
  }
}

class FluxerTypingDotsPainter extends CustomPainter {
  const FluxerTypingDotsPainter({
    required this.progress,
    required this.color,
    required this.dotSize,
    required this.dotSpacing,
  });

  final double progress;
  final Color color;
  final double dotSize;
  final double dotSpacing;

  @override
  void paint(Canvas canvas, Size size) {
    final double totalWidth = fluxerTypingDotsWidth(
      dotSize: dotSize,
      dotSpacing: dotSpacing,
    );
    double x = (size.width - totalWidth) / 2;
    final double y = size.height / 2;
    for (int index = 0; index < kFluxerTypingDotCount; index++) {
      final double wave = fluxerTypingDotWave(
        progress,
        kFluxerTypingDotDelays[index],
      );
      final double opacity = 0.3 + 0.7 * wave;
      final double scale = 0.8 + 0.2 * wave;
      final double radius = dotSize * scale / 2;
      final Paint paint = Paint()
        ..color = color.withValues(alpha: opacity * color.a);
      canvas.drawCircle(Offset(x + dotSize / 2, y), radius, paint);
      x += dotSize + dotSpacing;
    }
  }

  @override
  bool shouldRepaint(covariant FluxerTypingDotsPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.dotSize != dotSize ||
        oldDelegate.dotSpacing != dotSpacing;
  }
}
