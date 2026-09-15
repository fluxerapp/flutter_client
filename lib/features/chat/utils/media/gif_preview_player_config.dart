import 'package:flutter/foundation.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart' as mkv;

const int gifPreviewPlayerBufferSize = 4 * 1024 * 1024;

const PlayerConfiguration gifPreviewPlayerConfiguration = PlayerConfiguration(
  muted: true,
  bufferSize: gifPreviewPlayerBufferSize,
  title: 'Fluxer GIF preview',
);

mkv.VideoControllerConfiguration gifPreviewVideoControllerConfiguration() =>
    gifPreviewVideoControllerConfigurationFor(defaultTargetPlatform);

mkv.VideoControllerConfiguration gifPreviewVideoControllerConfigurationFor(
  TargetPlatform platform,
) => switch (platform) {
  TargetPlatform.android => const mkv.VideoControllerConfiguration(
    vo: 'gpu',
    hwdec: 'auto-safe',
  ),
  _ => const mkv.VideoControllerConfiguration(),
};
