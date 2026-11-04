import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';
import 'package:fluxer_app/core/talker.dart';

const MethodChannel _androidSystemVoiceCallChannel = MethodChannel(
  'fluxer_app/system_voice_call',
);

const MethodChannel _iosVoipCallKitChannel = MethodChannel(
  'fluxer_app/voip_callkit',
);

bool _loggedChannelFailure = false;

Future<bool> isExternalSystemVoiceCallActive({
  Future<bool> Function(MethodChannel channel, bool fluxerOwnsVoice)?
  invokeNative,
}) async {
  final bool fluxerOwnsVoice =
      ChatAttachmentAudioSession.instance.isVoiceCallActive;
  if (fluxerOwnsVoice) {
    return false;
  }
  if (invokeNative != null) {
    const MethodChannel channel = _androidSystemVoiceCallChannel;
    return invokeNative(channel, fluxerOwnsVoice);
  }
  if (!(Platform.isIOS || Platform.isAndroid)) {
    return false;
  }
  final MethodChannel channel = Platform.isIOS
      ? _iosVoipCallKitChannel
      : _androidSystemVoiceCallChannel;
  try {
    final bool? active = await channel.invokeMethod<bool>(
      'isExternalCallActive',
      <String, Object>{'fluxerOwnsVoice': fluxerOwnsVoice},
    );
    return active ?? false;
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
