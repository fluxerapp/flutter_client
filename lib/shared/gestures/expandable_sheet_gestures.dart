import 'dart:async' show unawaited;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';

const double kExpandableSheetSnapMidpointFraction = 0.42;
const double kExpandableSheetFlingVelocityThreshold = 650;

Duration expandableSheetSnapDuration(
  BuildContext context, {
  required bool isDragging,
}) {
  if (isDragging || MediaQuery.disableAnimationsOf(context)) {
    return Duration.zero;
  }
  return context.motion.slow;
}

double expandableSheetBinarySnapHeight({
  required double currentHeight,
  required double velocity,
  required double collapsedHeight,
  required double expandedHeight,
}) {
  final double midpoint =
      collapsedHeight +
      ((expandedHeight - collapsedHeight) *
          kExpandableSheetSnapMidpointFraction);
  if (velocity < -kExpandableSheetFlingVelocityThreshold) {
    return expandedHeight;
  }
  if (velocity > kExpandableSheetFlingVelocityThreshold) {
    return collapsedHeight;
  }
  return currentHeight >= midpoint ? expandedHeight : collapsedHeight;
}

void playExpandableSheetSnapHaptic({
  required bool wasExpanded,
  required bool isExpanded,
}) {
  if (wasExpanded == isExpanded) {
    return;
  }
  if (isExpanded) {
    unawaited(HapticFeedback.mediumImpact());
    return;
  }
  unawaited(HapticFeedback.lightImpact());
}

void playExpandableSheetDismissHaptic() {
  unawaited(HapticFeedback.lightImpact());
}

bool expandableSheetIsPastCollapsedHeight({
  required double currentHeight,
  required double collapsedHeight,
}) {
  return currentHeight > collapsedHeight + 1;
}

void updateExpandableSheetHeight({
  required ValueNotifier<double> heightNotifier,
  required double nextHeight,
}) {
  if (heightNotifier.value == nextHeight) {
    return;
  }
  heightNotifier.value = nextHeight;
}

class ExpandableSheetHeightBuilder extends StatelessWidget {
  const ExpandableSheetHeightBuilder({
    required this.heightNotifier,
    required this.isDraggingNotifier,
    required this.sizeBuilder,
    required this.child,
    super.key,
  });

  final ValueNotifier<double> heightNotifier;
  final ValueNotifier<bool> isDraggingNotifier;
  final Widget Function(
    BuildContext context,
    double height,
    bool isDragging,
    Widget child,
  )
  sizeBuilder;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge(<Listenable>[
        heightNotifier,
        isDraggingNotifier,
      ]),
      builder: (BuildContext context, Widget? stableChild) {
        return sizeBuilder(
          context,
          heightNotifier.value,
          isDraggingNotifier.value,
          stableChild!,
        );
      },
      child: child,
    );
  }
}

Widget expandableSheetAnimatedSize({
  required BuildContext context,
  required bool isDragging,
  required double height,
  required Widget child,
  double? width,
  BoxDecoration? decoration,
  Clip clipBehavior = Clip.none,
}) {
  final Duration duration = isDragging
      ? Duration.zero
      : expandableSheetSnapDuration(context, isDragging: false);
  return AnimatedContainer(
    duration: duration,
    curve: Curves.easeOutCubic,
    width: width,
    height: height,
    decoration: decoration,
    clipBehavior: decoration == null ? Clip.none : clipBehavior,
    child: child,
  );
}

bool? updateExpandableSheetDragHaptic({
  required bool? wasPastCollapsed,
  required double previousHeight,
  required double currentHeight,
  required double collapsedHeight,
}) {
  final bool wasPast =
      wasPastCollapsed ??
      expandableSheetIsPastCollapsedHeight(
        currentHeight: previousHeight,
        collapsedHeight: collapsedHeight,
      );
  final bool isPastCollapsed = expandableSheetIsPastCollapsedHeight(
    currentHeight: currentHeight,
    collapsedHeight: collapsedHeight,
  );
  if (wasPast != isPastCollapsed) {
    playExpandableSheetSnapHaptic(
      wasExpanded: wasPast,
      isExpanded: isPastCollapsed,
    );
  }
  return isPastCollapsed;
}

class ExpandableSheetDragHandlers {
  const ExpandableSheetDragHandlers({
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
    this.onVerticalDragStart,
  });

  final GestureDragStartCallback? onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;

  Widget wrapChrome(Widget child) {
    return ExpandableSheetDragTarget(
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      child: child,
    );
  }
}

class ExpandableSheetDragTarget extends StatelessWidget {
  const ExpandableSheetDragTarget({
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
    required this.child,
    this.onVerticalDragStart,
    super.key,
  });

  final GestureDragStartCallback? onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      child: child,
    );
  }
}
