import 'dart:io';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/audio/app_audio_session_restore.dart';

const AudioSessionConfiguration _kChatAttachmentAudioSessionConfig =
    AudioSessionConfiguration.music();

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

Future<void> restoreMixableSfxAudioSession() =>
    restorePreferredAppAudioSession();
