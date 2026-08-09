import 'dart:async' show unawaited;

import 'package:flutter/services.dart';

/// Shared haptic feedback
// ignore: avoid_classes_with_only_static_members
abstract final class FluxerHaptics {
  static void selection() {
    unawaited(HapticFeedback.selectionClick());
  }

  static void light() {
    unawaited(HapticFeedback.lightImpact());
  }

  static void medium() {
    unawaited(HapticFeedback.mediumImpact());
  }

  static void heavy() {
    unawaited(HapticFeedback.heavyImpact());
  }
}
