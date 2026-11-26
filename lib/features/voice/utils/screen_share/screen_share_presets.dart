import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_target.dart';
import 'package:livekit_client/livekit_client.dart';

const int kIosBroadcastMaxLongEdge = 1920;

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

bool get canRestartScreenCaptureSilently =>
    Platform.isMacOS || Platform.isWindows;

ScreenShareCaptureOptions screenShareCaptureOptionsFor(
  ScreenShareTarget target,
) {
  return ScreenShareCaptureOptions(
    useiOSBroadcastExtension: true,
    captureScreenAudio: screenShareCapturesSystemAudio,
    maxFrameRate: target.frameRate.toDouble(),
    params: target.videoParameters,
  );
}

String preferredScreenShareVideoCodec(
  ScreenShareCodecPreference preference, {
  bool av1OptIn = false,
  bool hevcOptIn = false,
}) {
  return switch (preference) {
    ScreenShareCodecPreference.auto => 'vp8',
    ScreenShareCodecPreference.av1 => av1OptIn ? 'av1' : 'vp8',
    ScreenShareCodecPreference.h265 => hevcOptIn ? 'h265' : 'vp8',
    ScreenShareCodecPreference.vp9 => 'vp9',
    ScreenShareCodecPreference.h264 => 'h264',
    ScreenShareCodecPreference.vp8 => 'vp8',
  };
}
