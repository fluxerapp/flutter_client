import 'dart:math' as math;

import 'package:flutter/material.dart';

final GlobalKey kVoicePipExpandSlotKey = GlobalKey(
  debugLabel: 'voice-pip-expand-slot',
);

const Key kVoicePipFlightKey = Key('voice-pip-flight');

const Duration kVoicePipSettleDuration = Duration(milliseconds: 80);

enum VoicePipOverlayPhase { hidden, pip, expanding, collapsing, settling }

bool voicePipHostsFeatured(VoicePipOverlayPhase phase) {
  return phase == VoicePipOverlayPhase.pip ||
      phase == VoicePipOverlayPhase.expanding ||
      phase == VoicePipOverlayPhase.collapsing;
}

bool voicePipHidesFeaturedTile(VoicePipOverlayPhase phase) {
  return phase == VoicePipOverlayPhase.expanding ||
      phase == VoicePipOverlayPhase.collapsing;
}

bool voicePipIsInFlight(VoicePipOverlayPhase phase) {
  return phase == VoicePipOverlayPhase.expanding ||
      phase == VoicePipOverlayPhase.collapsing ||
      phase == VoicePipOverlayPhase.settling;
}

bool _skipPhoneEnter = false;

void armVoicePipSkipPhoneEnter() {
  _skipPhoneEnter = true;
}

bool peekVoicePipSkipPhoneEnter() => _skipPhoneEnter;

bool takeVoicePipSkipPhoneEnter() {
  final bool armed = _skipPhoneEnter;
  _skipPhoneEnter = false;
  return armed;
}

bool voicePipRectsClose(Rect a, Rect b, {double epsilon = 2}) {
  return (a.left - b.left).abs() <= epsilon &&
      (a.top - b.top).abs() <= epsilon &&
      (a.right - b.right).abs() <= epsilon &&
      (a.bottom - b.bottom).abs() <= epsilon;
}

Rect voicePipHeroRectAt({
  required Rect begin,
  required Rect end,
  required double t,
}) {
  return MaterialRectCenterArcTween(
    begin: begin,
    end: end,
  ).lerp(t.clamp(0.0, 1.0));
}

class VoicePipHeroFlight {
  VoicePipHeroFlight({required this.begin, required this.end});

  Rect begin;
  Rect end;

  Rect rectAt(double t) => voicePipHeroRectAt(begin: begin, end: end, t: t);

  bool retarget({required Rect newEnd, required double t}) {
    if (voicePipRectsClose(end, newEnd)) {
      end = newEnd;
      return false;
    }
    begin = rectAt(t);
    end = newEnd;
    return true;
  }
}

Rect? voicePipSlotRectOf(BuildContext overlayContext) {
  final BuildContext? slotContext = kVoicePipExpandSlotKey.currentContext;
  if (slotContext == null || !slotContext.mounted) {
    return null;
  }
  final RenderObject? slotObject = slotContext.findRenderObject();
  final RenderObject? overlayObject = overlayContext.findRenderObject();
  if (slotObject is! RenderBox ||
      !slotObject.hasSize ||
      overlayObject is! RenderBox ||
      !overlayObject.hasSize) {
    return null;
  }
  final Offset global = slotObject.localToGlobal(Offset.zero);
  final Offset local = overlayObject.globalToLocal(global);
  return local & slotObject.size;
}

Rect voicePipFallbackExpandRect({
  required Size viewport,
  required EdgeInsets padding,
  Size? pipSize,
}) {
  final Rect bounds = Rect.fromLTRB(
    padding.left + 12,
    padding.top + 8,
    math.max(padding.left + 60, viewport.width - padding.right - 12),
    math.max(padding.top + 60, viewport.height - padding.bottom - 96),
  );
  if (pipSize == null || pipSize.width <= 0 || pipSize.height <= 0) {
    return bounds;
  }
  final double aspect = pipSize.width / pipSize.height;
  double width = bounds.width;
  double height = width / aspect;
  if (height > bounds.height) {
    height = bounds.height;
    width = height * aspect;
  }
  return Rect.fromCenter(center: bounds.center, width: width, height: height);
}

double voicePipMorphRadius(double t) {
  return 16 - (4 * t.clamp(0.0, 1.0));
}

double voicePipDecorationOpacity(double t) {
  return 1 - ((t - 0.55) / 0.35).clamp(0.0, 1.0);
}

Rect voicePipFlightRect({
  required VoicePipHeroFlight flight,
  required double t,
  Rect? slot,
  bool snapToSlot = true,
}) {
  if (!snapToSlot) {
    return flight.rectAt(t);
  }
  if (slot != null && t >= 0.88) {
    return slot;
  }
  final Rect tweened = flight.rectAt(t);
  if (slot == null || t < 0.72) {
    return tweened;
  }
  final double snap = ((t - 0.72) / 0.16).clamp(0.0, 1.0);
  return Rect.lerp(tweened, slot, snap)!;
}
