import 'package:fluxer_app/features/chat/utils/chat_video_hdr_native_set_property_stub.dart'
    if (dart.library.io) 'package:fluxer_app/features/chat/utils/chat_video_hdr_native_set_property_io.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:media_kit/media_kit.dart';

Map<String, String> chatVideoHdrMpvProperties(HdrDisplayMode mode) {
  return switch (mode) {
    HdrDisplayMode.standard => const {
      'hdr-compute-peak': 'yes',
      'tone-mapping': 'auto',
      'target-prim': 'bt.709',
      'target-trc': 'srgb',
    },
    HdrDisplayMode.full => const {
      'hdr-compute-peak': 'yes',
      'tone-mapping': 'auto',
      'target-prim': 'auto',
      'target-trc': 'auto',
    },
  };
}

Future<void> applyChatVideoHdrProperties(
  Player player,
  HdrDisplayMode mode,
) async {
  final PlatformPlayer? platform = player.platform;
  if (platform is! NativePlayer) {
    return;
  }
  for (final MapEntry<String, String> entry in chatVideoHdrMpvProperties(
    mode,
  ).entries) {
    await setNativePlayerProperty(platform, entry.key, entry.value);
  }
}
