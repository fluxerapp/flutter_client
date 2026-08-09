import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/animation/animation_controller_visibility_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FluxerLoadingSpinner extends StatefulWidget {
  const FluxerLoadingSpinner({super.key, this.color, this.inverted = false});

  final Color? color;
  final bool inverted;

  @override
  State<FluxerLoadingSpinner> createState() => _FluxerLoadingSpinnerState();
}

class _FluxerLoadingSpinnerState extends State<FluxerLoadingSpinner>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late final AnimationController _controller;
  bool _isVisible = true;

  static const _kDotCount = 3;
  static const _kDotSize = 6.0;
  static const _kDotSpacing = 2.0;
  static const _kDuration = Duration(milliseconds: 1400);
  static const List<double> _kDelays = [0.0, 0.2 / 1.4, 0.4 / 1.4];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = AnimationController(vsync: this, duration: _kDuration);
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
    final Color dotColor =
        widget.color ?? (widget.inverted ? Colors.black : Colors.white);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool animationsEnabled = !MediaQuery.disableAnimationsOf(context);
    _controller.syncWithVisibility(
      isVisible: _isVisible,
      animationsEnabled: animationsEnabled,
    );

    return VisibilityDetector(
      key: ObjectKey(this),
      onVisibilityChanged: _onVisibilityChanged,
      child: Semantics(
        label: l10n.uiLoading,
        child: ExcludeSemantics(
          child: SizedBox(
            width: 28,
            height: _kDotSize,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return CustomPaint(
                  painter: _FluxerLoadingDotsPainter(
                    progress: _controller.value,
                    color: dotColor,
                    dotCount: _kDotCount,
                    dotSize: _kDotSize,
                    dotSpacing: _kDotSpacing,
                    delays: _kDelays,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _FluxerLoadingDotsPainter extends CustomPainter {
  const _FluxerLoadingDotsPainter({
    required this.progress,
    required this.color,
    required this.dotCount,
    required this.dotSize,
    required this.dotSpacing,
    required this.delays,
  });

  final double progress;
  final Color color;
  final int dotCount;
  final double dotSize;
  final double dotSpacing;
  final List<double> delays;

  @override
  void paint(Canvas canvas, Size size) {
    final double totalWidth = dotCount * dotSize + (dotCount - 1) * dotSpacing;
    double x = (size.width - totalWidth) / 2;
    final double y = size.height / 2;
    for (int index = 0; index < dotCount; index++) {
      final double phase = (progress - delays[index]) % 1.0;
      final double wave = (math.cos(phase * 2 * math.pi) + 1) / 2;
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
  bool shouldRepaint(covariant _FluxerLoadingDotsPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerLoadingSpinner')
Widget fluxerLoadingSpinnerPreview() {
  return const FluxerLoadingSpinner();
}

@FluxerWidgetPreview(name: 'Inverted', group: 'FluxerLoadingSpinner')
Widget fluxerLoadingSpinnerInvertedPreview() {
  return const ColoredBox(
    color: Color(0xFF5865F2),
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FluxerLoadingSpinner(inverted: true),
    ),
  );
}
