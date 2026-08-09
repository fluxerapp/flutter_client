import 'dart:io';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart';

const AudioSessionConfiguration _kChatAttachmentAudioSessionConfig =
    AudioSessionConfiguration.music();

const AudioSessionConfiguration _kMixableSfxIosAudioSessionConfig =
    AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.ambient,
      avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.mixWithOthers,
    );

Future<void> configureChatAttachmentAudioSession() async {
  if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
    return;
  }
  final AudioSession session = await AudioSession.instance;
  await session.configure(_kChatAttachmentAudioSessionConfig);
}

Future<void> activateChatAttachmentAudioSession() async {
  if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
    return;
  }
  final AudioSession session = await AudioSession.instance;
  await session.configure(_kChatAttachmentAudioSessionConfig);
  await session.setActive(true);
}

Future<void> restoreMixableSfxAudioSession() async {
  if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
    return;
  }
  final AudioSession session = await AudioSession.instance;
  await session.setActive(false);
  if (Platform.isIOS) {
    await session.configure(_kMixableSfxIosAudioSessionConfig);
  }
}
