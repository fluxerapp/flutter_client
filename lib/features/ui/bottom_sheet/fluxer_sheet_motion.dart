import 'dart:math' as math;

import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/material_ui.dart';

const double kFluxerSheetOvershootBleed = 48;
const Duration kFluxerSheetDragSettleDuration = Duration(milliseconds: 180);

const double kFluxerSheetBackdropScale = 0.924;
const double kFluxerSheetBackdropCornerRadius = 12;
const double kFluxerSheetBackdropFullCoverage = 0.9;
const double kFluxerSheetBackdropCornerRampEnd = 0.25;

double fluxerSheetRouteProgress(
  Animation<double> animation,
  AnimationStyle style,
) {
  final Curve? curve = animation.status == AnimationStatus.reverse
      ? style.reverseCurve
      : style.curve;
  return (curve?.transform(animation.value) ?? animation.value).clamp(0, 1);
}

class FluxerSheetBackdropProgress extends ValueNotifier<double> {
  FluxerSheetBackdropProgress._() : super(0);

  static final Expando<FluxerSheetBackdropProgress> _byNavigator =
      Expando<FluxerSheetBackdropProgress>();

  factory FluxerSheetBackdropProgress.of(NavigatorState navigator) {
    return _byNavigator[navigator] ??= FluxerSheetBackdropProgress._();
  }

  final Map<Object, double> _coverageBySheet = <Object, double>{};
  bool _flushScheduled = false;

  void report(Object sheet, double coverage) {
    final double clamped = coverage.clamp(0, 1);
    if (_coverageBySheet[sheet] == clamped) {
      return;
    }
    _coverageBySheet[sheet] = clamped;
    _flush();
  }

  void remove(Object sheet) {
    if (_coverageBySheet.remove(sheet) == null) {
      return;
    }
    _flush();
  }

  void _flush() {
    if (SchedulerBinding.instance.schedulerPhase !=
        SchedulerPhase.persistentCallbacks) {
      value = _coverageBySheet.values.fold<double>(0, math.max);
      return;
    }
    if (_flushScheduled) {
      return;
    }
    _flushScheduled = true;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _flushScheduled = false;
      value = _coverageBySheet.values.fold<double>(0, math.max);
    });
  }
}

class FluxerSheetBackdropLink {
  FluxerSheetBackdropLink(this._navigator)
    : _progress = FluxerSheetBackdropProgress.of(_navigator);

  final NavigatorState _navigator;
  final FluxerSheetBackdropProgress _progress;

  void reportVisibleHeight(double visibleHeight) {
    final RenderObject? box = _navigator.mounted
        ? _navigator.context.findRenderObject()
        : null;
    if (box is! RenderBox || !box.hasSize || box.size.height <= 0) {
      return;
    }
    _progress.report(this, visibleHeight / box.size.height);
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
      builder: (BuildContext context, double coverage, Widget? child) {
        final double strength = (coverage / kFluxerSheetBackdropFullCoverage)
            .clamp(0, 1);
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
