import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

const double kFluxerSheetOvershootBleed = 48;

const Duration kFluxerSheetCloseDuration = Duration(milliseconds: 110);
const double kFluxerSheetHandoffRemaining = 0.45;
const Duration kFluxerSheetScrimOpenDuration = Duration(milliseconds: 125);
const Duration kFluxerSheetBackdropLead = Duration(milliseconds: 70);
const Duration kFluxerSheetInputLockout = Duration(milliseconds: 300);
const double kFluxerSheetBackdropSpringOmega = 18.5;

const double kFluxerSheetBackdropScale = 0.924;
const double kFluxerSheetBackdropCornerRadius = 12;
const double kFluxerSheetParallaxMinCoverage = 0.85;
const double kFluxerSheetBackdropCornerRampEnd = 0.25;
const Color kFluxerSheetBackdropDimColor = Color(0x66000000);
const Color kFluxerSheetScrimColor = Color(0xCC000000);

double _sheetOpenSeconds(Animation<double> animation, Duration forward) {
  return animation.value *
      forward.inMicroseconds /
      Duration.microsecondsPerSecond;
}

double fluxerSheetScrimOpacity(Animation<double> animation, Duration forward) {
  if (animation.status == AnimationStatus.reverse || forward <= Duration.zero) {
    return animation.value.clamp(0, 1);
  }
  return (animation.value *
          forward.inMicroseconds /
          kFluxerSheetScrimOpenDuration.inMicroseconds)
      .clamp(0, 1);
}

double fluxerSheetBackdropProgress(
  Animation<double> animation,
  Duration forward,
) {
  if (animation.status == AnimationStatus.reverse ||
      animation.status == AnimationStatus.completed ||
      forward <= Duration.zero) {
    return animation.value.clamp(0, 1);
  }
  final double x =
      kFluxerSheetBackdropSpringOmega * _sheetOpenSeconds(animation, forward);
  return (1 - math.exp(-x) * (1 + x)).clamp(0, 1);
}

class FluxerSheetRoute<T> extends ModalBottomSheetRoute<T> {
  FluxerSheetRoute({
    required super.builder,
    required super.isScrollControlled,
    this.origin,
    this.inputLockout = Duration.zero,
    super.capturedThemes,
    super.barrierLabel,
    super.barrierOnTapHint,
    super.backgroundColor,
    super.elevation,
    super.isDismissible,
    super.modalBarrierColor,
    super.enableDrag,
    super.useSafeArea,
    super.sheetAnimationStyle,
  }) : _inputLocked = ValueNotifier<bool>(inputLockout > Duration.zero);

  static FluxerSheetRoute<dynamic>? _scrimHandoff;

  final Route<dynamic>? origin;
  final Duration inputLockout;
  Route<dynamic>? _previous;
  final ValueNotifier<double> _scrimTravel = ValueNotifier<double>(1);
  final ValueNotifier<double?> _scrimPin = ValueNotifier<double?>(null);
  double _scrimFloor = 0;
  bool _disposed = false;
  final ValueNotifier<bool> _inputLocked;
  bool _travelFlushScheduled = false;
  double _pendingTravel = 1;
  GoRouter? _router;
  String? _routerPath;

  bool get isEntering => _inputLocked.value;

  FluxerSheetBackdropProgress? get backdrop {
    final Route<dynamic>? previous = _previous;
    if (previous != null && previous is FluxerSheetBackdropHost) {
      return FluxerSheetBackdropProgress.of(previous);
    }
    final NavigatorState? nav = navigator;
    return nav == null ? null : FluxerSheetBackdropProgress.of(nav);
  }

  @override
  void didChangePrevious(Route<dynamic>? previousRoute) {
    super.didChangePrevious(previousRoute);
    _previous = previousRoute;
  }

  bool _barrierDismissing = false;

  bool get isBarrierDismissing => _barrierDismissing;

  void _dismissFromBarrier() {
    final NavigatorState? nav = navigator;
    if (nav == null || !isCurrent) {
      return;
    }
    _barrierDismissing = true;
    unawaited(nav.maybePop().whenComplete(() => _barrierDismissing = false));
  }

  void holdScrimForHandoff() {
    final Animation<double>? routeAnimation = animation;
    if (routeAnimation == null ||
        routeAnimation.status != AnimationStatus.reverse) {
      return;
    }
    _scrimPin.value = _scrimOpacity(routeAnimation);
    _scrimHandoff = this;
  }

  void _adoptScrimHandoff() {
    final FluxerSheetRoute<dynamic>? held = _scrimHandoff;
    _scrimHandoff = null;
    final double? pinned = held?._scrimPin.value;
    if (held == null || identical(held, this)) {
      return;
    }
    if (pinned == null || pinned <= 0) {
      return;
    }
    _scrimFloor = pinned;
    held._releaseScrim();
  }

  void _releaseScrim() {
    if (SchedulerBinding.instance.schedulerPhase !=
        SchedulerPhase.persistentCallbacks) {
      _scrimPin.value = 0;
      return;
    }
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!_disposed) {
        _scrimPin.value = 0;
      }
    });
  }

  double _scrimOpacity(Animation<double> routeAnimation) {
    final double? pinned = _scrimPin.value;
    if (pinned != null) {
      return pinned;
    }
    final double opacity =
        fluxerSheetScrimOpacity(routeAnimation, transitionDuration) *
        _scrimTravel.value;
    if (routeAnimation.status == AnimationStatus.forward &&
        opacity < _scrimFloor) {
      return _scrimFloor;
    }
    return opacity;
  }

  @override
  void install() {
    super.install();
    _adoptScrimHandoff();
    animation?.addListener(_syncInputLock);
    animation?.addStatusListener(_syncInputLockStatus);
    _syncInputLock();
    final NavigatorState? nav = navigator;
    final GoRouter? router = nav == null ? null : GoRouter.maybeOf(nav.context);
    if (router != null) {
      _router = router;
      _routerPath = _currentRouterPath(router);
      router.routerDelegate.addListener(_handleRouterChange);
    }
  }

  @override
  TickerFuture didPush() {
    final TickerFuture entrance = super.didPush();
    final AnimationController? entranceController = controller;
    if (entranceController == null || transitionDuration <= Duration.zero) {
      return entrance;
    }
    entranceController.stop();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (isActive && entranceController.status == AnimationStatus.forward) {
        entranceController.forward();
      }
    });
    return entrance;
  }

  void _syncInputLock() {
    if (!_inputLocked.value) {
      return;
    }
    final Animation<double>? routeAnimation = animation;
    if (routeAnimation == null) {
      return;
    }
    final AnimationStatus status = routeAnimation.status;
    final double elapsedUs =
        routeAnimation.value * transitionDuration.inMicroseconds;
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.reverse ||
        elapsedUs >= inputLockout.inMicroseconds) {
      _inputLocked.value = false;
    }
  }

  void _syncInputLockStatus(AnimationStatus status) => _syncInputLock();

  static String _currentRouterPath(GoRouter router) {
    return router.routerDelegate.currentConfiguration.uri.path;
  }

  void _handleRouterChange() {
    final GoRouter? router = _router;
    if (router == null) {
      return;
    }
    final String path = _currentRouterPath(router);
    if (path.isEmpty || path == _routerPath) {
      return;
    }
    _detachRouter();
    scheduleMicrotask(closeSelf);
  }

  void _detachRouter() {
    _router?.routerDelegate.removeListener(_handleRouterChange);
    _router = null;
  }

  void closeSelf([T? result]) {
    final NavigatorState? nav = navigator;
    if (nav == null || !nav.mounted || !isActive) {
      return;
    }
    if (isCurrent) {
      nav.pop<T>(result);
      return;
    }
    nav.removeRoute<T>(this, result);
  }

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return ValueListenableBuilder<bool>(
      valueListenable: _inputLocked,
      child: super.buildPage(context, animation, secondaryAnimation),
      builder: (BuildContext context, bool locked, Widget? child) =>
          AbsorbPointer(absorbing: locked, child: child),
    );
  }

  void setScrimTravel(double travel) {
    _pendingTravel = travel.clamp(0, 1);
    if (SchedulerBinding.instance.schedulerPhase !=
        SchedulerPhase.persistentCallbacks) {
      _scrimTravel.value = _pendingTravel;
      return;
    }
    if (_travelFlushScheduled) {
      return;
    }
    _travelFlushScheduled = true;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _travelFlushScheduled = false;
      if (isActive) {
        _scrimTravel.value = _pendingTravel;
      }
    });
  }

  @override
  Widget buildModalBarrier() {
    final Animation<double>? routeAnimation = animation;
    final FluxerSheetBackdropProgress? backdrop = this.backdrop;
    final Color base = barrierColor;
    if (routeAnimation == null || backdrop == null || base.a == 0 || offstage) {
      return super.buildModalBarrier();
    }
    return ListenableBuilder(
      listenable: Listenable.merge(<Listenable>[
        routeAnimation,
        _scrimTravel,
        _scrimPin,
        backdrop,
        _inputLocked,
      ]),
      builder: (BuildContext context, Widget? _) {
        final double opacity = _scrimOpacity(routeAnimation);
        final Color tinted = backdrop.value <= 0
            ? base
            : Color.lerp(base, kFluxerSheetBackdropDimColor, backdrop.value)!;
        return ModalBarrier(
          color: opacity >= 1
              ? tinted
              : tinted.withValues(alpha: tinted.a * opacity),
          dismissible: barrierDismissible && !_inputLocked.value,
          onDismiss: _dismissFromBarrier,
          semanticsLabel: barrierLabel,
          semanticsOnTapHint: barrierOnTapHint,
        );
      },
    );
  }

  @override
  void dispose() {
    _disposed = true;
    _detachRouter();
    if (identical(_scrimHandoff, this)) {
      _scrimHandoff = null;
    }
    animation?.removeListener(_syncInputLock);
    animation?.removeStatusListener(_syncInputLockStatus);
    _scrimTravel.dispose();
    _scrimPin.dispose();
    _inputLocked.dispose();
    super.dispose();
  }
}

abstract interface class FluxerSheetBackdropHost {}

class FluxerSheetBackdropProgress extends ValueNotifier<double> {
  FluxerSheetBackdropProgress._() : super(0);

  static final Expando<FluxerSheetBackdropProgress> _byOwner =
      Expando<FluxerSheetBackdropProgress>();

  factory FluxerSheetBackdropProgress.of(Object owner) {
    return _byOwner[owner] ??= FluxerSheetBackdropProgress._();
  }

  late final Animation<double> animation = _FluxerSheetBackdropAnimation(this);

  final Map<Object, double> _strengthBySheet = <Object, double>{};
  bool _flushScheduled = false;

  void report(Object sheet, double strength) {
    final double clamped = strength.clamp(0, 1);
    if (_strengthBySheet[sheet] == clamped) {
      return;
    }
    _strengthBySheet[sheet] = clamped;
    _flush();
  }

  void remove(Object sheet) {
    if (_strengthBySheet.remove(sheet) == null) {
      return;
    }
    _flush();
  }

  void _flush() {
    if (SchedulerBinding.instance.schedulerPhase !=
        SchedulerPhase.persistentCallbacks) {
      value = _strengthBySheet.values.fold<double>(0, math.max);
      return;
    }
    if (_flushScheduled) {
      return;
    }
    _flushScheduled = true;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _flushScheduled = false;
      value = _strengthBySheet.values.fold<double>(0, math.max);
    });
  }
}

class _FluxerSheetBackdropAnimation extends Animation<double> {
  _FluxerSheetBackdropAnimation(this._progress);

  final FluxerSheetBackdropProgress _progress;

  @override
  double get value => _progress.value;

  @override
  AnimationStatus get status {
    if (value <= 0) {
      return AnimationStatus.dismissed;
    }
    if (value >= 1) {
      return AnimationStatus.completed;
    }
    return AnimationStatus.forward;
  }

  @override
  void addListener(VoidCallback listener) => _progress.addListener(listener);

  @override
  void removeListener(VoidCallback listener) =>
      _progress.removeListener(listener);

  @override
  void addStatusListener(AnimationStatusListener listener) {}

  @override
  void removeStatusListener(AnimationStatusListener listener) {}
}

class FluxerSheetBackdropLink {
  FluxerSheetBackdropLink(this._navigator, {Route<dynamic>? route})
    : _progress =
          (route is FluxerSheetRoute ? route.backdrop : null) ??
          FluxerSheetBackdropProgress.of(_navigator);

  final NavigatorState _navigator;
  final FluxerSheetBackdropProgress _progress;

  bool covers(double sheetHeight) {
    final RenderObject? box = _navigator.mounted
        ? _navigator.context.findRenderObject()
        : null;
    if (box is! RenderBox || !box.hasSize || box.size.height <= 0) {
      return false;
    }
    return sheetHeight / box.size.height >= kFluxerSheetParallaxMinCoverage;
  }

  void report(double strength) => _progress.report(this, strength);

  void dispose() => _progress.remove(this);
}

class FluxerSheetBackdrop extends StatefulWidget {
  const FluxerSheetBackdrop({required this.child, super.key});

  final Widget child;

  @override
  State<FluxerSheetBackdrop> createState() => _FluxerSheetBackdropState();
}

class _FluxerSheetBackdropState extends State<FluxerSheetBackdrop> {
  FluxerSheetBackdropProgress? _progress;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final NavigatorState? navigator = Navigator.maybeOf(context);
    _progress = navigator == null
        ? null
        : FluxerSheetBackdropProgress.of(navigator);
  }

  @override
  Widget build(BuildContext context) {
    final FluxerSheetBackdropProgress? progress = _progress;
    if (progress == null) {
      return widget.child;
    }
    final double topInset = MediaQuery.viewPaddingOf(context).top;
    return ValueListenableBuilder<double>(
      valueListenable: progress,
      child: widget.child,
      builder: (BuildContext context, double strength, Widget? child) {
        final bool active = strength > 0;
        final double scale = 1 - (1 - kFluxerSheetBackdropScale) * strength;
        final double radius =
            kFluxerSheetBackdropCornerRadius *
            (strength / kFluxerSheetBackdropCornerRampEnd).clamp(0, 1);
        return CustomPaint(
          painter: active ? const _FluxerSheetBackdropFill() : null,
          child: Transform(
            alignment: Alignment.topCenter,
            transform: Matrix4.identity()
              ..setEntry(0, 0, scale)
              ..setEntry(1, 1, scale)
              ..setEntry(1, 3, topInset * strength),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              clipBehavior: active ? Clip.antiAlias : Clip.none,
              child: child,
            ),
          ),
        );
      },
    );
  }
}

class _FluxerSheetBackdropFill extends CustomPainter {
  const _FluxerSheetBackdropFill();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = Colors.black);
  }

  @override
  bool? hitTest(Offset position) => false;

  @override
  bool shouldRepaint(_FluxerSheetBackdropFill oldDelegate) => false;
}
