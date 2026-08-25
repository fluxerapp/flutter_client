import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';

void main() {
  test('priority speaker keybind wire ids match web', () {
    expect(
      KeybindAction.voicePushToTalkPriority.id,
      'voice_push_to_talk_priority',
    );
    expect(KeybindAction.voicePriorityVad.id, 'voice_priority_vad');
  });
}
