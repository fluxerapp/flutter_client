import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:visibility_detector/visibility_detector.dart';

const int kFluxerTypingDotCount = 3;
const double kFluxerTypingDotSize = 6;
const double kFluxerTypingDotSpacing = 2;
const List<double> kFluxerTypingDotDelays = <double>[0, 0.2 / 1.4, 0.4 / 1.4];

const int kFluxerTypingDotStepsPerCycle = 14;
const Duration kFluxerTypingDotStepInterval = Duration(milliseconds: 100);

double fluxerTypingDotsWidth({
  double dotSize = kFluxerTypingDotSize,
  double dotSpacing = kFluxerTypingDotSpacing,
}) {
  return kFluxerTypingDotCount * dotSize +
      (kFluxerTypingDotCount - 1) * dotSpacing;
}

double fluxerTypingDotWave(double progress, double delay) {
  final double phase = (progress - delay) % 1;
  return (math.cos(phase * 2 * math.pi) + 1) / 2;
}

class _FluxerTypingDotsClock {
  _FluxerTypingDotsClock._();

  static final ValueNotifier<int> step = ValueNotifier<int>(0);
  static int _subscribers = 0;
  static Timer? _timer;

  static void subscribe(VoidCallback listener) {
    step.addListener(listener);
    _subscribers++;
    _timer ??= Timer.periodic(kFluxerTypingDotStepInterval, (_) {
      step.value = (step.value + 1) % kFluxerTypingDotStepsPerCycle;
    });
  }

  static void unsubscribe(VoidCallback listener) {
    step.removeListener(listener);
    _subscribers--;
    if (_subscribers == 0) {
      _timer?.cancel();
      _timer = null;
    }
  }
}

class FluxerTypingDots extends StatefulWidget {
  const FluxerTypingDots({
    required this.color,
    this.dotSize = kFluxerTypingDotSize,
    this.dotSpacing = kFluxerTypingDotSpacing,
    super.key,
  });

  final Color color;
  final double dotSize;
  final double dotSpacing;

  @override
  State<FluxerTypingDots> createState() => _FluxerTypingDotsState();
}

class _FluxerTypingDotsState extends State<FluxerTypingDots>
    with WidgetsBindingObserver {
  final ValueNotifier<double> _progress = ValueNotifier<double>(0);
  ValueListenable<TickerModeData>? _tickerMode;
  bool _isVisible = true;
  bool _animationsEnabled = true;
  bool _subscribed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ValueListenable<TickerModeData> tickerMode =
        TickerMode.getValuesNotifier(context);
    if (!identical(tickerMode, _tickerMode)) {
      _tickerMode?.removeListener(_syncClock);
      _tickerMode = tickerMode..addListener(_syncClock);
    }
    _animationsEnabled = !MediaQuery.disableAnimationsOf(context);
    _syncClock();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tickerMode?.removeListener(_syncClock);
    if (_subscribed) {
      _subscribed = false;
      _FluxerTypingDotsClock.unsubscribe(_onStep);
    }
    _progress.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _syncClock();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    final bool visible = info.visibleFraction > 0;
    if (_isVisible == visible) {
      return;
    }
    _isVisible = visible;
    _syncClock();
  }

  void _syncClock() {
    if (!mounted) {
      return;
    }
    final AppLifecycleState? lifecycleState =
        SchedulerBinding.instance.lifecycleState;
    final bool isForeground =
        lifecycleState == null || lifecycleState == AppLifecycleState.resumed;
    final bool shouldAnimate =
        _isVisible &&
        isForeground &&
        _animationsEnabled &&
        (_tickerMode?.value.enabled ?? true);
    if (shouldAnimate == _subscribed) {
      return;
    }
    _subscribed = shouldAnimate;
    if (shouldAnimate) {
      _FluxerTypingDotsClock.subscribe(_onStep);
      _onStep();
    } else {
      _FluxerTypingDotsClock.unsubscribe(_onStep);
    }
  }

  void _onStep() {
    _progress.value =
        _FluxerTypingDotsClock.step.value / kFluxerTypingDotStepsPerCycle;
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(this),
      onVisibilityChanged: _onVisibilityChanged,
      child: SizedBox(
        width: fluxerTypingDotsWidth(
          dotSize: widget.dotSize,
          dotSpacing: widget.dotSpacing,
        ),
        height: widget.dotSize,
        child: CustomPaint(
          painter: FluxerTypingDotsPainter(
            progress: _progress,
            color: widget.color,
            dotSize: widget.dotSize,
            dotSpacing: widget.dotSpacing,
          ),
        ),
      ),
    );
  }
}

class FluxerTypingDotsPainter extends CustomPainter {
  FluxerTypingDotsPainter({
    required this.progress,
    required this.color,
    required this.dotSize,
    required this.dotSpacing,
  }) : super(repaint: progress);

  final ValueListenable<double> progress;
  final Color color;
  final double dotSize;
  final double dotSpacing;

  @override
  void paint(Canvas canvas, Size size) {
    final double totalWidth = fluxerTypingDotsWidth(
      dotSize: dotSize,
      dotSpacing: dotSpacing,
    );
    double x = (size.width - totalWidth) / 2;
    final double y = size.height / 2;
    for (int index = 0; index < kFluxerTypingDotCount; index++) {
      final double wave = fluxerTypingDotWave(
        progress.value,
        kFluxerTypingDotDelays[index],
      );
      final double opacity = 0.3 + 0.7 * wave;
      final double scale = 0.8 + 0.2 * wave;
      final double radius = dotSize * scale / 2;
      final Paint paint = Paint()
        ..color = color.withValues(alpha: opacity * color.a);
      canvas.drawCircle(Offset(x + dotSize / 2, y), radius, paint);
      x += dotSize + dotSpacing;
    }
  }

  @override
  bool shouldRepaint(covariant FluxerTypingDotsPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.dotSize != dotSize ||
        oldDelegate.dotSpacing != dotSpacing;
  }
}
