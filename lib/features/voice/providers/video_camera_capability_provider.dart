import 'package:fluxer_app/features/voice/utils/video_camera_capability.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_camera_capability_provider.g.dart';

@Riverpod(keepAlive: true)
Future<bool> videoCameraCapability(Ref ref) {
  return isVideoCameraAvailableOnDevice();
}
