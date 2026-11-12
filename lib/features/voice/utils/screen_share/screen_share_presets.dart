import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:livekit_client/livekit_client.dart';

const List<int> kSupportedScreenShareFrameRates = <int>[15, 30, 60];

const int kIosBroadcastMaxLongEdge = 1920;

const DegradationPreference kScreenShareDegradationPreference =
    DegradationPreference.maintainFramerate;

const Map<ScreenshareResolution, Map<int, int>> _kScreenShareBitrateKbps =
    <ScreenshareResolution, Map<int, int>>{
      ScreenshareResolution.high: <int, int>{15: 3000, 30: 4500, 60: 6000},
      ScreenshareResolution.medium: <int, int>{15: 2000, 30: 3000, 60: 4500},
      ScreenshareResolution.low480p: <int, int>{15: 1200, 30: 2000, 60: 3000},
    };

VideoDimensions _screenShareTargetDimensions(ScreenshareResolution resolution) {
  return switch (resolution) {
    ScreenshareResolution.high => const VideoDimensions(1920, 1080),
    ScreenshareResolution.medium => const VideoDimensions(1280, 720),
    ScreenshareResolution.low480p => const VideoDimensions(854, 480),
  };
}

VideoParameters screenShareVideoParameters({
  required ScreenshareResolution resolution,
  required int frameRate,
}) {
  final int clampedFrameRate = _clampFrameRate(frameRate);
  return VideoParameters(
    dimensions: _screenShareTargetDimensions(resolution),
    encoding: VideoEncoding(
      maxBitrate:
          _kScreenShareBitrateKbps[resolution]![clampedFrameRate]! * 1000,
      maxFramerate: clampedFrameRate,
    ),
  );
}

double screenShareScaleDownBy({
  required VideoDimensions source,
  required VideoDimensions target,
}) {
  final int sourceLong = math.max(source.width, source.height);
  final int sourceShort = math.min(source.width, source.height);
  final int targetLong = math.max(target.width, target.height);
  final int targetShort = math.min(target.width, target.height);
  if (sourceLong <= 0 || sourceShort <= 0) {
    return 1;
  }
  return math.max(
    1,
    math.max(sourceLong / targetLong, sourceShort / targetShort),
  );
}

VideoDimensions? nativeMobileScreenCaptureDimensions() {
  if (!isFluxerNativeMobileOs) {
    return null;
  }
  final ui.Display? display =
      ui.PlatformDispatcher.instance.displays.firstOrNull;
  if (display == null || display.size.isEmpty) {
    return null;
  }
  final VideoDimensions dimensions = VideoDimensions(
    display.size.width.round(),
    display.size.height.round(),
  );
  return Platform.isIOS ? iosBroadcastFrameDimensions(dimensions) : dimensions;
}

VideoDimensions iosBroadcastFrameDimensions(VideoDimensions display) {
  final int longEdge = math.max(display.width, display.height);
  if (longEdge <= kIosBroadcastMaxLongEdge) {
    return display;
  }
  final double scale = kIosBroadcastMaxLongEdge / longEdge;
  return VideoDimensions(
    (display.width * scale).round(),
    (display.height * scale).round(),
  );
}

bool get screenShareCapturesSystemAudio => !isFluxerNativeMobileOs;

ScreenShareCaptureOptions screenShareCaptureOptionsFor({
  required ScreenshareResolution resolution,
  required int frameRate,
}) {
  return ScreenShareCaptureOptions(
    useiOSBroadcastExtension: true,
    captureScreenAudio: screenShareCapturesSystemAudio,
    params: screenShareVideoParameters(
      resolution: resolution,
      frameRate: frameRate,
    ),
  );
}

int _clampFrameRate(int frameRate) {
  if (!kSupportedScreenShareFrameRates.contains(frameRate)) {
    return kDefaultVideoFrameRate;
  }
  return frameRate;
}

String preferredScreenShareVideoCodec(ScreenShareCodecPreference preference) {
  return switch (preference) {
    ScreenShareCodecPreference.auto => 'vp8',
    ScreenShareCodecPreference.av1 => 'av1',
    ScreenShareCodecPreference.h265 => 'h265',
    ScreenShareCodecPreference.vp9 => 'vp9',
    ScreenShareCodecPreference.h264 => 'h264',
    ScreenShareCodecPreference.vp8 => 'vp8',
  };
}

class VideoQualityCaps {
  const VideoQualityCaps({
    required this.screenShareMaxHeight,
    required this.screenShareMaxFrameRate,
    required this.cameraMaxHeight,
  });

  static const VideoQualityCaps base = VideoQualityCaps(
    screenShareMaxHeight: 720,
    screenShareMaxFrameRate: 30,
    cameraMaxHeight: 720,
  );

  static const VideoQualityCaps full = VideoQualityCaps(
    screenShareMaxHeight: 2160,
    screenShareMaxFrameRate: 120,
    cameraMaxHeight: 1080,
  );

  final int screenShareMaxHeight;
  final int screenShareMaxFrameRate;
  final int cameraMaxHeight;

  bool allowsCameraResolution(CameraResolution resolution) {
    return _cameraHeight(resolution) <= cameraMaxHeight;
  }

  bool allowsScreenShareResolution(ScreenshareResolution resolution) {
    return _screenShareTargetDimensions(resolution).height <=
        screenShareMaxHeight;
  }

  bool allowsFrameRate(int frameRate) {
    return frameRate <= screenShareMaxFrameRate;
  }
}

int _cameraHeight(CameraResolution resolution) {
  return switch (resolution) {
    CameraResolution.high => 1080,
    CameraResolution.medium => 720,
    CameraResolution.low => 480,
  };
}

VoiceSettingsState clampVoiceVideoSettings(
  VoiceSettingsState settings, {
  required VideoQualityCaps caps,
  required bool meshPhoneCap,
  required bool phoneScreenShareCap,
}) {
  final bool capCamera =
      settings.cameraResolution == CameraResolution.high &&
      (meshPhoneCap || !caps.allowsCameraResolution(settings.cameraResolution));
  final bool capScreenShare =
      settings.screenshareResolution == ScreenshareResolution.high &&
      (phoneScreenShareCap ||
          !caps.allowsScreenShareResolution(settings.screenshareResolution));
  final bool capFrameRate =
      settings.videoFrameRate > kDefaultVideoFrameRate &&
      (meshPhoneCap ||
          phoneScreenShareCap ||
          !caps.allowsFrameRate(settings.videoFrameRate));
  return settings.copyWith(
    cameraResolution: capCamera ? CameraResolution.medium : null,
    screenshareResolution: capScreenShare ? ScreenshareResolution.medium : null,
    videoFrameRate: capFrameRate ? kDefaultVideoFrameRate : null,
  );
}
