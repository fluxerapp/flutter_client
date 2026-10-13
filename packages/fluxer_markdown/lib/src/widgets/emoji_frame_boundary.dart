import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class FluxerEmojiFrameBoundary extends StatelessWidget {
  const FluxerEmojiFrameBoundary({
    required this.size,
    required this.child,
    super.key,
  });

  final double size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _FixedSquare(
      size: size,
      child: RepaintBoundary(
        child: LayoutBuilder(
          builder: (BuildContext _, BoxConstraints _) => child,
        ),
      ),
    );
  }
}

class _FixedSquare extends SingleChildRenderObjectWidget {
  const _FixedSquare({required this.size, super.child});

  final double size;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderFixedSquare(size);

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderFixedSquare renderObject,
  ) {
    renderObject.extent = size;
  }
}

class _RenderFixedSquare extends RenderProxyBox {
  _RenderFixedSquare(this._extent);

  double _extent;
  double get extent => _extent;
  set extent(double value) {
    if (value == _extent) {
      return;
    }
    _extent = value;
    markNeedsLayout();
  }

  @override
  bool get sizedByParent => true;

  @override
  Size computeDryLayout(BoxConstraints constraints) =>
      constraints.constrain(Size.square(_extent));

  @override
  double? computeDryBaseline(
    BoxConstraints constraints,
    TextBaseline baseline,
  ) => null;

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) => null;

  @override
  double computeMinIntrinsicWidth(double height) => _extent;

  @override
  double computeMaxIntrinsicWidth(double height) => _extent;

  @override
  double computeMinIntrinsicHeight(double width) => _extent;

  @override
  double computeMaxIntrinsicHeight(double width) => _extent;

  @override
  void performLayout() {
    child?.layout(BoxConstraints.tight(size));
  }
}
