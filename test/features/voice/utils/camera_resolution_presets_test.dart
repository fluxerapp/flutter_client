import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/camera_resolution_presets.dart';

void main() {
  group('capCameraResolutionForLinuxMobile', () {
    test('steps high and medium resolutions down', () {
      expect(
        capCameraResolutionForLinuxMobile(CameraResolution.high),
        CameraResolution.medium,
      );
      expect(
        capCameraResolutionForLinuxMobile(CameraResolution.medium),
        CameraResolution.low,
      );
      expect(
        capCameraResolutionForLinuxMobile(CameraResolution.low),
        CameraResolution.low,
      );
    });
  });
}
