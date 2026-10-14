import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/services/voice_settings_applicator.dart';
import 'package:fluxer_app/features/voice/utils/screen_share_presets.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:test/test.dart';

void main() {
  const VideoDimensions target720p = VideoDimensions(1280, 720);

  VideoDimensions scaled(VideoDimensions source, double scale) {
    return VideoDimensions(
      (source.width / scale).floor(),
      (source.height / scale).floor(),
    );
  }

  test('a portrait phone screen is scaled to fit 720p', () {
    const VideoDimensions phone = VideoDimensions(1080, 2400);
    final double scale = screenShareScaleDownBy(
      source: phone,
      target: target720p,
    );
    expect(scale, 1.875);
    final VideoDimensions sent = scaled(phone, scale);
    expect(sent.width, 576);
    expect(sent.height, 1280);
  });

  test('a 4K capture is scaled to 720p in either orientation', () {
    for (final VideoDimensions source in const <VideoDimensions>[
      VideoDimensions(3840, 2160),
      VideoDimensions(2160, 3840),
    ]) {
      final double scale = screenShareScaleDownBy(
        source: source,
        target: target720p,
      );
      expect(scale, 3);
      final VideoDimensions sent = scaled(source, scale);
      expect(<int>[sent.width, sent.height]..sort(), <int>[720, 1280]);
    }
  });

  test('a capture already within the target is never upscaled', () {
    expect(
      screenShareScaleDownBy(
        source: const VideoDimensions(1280, 600),
        target: target720p,
      ),
      1,
    );
    expect(
      screenShareScaleDownBy(
        source: const VideoDimensions(0, 0),
        target: target720p,
      ),
      1,
    );
  });

  test('default screen share publishes one 720p30 layer that keeps fps', () {
    const VoiceSettingsApplicator applicator = VoiceSettingsApplicator(
      noiseFilterSupported: false,
      higherVideoQuality: false,
      meshPhoneCap: false,
    );
    const VoiceSettingsState settings = VoiceSettingsState();
    final ScreenShareCaptureOptions capture = applicator
        .buildScreenShareCaptureOptions(settings);
    expect(capture.params.dimensions.width, 1280);
    expect(capture.params.dimensions.height, 720);
    expect(capture.params.encoding?.maxFramerate, 30);

    final VideoPublishOptions publish = applicator
        .buildScreenSharePublishOptions(settings);
    expect(publish.simulcast, isFalse);
    expect(
      publish.degradationPreference,
      DegradationPreference.maintainFramerate,
    );
    expect(publish.screenShareEncoding?.maxFramerate, 30);
    expect(publish.screenShareEncoding?.maxBitrate, 3000000);
  });

  test('high resolution is clamped without higher video quality', () {
    const VoiceSettingsApplicator applicator = VoiceSettingsApplicator(
      noiseFilterSupported: false,
      higherVideoQuality: false,
      meshPhoneCap: false,
    );
    const VoiceSettingsState settings = VoiceSettingsState(
      screenshareResolution: ScreenshareResolution.high,
      videoFrameRate: 60,
    );
    final ScreenShareCaptureOptions capture = applicator
        .buildScreenShareCaptureOptions(settings);
    expect(capture.params.dimensions.width, 1280);
    expect(capture.params.encoding?.maxFramerate, 30);
    expect(
      applicator
          .buildScreenSharePublishOptions(settings)
          .screenShareEncoding
          ?.maxBitrate,
      3000000,
    );
  });

  test('phones cap screen share at 720p30 even with higher quality', () {
    const VoiceSettingsState settings = VoiceSettingsState(
      screenshareResolution: ScreenshareResolution.high,
      videoFrameRate: 60,
    );
    final VoiceSettingsState phone = clampVoiceVideoSettings(
      settings,
      higherVideoQuality: true,
      meshPhoneCap: false,
      phoneScreenShareCap: true,
    );
    expect(phone.screenshareResolution, ScreenshareResolution.medium);
    expect(phone.videoFrameRate, 30);

    final VoiceSettingsState desktop = clampVoiceVideoSettings(
      settings,
      higherVideoQuality: true,
      meshPhoneCap: false,
      phoneScreenShareCap: false,
    );
    expect(desktop.screenshareResolution, ScreenshareResolution.high);
    expect(desktop.videoFrameRate, 60);
  });

  test('every resolution and frame rate has a bitrate', () {
    for (final ScreenshareResolution resolution
        in ScreenshareResolution.values) {
      for (final int frameRate in kSupportedScreenShareFrameRates) {
        final VideoParameters params = screenShareVideoParameters(
          resolution: resolution,
          frameRate: frameRate,
        );
        expect(params.encoding?.maxBitrate, greaterThan(0));
        expect(params.encoding?.maxFramerate, frameRate);
      }
    }
  });

  test('screen capture size is not read off native mobile', () {
    expect(nativeMobileScreenCaptureDimensions(), isNull);
  });
}
