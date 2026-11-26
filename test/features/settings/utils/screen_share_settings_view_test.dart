import 'package:fluxer_app/features/settings/utils/audio_and_video/screen_share_settings_view.dart';
import 'package:fluxer_app/features/voice/domain/video_quality_caps.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_target.dart';
import 'package:test/test.dart';

ScreenShareSettingsView _view({
  VoiceSettingsState settings = const VoiceSettingsState(),
  VideoQualityCaps entitlement = VideoQualityCaps.base,
  VideoQualityCaps device = VideoQualityCaps.full,
  bool premiumInstance = true,
}) {
  return resolveScreenShareSettingsView(
    settings: settings,
    entitlementCaps: entitlement,
    deviceCaps: device,
    bitrate: ScreenShareBitrateBudget.automatic,
    showsPremiumFeatures: premiumInstance,
  );
}

List<ScreenshareResolution> _resolutions(ScreenShareSettingsView view) =>
    <ScreenshareResolution>[
      for (final VideoQualityOption<ScreenshareResolution> option
          in view.resolutionOptions)
        option.value,
    ];

List<ScreenshareResolution> _enabled(ScreenShareSettingsView view) =>
    <ScreenshareResolution>[
      for (final VideoQualityOption<ScreenshareResolution> option
          in view.resolutionOptions)
        if (option.enabled) option.value,
    ];

void main() {
  test('free accounts on a premium instance see locked options and upsell', () {
    final ScreenShareSettingsView view = _view();
    expect(_resolutions(view), ScreenshareResolution.values);
    expect(_enabled(view), <ScreenshareResolution>[
      ScreenshareResolution.low480p,
      ScreenshareResolution.medium,
    ]);
    expect(view.frameRateOptions, <int>[15, 30]);
    expect(view.cameraOptions.last.value, CameraResolution.high);
    expect(view.cameraOptions.last.enabled, isFalse);
    expect(view.showUpsell, isTrue);
    expect(view.showHighFrameRateNote, isTrue);
    expect(view.showBitrate, isFalse);
    expect(view.instanceLimit, isNull);
  });

  test('instances without premium hide locked options and name the limit', () {
    final ScreenShareSettingsView view = _view(premiumInstance: false);
    expect(_resolutions(view), <ScreenshareResolution>[
      ScreenshareResolution.low480p,
      ScreenshareResolution.medium,
    ]);
    expect(view.cameraOptions.map((option) => option.value), <CameraResolution>[
      CameraResolution.low,
      CameraResolution.medium,
    ]);
    expect(view.showUpsell, isFalse);
    expect(view.instanceLimit, (
      resolution: ScreenshareResolution.medium,
      frameRate: 30,
    ));
  });

  test('a custom instance rule shows its own limit', () {
    final ScreenShareSettingsView view = _view(
      entitlement: const VideoQualityCaps(
        screenShareMaxHeight: 1080,
        screenShareMaxFrameRate: 60,
        cameraMaxHeight: 1080,
      ),
      premiumInstance: false,
    );
    expect(_resolutions(view).last, ScreenshareResolution.high);
    expect(view.frameRateOptions, <int>[15, 30, 60]);
    expect(view.instanceLimit, (
      resolution: ScreenshareResolution.high,
      frameRate: 60,
    ));
  });

  test('full quality offers everything and the bitrate picker', () {
    final ScreenShareSettingsView view = _view(
      entitlement: VideoQualityCaps.full,
    );
    expect(_enabled(view), ScreenshareResolution.values);
    expect(view.frameRateOptions, <int>[15, 30, 60, 120]);
    expect(view.showBitrate, isTrue);
    expect(view.showUpsell, isFalse);
    expect(view.quality, (
      resolution: ScreenshareResolution.high,
      frameRate: 30,
    ));
  });

  test('phones never list options above 1080p30', () {
    final ScreenShareSettingsView view = _view(
      entitlement: VideoQualityCaps.full,
      device: VideoQualityCaps.phone,
      settings: const VoiceSettingsState(streamingMode: StreamingMode.gaming),
    );
    expect(_resolutions(view).last, ScreenshareResolution.high);
    expect(view.frameRateOptions, <int>[15, 30]);
    expect(view.quality, (
      resolution: ScreenshareResolution.high,
      frameRate: 30,
    ));
    expect(view.showHighFrameRateNote, isFalse);
    expect(view.showUpsell, isFalse);
  });

  test('saved quality above the tier is reported with what is sent', () {
    final ScreenShareSettingsView view = _view(
      settings: const VoiceSettingsState(
        streamingMode: StreamingMode.custom,
        screenshareResolution: ScreenshareResolution.source,
        videoFrameRate: 60,
      ),
    );
    expect(view.saved, (
      resolution: ScreenshareResolution.source,
      frameRate: 60,
    ));
    expect(view.quality, (
      resolution: ScreenshareResolution.medium,
      frameRate: 30,
    ));
    expect(
      _view(
        settings: const VoiceSettingsState(
          streamingMode: StreamingMode.custom,
          screenshareResolution: ScreenshareResolution.source,
        ),
        premiumInstance: false,
      ).saved,
      isNull,
    );
  });
}
