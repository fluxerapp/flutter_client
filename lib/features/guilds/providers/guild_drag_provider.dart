import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_drag_provider.g.dart';

const double kGuildDragCollapseThreshold = 12;
const double kGuildNavbarWidth = 72;

enum DropPosition { before, after, combine }

class RegisteredGuildDragTarget {
  const RegisteredGuildDragTarget({
    required this.itemId,
    required this.isFolder,
    required this.allowCombine,
    required this.boundsKey,
  });

  final String itemId;
  final bool isFolder;
  final bool allowCombine;
  final GlobalKey boundsKey;
}

class DragState {
  const DragState({
    this.dragItemId,
    this.dragSourceIsFolder = false,
    this.hoverTargetId,
    this.hoverTargetIsFolder = false,
    this.dropPosition,
    this.hasMovedFromHoldPoint = false,
    this.dragAnchorGlobalCenterX,
    this.dragFeedbackGlobalY,
  });

  final String? dragItemId;
  final bool dragSourceIsFolder;
  final String? hoverTargetId;
  final bool hoverTargetIsFolder;
  final DropPosition? dropPosition;
  final bool hasMovedFromHoldPoint;
  final double? dragAnchorGlobalCenterX;
  final double? dragFeedbackGlobalY;

  bool get isDragging => dragItemId != null;
  bool get hasHoverTarget => hoverTargetId != null;
  bool get showMobileDragFeedback =>
      isDragging && hasMovedFromHoldPoint && dragFeedbackGlobalY != null;

  DragState copyWith({
    String? dragItemId,
    bool? dragSourceIsFolder,
    String? hoverTargetId,
    bool? hoverTargetIsFolder,
    DropPosition? dropPosition,
    bool? hasMovedFromHoldPoint,
    double? dragAnchorGlobalCenterX,
    double? dragFeedbackGlobalY,
    bool clearDragItemId = false,
    bool clearHoverTargetId = false,
    bool clearDropPosition = false,
    bool clearDragAnchorGlobalCenterX = false,
    bool clearDragFeedbackGlobalY = false,
  }) {
    return DragState(
      dragItemId: clearDragItemId ? null : (dragItemId ?? this.dragItemId),
      dragSourceIsFolder: dragSourceIsFolder ?? this.dragSourceIsFolder,
      hoverTargetId: clearHoverTargetId
          ? null
          : (hoverTargetId ?? this.hoverTargetId),
      hoverTargetIsFolder: hoverTargetIsFolder ?? this.hoverTargetIsFolder,
      dropPosition: clearDropPosition
          ? null
          : (dropPosition ?? this.dropPosition),
      hasMovedFromHoldPoint:
          hasMovedFromHoldPoint ?? this.hasMovedFromHoldPoint,
      dragAnchorGlobalCenterX: clearDragAnchorGlobalCenterX
          ? null
          : (dragAnchorGlobalCenterX ?? this.dragAnchorGlobalCenterX),
      dragFeedbackGlobalY: clearDragFeedbackGlobalY
          ? null
          : (dragFeedbackGlobalY ?? this.dragFeedbackGlobalY),
    );
  }
}

@Riverpod(keepAlive: true)
class GuildDrag extends _$GuildDrag {
  Offset? _dragStartGlobalPosition;
  final Map<String, RegisteredGuildDragTarget> _dragTargets =
      <String, RegisteredGuildDragTarget>{};

  @override
  DragState build() => const DragState();

  void registerDragTarget(RegisteredGuildDragTarget target) {
    _dragTargets[target.itemId] = target;
  }

  void unregisterDragTarget(String itemId) {
    _dragTargets.remove(itemId);
  }

  void startDrag(
    String itemId, {
    required bool sourceIsFolder,
    double? anchorGlobalCenterX,
  }) {
    _dragStartGlobalPosition = null;
    state = DragState(
      dragItemId: itemId,
      dragSourceIsFolder: sourceIsFolder,
      dragAnchorGlobalCenterX: anchorGlobalCenterX,
    );
  }

  bool updateDragMovement(Offset globalPosition) {
    _dragStartGlobalPosition ??= globalPosition;
    final bool hasMoved =
        state.hasMovedFromHoldPoint ||
        (globalPosition.dy - _dragStartGlobalPosition!.dy).abs() >=
            kGuildDragCollapseThreshold;
    final bool yChanged = state.dragFeedbackGlobalY != globalPosition.dy;
    final bool movedChanged = state.hasMovedFromHoldPoint != hasMoved;
    if (yChanged || movedChanged) {
      state = state.copyWith(
        dragFeedbackGlobalY: globalPosition.dy,
        hasMovedFromHoldPoint: hasMoved,
      );
    }
    if (!hasMoved) {
      return false;
    }
    return _updateHoverFromGlobalPosition(globalPosition);
  }

  bool _updateHoverFromGlobalPosition(Offset globalPosition) {
    RegisteredGuildDragTarget? matchedTarget;
    RegisteredGuildDragTarget? closestTarget;
    double smallestMatchingArea = double.infinity;
    double closestDistance = double.infinity;

    for (final RegisteredGuildDragTarget target in _dragTargets.values) {
      final RenderBox? renderBox =
          target.boundsKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox == null || !renderBox.hasSize) {
        continue;
      }
      final Offset topLeft = renderBox.localToGlobal(Offset.zero);
      final double top = topLeft.dy;
      final double bottom = top + renderBox.size.height;
      final double centerY = top + renderBox.size.height / 2;

      if (globalPosition.dy >= top && globalPosition.dy <= bottom) {
        final double area = renderBox.size.width * renderBox.size.height;
        if (area < smallestMatchingArea) {
          smallestMatchingArea = area;
          matchedTarget = target;
        }
        continue;
      }

      final double distance = (globalPosition.dy - centerY).abs();
      if (distance < closestDistance) {
        closestDistance = distance;
        closestTarget = target;
      }
    }

    matchedTarget ??= closestTarget;

    if (matchedTarget == null || matchedTarget.itemId == state.dragItemId) {
      clearHover();
      return false;
    }

    final RenderBox renderBox =
        matchedTarget.boundsKey.currentContext!.findRenderObject()!
            as RenderBox;
    final double ratio = globalVerticalDropRatio(renderBox, globalPosition);
    final DropPosition? currentPosition =
        state.hoverTargetId == matchedTarget.itemId ? state.dropPosition : null;
    final DropPosition position = resolveGuildDropPosition(
      ratio: ratio,
      sourceIsFolder: state.dragSourceIsFolder,
      targetIsFolder: matchedTarget.isFolder,
      allowCombine: matchedTarget.allowCombine,
      currentPosition: currentPosition,
    );
    return updateHover(
      targetId: matchedTarget.itemId,
      isFolder: matchedTarget.isFolder,
      position: position,
    );
  }

  bool updateHover({
    required String targetId,
    required bool isFolder,
    required DropPosition position,
  }) {
    final bool didChangeTarget = state.hoverTargetId != targetId;
    final bool didChangePosition = state.dropPosition != position;
    if (!didChangeTarget &&
        !didChangePosition &&
        state.hoverTargetIsFolder == isFolder) {
      return false;
    }
    state = state.copyWith(
      hoverTargetId: targetId,
      hoverTargetIsFolder: isFolder,
      dropPosition: position,
    );
    return didChangeTarget || didChangePosition;
  }

  void clearHover() {
    if (!state.hasHoverTarget && state.dropPosition == null) {
      return;
    }
    state = state.copyWith(
      clearHoverTargetId: true,
      hoverTargetIsFolder: false,
      clearDropPosition: true,
    );
  }

  void endDrag() {
    _dragStartGlobalPosition = null;
    state = const DragState();
  }
}

DropPosition resolveGuildDropPosition({
  required double ratio,
  required bool sourceIsFolder,
  required bool targetIsFolder,
  required bool allowCombine,
  DropPosition? currentPosition,
}) {
  const double inset = 0.08;

  if (sourceIsFolder || !allowCombine) {
    return _resolveSplitDropPosition(
      ratio: ratio,
      split: 0.5,
      currentPosition: currentPosition,
      inset: inset,
    );
  }
  return _resolveSplitDropPosition(
    ratio: ratio,
    split: 0.25,
    currentPosition: currentPosition,
    inset: inset,
    upperSplit: 0.75,
  );
}

DropPosition _resolveSplitDropPosition({
  required double ratio,
  required double split,
  required DropPosition? currentPosition,
  required double inset,
  double? upperSplit,
}) {
  if (upperSplit == null) {
    if (currentPosition == DropPosition.before && ratio < split + inset) {
      return DropPosition.before;
    }
    if (currentPosition == DropPosition.after && ratio > split - inset) {
      return DropPosition.after;
    }
    return ratio < split ? DropPosition.before : DropPosition.after;
  }

  if (currentPosition == DropPosition.before && ratio < split + inset) {
    return DropPosition.before;
  }
  if (currentPosition == DropPosition.combine &&
      ratio > split - inset &&
      ratio < upperSplit + inset) {
    return DropPosition.combine;
  }
  if (currentPosition == DropPosition.after && ratio > upperSplit - inset) {
    return DropPosition.after;
  }
  if (ratio < split) {
    return DropPosition.before;
  }
  if (ratio > upperSplit) {
    return DropPosition.after;
  }
  return DropPosition.combine;
}

double globalVerticalDropRatio(RenderBox renderBox, Offset globalOffset) {
  final Offset topLeft = renderBox.localToGlobal(Offset.zero);
  return ((globalOffset.dy - topLeft.dy) / renderBox.size.height).clamp(
    0.0,
    1.0,
  );
}
