import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_priority_speaker_provider.g.dart';

@Riverpod(keepAlive: true)
class VoicePrioritySpeaker extends _$VoicePrioritySpeaker {
  @override
  bool build() => false;

  void setPrioritySpeakerHeld({required bool held}) {
    if (state == held) {
      return;
    }
    state = held;
  }

  void resetPrioritySpeakerState() {
    setPrioritySpeakerHeld(held: false);
  }
}
