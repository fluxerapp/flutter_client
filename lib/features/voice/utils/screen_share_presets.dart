import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:livekit_client/livekit_client.dart';

const List<int> kSupportedScreenShareFrameRates = <int>[15, 30, 60];

VideoParameters screenShareVideoParameters({
  required ScreenshareResolution resolution,
  required int frameRate,
}) {
  final int clampedFrameRate = _clampFrameRate(frameRate);
  return switch (resolution) {
    ScreenshareResolution.high => VideoParameters(
      dimensions: const VideoDimensions(1920, 1080),
      encoding: VideoEncoding(
        maxBitrate: 3 * 1000 * 1000,
        maxFramerate: clampedFrameRate,
      ),
    ),
    ScreenshareResolution.medium => VideoParameters(
      dimensions: const VideoDimensions(1280, 720),
      encoding: VideoEncoding(
        maxBitrate: 2 * 1000 * 1000,
        maxFramerate: clampedFrameRate,
      ),
    ),
    ScreenshareResolution.low480p => VideoParameters(
      dimensions: const VideoDimensions(854, 480),
      encoding: VideoEncoding(
        maxBitrate: 1 * 1000 * 1000,
        maxFramerate: clampedFrameRate,
      ),
    ),
  };
}

ScreenShareCaptureOptions screenShareCaptureOptionsFor({
  required ScreenshareResolution resolution,
  required int frameRate,
}) {
  return ScreenShareCaptureOptions(
    useiOSBroadcastExtension: true,
    captureScreenAudio: true,
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

bool isHigherVideoQualityFrameRate(int frameRate) {
  return frameRate > 30;
}

bool isHigherVideoQualityCameraResolution(CameraResolution resolution) {
  return resolution == CameraResolution.high;
}

bool isHigherVideoQualityScreenShareResolution(
  ScreenshareResolution resolution,
) {
  return resolution == ScreenshareResolution.high;
}
