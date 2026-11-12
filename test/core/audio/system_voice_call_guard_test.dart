import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';
import 'package:fluxer_app/core/audio/system_voice_call_guard.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    resetExternalSystemVoiceCallGuardForTest();
    ChatAttachmentAudioSession.instance.resetForTest();
  });

  tearDown(ChatAttachmentAudioSession.instance.resetForTest);

  test('returns native result when Fluxer does not own voice', () async {
    bool? invokedFluxerOwnsVoice;

    final bool active = await isExternalSystemVoiceCallActive(
      invokeNative: ({required bool fluxerOwnsVoice}) async {
        invokedFluxerOwnsVoice = fluxerOwnsVoice;
        return true;
      },
    );

    expect(invokedFluxerOwnsVoice, isFalse);
    expect(active, isTrue);
  });

  test('does not call native when Fluxer owns the voice session', () async {
    await ChatAttachmentAudioSession.instance.clearForVoiceCall();
    var nativeInvoked = false;

    final bool active = await isExternalSystemVoiceCallActive(
      invokeNative: ({required bool fluxerOwnsVoice}) async {
        nativeInvoked = true;
        return true;
      },
    );

    expect(active, isFalse);
    expect(nativeInvoked, isFalse);
  });
}
