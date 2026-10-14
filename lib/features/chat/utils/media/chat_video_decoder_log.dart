import 'dart:async';

import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/utils/media/chat_video_native_get_property_stub.dart'
    if (dart.library.io) 'package:fluxer_app/features/chat/utils/media/chat_video_native_get_property_io.dart';
import 'package:media_kit/media_kit.dart';

enum ChatVideoSurface { inline, fullscreen }

const Duration _decoderSettleDelay = Duration(seconds: 3);

const List<String> _decoderProperties = <String>[
  'hwdec-current',
  'video-codec',
  'video-params/pixelformat',
  'video-params/w',
  'video-params/h',
];

Future<void> logChatVideoDecoder(
  Player player, {
  required ChatVideoSurface surface,
}) async {
  final PlatformPlayer? platform = player.platform;
  if (platform is! NativePlayer) {
    return;
  }
  try {
    if (!_hasFrameSize(player.state.videoParams)) {
      await player.stream.videoParams.firstWhere(_hasFrameSize);
    }
    await Future<void>.delayed(_decoderSettleDelay);
    final StringBuffer line = StringBuffer(
      '[ChatVideoDecoder] surface=${surface.name}',
    );
    for (final String property in _decoderProperties) {
      final String value = await getNativePlayerProperty(platform, property);
      line.write(' $property=$value');
    }
    talker.info(line.toString());
  } on Object {
    // The player was disposed before or between the reads.
  }
}

bool _hasFrameSize(VideoParams params) =>
    (params.w ?? 0) > 0 && (params.h ?? 0) > 0;
