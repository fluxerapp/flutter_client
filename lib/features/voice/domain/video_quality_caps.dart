import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';

const int kBaseScreenShareMaxHeight = 720;
const int kBaseScreenShareMaxFrameRate = 30;
const int kBaseCameraMaxHeight = 720;
const int kFullScreenShareMaxHeight = 2160;
const int kFullScreenShareMaxFrameRate = 120;
const int kFullCameraMaxHeight = 1080;

@immutable
class VideoQualityCaps {
  const VideoQualityCaps({
    required this.screenShareMaxHeight,
    required this.screenShareMaxFrameRate,
    required this.cameraMaxHeight,
  });

  static const VideoQualityCaps base = VideoQualityCaps(
    screenShareMaxHeight: kBaseScreenShareMaxHeight,
    screenShareMaxFrameRate: kBaseScreenShareMaxFrameRate,
    cameraMaxHeight: kBaseCameraMaxHeight,
  );

  static const VideoQualityCaps full = VideoQualityCaps(
    screenShareMaxHeight: kFullScreenShareMaxHeight,
    screenShareMaxFrameRate: kFullScreenShareMaxFrameRate,
    cameraMaxHeight: kFullCameraMaxHeight,
  );

  static const VideoQualityCaps phone = VideoQualityCaps(
    screenShareMaxHeight: 1080,
    screenShareMaxFrameRate: 30,
    cameraMaxHeight: kFullCameraMaxHeight,
  );

  static const VideoQualityCaps p2pPhone = VideoQualityCaps(
    screenShareMaxHeight: kFullScreenShareMaxHeight,
    screenShareMaxFrameRate: 30,
    cameraMaxHeight: 720,
  );

  final int screenShareMaxHeight;
  final int screenShareMaxFrameRate;
  final int cameraMaxHeight;

  bool get isFull =>
      screenShareMaxHeight >= full.screenShareMaxHeight &&
      screenShareMaxFrameRate >= full.screenShareMaxFrameRate &&
      cameraMaxHeight >= full.cameraMaxHeight;

  VideoQualityCaps limitedTo(VideoQualityCaps other) {
    return VideoQualityCaps(
      screenShareMaxHeight: math.min(
        screenShareMaxHeight,
        other.screenShareMaxHeight,
      ),
      screenShareMaxFrameRate: math.min(
        screenShareMaxFrameRate,
        other.screenShareMaxFrameRate,
      ),
      cameraMaxHeight: math.min(cameraMaxHeight, other.cameraMaxHeight),
    );
  }

  bool allowsCameraResolution(CameraResolution resolution) {
    return cameraCaptureHeight(resolution) <= cameraMaxHeight;
  }

  CameraResolution effectiveCameraResolution(CameraResolution configured) {
    if (allowsCameraResolution(configured)) {
      return configured;
    }
    return allowsCameraResolution(CameraResolution.medium)
        ? CameraResolution.medium
        : CameraResolution.low;
  }

  bool allowsScreenShareResolution(ScreenshareResolution resolution) {
    return screenShareTargetHeight(resolution) <= screenShareMaxHeight;
  }

  bool allowsFrameRate(int frameRate) {
    return frameRate <= screenShareMaxFrameRate;
  }

  @override
  bool operator ==(Object other) =>
      other is VideoQualityCaps &&
      other.screenShareMaxHeight == screenShareMaxHeight &&
      other.screenShareMaxFrameRate == screenShareMaxFrameRate &&
      other.cameraMaxHeight == cameraMaxHeight;

  @override
  int get hashCode => Object.hash(
    screenShareMaxHeight,
    screenShareMaxFrameRate,
    cameraMaxHeight,
  );
}

int cameraCaptureHeight(CameraResolution resolution) {
  return switch (resolution) {
    CameraResolution.high => 1080,
    CameraResolution.medium => 720,
    CameraResolution.low => 360,
  };
}

int screenShareTargetHeight(ScreenshareResolution resolution) {
  return switch (resolution) {
    ScreenshareResolution.low480p => 480,
    ScreenshareResolution.medium => 720,
    ScreenshareResolution.high => 1080,
    ScreenshareResolution.ultra => 1440,
    ScreenshareResolution.source => 2160,
  };
}

VideoQualityCaps deviceVideoQualityCaps({
  required bool nativeMobile,
  required bool mobile,
  required bool p2p,
}) {
  VideoQualityCaps caps = VideoQualityCaps.full;
  if (nativeMobile) {
    caps = caps.limitedTo(VideoQualityCaps.phone);
  }
  if (mobile && p2p) {
    caps = caps.limitedTo(VideoQualityCaps.p2pPhone);
  }
  return caps;
}
