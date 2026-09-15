import 'package:fluxer_app/core/platform/fluxer_platform.dart';

bool isMobileVoiceCameraPlatform() {
  return isFluxerMobileOs;
}

bool isNativeMobileVoiceCameraPlatform() {
  return isFluxerNativeMobileOs;
}

bool isNativeVoiceCallKitPlatform() {
  return isFluxerNativeMobileOs;
}
