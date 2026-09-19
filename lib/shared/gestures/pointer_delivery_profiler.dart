import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:fluxer_app/shared/gestures/horizontal_drag_axis_lock.dart';

const double _kEmaAlpha = 0.2;
const int _kGesturesBeforeShift = 3;
const double _kCoalescedFirstMoveSlops = 1.6;
const double _kCoalescedSamplesToSlop = 1.5;

/// Watches raw pointer packets and biases [AxisLockParams] after repeated
/// coalesced delivery.
class PointerDeliveryProfiler {
  PointerDeliveryProfiler({
    this.slop = kTouchSlop,
    this.alpha = _kEmaAlpha,
    this.gesturesBeforeShift = _kGesturesBeforeShift,
  });

  static PointerDeliveryProfiler instance = PointerDeliveryProfiler();

  final double slop;
  final double alpha;
  final int gesturesBeforeShift;

  AxisLockParams _params = AxisLockParams.fine;
  double? _emaFirstMoveSlops;
  double? _emaSamplesToSlop;
  int _completedGestures = 0;
  bool _attached = false;
  PointerDataPacketCallback? _previous;
  final Map<int, _TrackedPointer> _tracked = <int, _TrackedPointer>{};
  final List<bool> _recentCoalesced = <bool>[];

  AxisLockParams get params => _params;

  @visibleForTesting
  double? get emaFirstMoveSlops => _emaFirstMoveSlops;

  @visibleForTesting
  double? get emaSamplesToSlop => _emaSamplesToSlop;

  @visibleForTesting
  int get completedGestureCount => _completedGestures;

  void attach() {
    if (_attached) {
      return;
    }
    _previous = PlatformDispatcher.instance.onPointerDataPacket;
    PlatformDispatcher.instance.onPointerDataPacket =
        (PointerDataPacket packet) {
          observePacket(packet);
          _previous?.call(packet);
        };
    _attached = true;
  }

  @visibleForTesting
  void detach() {
    if (!_attached) {
      return;
    }
    PlatformDispatcher.instance.onPointerDataPacket = _previous;
    _previous = null;
    _attached = false;
  }

  @visibleForTesting
  static void resetInstance() {
    instance.detach();
    instance = PointerDeliveryProfiler();
  }

  void observePacket(PointerDataPacket packet) {
    for (final PointerData data in packet.data) {
      if (data.kind != PointerDeviceKind.touch || data.synthesized) {
        continue;
      }
      final double dpr = _devicePixelRatioForView(data.viewId);
      observePointer(
        change: data.change,
        pointer: data.pointerIdentifier,
        logicalPosition: Offset(data.physicalX, data.physicalY) / dpr,
        timeStamp: data.timeStamp,
      );
    }
  }

  @visibleForTesting
  void observePointer({
    required PointerChange change,
    required int pointer,
    required Offset logicalPosition,
    required Duration timeStamp,
  }) {
    switch (change) {
      case PointerChange.down:
        _tracked[pointer] = _TrackedPointer(
          downPosition: logicalPosition,
          downTime: timeStamp,
        );
      case PointerChange.move:
        final _TrackedPointer? tracked = _tracked[pointer];
        if (tracked == null) {
          return;
        }
        tracked.samples += 1;
        final Offset delta = logicalPosition - tracked.downPosition;
        if (tracked.samples == 1) {
          tracked.firstMoveDistance = delta.distance;
          tracked.firstMoveElapsed = timeStamp - tracked.downTime;
        }
        if (!tracked.leftSlop && delta.distance >= slop) {
          tracked.leftSlop = true;
          tracked.samplesToSlop = tracked.samples;
        }
      case PointerChange.up:
      case PointerChange.cancel:
        _commit(pointer);
      case PointerChange.add:
      case PointerChange.remove:
      case PointerChange.hover:
      case PointerChange.panZoomStart:
      case PointerChange.panZoomUpdate:
      case PointerChange.panZoomEnd:
        break;
    }
  }

  void _commit(int pointer) {
    final _TrackedPointer? tracked = _tracked.remove(pointer);
    if (tracked == null || !tracked.leftSlop) {
      return;
    }
    final double firstMoveSlops = (tracked.firstMoveDistance ?? 0) / slop;
    final double samplesToSlop = tracked.samplesToSlop.toDouble();
    _emaFirstMoveSlops = _ema(_emaFirstMoveSlops, firstMoveSlops);
    _emaSamplesToSlop = _ema(_emaSamplesToSlop, samplesToSlop);
    _completedGestures += 1;
    final Duration elapsed = tracked.firstMoveElapsed ?? Duration.zero;
    final bool thisCoalesced =
        (elapsed <= Duration.zero || elapsed < kSlowGestureElapsed) &&
        (firstMoveSlops >= _kCoalescedFirstMoveSlops ||
            samplesToSlop <= _kCoalescedSamplesToSlop);
    _recentCoalesced.add(thisCoalesced);
    if (_recentCoalesced.length > gesturesBeforeShift) {
      _recentCoalesced.removeAt(0);
    }
    if (_recentCoalesced.length < gesturesBeforeShift) {
      return;
    }
    if (_recentCoalesced.every((bool value) => value)) {
      _params = AxisLockParams.coalesced;
    } else if (_recentCoalesced.every((bool value) => !value)) {
      _params = AxisLockParams.fine;
    }
  }

  double _ema(double? current, double sample) {
    if (current == null) {
      return sample;
    }
    return alpha * sample + (1 - alpha) * current;
  }

  double _devicePixelRatioForView(int viewId) {
    for (final FlutterView view in PlatformDispatcher.instance.views) {
      if (view.viewId == viewId) {
        return view.devicePixelRatio;
      }
    }
    return PlatformDispatcher.instance.implicitView?.devicePixelRatio ?? 1.0;
  }
}

class _TrackedPointer {
  _TrackedPointer({required this.downPosition, required this.downTime});

  final Offset downPosition;
  final Duration downTime;
  int samples = 0;
  double? firstMoveDistance;
  Duration? firstMoveElapsed;
  bool leftSlop = false;
  int samplesToSlop = 0;
}
