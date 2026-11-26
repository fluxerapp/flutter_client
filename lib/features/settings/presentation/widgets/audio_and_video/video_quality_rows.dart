import 'dart:async';

import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/settings/utils/audio_and_video/screen_share_settings_view.dart';
import 'package:fluxer_app/features/settings/utils/audio_and_video/video_quality_labels.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/domain/video_quality_caps.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_media_devices_provider.dart';
import 'package:fluxer_app/features/voice/utils/media/voice_media_device_label.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_target.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class VoiceVideoQualityRows {
  const VoiceVideoQualityRows({
    required this.l10n,
    required this.notifier,
    required this.settings,
    required this.view,
    required this.caps,
  });

  static const int _kAutomaticBitrate = 0;

  final FluxerLocalizations l10n;
  final VoiceSettings notifier;
  final VoiceSettingsState settings;
  final ScreenShareSettingsView view;
  final VideoQualityCaps caps;

  FluxerSettingsCompactSelectRow<String> cameraDevice(
    List<VoiceMediaDeviceOption> devices,
  ) {
    return FluxerSettingsCompactSelectRow<String>(
      label: l10n.audioAndVideoCameraLabel,
      value: settings.videoDeviceId,
      controlWidth: FluxerSettingsSelectWidth.wide,
      items: <FluxerSelectItem<String>>[
        for (final VoiceMediaDeviceOption device in devices)
          FluxerSelectItem<String>(
            value: device.deviceId,
            label: voiceMediaDeviceLabel(l10n, device),
          ),
      ],
      onChanged: (String value) => unawaited(notifier.setVideoDeviceId(value)),
    );
  }

  FluxerSettingsCompactSelectRow<CameraResolution> cameraQuality() {
    return FluxerSettingsCompactSelectRow<CameraResolution>(
      label: l10n.audioAndVideoCameraQualitySectionTitle,
      value: view.camera,
      controlWidth: FluxerSettingsSelectWidth.small,
      items: <FluxerSelectItem<CameraResolution>>[
        for (final VideoQualityOption<CameraResolution> option
            in view.cameraOptions)
          FluxerSelectItem<CameraResolution>(
            value: option.value,
            label: cameraResolutionLabel(l10n, option.value),
            enabled: option.enabled,
          ),
      ],
      onChanged: (CameraResolution value) {
        if (caps.allowsCameraResolution(value)) {
          unawaited(notifier.setCameraResolution(value));
        }
      },
    );
  }

  FluxerSettingsCompactSelectRow<StreamingMode> streamingMode() {
    return FluxerSettingsCompactSelectRow<StreamingMode>(
      label: l10n.audioAndVideoStreamingModeSectionTitle,
      value: view.mode,
      controlWidth: FluxerSettingsSelectWidth.small,
      items: <FluxerSelectItem<StreamingMode>>[
        for (final StreamingMode mode in StreamingMode.values)
          FluxerSelectItem<StreamingMode>(
            value: mode,
            label: streamingModeLabel(l10n, mode),
            description: _streamingModeDescription(mode),
          ),
      ],
      onChanged: (StreamingMode value) =>
          unawaited(notifier.setStreamingMode(value)),
    );
  }

  FluxerSettingsCompactSelectRow<ScreenshareResolution> resolution() {
    return FluxerSettingsCompactSelectRow<ScreenshareResolution>(
      label: l10n.audioAndVideoScreenShareQualitySectionTitle,
      value: view.quality.resolution,
      controlWidth: FluxerSettingsSelectWidth.small,
      items: <FluxerSelectItem<ScreenshareResolution>>[
        for (final VideoQualityOption<ScreenshareResolution> option
            in view.resolutionOptions)
          FluxerSelectItem<ScreenshareResolution>(
            value: option.value,
            label: screenShareResolutionLabel(l10n, option.value),
            enabled: option.enabled,
          ),
      ],
      onChanged: (ScreenshareResolution value) => _applyPick(
        resolveScreenShareQualityPick(
          settings: settings,
          caps: caps,
          resolution: value,
        ),
      ),
    );
  }

  FluxerSettingsCompactSelectRow<int> frameRate() {
    return FluxerSettingsCompactSelectRow<int>(
      label: l10n.audioAndVideoFrameRateSectionTitle,
      value: view.quality.frameRate,
      controlWidth: FluxerSettingsSelectWidth.small,
      items: <FluxerSelectItem<int>>[
        for (final int value in view.frameRateOptions)
          FluxerSelectItem<int>(
            value: value,
            label: screenShareFrameRateLabel(l10n, value),
          ),
      ],
      onChanged: (int value) => _applyPick(
        resolveScreenShareQualityPick(
          settings: settings,
          caps: caps,
          frameRate: value,
        ),
      ),
    );
  }

  FluxerSettingsCompactSelectRow<int> bitrate() {
    return FluxerSettingsCompactSelectRow<int>(
      label: l10n.audioAndVideoScreenShareBitrateLabel,
      description: l10n.audioAndVideoScreenShareBitrateDescription,
      value: view.bitrate ?? _kAutomaticBitrate,
      controlWidth: FluxerSettingsSelectWidth.small,
      items: <FluxerSelectItem<int>>[
        FluxerSelectItem<int>(
          value: _kAutomaticBitrate,
          label: l10n.audioAndVideoScreenShareBitrateAutomatic,
        ),
        for (final int value in view.bitrateOptions)
          FluxerSelectItem<int>(
            value: value,
            label: screenShareBitrateLabel(l10n, value),
          ),
      ],
      onChanged: (int value) => unawaited(
        notifier.setScreenShareBitrate(
          value == _kAutomaticBitrate ? null : value,
        ),
      ),
    );
  }

  String _streamingModeDescription(StreamingMode mode) {
    final ScreenShareQuality? quality = view.presetQualities[mode];
    if (quality == null) {
      return l10n.audioAndVideoStreamingModeCustomDescription;
    }
    final String label = screenShareResolutionLabel(l10n, quality.resolution);
    return mode == StreamingMode.gaming
        ? l10n.audioAndVideoStreamingModeGamingDescription(
            quality.frameRate,
            label,
          )
        : l10n.audioAndVideoStreamingModeScreenShareDescription(
            label,
            quality.frameRate,
          );
  }

  void _applyPick(ScreenShareQualityPatch? patch) {
    if (patch == null) {
      return;
    }
    unawaited(
      notifier.setScreenShareQuality(
        resolution: patch.resolution,
        frameRate: patch.frameRate,
      ),
    );
  }
}
