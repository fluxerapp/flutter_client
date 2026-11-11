import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerDesktopOverhang extends SingleChildRenderObjectWidget {
  const FluxerDesktopOverhang({
    required this.overhang,
    required super.child,
    super.key,
  });

  final EdgeInsetsGeometry overhang;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      RenderFluxerDesktopOverhang(overhang.resolve(Directionality.of(context)));

  @override
  void updateRenderObject(
    BuildContext context,
    RenderFluxerDesktopOverhang renderObject,
  ) {
    renderObject.overhang = overhang.resolve(Directionality.of(context));
  }
}

class RenderFluxerDesktopOverhang extends RenderProxyBox {
  RenderFluxerDesktopOverhang(this._overhang);

  EdgeInsets _overhang;

  EdgeInsets get overhang => _overhang;

  set overhang(EdgeInsets value) {
    if (value == _overhang) {
      return;
    }
    _overhang = value;
    markNeedsLayout();
  }

  Offset get _childOffset => Offset(-_overhang.left, -_overhang.top);

  BoxConstraints _inflate(BoxConstraints constraints) {
    final double h = _overhang.horizontal;
    final double v = _overhang.vertical;
    return BoxConstraints(
      minWidth: constraints.minWidth + h,
      maxWidth: constraints.maxWidth + h,
      minHeight: constraints.minHeight + v,
      maxHeight: constraints.maxHeight + v,
    );
  }

  Size _deflate(BoxConstraints constraints, Size childSize) =>
      constraints.constrain(
        Size(
          math.max(0, childSize.width - _overhang.horizontal),
          math.max(0, childSize.height - _overhang.vertical),
        ),
      );

  @override
  void performLayout() {
    final RenderBox? child = this.child;
    if (child == null) {
      size = constraints.smallest;
      return;
    }
    child.layout(_inflate(constraints), parentUsesSize: true);
    size = _deflate(constraints, child.size);
  }

  @override
  double computeMinIntrinsicWidth(double height) => math.max(
    0,
    super.computeMinIntrinsicWidth(height) - _overhang.horizontal,
  );

  @override
  double computeMaxIntrinsicWidth(double height) => math.max(
    0,
    super.computeMaxIntrinsicWidth(height) - _overhang.horizontal,
  );

  @override
  double computeMinIntrinsicHeight(double width) =>
      math.max(0, super.computeMinIntrinsicHeight(width) - _overhang.vertical);

  @override
  double computeMaxIntrinsicHeight(double width) =>
      math.max(0, super.computeMaxIntrinsicHeight(width) - _overhang.vertical);

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final RenderBox? child = this.child;
    if (child == null) {
      return constraints.smallest;
    }
    return _deflate(constraints, child.getDryLayout(_inflate(constraints)));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? child = this.child;
    if (child != null) {
      context.paintChild(child, offset + _childOffset);
    }
  }

  @override
  void applyPaintTransform(RenderBox child, Matrix4 transform) {
    transform.translateByDouble(_childOffset.dx, _childOffset.dy, 0, 1);
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (!_overhang.inflateRect(Offset.zero & size).contains(position)) {
      return false;
    }
    if (hitTestChildren(result, position: position)) {
      result.add(BoxHitTestEntry(this, position));
      return true;
    }
    return false;
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final RenderBox? child = this.child;
    if (child == null) {
      return false;
    }
    return result.addWithPaintOffset(
      offset: _childOffset,
      position: position,
      hitTest: (BoxHitTestResult result, Offset transformed) =>
          child.hitTest(result, position: transformed),
    );
  }
}
