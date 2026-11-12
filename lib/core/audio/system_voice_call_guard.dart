import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_voice/fluxer_voice.dart';

bool _loggedChannelFailure = false;

Future<bool> isExternalSystemVoiceCallActive({
  Future<bool> Function({required bool fluxerOwnsVoice})? invokeNative,
}) async {
  final bool fluxerOwnsVoice =
      ChatAttachmentAudioSession.instance.isVoiceCallActive ||
      FluxerVoiceAudioSession.instance.isActive;
  if (fluxerOwnsVoice) {
    return false;
  }
  if (invokeNative != null) {
    return invokeNative(fluxerOwnsVoice: fluxerOwnsVoice);
  }
  if (!(Platform.isIOS || Platform.isAndroid)) {
    return false;
  }
  try {
    return await FluxerSystemVoiceCallGuard.isExternalCallActive(
      fluxerOwnsVoice: fluxerOwnsVoice,
    );
  } on Object catch (error, stackTrace) {
    if (!_loggedChannelFailure) {
      _loggedChannelFailure = true;
      talker.warning(
        '[AudioSession] external call guard unavailable',
        error,
        stackTrace,
      );
    }
    return false;
  }
}

@visibleForTesting
void resetExternalSystemVoiceCallGuardForTest() {
  _loggedChannelFailure = false;
}
