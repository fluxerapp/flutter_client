import 'dart:math' as math;

import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_style.dart';
import 'package:fluxer_app/material_ui.dart';

enum _ShapeKind { spark, ring, dot, plus }

class _HeroShapeSpec {
  const _HeroShapeSpec({
    required this.kind,
    required this.y,
    required this.sizeRem,
    required this.sizeVw,
    this.x,
    this.xe,
  });

  final _ShapeKind kind;
  final double? x;
  final double? xe;
  final double y;
  final double sizeRem;
  final double sizeVw;
}

const List<_HeroShapeSpec> _kHeroShapes = [
  _HeroShapeSpec(
    kind: _ShapeKind.spark,
    x: 0.18,
    y: 6,
    sizeRem: 2.5,
    sizeVw: 1.6,
  ),
  _HeroShapeSpec(
    kind: _ShapeKind.ring,
    x: 0.55,
    y: 24,
    sizeRem: 3,
    sizeVw: 1.9,
  ),
  _HeroShapeSpec(kind: _ShapeKind.dot, x: 0.72, y: 8, sizeRem: 1, sizeVw: 0.7),
  _HeroShapeSpec(
    kind: _ShapeKind.plus,
    x: 0.3,
    y: 44,
    sizeRem: 1.75,
    sizeVw: 1.1,
  ),
  _HeroShapeSpec(
    kind: _ShapeKind.spark,
    x: 0.7,
    y: 58,
    sizeRem: 1.5,
    sizeVw: 1,
  ),
  _HeroShapeSpec(
    kind: _ShapeKind.dot,
    x: 0.12,
    y: 66,
    sizeRem: 0.75,
    sizeVw: 0.5,
  ),
  _HeroShapeSpec(
    kind: _ShapeKind.plus,
    x: 0.48,
    y: 80,
    sizeRem: 1.5,
    sizeVw: 1,
  ),
  _HeroShapeSpec(
    kind: _ShapeKind.ring,
    xe: 0.2,
    y: 4,
    sizeRem: 2.25,
    sizeVw: 1.5,
  ),
  _HeroShapeSpec(
    kind: _ShapeKind.plus,
    xe: 0.62,
    y: 16,
    sizeRem: 1.5,
    sizeVw: 1,
  ),
  _HeroShapeSpec(
    kind: _ShapeKind.dot,
    xe: 0.78,
    y: 34,
    sizeRem: 1.25,
    sizeVw: 0.8,
  ),
  _HeroShapeSpec(
    kind: _ShapeKind.spark,
    xe: 0.3,
    y: 40,
    sizeRem: 3,
    sizeVw: 1.9,
  ),
  _HeroShapeSpec(
    kind: _ShapeKind.dot,
    xe: 0.6,
    y: 60,
    sizeRem: 0.875,
    sizeVw: 0.6,
  ),
  _HeroShapeSpec(
    kind: _ShapeKind.ring,
    xe: 0.16,
    y: 70,
    sizeRem: 1.75,
    sizeVw: 1.1,
  ),
  _HeroShapeSpec(
    kind: _ShapeKind.plus,
    xe: 0.5,
    y: 84,
    sizeRem: 2,
    sizeVw: 1.3,
  ),
];

const double _kHeroContentMaxWidth = 896;

double _heroShapeSize(_HeroShapeSpec spec, double width) {
  final double remPx = spec.sizeRem * 16;
  final double vwPx = width * spec.sizeVw / 100;
  return remPx > vwPx ? remPx : vwPx;
}

double _heroShapeGutter(double width) {
  final double side = (width - _kHeroContentMaxWidth) / 2;
  return side > 0 ? side : 0;
}

class PremiumStoreHeroShapes extends StatefulWidget {
  const PremiumStoreHeroShapes({this.scrollController, super.key});

  final ScrollController? scrollController;

  @override
  State<PremiumStoreHeroShapes> createState() => _PremiumStoreHeroShapesState();
}

class _PremiumStoreHeroShapesState extends State<PremiumStoreHeroShapes>
    with SingleTickerProviderStateMixin {
  late final AnimationController _driftController;

  @override
  void initState() {
    super.initState();
    _driftController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    );
    widget.scrollController?.addListener(_repaint);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_reduceMotion) {
      if (_driftController.isAnimating) {
        _driftController.stop();
      }
    } else if (!_driftController.isAnimating) {
      _driftController.repeat();
    }
  }

  @override
  void didUpdateWidget(PremiumStoreHeroShapes oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollController != widget.scrollController) {
      oldWidget.scrollController?.removeListener(_repaint);
      widget.scrollController?.addListener(_repaint);
    }
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_repaint);
    _driftController.dispose();
    super.dispose();
  }

  bool get _reduceMotion {
    return MediaQuery.disableAnimationsOf(context);
  }

  void _repaint() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final PremiumStoreStyle style = PremiumStoreStyle.of(context);
    final double scrollOffset = widget.scrollController?.hasClients ?? false
        ? widget.scrollController!.offset
        : 0;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;
        final double gutter = _heroShapeGutter(width);
        return AnimatedBuilder(
          animation: _driftController,
          builder: (BuildContext context, Widget? child) {
            final double t = _driftController.value * math.pi * 2;
            return Stack(
              clipBehavior: Clip.none,
              children: [
                for (var i = 0; i < _kHeroShapes.length; i++)
                  _ShapePlacement(
                    spec: _kHeroShapes[i],
                    index: i,
                    width: width,
                    height: height,
                    gutter: gutter,
                    style: style,
                    driftT: t,
                    scrollOffset: scrollOffset,
                    animate: !_reduceMotion,
                  ),
              ],
            );
          },
        );
      },
    );
  }
}

class _ShapePlacement extends StatelessWidget {
  const _ShapePlacement({
    required this.spec,
    required this.index,
    required this.width,
    required this.height,
    required this.gutter,
    required this.style,
    required this.driftT,
    required this.scrollOffset,
    required this.animate,
  });

  final _HeroShapeSpec spec;
  final int index;
  final double width;
  final double height;
  final double gutter;
  final PremiumStoreStyle style;
  final double driftT;
  final double scrollOffset;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    final double size = _heroShapeSize(spec, width);
    final double phase = index * 0.9;
    final double driftX = animate ? math.sin(driftT + phase) * 6 : 0;
    final double driftY = animate
        ? math.cos(driftT * 0.85 + phase) * 8 - scrollOffset * 0.04
        : -scrollOffset * 0.04;
    final double? left = spec.x != null
        ? (gutter - size) * spec.x! + driftX
        : null;
    final double? right = spec.xe != null
        ? (gutter - size) * spec.xe! - driftX
        : null;
    final Color color = spec.kind == _ShapeKind.spark
        ? style.heroShapeSpark
        : style.heroShape;
    final double rotation = animate ? math.sin(driftT * 0.5 + phase) * 0.12 : 0;
    return Positioned(
      left: left,
      right: right,
      top: height * spec.y / 100 + driftY,
      width: size,
      height: size,
      child: ExcludeSemantics(
        child: Transform.rotate(
          angle: rotation,
          child: CustomPaint(
            painter: _ShapeGlyphPainter(kind: spec.kind, color: color),
          ),
        ),
      ),
    );
  }
}

class _ShapeGlyphPainter extends CustomPainter {
  const _ShapeGlyphPainter({required this.kind, required this.color});

  final _ShapeKind kind;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fill = Paint()..color = color;
    final Paint stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.15;

    canvas.scale(size.width / 40, size.height / 40);

    switch (kind) {
      case _ShapeKind.ring:
        canvas.drawCircle(const Offset(20, 20), 15, stroke);
      case _ShapeKind.spark:
        canvas.drawPath(
          Path()
            ..moveTo(20, 0)
            ..cubicTo(21.5, 12, 28, 18.5, 40, 20)
            ..cubicTo(28, 21.5, 21.5, 28, 20, 40)
            ..cubicTo(18.5, 28, 12, 21.5, 0, 20)
            ..cubicTo(12, 18.5, 18.5, 12, 20, 0)
            ..close(),
          fill,
        );
      case _ShapeKind.plus:
        canvas.drawPath(
          Path()
            ..moveTo(15, 2)
            ..lineTo(25, 2)
            ..lineTo(25, 15)
            ..lineTo(38, 15)
            ..lineTo(38, 25)
            ..lineTo(25, 25)
            ..lineTo(25, 38)
            ..lineTo(15, 38)
            ..lineTo(15, 25)
            ..lineTo(2, 25)
            ..lineTo(2, 15)
            ..lineTo(15, 15)
            ..close(),
          fill,
        );
      case _ShapeKind.dot:
        canvas.drawCircle(const Offset(20, 20), 20, fill);
    }
  }

  @override
  bool shouldRepaint(_ShapeGlyphPainter oldDelegate) {
    return oldDelegate.kind != kind || oldDelegate.color != color;
  }
}
