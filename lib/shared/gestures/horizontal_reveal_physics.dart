import 'package:flutter/widgets.dart';
import 'package:fluxer_app/features/shell/presentation/swipe_constants.dart';
import 'package:fluxer_app/shared/gestures/directional_horizontal_drag_recognizer.dart';

enum HorizontalRevealEdge { left, right }

AnimationController createHorizontalRevealController({
  required TickerProvider vsync,
  VoidCallback? onTranslateChanged,
}) {
  final AnimationController controller = AnimationController.unbounded(
    vsync: vsync,
    duration: kHorizontalSwipeRevealDuration,
  );
  if (onTranslateChanged != null) {
    controller.addListener(onTranslateChanged);
  }
  return controller;
}

Future<void> animateHorizontalReveal(
  AnimationController controller,
  double goal,
  Duration duration,
  Curve curve,
) async {
  final double current = controller.value;
  if (current == goal && !controller.isAnimating) {
    return;
  }
  controller.stop();
  await controller.animateTo(goal, duration: duration, curve: curve);
}

double applyHorizontalRevealDrag({
  required HorizontalRevealEdge edge,
  required double translate,
  required double deltaDx,
  required double min,
  required double max,
}) {
  final double next = edge == HorizontalRevealEdge.left
      ? translate + deltaDx
      : translate - deltaDx;
  return next.clamp(min, max);
}

Set<HorizontalClaimDirection> horizontalRevealDragDirections({
  required HorizontalRevealEdge edge,
  required double translate,
}) {
  final HorizontalClaimDirection open = edge == HorizontalRevealEdge.left
      ? HorizontalClaimDirection.right
      : HorizontalClaimDirection.left;
  final HorizontalClaimDirection close = edge == HorizontalRevealEdge.left
      ? HorizontalClaimDirection.left
      : HorizontalClaimDirection.right;
  return <HorizontalClaimDirection>{open, if (translate > 0) close};
}

bool horizontalRevealShouldOpen({
  required HorizontalRevealEdge edge,
  required double translate,
  required double maxExtent,
  required double primaryVelocity,
  required double completionThreshold,
  double flingVelocity = kDrawerSwipeFlingVelocityPxPerSecond,
}) {
  if (maxExtent <= 0) {
    return false;
  }
  if (primaryVelocity.abs() >= flingVelocity) {
    return edge == HorizontalRevealEdge.left
        ? primaryVelocity > 0
        : primaryVelocity < 0;
  }
  return translate / maxExtent >= completionThreshold;
}

void rescaleHorizontalRevealOnWidthChange({
  required AnimationController controller,
  required double previousWidth,
  required double width,
  required void Function(double lastWidth) setLastWidth,
}) {
  if (width <= 0) {
    return;
  }
  final double fraction = previousWidth <= 0
      ? 0
      : controller.value / previousWidth;
  setLastWidth(width);
  controller.value = (fraction * width).clamp(0.0, width);
}

Map<Type, GestureRecognizerFactory> horizontalRevealDragGestures({
  required AnimationController translateController,
  required HorizontalRevealEdge edge,
  required bool Function(PointerDownEvent) shouldDefer,
  required void Function(double deltaDx) onDragUpdate,
  required void Function(DragEndDetails details) onDragEnd,
}) {
  return <Type, GestureRecognizerFactory>{
    DirectionalHorizontalDragRecognizer:
        GestureRecognizerFactoryWithHandlers<
          DirectionalHorizontalDragRecognizer
        >(
          () => DirectionalHorizontalDragRecognizer(
            directions: () => horizontalRevealDragDirections(
              edge: edge,
              translate: translateController.value,
            ),
            shouldDefer: shouldDefer,
          ),
          (DirectionalHorizontalDragRecognizer recognizer) {
            recognizer
              ..onStart = (_) {
                translateController.stop();
              }
              ..onUpdate = (DragUpdateDetails details) {
                onDragUpdate(details.delta.dx);
              }
              ..onEnd = onDragEnd;
          },
        ),
  };
}
