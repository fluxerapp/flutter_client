import 'package:fluxer_app/material_ui.dart';

class FluxerFocusRingPainter extends CustomPainter {
  const FluxerFocusRingPainter({
    required this.color,
    required this.borderRadius,
    required this.visible,
    this.outset = 0,
  });

  static const double kRingWidth = 4;

  final Color color;
  final BorderRadius borderRadius;
  final bool visible;
  final double outset;

  @override
  void paint(Canvas canvas, Size size) {
    if (!visible || size.isEmpty) {
      return;
    }
    final RRect inner = borderRadius.toRRect(
      (Offset.zero & size).inflate(outset),
    );
    canvas.drawDRRect(inner.inflate(kRingWidth), inner, Paint()..color = color);
  }

  @override
  bool shouldRepaint(FluxerFocusRingPainter oldDelegate) =>
      color != oldDelegate.color ||
      borderRadius != oldDelegate.borderRadius ||
      visible != oldDelegate.visible ||
      outset != oldDelegate.outset;
}
