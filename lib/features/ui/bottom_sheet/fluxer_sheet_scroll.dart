import 'package:flutter/gestures.dart' show Drag;
import 'package:flutter/physics.dart' show Tolerance, nearEqual;
import 'package:fluxer_app/material_ui.dart';

abstract interface class FluxerSheetDragTarget {
  bool get canExpand;

  void dragBy(double deltaDy);

  void endDrag(double velocityDy);
}

class FluxerSheetScrollController extends ScrollController {
  FluxerSheetScrollController(this.target, {this.dragsWhenShort = false});

  final FluxerSheetDragTarget target;
  final bool dragsWhenShort;

  @override
  ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition? oldPosition,
  ) {
    return _FluxerSheetScrollPosition(
      physics: _FluxerSheetContentPhysics(
        dragsWhenShort: dragsWhenShort,
        parent: physics,
      ),
      context: context,
      oldPosition: oldPosition,
      target: target,
    );
  }
}

class _FluxerSheetContentPhysics extends ScrollPhysics {
  const _FluxerSheetContentPhysics({
    required this.dragsWhenShort,
    super.parent,
  });

  final bool dragsWhenShort;

  @override
  _FluxerSheetContentPhysics applyTo(ScrollPhysics? ancestor) {
    return _FluxerSheetContentPhysics(
      dragsWhenShort: dragsWhenShort,
      parent: buildParent(ancestor),
    );
  }

  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) {
    return dragsWhenShort ||
        position.maxScrollExtent > position.minScrollExtent ||
        position.pixels != position.minScrollExtent;
  }
}

enum _FluxerSheetDragOwner { none, content, sheet }

class _FluxerSheetScrollPosition extends ScrollPositionWithSingleContext {
  _FluxerSheetScrollPosition({
    required super.physics,
    required super.context,
    required this.target,
    super.oldPosition,
  });

  final FluxerSheetDragTarget target;
  _FluxerSheetDragOwner _owner = _FluxerSheetDragOwner.none;

  @override
  Drag drag(DragStartDetails details, VoidCallback dragCancelCallback) {
    _owner = _FluxerSheetDragOwner.none;
    if (pixels < minScrollExtent) {
      jumpTo(minScrollExtent);
    }
    return super.drag(details, dragCancelCallback);
  }

  @override
  void applyUserOffset(double delta) {
    if (_owner == _FluxerSheetDragOwner.none) {
      final bool atTop = pixels <= minScrollExtent;
      _owner = atTop && (delta > 0 || target.canExpand)
          ? _FluxerSheetDragOwner.sheet
          : _FluxerSheetDragOwner.content;
    }
    if (_owner == _FluxerSheetDragOwner.sheet) {
      target.dragBy(delta);
      return;
    }
    if (delta > 0) {
      final double room = pixels - minScrollExtent;
      if (delta > room) {
        if (room > 0) {
          super.applyUserOffset(room);
        }
        _owner = _FluxerSheetDragOwner.sheet;
        target.dragBy(delta - room);
        return;
      }
    } else if (maxScrollExtent <= minScrollExtent &&
        pixels <= minScrollExtent) {
      return;
    }
    super.applyUserOffset(delta);
  }

  @override
  void correctBy(double correction) {
    if (hasContentDimensions && _clampsOverscroll(pixels + correction)) {
      return;
    }
    super.correctBy(correction);
  }

  bool _clampsOverscroll(double corrected) {
    final bool clampsTrailing =
        pixels > maxScrollExtent &&
        nearEqual(
          corrected,
          maxScrollExtent,
          Tolerance.defaultTolerance.distance,
        );
    final bool clampsLeading =
        pixels < minScrollExtent &&
        nearEqual(
          corrected,
          minScrollExtent,
          Tolerance.defaultTolerance.distance,
        );
    return clampsTrailing || clampsLeading;
  }

  @override
  void goBallistic(double velocity) {
    final _FluxerSheetDragOwner owner = _owner;
    _owner = _FluxerSheetDragOwner.none;
    if (owner == _FluxerSheetDragOwner.sheet) {
      target.endDrag(-velocity);
      super.goBallistic(0);
      return;
    }
    super.goBallistic(velocity);
  }
}
