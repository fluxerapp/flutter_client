import 'package:fluxer_app/features/voice/domain/video_quality_caps.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/services/voice_settings_applicator.dart';
import 'package:fluxer_app/features/voice/utils/e2ee/p2p_mode.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_presets.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:test/test.dart';

void main() {
  const VoiceSettingsApplicator free = VoiceSettingsApplicator(
    unavailableBackends: NoiseSuppressionBackend.native,
    videoQualityCaps: VideoQualityCaps.base,
  );
  const VoiceSettingsApplicator premium = VoiceSettingsApplicator(
    unavailableBackends: NoiseSuppressionBackend.native,
    videoQualityCaps: VideoQualityCaps.full,
    canChooseScreenShareBitrate: true,
  );

  test('screen share capture targets the chosen source', () {
    const VoiceSettingsState settings = VoiceSettingsState();
    expect(free.buildScreenShareCaptureOptions(settings).deviceId, isNull);
    final ScreenShareCaptureOptions capture = free
        .buildScreenShareCaptureOptions(settings, sourceId: 'window:42');
    expect(capture.deviceId, 'window:42');
    expect(capture.maxFrameRate, 30);
  });

  test('default screen share sends 720p30 for free accounts', () {
    const VoiceSettingsState settings = VoiceSettingsState();
    final ScreenShareCaptureOptions capture = free
        .buildScreenShareCaptureOptions(settings);
    expect(capture.params.dimensions.width, 1280);
    expect(capture.params.dimensions.height, 720);
    expect(capture.params.encoding?.maxFramerate, 30);
    expect(capture.maxFrameRate, 30);

    final VideoPublishOptions publish = free.buildScreenSharePublishOptions(
      settings,
    );
    expect(publish.simulcast, isFalse);
    expect(
      publish.degradationPreference,
      DegradationPreference.maintainResolution,
    );
    expect(publish.screenShareEncoding?.maxFramerate, 30);
    expect(publish.screenShareEncoding?.maxBitrate, 3000000);
  });

  test('the Screen share preset sends 1080p30 with higher quality', () {
    final ScreenShareCaptureOptions capture = premium
        .buildScreenShareCaptureOptions(const VoiceSettingsState());
    expect(capture.params.dimensions.height, 1080);
    expect(capture.maxFrameRate, 30);
  });

  test('custom quality above the tier falls back to the caps', () {
    const VoiceSettingsState settings = VoiceSettingsState(
      streamingMode: StreamingMode.custom,
      screenshareResolution: ScreenshareResolution.source,
      videoFrameRate: 120,
    );
    final ScreenShareCaptureOptions capture = free
        .buildScreenShareCaptureOptions(settings);
    expect(capture.params.dimensions.height, 720);
    expect(capture.maxFrameRate, 30);

    final ScreenShareCaptureOptions full = premium
        .buildScreenShareCaptureOptions(settings);
    expect(full.params.dimensions.height, 2160);
    expect(full.maxFrameRate, 120);
    expect(
      premium.buildScreenSharePublishOptions(settings).degradationPreference,
      DegradationPreference.maintainResolution,
    );
  });

  test('phones stop screen share at 1080p30 even with higher quality', () {
    const VoiceSettingsApplicator phone = VoiceSettingsApplicator(
      unavailableBackends: NoiseSuppressionBackend.native,
      videoQualityCaps: VideoQualityCaps.full,
      deviceCaps: VideoQualityCaps.phone,
    );
    const VoiceSettingsState settings = VoiceSettingsState(
      streamingMode: StreamingMode.gaming,
    );
    final ScreenShareCaptureOptions capture = phone
        .buildScreenShareCaptureOptions(settings);
    expect(capture.params.dimensions.height, 1080);
    expect(capture.maxFrameRate, 30);
  });

  test('instance caps allow 1080p without 60 FPS or a 1080p camera', () {
    const VoiceSettingsApplicator instance = VoiceSettingsApplicator(
      unavailableBackends: NoiseSuppressionBackend.native,
      videoQualityCaps: VideoQualityCaps(
        screenShareMaxHeight: 1080,
        screenShareMaxFrameRate: 30,
        cameraMaxHeight: 720,
      ),
    );
    const VoiceSettingsState settings = VoiceSettingsState(
      cameraResolution: CameraResolution.high,
      streamingMode: StreamingMode.custom,
      screenshareResolution: ScreenshareResolution.ultra,
      videoFrameRate: 60,
    );
    final ScreenShareCaptureOptions capture = instance
        .buildScreenShareCaptureOptions(settings);
    expect(capture.params.dimensions.height, 1080);
    expect(capture.maxFrameRate, 30);
    expect(
      instance.buildCameraCaptureOptions(settings).params.dimensions.height,
      720,
    );
  });

  test('a chosen bitrate only applies with higher quality', () {
    const VoiceSettingsState settings = VoiceSettingsState(
      screenShareBitrate: 4000000,
    );
    expect(
      premium
          .buildScreenSharePublishOptions(settings)
          .screenShareEncoding
          ?.maxBitrate,
      4000000,
    );
    expect(
      free
          .buildScreenSharePublishOptions(settings)
          .screenShareEncoding
          ?.maxBitrate,
      3000000,
    );
  });

  test('P2P calls unlock full quality and bitrate choice', () {
    final VoiceSettingsApplicator p2p = free.forChannelMode(
      VoiceChannelMode.p2p,
    );
    const VoiceSettingsState settings = VoiceSettingsState(
      streamingMode: StreamingMode.custom,
      screenshareResolution: ScreenshareResolution.ultra,
      videoFrameRate: 60,
      screenShareBitrate: 8000000,
    );
    expect(
      p2p.buildScreenShareCaptureOptions(settings).params.dimensions.height,
      1440,
    );
    expect(
      p2p
          .buildScreenSharePublishOptions(settings)
          .screenShareEncoding
          ?.maxBitrate,
      8000000,
    );
  });

  test('screen capture size is not read off native mobile', () {
    expect(nativeMobileScreenCaptureDimensions(), isNull);
  });
}
