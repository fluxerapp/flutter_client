import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

const Duration _kSettleDelay = Duration(milliseconds: 80);
const double _kFollowTau = 0.03;
const double _kMinTickDt = 1 / 120;
const double _kSnapEpsilon = 0.5;

/// Coalesces pointer-scroll ticks into one gesture and skips child hit
/// testing while the list is moving.
class MessageListScrollPosition extends ScrollPositionWithSingleContext {
  MessageListScrollPosition({
    required super.physics,
    required super.context,
    super.initialPixels,
    super.keepScrollOffset,
    super.oldPosition,
    super.debugLabel,
  });

  Timer? _settleTimer;
  Ticker? _ticker;
  Duration? _elapsed;
  double _target = 0;
  bool _disposed = false;

  bool get _signalScrolling => activity is _PointerSignalScrollActivity;

  @override
  void beginActivity(ScrollActivity? newActivity) {
    if (newActivity != null && newActivity is! _PointerSignalScrollActivity) {
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
    if (_disposed || !_signalScrolling) {
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
    _cancelSettle();
    _ticker?.dispose();
    _ticker = null;
    super.dispose();
  }
}

class _PointerSignalScrollActivity extends ScrollActivity {
  _PointerSignalScrollActivity(super.delegate);

  @override
  bool get shouldIgnorePointer => true;

  @override
  bool get isScrolling => true;

  @override
  double get velocity => 0;
}
