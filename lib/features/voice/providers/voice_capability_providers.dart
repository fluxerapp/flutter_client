import 'package:fluxer_app/features/voice/utils/media/video_camera_capability.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_capability.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_capability_providers.g.dart';

@Riverpod(keepAlive: true)
Future<bool> screenShareCapability(Ref ref) {
  return isScreenShareSupportedOnPlatform();
}

@Riverpod(keepAlive: true)
Future<bool> videoCameraCapability(Ref ref) {
  return isVideoCameraAvailableOnDevice();
}
