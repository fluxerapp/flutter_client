import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/camera_resolution_presets.dart';
import 'package:livekit_client/livekit_client.dart';

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

  group('camera capture option matching', () {
    CameraCaptureOptions optionsFor({
      required CameraPosition position,
      CameraResolution resolution = CameraResolution.medium,
    }) {
      return CameraCaptureOptions(
        cameraPosition: position,
        params: cameraVideoParameters(resolution),
      );
    }

    test('cameraCaptureOptionsMatch requires the same facing', () {
      final CameraCaptureOptions front = optionsFor(
        position: CameraPosition.front,
      );
      expect(cameraCaptureOptionsMatch(front, front), isTrue);
      expect(
        cameraCaptureOptionsMatch(
          front,
          optionsFor(position: CameraPosition.back),
        ),
        isFalse,
      );
    });

    test('isCameraFacingOnlyChange is true when only facing changes', () {
      expect(
        isCameraFacingOnlyChange(
          current: optionsFor(position: CameraPosition.front),
          next: optionsFor(position: CameraPosition.back),
        ),
        isTrue,
      );
    });

    test('isCameraFacingOnlyChange is false when facing is unchanged', () {
      final CameraCaptureOptions current = optionsFor(
        position: CameraPosition.front,
      );
      expect(
        isCameraFacingOnlyChange(current: current, next: current),
        isFalse,
      );
    });

    test('isCameraFacingOnlyChange is false when resolution also changes', () {
      expect(
        isCameraFacingOnlyChange(
          current: optionsFor(position: CameraPosition.front),
          next: optionsFor(
            position: CameraPosition.back,
            resolution: CameraResolution.high,
          ),
        ),
        isFalse,
      );
    });
  });
}
