import 'package:fluxer_voice/src/messages.g.dart';

class FluxerSystemVoiceCallGuard {
  FluxerSystemVoiceCallGuard._();

  static final SystemVoiceCallGuardHostApi _api = SystemVoiceCallGuardHostApi();

  static Future<bool> isExternalCallActive({required bool fluxerOwnsVoice}) {
    return _api.isExternalCallActive(fluxerOwnsVoice: fluxerOwnsVoice);
  }
}
