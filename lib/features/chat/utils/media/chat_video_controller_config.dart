import 'package:flutter/foundation.dart';
import 'package:media_kit_video/media_kit_video.dart' as mkv;

mkv.VideoControllerConfiguration chatVideoControllerConfiguration() =>
    chatVideoControllerConfigurationFor(defaultTargetPlatform);

mkv.VideoControllerConfiguration chatVideoControllerConfigurationFor(
  TargetPlatform platform,
) => switch (platform) {
  TargetPlatform.android => const mkv.VideoControllerConfiguration(
    hwdec: 'mediacodec,mediacodec-copy',
  ),
  _ => const mkv.VideoControllerConfiguration(),
};
