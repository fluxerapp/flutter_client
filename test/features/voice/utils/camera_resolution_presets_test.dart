import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/camera_resolution_presets.dart';
import 'package:livekit_client/livekit_client.dart';

void main() {
  group('cameraVideoParameters', () {
    test('maps low resolution to h360 preset', () {
      expect(
        cameraVideoParameters(CameraResolution.low),
        VideoParametersPresets.h360_169,
      );
    });

    test('maps medium resolution to h720 preset', () {
      expect(
        cameraVideoParameters(CameraResolution.medium),
        VideoParametersPresets.h720_169,
      );
    });

    test('maps high resolution to h1080 preset', () {
      expect(
        cameraVideoParameters(CameraResolution.high),
        VideoParametersPresets.h1080_169,
      );
    });
  });
}
