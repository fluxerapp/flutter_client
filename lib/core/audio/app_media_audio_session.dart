import 'dart:io';

import 'package:audio_session/audio_session.dart' as audio_session;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

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

Future<void> restoreAppMediaAudioSession() async {
  if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
    return;
  }
  try {
    await AudioPlayer.global.setAudioContext(kAppMediaAudioContext);
  } on Object {}
  final audio_session.AudioSession session =
      await audio_session.AudioSession.instance;
  await session.setActive(false);
  await session.configure(kAppMediaAudioSessionConfig);
}
