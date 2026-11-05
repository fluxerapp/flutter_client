part of 'fluxer_desktop_surface.dart';

class FluxerDesktopAnchoredLayoutDelegate extends SingleChildLayoutDelegate {
  FluxerDesktopAnchoredLayoutDelegate({
    required this.posture,
    this.position,
    this.anchor,
    this.placement = FluxerDesktopPlacement.belowStart,
  });

  final DeviceFoldPosture posture;
  final Offset? position;
  final Rect? anchor;
  final FluxerDesktopPlacement placement;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.deflate(const EdgeInsets.all(_kEdgePadding)).loosen();
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    const double edge = _kEdgePadding;
    final Rect? anchorRect = anchor;
    final Offset point =
        position ?? size.center(Offset.zero) - childSize.center(Offset.zero);
    double x;
    double y;
    if (anchorRect != null) {
      final double above = anchorRect.top - _kAnchorGap - childSize.height;
      final double below = anchorRect.bottom + _kAnchorGap;
      switch (placement) {
        case FluxerDesktopPlacement.rightStart:
          x = anchorRect.right + _kPopoutSideGap;
          if (x + childSize.width > size.width - edge) {
            x = anchorRect.left - _kPopoutSideGap - childSize.width;
          }
          y = anchorRect.top;
        case FluxerDesktopPlacement.aboveStart:
          x = anchorRect.left;
          y = above >= edge ? above : below;
        case FluxerDesktopPlacement.belowStart:
        case FluxerDesktopPlacement.belowEnd:
          x = placement == FluxerDesktopPlacement.belowEnd
              ? anchorRect.right - childSize.width
              : anchorRect.left;
          y = below + childSize.height > size.height - edge && above >= edge
              ? above
              : below;
      }
    } else {
      x = point.dx;
      y = point.dy;
      if (x + childSize.width > size.width - edge &&
          x - childSize.width >= edge) {
        x -= childSize.width;
      }
      if (y + childSize.height > size.height - edge &&
          y - childSize.height >= edge) {
        y -= childSize.height;
      }
    }
    Offset resolved = Offset(
      x.clamp(edge, _upperBound(size.width, childSize.width)),
      y.clamp(edge, _upperBound(size.height, childSize.height)),
    );
    final Rect? hinge = posture.hingeBounds;
    if (hinge != null) {
      resolved += shiftOffHingeForPoint(
        window: size,
        hinge: hinge,
        point: resolved,
        childSize: childSize,
      );
    }
    return resolved;
  }

  double _upperBound(double extent, double child) {
    final double upper = extent - child - _kEdgePadding;
    return upper < _kEdgePadding ? _kEdgePadding : upper;
  }

  @override
  bool shouldRelayout(FluxerDesktopAnchoredLayoutDelegate oldDelegate) {
    return position != oldDelegate.position ||
        anchor != oldDelegate.anchor ||
        placement != oldDelegate.placement ||
        posture != oldDelegate.posture;
  }
}

class FluxerDesktopRoute<T> extends PopupRoute<T> {
  FluxerDesktopRoute({
    required this.surface,
    required this.builder,
    required this.capturedThemes,
    required this.dismissible,
    required this.dismissLabel,
    required this.duration,
    this.origin,
    this.barrierTint,
  });

  final FluxerDesktopSurface surface;
  final WidgetBuilder builder;
  final CapturedThemes capturedThemes;
  final bool dismissible;
  final String dismissLabel;
  final Duration duration;
  final Route<dynamic>? origin;
  final Color? barrierTint;

  bool get _isModal => surface == FluxerDesktopSurface.modal;

  bool get isEntering => animation?.status == AnimationStatus.forward;

  @override
  Color? get barrierColor =>
      barrierTint ??
      (_isModal ? Colors.black.withValues(alpha: 0.35) : Colors.transparent);

  @override
  bool get barrierDismissible => dismissible;

  @override
  String? get barrierLabel => dismissLabel;

  @override
  Duration get transitionDuration => duration;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final Widget page = Builder(builder: builder);
    return capturedThemes.wrap(
      _isModal
          ? page
          : Stack(
              children: [
                Positioned.fill(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerDown: (PointerDownEvent event) {
                      if (dismissible && event.buttons == kSecondaryButton) {
                        navigator?.maybePop();
                      }
                    },
                  ),
                ),
                page,
              ],
            ),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final CurvedAnimation curved = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    );
    if (!_isModal) {
      return FadeTransition(opacity: curved, child: child);
    }
    return FadeTransition(
      opacity: curved,
      child: Stack(
        fit: StackFit.expand,
        children: [
          IgnorePointer(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: const SizedBox.expand(),
            ),
          ),
          ScaleTransition(
            scale: Tween<double>(begin: 0.98, end: 1).animate(curved),
            child: child,
          ),
        ],
      ),
    );
  }
}

Duration fluxerDesktopAnchoredTransition(BuildContext context) =>
    context.motion.normal > Duration.zero
    ? _kAnchoredTransition
    : Duration.zero;

Rect? fluxerDesktopPressAnchorOf(
  BuildContext context, {
  required NavigatorState navigator,
}) {
  final Rect? box = fluxerDesktopWidgetRectOf(context, navigator: navigator);
  final Offset? press = fluxerDesktopPressPosition(
    context,
    navigator: navigator,
  );
  final bool boxIsCompact =
      box != null &&
      box.width <= _kAnchorMaxWidth &&
      box.height <= _kAnchorMaxHeight;
  if (press == null) {
    return boxIsCompact ? box : null;
  }
  if (boxIsCompact && box.contains(press)) {
    return box;
  }
  return Rect.fromLTWH(press.dx, press.dy, 0, 0);
}

Rect? fluxerDesktopWidgetRectOf(
  BuildContext anchorContext, {
  required NavigatorState navigator,
}) {
  final RenderObject? anchor = anchorContext.findRenderObject();
  final RenderObject? overlay = navigator.overlay?.context.findRenderObject();
  if (anchor is! RenderBox || overlay is! RenderBox || !anchor.hasSize) {
    return null;
  }
  return anchor.localToGlobal(Offset.zero, ancestor: overlay) & anchor.size;
}

Offset? fluxerDesktopPressPosition(
  BuildContext context, {
  required NavigatorState navigator,
}) {
  final Offset? global = ProviderScope.containerOf(
    context,
    listen: false,
  ).read(inputModalityProvider.notifier).lastPointerDownPosition;
  final RenderObject? overlay = navigator.overlay?.context.findRenderObject();
  if (global == null || overlay is! RenderBox) {
    return null;
  }
  return overlay.globalToLocal(global);
}

Future<T?> pushFluxerDesktopRoute<T>(
  BuildContext context, {
  required NavigatorState navigator,
  required FluxerDesktopSurface surface,
  required WidgetBuilder builder,
  bool dismissible = true,
  Route<dynamic>? origin,
  Color? barrierTint,
  void Function(FluxerDesktopRoute<T> route)? onCreated,
}) {
  final FluxerDesktopRoute<T> route = FluxerDesktopRoute<T>(
    surface: surface,
    origin: origin,
    dismissible: dismissible,
    barrierTint: barrierTint,
    dismissLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    duration: surface == FluxerDesktopSurface.modal
        ? context.motion.normal
        : fluxerDesktopAnchoredTransition(context),
    capturedThemes: InheritedTheme.capture(
      from: context,
      to: navigator.context,
    ),
    builder: builder,
  );
  onCreated?.call(route);
  return navigator.push<T>(route);
}
