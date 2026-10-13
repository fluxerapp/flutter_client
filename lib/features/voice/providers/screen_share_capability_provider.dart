import 'package:fluxer_app/features/voice/utils/screen_share_capability.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screen_share_capability_provider.g.dart';

@Riverpod(keepAlive: true)
Future<bool> screenShareCapability(Ref ref) {
  return isScreenShareSupportedOnPlatform();
}
