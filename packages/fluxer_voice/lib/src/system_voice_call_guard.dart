import 'package:flutter/services.dart';

class FluxerSystemVoiceCallGuard {
  FluxerSystemVoiceCallGuard._();

  static const MethodChannel androidChannel = MethodChannel(
    'fluxer_app/system_voice_call',
  );

  static const MethodChannel iosChannel = MethodChannel(
    'fluxer_app/voip_callkit',
  );

  static Future<bool> isExternalCallActive(
    MethodChannel channel, {
    required bool fluxerOwnsVoice,
  }) async {
    final bool? active = await channel.invokeMethod<bool>(
      'isExternalCallActive',
      <String, Object>{'fluxerOwnsVoice': fluxerOwnsVoice},
    );
    return active ?? false;
  }
}
