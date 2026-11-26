import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/voice/domain/video_quality_caps.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_target.dart';

typedef VideoQualityOption<T> = ({T value, bool enabled});

@immutable
class ScreenShareSettingsView {
  const ScreenShareSettingsView({
    required this.mode,
    required this.quality,
    required this.presetQualities,
    required this.resolutionOptions,
    required this.frameRateOptions,
    required this.camera,
    required this.cameraOptions,
    required this.showBitrate,
    required this.bitrate,
    required this.bitrateOptions,
    required this.showUpsell,
    required this.showHighFrameRateNote,
    required this.instanceLimit,
    required this.saved,
  });

  final StreamingMode mode;
  final ScreenShareQuality quality;
  final Map<StreamingMode, ScreenShareQuality> presetQualities;
  final List<VideoQualityOption<ScreenshareResolution>> resolutionOptions;
  final List<int> frameRateOptions;
  final CameraResolution camera;
  final List<VideoQualityOption<CameraResolution>> cameraOptions;
  final bool showBitrate;
  final int? bitrate;
  final List<int> bitrateOptions;
  final bool showUpsell;
  final bool showHighFrameRateNote;
  final ScreenShareQuality? instanceLimit;
  final ScreenShareQuality? saved;
}

ScreenShareSettingsView resolveScreenShareSettingsView({
  required VoiceSettingsState settings,
  required VideoQualityCaps entitlementCaps,
  required VideoQualityCaps deviceCaps,
  required ScreenShareBitrateBudget bitrate,
  required bool showsPremiumFeatures,
}) {
  final VideoQualityCaps caps = entitlementCaps.limitedTo(deviceCaps);
  final ScreenShareQuality quality = resolveScreenShareQualityFor(
    settings,
    caps,
  );
  final bool entitled = entitlementCaps.isFull;
  return ScreenShareSettingsView(
    mode: settings.streamingMode,
    quality: quality,
    presetQualities: <StreamingMode, ScreenShareQuality>{
      for (final StreamingMode mode in kStreamingModePresets.keys)
        mode: resolveScreenShareQuality(
          mode: mode,
          storedResolution: settings.screenshareResolution,
          storedFrameRate: settings.videoFrameRate,
          caps: caps,
        ),
    },
    resolutionOptions: <VideoQualityOption<ScreenshareResolution>>[
      for (final ScreenshareResolution value in ScreenshareResolution.values)
        if (value == quality.resolution ||
            caps.allowsScreenShareResolution(value) ||
            (showsPremiumFeatures &&
                deviceCaps.allowsScreenShareResolution(value)))
          (value: value, enabled: caps.allowsScreenShareResolution(value)),
    ],
    frameRateOptions: <int>[
      for (final int value in kScreenShareFrameRates)
        if (value == quality.frameRate || caps.allowsFrameRate(value)) value,
    ],
    camera: caps.effectiveCameraResolution(settings.cameraResolution),
    cameraOptions: <VideoQualityOption<CameraResolution>>[
      for (final CameraResolution value in CameraResolution.values)
        if (caps.allowsCameraResolution(value) ||
            (showsPremiumFeatures && deviceCaps.allowsCameraResolution(value)))
          (value: value, enabled: caps.allowsCameraResolution(value)),
    ],
    showBitrate: entitled,
    bitrate: bitrate.chosenBps,
    bitrateOptions: screenShareBitrateOptions(bitrate),
    showUpsell: !entitled && showsPremiumFeatures,
    showHighFrameRateNote:
        !entitled && showsPremiumFeatures && deviceCaps.allowsFrameRate(60),
    instanceLimit: entitled || showsPremiumFeatures
        ? null
        : (
            resolution: maxScreenShareResolution(entitlementCaps),
            frameRate: resolveScreenShareFrameRate(
              entitlementCaps.screenShareMaxFrameRate,
            ),
          ),
    saved:
        showsPremiumFeatures &&
            isScreenShareTierLimited(settings, entitlementCaps)
        ? (
            resolution: settings.screenshareResolution,
            frameRate: resolveScreenShareFrameRate(settings.videoFrameRate),
          )
        : null,
  );
}
