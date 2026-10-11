import 'dart:math';
import 'dart:ui' show PathMetric;

import 'package:fluxer_app/material_ui.dart';

enum DashedBorderShape { circle, roundedRectangle }

class DashedBorderPainter extends CustomPainter {
  const DashedBorderPainter({
    required this.color,
    required this.shape,
    this.strokeWidth = 2,
    this.borderRadius = 0,
  });

  final Color color;
  final DashedBorderShape shape;
  final double strokeWidth;
  final double borderRadius;

  static const double _dashLength = 6;
  static const double _gapLength = 4;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    final Path path = _buildPath(size);
    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final double end = (distance + _dashLength).clamp(0, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance += _dashLength + _gapLength;
      }
    }
  }

  Path _buildPath(Size size) {
    return switch (shape) {
      DashedBorderShape.circle =>
        Path()..addOval(
          Rect.fromLTWH(
            strokeWidth / 2,
            strokeWidth / 2,
            size.width - strokeWidth,
            size.height - strokeWidth,
          ),
        ),
      DashedBorderShape.roundedRectangle =>
        Path()..addRRect(
          RRect.fromRectAndRadius(
            (Offset.zero & size).deflate(strokeWidth / 2),
            Radius.circular(max(0, borderRadius - strokeWidth / 2)),
          ),
        ),
    };
  }

  @override
  bool shouldRepaint(DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.shape != shape ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.borderRadius != borderRadius;
  }
}
