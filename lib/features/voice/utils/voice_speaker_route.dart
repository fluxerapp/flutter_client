import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart';

AVAudioSessionCategoryOptions iosSpeakerCategoryOptions({
  required bool speaker,
}) {
  final AVAudioSessionCategoryOptions options =
      AVAudioSessionCategoryOptions.allowBluetooth |
      AVAudioSessionCategoryOptions.allowBluetoothA2dp |
      AVAudioSessionCategoryOptions.allowAirPlay;
  if (!speaker) {
    return options;
  }
  return options | AVAudioSessionCategoryOptions.defaultToSpeaker;
}

AVAudioSessionMode iosSpeakerAudioMode({required bool speaker}) {
  return speaker ? AVAudioSessionMode.videoChat : AVAudioSessionMode.voiceChat;
}

Future<void> applyIosSpeakerPortOverride({required bool speaker}) async {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.iOS) {
    return;
  }
  try {
    final AVAudioSession session = AVAudioSession();
    await session.setCategory(
      AVAudioSessionCategory.playAndRecord,
      iosSpeakerCategoryOptions(speaker: speaker),
      iosSpeakerAudioMode(speaker: speaker),
    );
    await session.overrideOutputAudioPort(
      speaker
          ? AVAudioSessionPortOverride.speaker
          : AVAudioSessionPortOverride.none,
    );
  } on Object {
    return;
  }
}
