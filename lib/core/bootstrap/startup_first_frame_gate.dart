import 'dart:async';

import 'package:clock/clock.dart';
import 'package:fluxer_app/material_ui.dart';

/// Keeps the platform launch screen up while a cached launch can open the
/// shell directly, so the Flutter splash never shows for it.
class StartupFirstFrameGate {
  StartupFirstFrameGate._();

  static bool _held = false;
  static Timer? _limit;
  static DateTime? _releasedAt;

  static bool get isHeld => _held;

  static DateTime? get releasedAt => _releasedAt;

  static void hold({required Duration limit}) {
    if (_held) {
      return;
    }
    _held = true;
    WidgetsBinding.instance.deferFirstFrame();
    _limit = Timer(limit, release);
  }

  static void release() {
    if (!_held) {
      return;
    }
    _held = false;
    _releasedAt = clock.now();
    _limit?.cancel();
    _limit = null;
    // Releasing from inside a frame (a disposing splash) would not schedule the
    // warm-up frame, so the launch screen would stay up.
    scheduleMicrotask(WidgetsBinding.instance.allowFirstFrame);
  }
}
