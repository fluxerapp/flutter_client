import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_drag_provider.g.dart';

const double kGuildDragCollapseThreshold = 12;
const double kGuildNavbarWidth = 72;
const double kGuildDragFeedbackSize = 48;
const double kGuildNavbarItemSpacing = 8;
const double kGuildTouchInsertionSlotHeight =
    kGuildDragFeedbackSize + kGuildNavbarItemSpacing;
const double kGuildTouchInsertionSlotHalfHeight =
    kGuildTouchInsertionSlotHeight / 2;
const double kGuildDragHoverSpeedThresholdPxPerMs = 2;
const Duration kGuildDragHoverDwell = Duration(milliseconds: 70);
const double kGuildDragSeamAdjacentTolerance = 4;
const double kGuildRailAutoScrollEdgeExtent = 56;
const double kGuildRailAutoScrollMaxSpeed = 900;
const double kFolderCombineSplit = 0.34;
const double kFolderCombineUpperSplit = 0.66;
const double kGuildMergeCombineSplit = 0.44;
const double kGuildMergeCombineUpperSplit = 0.56;
const double kFolderCombineEdgeInset = 0.1;
const double kGuildMergeCombineEdgeInset = 0.05;

double clampGuildDragFeedbackCenterY({
  required double centerY,
  double? boundsTop,
  double? boundsBottom,
}) {
  if (boundsTop == null || boundsBottom == null) {
    return centerY;
  }
  const double halfExtent = kGuildDragFeedbackSize / 2;
  final double minY = boundsTop + halfExtent;
  final double maxY = boundsBottom - halfExtent;
  if (maxY < minY) {
    return centerY.clamp(boundsTop, boundsBottom);
  }
  return centerY.clamp(minY, maxY);
}

double guildRailAutoScrollVelocity({
  required double pointerY,
  required double top,
  required double bottom,
}) {
  final double halfHeight = (bottom - top) / 2;
  final double extent = halfHeight < kGuildRailAutoScrollEdgeExtent
      ? halfHeight
      : kGuildRailAutoScrollEdgeExtent;
  if (extent <= 0) {
    return 0;
  }
  final double intoTop = top + extent - pointerY;
  if (intoTop > 0) {
    return -kGuildRailAutoScrollMaxSpeed * (intoTop / extent).clamp(0.0, 1.0);
  }
  final double intoBottom = pointerY - (bottom - extent);
  if (intoBottom > 0) {
    return kGuildRailAutoScrollMaxSpeed * (intoBottom / extent).clamp(0.0, 1.0);
  }
  return 0;
}

enum DropPosition { before, after, combine }

@immutable
class GuildDropHoverIntent {
  const GuildDropHoverIntent({
    required this.targetId,
    required this.isFolder,
    required this.position,
  });

  final String targetId;
  final bool isFolder;
  final DropPosition position;

  @override
  bool operator ==(Object other) {
    return other is GuildDropHoverIntent &&
        other.targetId == targetId &&
        other.isFolder == isFolder &&
        other.position == position;
  }

  @override
  int get hashCode => Object.hash(targetId, isFolder, position);
}

@immutable
class GuildDragTargetBounds {
  const GuildDragTargetBounds({
    required this.itemId,
    required this.isFolder,
    required this.top,
    required this.bottom,
  });

  final String itemId;
  final bool isFolder;
  final double top;
  final double bottom;
}

bool shouldDeferGuildHoverUpdate({
  required double verticalSpeedPxPerMs,
  required Duration dwellInPendingTarget,
  required bool hasPendingChange,
}) {
  if (!hasPendingChange) {
    return false;
  }
  if (verticalSpeedPxPerMs < kGuildDragHoverSpeedThresholdPxPerMs) {
    return false;
  }
  if (dwellInPendingTarget >= kGuildDragHoverDwell) {
    return false;
  }
  return true;
}

class _ResolvedGuildHoverIntent {
  const _ResolvedGuildHoverIntent({required this.intent, required this.bounds});

  final GuildDropHoverIntent? intent;
  final List<GuildDragTargetBounds> bounds;
}

GuildDropHoverIntent normalizeGuildDropSeam({
  required GuildDropHoverIntent intent,
  required List<GuildDragTargetBounds> targets,
}) {
  if (intent.position != DropPosition.after) {
    return intent;
  }

  GuildDragTargetBounds? current;
  for (final GuildDragTargetBounds target in targets) {
    if (target.itemId == intent.targetId) {
      current = target;
      break;
    }
  }
  if (current == null) {
    return intent;
  }

  GuildDragTargetBounds? nextTarget;
  double? nextTop;
  for (final GuildDragTargetBounds target in targets) {
    if (target.itemId == intent.targetId) {
      continue;
    }
    if (target.top < current.bottom - kGuildDragSeamAdjacentTolerance) {
      continue;
    }
    if (nextTop == null || target.top < nextTop) {
      nextTop = target.top;
      nextTarget = target;
    }
  }
  if (nextTarget == null) {
    return intent;
  }
  if (nextTarget.top > current.bottom + kGuildDragSeamAdjacentTolerance) {
    return intent;
  }

  return GuildDropHoverIntent(
    targetId: nextTarget.itemId,
    isFolder: nextTarget.isFolder,
    position: DropPosition.before,
  );
}

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
    this.dragSourceAllowGuildMerge = true,
    this.dragSourceSlotTop,
    this.dragSourceSlotBottom,
    this.dragSourceSlotCenterX,
    this.dragSourceSlotCenterY,
    this.hoverTargetId,
    this.hoverTargetIsFolder = false,
    this.dropPosition,
    this.hasMovedFromHoldPoint = false,
    this.dragAnchorGlobalCenterX,
    this.dragFeedbackGlobalY,
  });

  final String? dragItemId;
  final bool dragSourceIsFolder;
  final bool dragSourceAllowGuildMerge;
  final double? dragSourceSlotTop;
  final double? dragSourceSlotBottom;
  final double? dragSourceSlotCenterX;
  final double? dragSourceSlotCenterY;
  final String? hoverTargetId;
  final bool hoverTargetIsFolder;
  final DropPosition? dropPosition;
  final bool hasMovedFromHoldPoint;
  final double? dragAnchorGlobalCenterX;
  final double? dragFeedbackGlobalY;

  bool get isDragging => dragItemId != null;
  bool get hasHoverTarget => hoverTargetId != null;
  bool get showTouchDragFeedback =>
      isDragging && hasMovedFromHoldPoint && dragFeedbackGlobalY != null;

  bool shouldCollapseDragSource({
    required String itemId,
    required bool useTouchDrag,
  }) {
    if (dragItemId != itemId) {
      return false;
    }
    return !useTouchDrag || hasMovedFromHoldPoint;
  }

  DragState copyWith({
    String? dragItemId,
    bool? dragSourceIsFolder,
    bool? dragSourceAllowGuildMerge,
    double? dragSourceSlotTop,
    double? dragSourceSlotBottom,
    double? dragSourceSlotCenterX,
    double? dragSourceSlotCenterY,
    String? hoverTargetId,
    bool? hoverTargetIsFolder,
    DropPosition? dropPosition,
    bool? hasMovedFromHoldPoint,
    double? dragAnchorGlobalCenterX,
    double? dragFeedbackGlobalY,
    bool clearDragItemId = false,
    bool clearDragSourceSlot = false,
    bool clearHoverTargetId = false,
    bool clearDropPosition = false,
    bool clearDragAnchorGlobalCenterX = false,
    bool clearDragFeedbackGlobalY = false,
  }) {
    return DragState(
      dragItemId: clearDragItemId ? null : (dragItemId ?? this.dragItemId),
      dragSourceIsFolder: dragSourceIsFolder ?? this.dragSourceIsFolder,
      dragSourceAllowGuildMerge:
          dragSourceAllowGuildMerge ?? this.dragSourceAllowGuildMerge,
      dragSourceSlotTop: clearDragSourceSlot
          ? null
          : (dragSourceSlotTop ?? this.dragSourceSlotTop),
      dragSourceSlotBottom: clearDragSourceSlot
          ? null
          : (dragSourceSlotBottom ?? this.dragSourceSlotBottom),
      dragSourceSlotCenterX: clearDragSourceSlot
          ? null
          : (dragSourceSlotCenterX ?? this.dragSourceSlotCenterX),
      dragSourceSlotCenterY: clearDragSourceSlot
          ? null
          : (dragSourceSlotCenterY ?? this.dragSourceSlotCenterY),
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

@immutable
class GuildDragItemVisualState {
  const GuildDragItemVisualState({
    required this.dropPosition,
    required this.collapseSource,
  });

  final DropPosition? dropPosition;
  final bool collapseSource;

  @override
  bool operator ==(Object other) {
    return other is GuildDragItemVisualState &&
        other.dropPosition == dropPosition &&
        other.collapseSource == collapseSource;
  }

  @override
  int get hashCode => Object.hash(dropPosition, collapseSource);
}

GuildDropHoverIntent? guildDropHoverIntentForDragSourceSlot({
  required String? dragItemId,
  required bool dragSourceIsFolder,
  required double? slotTop,
  required double? slotBottom,
  required double globalY,
}) {
  if (dragItemId == null || slotTop == null || slotBottom == null) {
    return null;
  }
  if (globalY < slotTop || globalY > slotBottom) {
    return null;
  }
  return GuildDropHoverIntent(
    targetId: dragItemId,
    isFolder: dragSourceIsFolder,
    position: DropPosition.before,
  );
}

bool isGuildReorderSeamOnDragSourceSlot({
  required double? sourceSlotTop,
  required double? sourceSlotBottom,
  required double targetTop,
  required double targetBottom,
  required DropPosition position,
}) {
  if (sourceSlotTop == null || sourceSlotBottom == null) {
    return false;
  }
  if (position == DropPosition.before) {
    return (targetTop - sourceSlotBottom).abs() <=
        kGuildDragSeamAdjacentTolerance;
  }
  if (position == DropPosition.after) {
    return (targetBottom - sourceSlotTop).abs() <=
        kGuildDragSeamAdjacentTolerance;
  }
  return false;
}

GuildDragItemVisualState guildDragVisualStateForItem({
  required DragState state,
  required String itemId,
  required bool useTouchDrag,
}) {
  final bool showDropIndicators = !useTouchDrag || state.hasMovedFromHoldPoint;
  final DropPosition? dropPosition =
      showDropIndicators && state.hoverTargetId == itemId
      ? state.dropPosition
      : null;
  final bool collapseSource = state.shouldCollapseDragSource(
    itemId: itemId,
    useTouchDrag: useTouchDrag,
  );
  return GuildDragItemVisualState(
    dropPosition: dropPosition,
    collapseSource: collapseSource,
  );
}

@Riverpod(keepAlive: true)
class GuildDrag extends _$GuildDrag {
  Offset? _dragStartGlobalPosition;
  double? _lastHoverSpeedSampleY;
  DateTime? _lastHoverSpeedSampleTime;
  String? _pendingDwellTargetId;
  DateTime? _pendingDwellStartedAt;
  final Map<String, RegisteredGuildDragTarget> _dragTargets =
      <String, RegisteredGuildDragTarget>{};
  double? _verticalBoundsTop;
  double? _verticalBoundsBottom;
  Offset? _lastRawDragGlobalPosition;

  @override
  DragState build() => const DragState();

  void updateVerticalBounds({required double top, required double bottom}) {
    _verticalBoundsTop = top;
    _verticalBoundsBottom = bottom;
  }

  void clearVerticalBounds() {
    _verticalBoundsTop = null;
    _verticalBoundsBottom = null;
  }

  Offset _clampDragGlobalPosition(Offset globalPosition) {
    return Offset(
      globalPosition.dx,
      clampGuildDragFeedbackCenterY(
        centerY: globalPosition.dy,
        boundsTop: _verticalBoundsTop,
        boundsBottom: _verticalBoundsBottom,
      ),
    );
  }

  Offset _clampHoverGlobalPosition(Offset globalPosition) {
    final double? top = _verticalBoundsTop;
    final double? bottom = _verticalBoundsBottom;
    if (top == null || bottom == null || bottom < top) {
      return globalPosition;
    }
    return Offset(globalPosition.dx, globalPosition.dy.clamp(top, bottom));
  }

  double autoScrollVelocity() {
    final Offset? pointer = _lastRawDragGlobalPosition;
    final double? top = _verticalBoundsTop;
    final double? bottom = _verticalBoundsBottom;
    if (!state.hasMovedFromHoldPoint ||
        pointer == null ||
        top == null ||
        bottom == null) {
      return 0;
    }
    return guildRailAutoScrollVelocity(
      pointerY: pointer.dy,
      top: top,
      bottom: bottom,
    );
  }

  bool refreshHoverAfterAutoScroll() {
    final Offset? pointer = _lastRawDragGlobalPosition;
    if (!state.hasMovedFromHoldPoint || pointer == null) {
      return false;
    }
    return _updateHoverFromGlobalPosition(pointer, stabilizeHover: false);
  }

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
    bool allowGuildMerge = true,
    double? slotTop,
    double? slotBottom,
    double? slotCenterX,
    double? slotCenterY,
  }) {
    _dragStartGlobalPosition = null;
    _lastRawDragGlobalPosition = null;
    _resetHoverStabilization();
    state = DragState(
      dragItemId: itemId,
      dragSourceIsFolder: sourceIsFolder,
      dragSourceAllowGuildMerge: allowGuildMerge,
      dragSourceSlotTop: slotTop,
      dragSourceSlotBottom: slotBottom,
      dragSourceSlotCenterX: slotCenterX,
      dragSourceSlotCenterY: slotCenterY,
      dragAnchorGlobalCenterX: anchorGlobalCenterX,
    );
  }

  bool updateDragMovement(Offset globalPosition) {
    _lastRawDragGlobalPosition = globalPosition;
    _dragStartGlobalPosition ??= globalPosition;
    final bool hasMoved =
        state.hasMovedFromHoldPoint ||
        (globalPosition.dy - _dragStartGlobalPosition!.dy).abs() >=
            kGuildDragCollapseThreshold;
    final Offset clampedPosition = _clampDragGlobalPosition(globalPosition);
    final bool yChanged = state.dragFeedbackGlobalY != clampedPosition.dy;
    final bool movedChanged = state.hasMovedFromHoldPoint != hasMoved;
    if (yChanged || movedChanged) {
      state = state.copyWith(
        dragFeedbackGlobalY: clampedPosition.dy,
        hasMovedFromHoldPoint: hasMoved,
      );
    }
    if (!hasMoved) {
      return false;
    }
    return _updateHoverFromGlobalPosition(globalPosition, stabilizeHover: true);
  }

  bool finalizeHoverForDrop() {
    final Offset? globalPosition = _lastRawDragGlobalPosition;
    if (globalPosition == null) {
      return false;
    }
    return _updateHoverFromGlobalPosition(
      globalPosition,
      stabilizeHover: false,
    );
  }

  bool _updateHoverFromGlobalPosition(
    Offset globalPosition, {
    required bool stabilizeHover,
  }) {
    final Offset hoverPosition = _clampHoverGlobalPosition(globalPosition);
    final _ResolvedGuildHoverIntent resolved = _resolveHoverIntent(
      hoverPosition,
    );
    if (stabilizeHover) {
      final double speed = _recordHoverSpeedSample(hoverPosition);
      _trackPendingDwell(resolved.intent);
      final GuildDropHoverIntent? applied = _hoverIntentFromState();
      final bool hasPendingChange = resolved.intent != applied;
      final Duration dwell = _pendingDwellStartedAt == null
          ? Duration.zero
          : DateTime.now().difference(_pendingDwellStartedAt!);
      if (shouldDeferGuildHoverUpdate(
        verticalSpeedPxPerMs: speed,
        dwellInPendingTarget: dwell,
        hasPendingChange: hasPendingChange,
      )) {
        return false;
      }
    }
    return _applyHoverIntent(resolved.intent, targetBounds: resolved.bounds);
  }

  _ResolvedGuildHoverIntent _resolveHoverIntent(Offset globalPosition) {
    RegisteredGuildDragTarget? matchedTarget;
    RegisteredGuildDragTarget? closestTarget;
    double smallestMatchingArea = double.infinity;
    double closestDistance = double.infinity;
    final List<GuildDragTargetBounds> bounds = <GuildDragTargetBounds>[];

    for (final RegisteredGuildDragTarget target in _dragTargets.values) {
      final RenderBox? renderBox =
          target.boundsKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox == null || !renderBox.hasSize) {
        continue;
      }
      final Offset topLeft = renderBox.localToGlobal(Offset.zero);
      final double top = topLeft.dy;
      final double bottom = top + renderBox.size.height;
      bounds.add(
        GuildDragTargetBounds(
          itemId: target.itemId,
          isFolder: target.isFolder,
          top: top,
          bottom: bottom,
        ),
      );
    }

    final GuildDropHoverIntent? originSlotIntent =
        guildDropHoverIntentForDragSourceSlot(
          dragItemId: state.dragItemId,
          dragSourceIsFolder: state.dragSourceIsFolder,
          slotTop: state.dragSourceSlotTop,
          slotBottom: state.dragSourceSlotBottom,
          globalY: globalPosition.dy,
        );
    if (originSlotIntent != null) {
      return _ResolvedGuildHoverIntent(
        intent: originSlotIntent,
        bounds: bounds,
      );
    }

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

    if (matchedTarget == null) {
      return _ResolvedGuildHoverIntent(intent: null, bounds: bounds);
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
      sourceAllowGuildMerge: state.dragSourceAllowGuildMerge,
      currentPosition: currentPosition,
    );
    final Offset targetTopLeft = renderBox.localToGlobal(Offset.zero);
    final double targetTop = targetTopLeft.dy;
    final double targetBottom = targetTop + renderBox.size.height;
    if (state.dragItemId != null &&
        isGuildReorderSeamOnDragSourceSlot(
          sourceSlotTop: state.dragSourceSlotTop,
          sourceSlotBottom: state.dragSourceSlotBottom,
          targetTop: targetTop,
          targetBottom: targetBottom,
          position: position,
        )) {
      return _ResolvedGuildHoverIntent(
        intent: GuildDropHoverIntent(
          targetId: state.dragItemId!,
          isFolder: state.dragSourceIsFolder,
          position: DropPosition.before,
        ),
        bounds: bounds,
      );
    }
    return _ResolvedGuildHoverIntent(
      intent: normalizeGuildDropSeam(
        intent: GuildDropHoverIntent(
          targetId: matchedTarget.itemId,
          isFolder: matchedTarget.isFolder,
          position: position,
        ),
        targets: bounds,
      ),
      bounds: bounds,
    );
  }

  Offset? landingGlobalCenter() {
    final String? targetId = state.hoverTargetId;
    final DropPosition? position = state.dropPosition;
    if (targetId == null || position == null) {
      return null;
    }
    return _landingCenterForHover(targetId: targetId, position: position);
  }

  Offset? releaseLandingCenter(String itemId) {
    return _renderBoxCenterForTarget(itemId);
  }

  Offset? _landingCenterForHover({
    required String targetId,
    required DropPosition position,
  }) {
    if (targetId == state.dragItemId && position == DropPosition.before) {
      return dragSourceGlobalCenter();
    }
    final Offset? edge = _globalCenterForTarget(targetId, position);
    if (edge == null) {
      return null;
    }
    switch (position) {
      case DropPosition.before:
        return Offset(edge.dx, edge.dy - kGuildTouchInsertionSlotHalfHeight);
      case DropPosition.after:
        return Offset(edge.dx, edge.dy + kGuildTouchInsertionSlotHalfHeight);
      case DropPosition.combine:
        return edge;
    }
  }

  Offset? _renderBoxCenterForTarget(String itemId) {
    final RegisteredGuildDragTarget? target = _dragTargets[itemId];
    if (target == null) {
      return null;
    }
    final RenderBox? renderBox =
        target.boundsKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.hasSize) {
      return null;
    }
    final Offset topLeft = renderBox.localToGlobal(Offset.zero);
    return Offset(
      topLeft.dx + renderBox.size.width / 2,
      topLeft.dy + renderBox.size.height / 2,
    );
  }

  Offset? dragSourceGlobalCenter() {
    if (state.dragSourceSlotCenterX != null &&
        state.dragSourceSlotCenterY != null) {
      return Offset(state.dragSourceSlotCenterX!, state.dragSourceSlotCenterY!);
    }
    final String? sourceId = state.dragItemId;
    if (sourceId == null) {
      return null;
    }
    return _globalCenterForTarget(sourceId, DropPosition.combine);
  }

  Offset? _globalCenterForTarget(String itemId, DropPosition position) {
    if (itemId == state.dragItemId &&
        state.dragSourceSlotTop != null &&
        state.dragSourceSlotBottom != null &&
        state.dragSourceSlotCenterX != null &&
        state.dragSourceSlotCenterY != null) {
      final double centerX = state.dragSourceSlotCenterX!;
      switch (position) {
        case DropPosition.before:
          return Offset(centerX, state.dragSourceSlotTop!);
        case DropPosition.after:
          return Offset(centerX, state.dragSourceSlotBottom!);
        case DropPosition.combine:
          return Offset(centerX, state.dragSourceSlotCenterY!);
      }
    }
    final RegisteredGuildDragTarget? target = _dragTargets[itemId];
    if (target == null) {
      return null;
    }
    final RenderBox? renderBox =
        target.boundsKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.hasSize) {
      return null;
    }
    final Offset topLeft = renderBox.localToGlobal(Offset.zero);
    final double centerX = topLeft.dx + renderBox.size.width / 2;
    final double top = topLeft.dy;
    final double bottom = top + renderBox.size.height;
    final double centerY = top + renderBox.size.height / 2;
    switch (position) {
      case DropPosition.before:
        return Offset(centerX, top);
      case DropPosition.after:
        return Offset(centerX, bottom);
      case DropPosition.combine:
        return Offset(centerX, centerY);
    }
  }

  List<GuildDragTargetBounds> _collectTargetBounds() {
    final List<GuildDragTargetBounds> bounds = <GuildDragTargetBounds>[];
    for (final RegisteredGuildDragTarget target in _dragTargets.values) {
      final RenderBox? renderBox =
          target.boundsKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox == null || !renderBox.hasSize) {
        continue;
      }
      final Offset topLeft = renderBox.localToGlobal(Offset.zero);
      bounds.add(
        GuildDragTargetBounds(
          itemId: target.itemId,
          isFolder: target.isFolder,
          top: topLeft.dy,
          bottom: topLeft.dy + renderBox.size.height,
        ),
      );
    }
    return bounds;
  }

  GuildDropHoverIntent? _hoverIntentFromState() {
    final String? targetId = state.hoverTargetId;
    final DropPosition? position = state.dropPosition;
    if (targetId == null || position == null) {
      return null;
    }
    return GuildDropHoverIntent(
      targetId: targetId,
      isFolder: state.hoverTargetIsFolder,
      position: position,
    );
  }

  bool _applyHoverIntent(
    GuildDropHoverIntent? intent, {
    List<GuildDragTargetBounds>? targetBounds,
  }) {
    if (intent == null) {
      final bool hadHover = state.hasHoverTarget || state.dropPosition != null;
      clearHover();
      return hadHover;
    }
    return updateHover(
      targetId: intent.targetId,
      isFolder: intent.isFolder,
      position: intent.position,
      targetBounds: targetBounds,
    );
  }

  double _recordHoverSpeedSample(Offset globalPosition) {
    final DateTime now = DateTime.now();
    if (_lastHoverSpeedSampleTime == null || _lastHoverSpeedSampleY == null) {
      _lastHoverSpeedSampleTime = now;
      _lastHoverSpeedSampleY = globalPosition.dy;
      return 0;
    }
    final double elapsedMs =
        now.difference(_lastHoverSpeedSampleTime!).inMicroseconds.toDouble() /
        1000;
    _lastHoverSpeedSampleTime = now;
    final double deltaY = globalPosition.dy - _lastHoverSpeedSampleY!;
    _lastHoverSpeedSampleY = globalPosition.dy;
    if (elapsedMs <= 0) {
      return 0;
    }
    return deltaY.abs() / elapsedMs;
  }

  void _trackPendingDwell(GuildDropHoverIntent? resolved) {
    final String? targetId = resolved?.targetId;
    if (targetId != _pendingDwellTargetId) {
      _pendingDwellTargetId = targetId;
      _pendingDwellStartedAt = DateTime.now();
    }
  }

  void _resetHoverStabilization() {
    _lastHoverSpeedSampleY = null;
    _lastHoverSpeedSampleTime = null;
    _pendingDwellTargetId = null;
    _pendingDwellStartedAt = null;
  }

  bool updateHover({
    required String targetId,
    required bool isFolder,
    required DropPosition position,
    List<GuildDragTargetBounds>? targetBounds,
  }) {
    final GuildDropHoverIntent intent = normalizeGuildDropSeam(
      intent: GuildDropHoverIntent(
        targetId: targetId,
        isFolder: isFolder,
        position: position,
      ),
      targets: targetBounds ?? _collectTargetBounds(),
    );
    final bool didChangeTarget = state.hoverTargetId != intent.targetId;
    final bool didChangePosition = state.dropPosition != intent.position;
    if (!didChangeTarget &&
        !didChangePosition &&
        state.hoverTargetIsFolder == intent.isFolder) {
      return false;
    }
    state = state.copyWith(
      hoverTargetId: intent.targetId,
      hoverTargetIsFolder: intent.isFolder,
      dropPosition: intent.position,
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
    _lastRawDragGlobalPosition = null;
    _resetHoverStabilization();
    state = const DragState();
  }
}

DropPosition resolveGuildDropPosition({
  required double ratio,
  required bool sourceIsFolder,
  required bool targetIsFolder,
  required bool allowCombine,
  bool sourceAllowGuildMerge = true,
  DropPosition? currentPosition,
}) {
  const double reorderInset = 0.08;

  if (sourceIsFolder || !allowCombine) {
    return _resolveSplitDropPosition(
      ratio: ratio,
      split: 0.5,
      currentPosition: currentPosition,
      inset: reorderInset,
    );
  }
  if (targetIsFolder) {
    return _resolveSplitDropPosition(
      ratio: ratio,
      split: kFolderCombineSplit,
      currentPosition: currentPosition,
      inset: kFolderCombineEdgeInset,
      upperSplit: kFolderCombineUpperSplit,
    );
  }
  if (!sourceAllowGuildMerge) {
    return _resolveSplitDropPosition(
      ratio: ratio,
      split: 0.5,
      currentPosition: currentPosition,
      inset: reorderInset,
    );
  }
  return _resolveSplitDropPosition(
    ratio: ratio,
    split: kGuildMergeCombineSplit,
    currentPosition: currentPosition,
    inset: kGuildMergeCombineEdgeInset,
    upperSplit: kGuildMergeCombineUpperSplit,
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
  if (ratio < split) {
    return DropPosition.before;
  }
  if (currentPosition == DropPosition.combine && ratio <= upperSplit + inset) {
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
