import 'dart:io';

import 'package:audio_session/audio_session.dart' as audio_session;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';
import 'package:fluxer_app/core/talker.dart';

final AudioContext kAppMediaAudioContext = AudioContext(
  android: const AudioContextAndroid(audioFocus: AndroidAudioFocus.none),
  iOS: AudioContextIOS(
    options: const <AVAudioSessionOptions>{AVAudioSessionOptions.mixWithOthers},
  ),
);

const audio_session.AudioSessionConfiguration kAppMediaAudioSessionConfig =
    audio_session.AudioSessionConfiguration(
      avAudioSessionCategory: audio_session.AVAudioSessionCategory.playback,
      avAudioSessionCategoryOptions:
          audio_session.AVAudioSessionCategoryOptions.mixWithOthers,
      androidAudioAttributes: audio_session.AndroidAudioAttributes(
        contentType: audio_session.AndroidAudioContentType.music,
        usage: audio_session.AndroidAudioUsage.media,
      ),
      androidAudioFocusGainType:
          audio_session.AndroidAudioFocusGainType.gainTransientMayDuck,
    );

const audio_session.AudioSessionConfiguration kMixableIdleAudioSessionConfig =
    audio_session.AudioSessionConfiguration(
      avAudioSessionCategory: audio_session.AVAudioSessionCategory.ambient,
      avAudioSessionCategoryOptions:
          audio_session.AVAudioSessionCategoryOptions.mixWithOthers,
    );

bool voiceCallOwnsAndroidAudioRoute() {
  return defaultTargetPlatform == TargetPlatform.android &&
      ChatAttachmentAudioSession.instance.isVoiceCallActive;
}

Future<bool> applyAudioPlayerContext(
  AudioPlayer player,
  AudioContext context,
) async {
  if (voiceCallOwnsAndroidAudioRoute()) {
    return false;
  }
  await player.setAudioContext(context);
  return true;
}

Future<void> _applyGlobalAudioPlayerContext() async {
  if (voiceCallOwnsAndroidAudioRoute()) {
    return;
  }
  try {
    await AudioPlayer.global.setAudioContext(kAppMediaAudioContext);
  } on Object catch (error, stackTrace) {
    talker.warning(
      '[AudioSession] Failed to set the media audio context',
      error,
      stackTrace,
    );
  }
}

Future<void> prepareAppMediaAudioSession() async {
  if (!(Platform.isAndroid || Platform.isIOS)) {
    return;
  }
  await _applyGlobalAudioPlayerContext();
  final audio_session.AudioSession session =
      await audio_session.AudioSession.instance;
  await session.configure(kAppMediaAudioSessionConfig);
}

Future<void> releaseAppAudioSessionForMixing() async {
  if (!(Platform.isAndroid || Platform.isIOS)) {
    return;
  }
  await _applyGlobalAudioPlayerContext();
  final audio_session.AudioSession session =
      await audio_session.AudioSession.instance;
  await session.setActive(false);
  if (Platform.isIOS) {
    await session.configure(kMixableIdleAudioSessionConfig);
  }
}
