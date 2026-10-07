import 'package:flutter_riverpod/flutter_riverpod.dart';

/// True while CallKit has suppressed the LiveKit WebRTC engine.
class VoiceCallKitEngineGate extends Notifier<bool> {
  @override
  bool build() => false;

  void setSuppressed({required bool suppressed}) {
    if (state == suppressed) {
      return;
    }
    state = suppressed;
  }
}

final voiceCallKitEngineSuppressedProvider =
    NotifierProvider<VoiceCallKitEngineGate, bool>(VoiceCallKitEngineGate.new);

bool readVoiceWebRtcEngineSuppressed(Ref ref) {
  return ref.read(voiceCallKitEngineSuppressedProvider);
}
