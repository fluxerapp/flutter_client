import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import 'package:fluxer_voice/src/messages.g.dart';

@immutable
sealed class VoicePipVideoSource {
  const VoicePipVideoSource();

  const factory VoicePipVideoSource.webRtcTrack(String trackId) =
      VoicePipWebRtcTrackSource;

  NativePipVideoSource toMessage();
}

@immutable
final class VoicePipWebRtcTrackSource extends VoicePipVideoSource {
  const VoicePipWebRtcTrackSource(this.trackId);

  final String trackId;

  @override
  NativePipVideoSource toMessage() {
    return NativePipVideoSource(
      kind: NativePipVideoSourceKind.webRtcTrack,
      trackId: trackId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VoicePipWebRtcTrackSource && other.trackId == trackId;
  }

  @override
  int get hashCode => Object.hash(VoicePipWebRtcTrackSource, trackId);
}

@immutable
class VoicePipRequest {
  const VoicePipRequest({
    required this.source,
    required this.aspect,
    this.sourceRect,
    this.mirror = false,
  });

  static const int _aspectPrecision = 1000;

  final VoicePipVideoSource source;
  final Size aspect;
  final Rect? sourceRect;
  final bool mirror;

  (int, int) get aspectRatio {
    final double width = aspect.width;
    final double height = aspect.height;
    if (!width.isFinite || !height.isFinite || width <= 0 || height <= 0) {
      return (16, 9);
    }
    final double ratio = width / height;
    return (math.max(1, (ratio * _aspectPrecision).round()), _aspectPrecision);
  }

  NativePipConfig toMessage() {
    final (int aspectWidth, int aspectHeight) = aspectRatio;
    final Rect? rect = sourceRect;
    return NativePipConfig(
      source: source.toMessage(),
      aspectWidth: aspectWidth,
      aspectHeight: aspectHeight,
      mirror: mirror,
      sourceRect: rect == null || rect.isEmpty
          ? null
          : NativePipRect(
              left: rect.left,
              top: rect.top,
              width: rect.width,
              height: rect.height,
            ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VoicePipRequest &&
        other.source == source &&
        other.aspectRatio == aspectRatio &&
        other.sourceRect == sourceRect &&
        other.mirror == mirror;
  }

  @override
  int get hashCode => Object.hash(source, aspectRatio, sourceRect, mirror);
}

@immutable
class VoicePipEvent {
  const VoicePipEvent({
    required this.active,
    required this.restoreRequested,
    this.size,
  });

  factory VoicePipEvent.fromMessage(NativePipEvent message) {
    final double? width = message.width;
    final double? height = message.height;
    return VoicePipEvent(
      active: message.active,
      restoreRequested: message.restoreRequested,
      size: width == null || height == null ? null : Size(width, height),
    );
  }

  final bool active;
  final bool restoreRequested;
  final Size? size;
}

class FluxerVoicePip {
  FluxerVoicePip._();

  static final FluxerVoicePip instance = FluxerVoicePip._();

  VoicePipHostApi _api = VoicePipHostApi();
  Stream<VoicePipEvent>? _events;
  Stream<NativePipEvent> Function() _eventSource = voicePipEvents;
  Future<bool>? _supported;
  VoicePipRequest? _armed;

  Stream<VoicePipEvent> get events {
    return _events ??= _eventSource()
        .map(VoicePipEvent.fromMessage)
        .asBroadcastStream();
  }

  VoicePipRequest? get armed => _armed;

  @visibleForTesting
  void debugOverridePlatform({
    VoicePipHostApi? api,
    Stream<NativePipEvent> Function()? events,
  }) {
    _api = api ?? VoicePipHostApi();
    _eventSource = events ?? voicePipEvents;
    _events = null;
    _supported = null;
    _armed = null;
  }

  Future<bool> isSupported() {
    return _supported ??= _api.isSupported().catchError((Object _) => false);
  }

  Future<void> arm(VoicePipRequest request) async {
    if (request == _armed) {
      return;
    }
    _armed = request;
    try {
      await _api.arm(request.toMessage());
    } catch (_) {
      if (identical(_armed, request)) {
        _armed = null;
      }
      rethrow;
    }
  }

  Future<void> disarm() async {
    if (_armed == null) {
      return;
    }
    _armed = null;
    await _api.disarm();
  }

  Future<void> stop() {
    return _api.stop();
  }
}
