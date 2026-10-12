import 'dart:math' as math;

import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/material_ui.dart';

const double kFluxerSheetOvershootBleed = 48;

const Duration kFluxerSheetCloseDuration = Duration(milliseconds: 110);
const Duration kFluxerSheetScrimOpenDuration = Duration(milliseconds: 125);
const Duration kFluxerSheetBackdropLead = Duration(milliseconds: 70);
const double kFluxerSheetBackdropSpringOmega = 18.5;

const double kFluxerSheetBackdropScale = 0.924;
const double kFluxerSheetBackdropCornerRadius = 12;
const double kFluxerSheetBackdropMinCoverage = 0.6;
const double kFluxerSheetBackdropFullCoverage = 0.9;
const double kFluxerSheetBackdropCornerRampEnd = 0.25;
const Color kFluxerSheetBackdropDimColor = Color(0x80000000);

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
    required NavigatorState navigator,
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
  }) : _backdrop = FluxerSheetBackdropProgress.of(navigator);

  final FluxerSheetBackdropProgress _backdrop;
  final ValueNotifier<double> _scrimTravel = ValueNotifier<double>(1);
  bool _travelFlushScheduled = false;
  double _pendingTravel = 1;

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
    final Color base = barrierColor;
    if (routeAnimation == null || base.a == 0 || offstage) {
      return super.buildModalBarrier();
    }
    return ListenableBuilder(
      listenable: Listenable.merge(<Listenable>[
        routeAnimation,
        _scrimTravel,
        _backdrop,
      ]),
      builder: (BuildContext context, Widget? _) {
        final double opacity =
            fluxerSheetScrimOpacity(routeAnimation, transitionDuration) *
            _scrimTravel.value;
        final Color tinted = _backdrop.value <= 0
            ? base
            : Color.lerp(base, kFluxerSheetBackdropDimColor, _backdrop.value)!;
        return ModalBarrier(
          color: opacity >= 1
              ? tinted
              : tinted.withValues(alpha: tinted.a * opacity),
          dismissible: barrierDismissible,
          semanticsLabel: barrierLabel,
          semanticsOnTapHint: barrierOnTapHint,
        );
      },
    );
  }

  @override
  void dispose() {
    _scrimTravel.dispose();
    super.dispose();
  }
}

class FluxerSheetBackdropProgress extends ValueNotifier<double> {
  FluxerSheetBackdropProgress._() : super(0);

  static final Expando<FluxerSheetBackdropProgress> _byNavigator =
      Expando<FluxerSheetBackdropProgress>();

  factory FluxerSheetBackdropProgress.of(NavigatorState navigator) {
    return _byNavigator[navigator] ??= FluxerSheetBackdropProgress._();
  }

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

class FluxerSheetBackdropLink {
  FluxerSheetBackdropLink(this._navigator)
    : _progress = FluxerSheetBackdropProgress.of(_navigator);

  final NavigatorState _navigator;
  final FluxerSheetBackdropProgress _progress;

  double reportVisibleHeight(double visibleHeight, double routeProgress) {
    final RenderObject? box = _navigator.mounted
        ? _navigator.context.findRenderObject()
        : null;
    if (box is! RenderBox || !box.hasSize || box.size.height <= 0) {
      return 0;
    }
    final double coverage = visibleHeight / box.size.height;
    final double strength =
        ((coverage - kFluxerSheetBackdropMinCoverage) /
                (kFluxerSheetBackdropFullCoverage -
                    kFluxerSheetBackdropMinCoverage))
            .clamp(0, 1) *
        routeProgress;
    _progress.report(this, strength);
    return strength;
  }

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
