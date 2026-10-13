import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

const Duration kMessageListTailFollowDuration = Duration(milliseconds: 300);
const Curve kMessageListTailFollowCurve = Curves.ease;
const Duration _kSettleDelay = Duration(milliseconds: 80);
const double _kFollowTau = 0.03;
const double _kMinTickDt = 1 / 120;
const double _kSnapEpsilon = 0.5;

class MessageListScrollPosition extends ScrollPositionWithSingleContext {
  MessageListScrollPosition({
    required super.physics,
    required super.context,
    super.initialPixels,
    super.keepScrollOffset,
    super.oldPosition,
    super.debugLabel,
    this.holdTrailingEdge,
  });

  final bool Function()? holdTrailingEdge;
  Timer? _settleTimer;
  Ticker? _ticker;
  Duration? _elapsed;
  double _target = 0;
  bool _disposed = false;
  bool _applyingNewDimensions = false;

  bool _tailFollowActive = false;
  double _tailFollowFrom = 0;
  double _tailFollowTo = 0;
  Duration _tailFollowDuration = Duration.zero;
  Curve _tailFollowCurve = Curves.linear;
  Duration? _tailFollowStartedAt;
  VoidCallback? _tailFollowOnComplete;
  double Function()? _tailFollowResolveTarget;

  bool get _signalScrolling => activity is _PointerSignalScrollActivity;

  bool get isFollowingTail => _tailFollowActive;

  void followTailTo(
    double target, {
    Duration duration = kMessageListTailFollowDuration,
    Curve curve = kMessageListTailFollowCurve,
    VoidCallback? onComplete,
    double Function()? resolveTarget,
  }) {
    _tailFollowResolveTarget = resolveTarget;
    final double clampedTarget = target.clamp(minScrollExtent, maxScrollExtent);
    if (clampedTarget <= pixels + _kSnapEpsilon) {
      if (_tailFollowActive) {
        _tailFollowActive = false;
        _tailFollowStartedAt = null;
        _tailFollowOnComplete = null;
        _tailFollowResolveTarget = null;
        if (!_signalScrolling) {
          _stopTicker();
        }
      }
      if (pixels < clampedTarget) {
        _applyPixels(clampedTarget);
      }
      onComplete?.call();
      return;
    }
    if (_tailFollowActive) {
      _tailFollowTo = clampedTarget;
      if (onComplete != null) {
        _tailFollowOnComplete = onComplete;
      }
      return;
    }
    _cancelSettle();
    if (_signalScrolling) {
      _stopTicker();
      goBallistic(0);
    }
    _tailFollowActive = true;
    _tailFollowFrom = pixels;
    _tailFollowTo = clampedTarget;
    _tailFollowDuration = duration;
    _tailFollowCurve = curve;
    _tailFollowStartedAt = null;
    _tailFollowOnComplete = onComplete;
    _ensureTicker();
  }

  void _endTailFollow({required bool deferComplete}) {
    if (!_tailFollowActive) {
      return;
    }
    _tailFollowActive = false;
    _tailFollowStartedAt = null;
    _tailFollowResolveTarget = null;
    final VoidCallback? callback = _tailFollowOnComplete;
    _tailFollowOnComplete = null;
    if (!_signalScrolling) {
      _stopTicker();
    }
    if (callback == null) {
      return;
    }
    if (deferComplete) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (!_disposed) {
          callback();
        }
      });
      return;
    }
    callback();
  }

  void _stopTailFollow() {
    _tailFollowOnComplete = null;
    _endTailFollow(deferComplete: false);
  }

  void _abortTailFollow() => _endTailFollow(deferComplete: true);

  void _refreshTailFollowTarget() {
    final double Function()? resolve = _tailFollowResolveTarget;
    if (resolve == null) {
      return;
    }
    final double latest = resolve().clamp(minScrollExtent, maxScrollExtent);
    _tailFollowTo = latest;
  }

  void _finishTailFollow() {
    _refreshTailFollowTarget();
    _applyPixels(_tailFollowTo.clamp(minScrollExtent, maxScrollExtent));
    _endTailFollow(deferComplete: false);
  }

  void _tickTailFollow(Duration elapsed) {
    _refreshTailFollowTarget();
    _tailFollowStartedAt ??= elapsed;
    final Duration sinceStart = elapsed - _tailFollowStartedAt!;
    final double t = _tailFollowDuration.inMicroseconds <= 0
        ? 1
        : (sinceStart.inMicroseconds / _tailFollowDuration.inMicroseconds)
              .clamp(0.0, 1.0);
    final double curved = _tailFollowCurve.transform(t);
    final double next =
        _tailFollowFrom + (_tailFollowTo - _tailFollowFrom) * curved;
    _applyPixels(next);
    if (t >= 1.0) {
      _finishTailFollow();
    }
  }

  @override
  void applyNewDimensions() {
    _applyingNewDimensions = true;
    try {
      super.applyNewDimensions();
    } finally {
      _applyingNewDimensions = false;
    }
  }

  @override
  bool correctForNewDimensions(
    ScrollMetrics oldPosition,
    ScrollMetrics newPosition,
  ) {
    final bool Function()? hold = holdTrailingEdge;
    if (hold == null ||
        _tailFollowActive ||
        activity!.isScrolling ||
        userScrollDirection != ScrollDirection.idle ||
        oldPosition.pixels < oldPosition.maxScrollExtent - _kSnapEpsilon ||
        newPosition.maxScrollExtent == oldPosition.maxScrollExtent ||
        !hold()) {
      return super.correctForNewDimensions(oldPosition, newPosition);
    }
    if (pixels == newPosition.maxScrollExtent) {
      return true;
    }
    correctPixels(newPosition.maxScrollExtent);
    return false;
  }

  @override
  void beginActivity(ScrollActivity? newActivity) {
    final bool settlesInPlace =
        newActivity is IdleScrollActivity &&
        (_applyingNewDimensions || _tailFollowActive);
    if (newActivity != null &&
        newActivity is! _PointerSignalScrollActivity &&
        !settlesInPlace) {
      _abortTailFollow();
      _stopTicker();
      _cancelSettle();
    }
    super.beginActivity(newActivity);
    if (newActivity != null) {
      context.setIgnorePointer(newActivity.isScrolling);
    }
  }

  @override
  void pointerScroll(double delta) {
    if (delta == 0) {
      _applyPixels(_signalScrolling ? _target : pixels);
      _stopTicker();
      goBallistic(0);
      return;
    }

    _stopTailFollow();
    _cancelSettle();
    if (!_signalScrolling) {
      beginActivity(_PointerSignalScrollActivity(this));
      _target = pixels;
    }
    updateUserScrollDirection(
      -delta > 0.0 ? ScrollDirection.forward : ScrollDirection.reverse,
    );
    _target = (_target + delta).clamp(minScrollExtent, maxScrollExtent);
    final bool tickerWasActive = _ticker?.isActive ?? false;
    _ensureTicker();
    if (!tickerWasActive) {
      _follow(_kMinTickDt);
    }
  }

  void _ensureTicker() {
    _ticker ??= context.vsync.createTicker(_onTick);
    if (_ticker!.isActive) {
      return;
    }
    _elapsed = null;
    _ticker!.start();
  }

  void _stopTicker() {
    _ticker?.stop();
    _elapsed = null;
  }

  void _onTick(Duration elapsed) {
    if (_disposed) {
      _stopTicker();
      return;
    }
    if (_tailFollowActive) {
      _tickTailFollow(elapsed);
      return;
    }
    if (!_signalScrolling) {
      _stopTicker();
      return;
    }
    _follow(_tickDt(elapsed));
    if ((_target - pixels).abs() <= _kSnapEpsilon) {
      _applyPixels(_target);
      _stopTicker();
      _armSettle();
    }
  }

  double _tickDt(Duration elapsed) {
    final Duration? previous = _elapsed;
    _elapsed = elapsed;
    if (previous == null) {
      return _kMinTickDt;
    }
    final double dt = (elapsed - previous).inMicroseconds / 1e6;
    if (dt <= 0) {
      return _kMinTickDt;
    }
    return math.min(dt, 0.05);
  }

  void _follow(double dt) {
    _target = _target.clamp(minScrollExtent, maxScrollExtent);
    final double remaining = _target - pixels;
    if (remaining.abs() <= _kSnapEpsilon) {
      return;
    }
    _applyPixels(pixels + remaining * (1 - math.exp(-dt / _kFollowTau)));
  }

  void _applyPixels(double next) {
    final double targetPixels = next.clamp(minScrollExtent, maxScrollExtent);
    if (targetPixels == pixels) {
      return;
    }
    final double oldPixels = pixels;
    forcePixels(targetPixels);
    didUpdateScrollPositionBy(pixels - oldPixels);
  }

  void _armSettle() {
    _cancelSettle();
    _settleTimer = Timer(_kSettleDelay, () {
      _settleTimer = null;
      if (!_disposed && _signalScrolling) {
        goBallistic(0);
      }
    });
  }

  void _cancelSettle() {
    _settleTimer?.cancel();
    _settleTimer = null;
  }

  @override
  void dispose() {
    _disposed = true;
    _stopTailFollow();
    _cancelSettle();
    _ticker?.dispose();
    _ticker = null;
    super.dispose();
  }
}

class _PointerSignalScrollActivity extends ScrollActivity {
  _PointerSignalScrollActivity(super._delegate);

  @override
  bool get shouldIgnorePointer => true;

  @override
  bool get isScrolling => true;

  @override
  double get velocity => 0;
}
