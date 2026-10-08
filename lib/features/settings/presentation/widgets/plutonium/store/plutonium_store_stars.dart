import 'dart:math' as math;

import 'package:fluxer_app/material_ui.dart';

class PremiumStoreStars extends StatelessWidget {
  const PremiumStoreStars({required this.controller, super.key});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: RepaintBoundary(
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            final double offset = controller.hasClients
                ? _quantize(controller.offset)
                : 0;
            return CustomPaint(
              painter: _StarfieldPainter(offset: offset),
              child: child,
            );
          },
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}

double _quantize(double value) => (value * 2).roundToDouble() / 2;

class _Dot {
  const _Dot(this.x, this.y, this.radius, this.opacity);

  final double x;
  final double y;
  final double radius;
  final double opacity;
}

List<_Dot> _field({
  required int seed,
  required int count,
  required double minRadius,
  required double maxRadius,
  required double minOpacity,
  required double maxOpacity,
}) {
  final math.Random random = math.Random(seed);
  return [
    for (int i = 0; i < count; i++)
      _Dot(
        random.nextDouble(),
        random.nextDouble(),
        minRadius + random.nextDouble() * (maxRadius - minRadius),
        minOpacity + random.nextDouble() * (maxOpacity - minOpacity),
      ),
  ];
}

final List<_Dot> _farStars = _field(
  seed: 3,
  count: 42,
  minRadius: 0.35,
  maxRadius: 0.85,
  minOpacity: 0.18,
  maxOpacity: 0.4,
);

final List<_Dot> _nearStars = _field(
  seed: 11,
  count: 22,
  minRadius: 0.7,
  maxRadius: 1.35,
  minOpacity: 0.35,
  maxOpacity: 0.7,
);

class _StarfieldPainter extends CustomPainter {
  const _StarfieldPainter({required this.offset});

  final double offset;

  @override
  void paint(Canvas canvas, Size size) {
    _paintLayer(
      canvas,
      size,
      stars: _farStars,
      tile: 260,
      drift: offset * 0.18,
    );
    _paintLayer(
      canvas,
      size,
      stars: _nearStars,
      tile: 340,
      drift: offset * 0.42,
    );
  }

  void _paintLayer(
    Canvas canvas,
    Size size, {
    required List<_Dot> stars,
    required double tile,
    required double drift,
  }) {
    final double wrapped = drift % tile;
    final double shift = wrapped < 0 ? wrapped + tile : wrapped;
    final Paint paint = Paint();
    canvas
      ..save()
      ..translate(0, -shift);
    for (double y = -tile; y < size.height + tile; y += tile) {
      for (double x = 0; x < size.width + tile; x += tile) {
        for (final _Dot star in stars) {
          paint.color = const Color(0xFFFFFFFF).withValues(alpha: star.opacity);
          canvas.drawCircle(
            Offset(x + star.x * tile, y + star.y * tile),
            star.radius,
            paint,
          );
        }
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_StarfieldPainter oldDelegate) =>
      oldDelegate.offset != offset;
}
