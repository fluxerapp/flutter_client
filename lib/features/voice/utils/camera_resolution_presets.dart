import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_camera_platform.dart';
import 'package:livekit_client/livekit_client.dart';

VideoParameters cameraVideoParameters(CameraResolution resolution) {
  return switch (resolution) {
    CameraResolution.high => VideoParametersPresets.h1080_169,
    CameraResolution.medium => VideoParametersPresets.h720_169,
    CameraResolution.low => VideoParametersPresets.h360_169,
  };
}

CameraPosition liveKitCameraPosition(VoiceCameraFacing facing) {
  return facing == VoiceCameraFacing.back
      ? CameraPosition.back
      : CameraPosition.front;
}

CameraCaptureOptions cameraCaptureOptionsFor({
  required CameraResolution resolution,
  String? deviceId,
  VoiceCameraFacing cameraFacing = VoiceCameraFacing.front,
}) {
  final VideoParameters params = cameraVideoParameters(resolution);
  if (isMobileVoiceCameraPlatform()) {
    return CameraCaptureOptions(
      params: params,
      cameraPosition: liveKitCameraPosition(cameraFacing),
    );
  }
  final String? resolvedDeviceId =
      deviceId != null && deviceId != kDefaultVoiceDeviceId ? deviceId : null;
  return CameraCaptureOptions(params: params, deviceId: resolvedDeviceId);
}
