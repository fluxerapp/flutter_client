import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

abstract interface class VoiceVideoSurface {
  Rect? get globalRect;

  Size? get videoSize;
}

@immutable
class VoiceVideoSurfaceInfo {
  const VoiceVideoSurfaceInfo({required this.rect, required this.videoSize});

  final Rect? rect;
  final Size? videoSize;
}

class VoiceVideoSurfaceRegistry {
  VoiceVideoSurfaceRegistry._();

  static final VoiceVideoSurfaceRegistry instance =
      VoiceVideoSurfaceRegistry._();

  final Map<String, Set<VoiceVideoSurface>> _surfaces =
      <String, Set<VoiceVideoSurface>>{};
  final Set<ValueChanged<String>> _listeners = <ValueChanged<String>>{};

  void addListener(ValueChanged<String> listener) => _listeners.add(listener);

  void removeListener(ValueChanged<String> listener) =>
      _listeners.remove(listener);

  void add(String key, VoiceVideoSurface surface) {
    if (_surfaces.putIfAbsent(key, () => <VoiceVideoSurface>{}).add(surface)) {
      markChanged(key);
    }
  }

  void remove(String key, VoiceVideoSurface surface) {
    final Set<VoiceVideoSurface>? surfaces = _surfaces[key];
    if (surfaces == null || !surfaces.remove(surface)) {
      return;
    }
    if (surfaces.isEmpty) {
      _surfaces.remove(key);
    }
    markChanged(key);
  }

  void markChanged(String key) {
    for (final ValueChanged<String> listener in _listeners.toList()) {
      listener(key);
    }
  }

  VoiceVideoSurfaceInfo? lookup(String key) {
    final Set<VoiceVideoSurface>? surfaces = _surfaces[key];
    if (surfaces == null || surfaces.isEmpty) {
      return null;
    }
    Rect? bestRect;
    Size? videoSize;
    for (final VoiceVideoSurface surface in surfaces) {
      videoSize ??= surface.videoSize;
      final Rect? rect = surface.globalRect;
      if (rect != null &&
          !rect.isEmpty &&
          (bestRect == null || _area(rect) > _area(bestRect))) {
        bestRect = rect;
      }
    }
    return VoiceVideoSurfaceInfo(
      rect: bestRect == null
          ? null
          : voiceVideoContentRect(bounds: bestRect, videoSize: videoSize),
      videoSize: videoSize,
    );
  }

  @visibleForTesting
  void debugClear() {
    _surfaces.clear();
    _listeners.clear();
  }

  static double _area(Rect rect) => rect.width * rect.height;
}

Rect voiceVideoContentRect({required Rect bounds, required Size? videoSize}) {
  if (videoSize == null || videoSize.isEmpty) {
    return bounds;
  }
  final FittedSizes fitted = applyBoxFit(
    BoxFit.contain,
    videoSize,
    bounds.size,
  );
  return Alignment.center.inscribe(fitted.destination, bounds);
}

Rect? voiceVideoSurfaceGlobalRect(RenderObject? renderObject) {
  if (renderObject is! RenderBox ||
      !renderObject.attached ||
      !renderObject.hasSize) {
    return null;
  }
  return renderObject.localToGlobal(Offset.zero) & renderObject.size;
}

Size? voiceVideoSizeFrom({
  required double width,
  required double height,
  required int rotation,
}) {
  if (width <= 0 || height <= 0) {
    return null;
  }
  return rotation == 90 || rotation == 270
      ? Size(height, width)
      : Size(width, height);
}
