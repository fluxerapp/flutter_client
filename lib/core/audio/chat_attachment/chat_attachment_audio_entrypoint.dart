import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_artwork.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_handler.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';

Future<void> bootstrapChatAttachmentAudio() async {
  if (kIsWeb || !(Platform.isAndroid || Platform.isIOS)) {
    return;
  }
  final ChatAttachmentAudioSession session =
      ChatAttachmentAudioSession.instance;
  if (session.isAvailable) {
    return;
  }
  await bootstrapChatAttachmentAudioArtwork();
  await AudioService.init(
    builder: () => ChatAttachmentAudioHandler(session),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.fluxer.chat.audio',
      androidNotificationChannelName: 'Chat audio',
    ),
  );
}
