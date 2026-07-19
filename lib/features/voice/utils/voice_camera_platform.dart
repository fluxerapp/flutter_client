import 'package:fluxer_app/core/platform/fluxer_platform.dart';

bool isMobileVoiceCameraPlatform() {
  return isFluxerMobileOs;
}

bool isNativeVoiceCallKitPlatform() {
  return isFluxerNativeMobileOs;
}
