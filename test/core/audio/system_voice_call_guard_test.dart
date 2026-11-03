import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';
import 'package:fluxer_app/core/audio/system_voice_call_guard.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel androidChannel = MethodChannel(
    'fluxer_app/system_voice_call',
  );

  setUp(() {
    resetExternalSystemVoiceCallGuardForTest();
    ChatAttachmentAudioSession.instance.resetForTest();
  });

  tearDown(ChatAttachmentAudioSession.instance.resetForTest);

  test('returns native result when Fluxer does not own voice', () async {
    bool? invokedFluxerOwnsVoice;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(androidChannel, (MethodCall call) async {
          expect(call.method, 'isExternalCallActive');
          invokedFluxerOwnsVoice = call.arguments['fluxerOwnsVoice'] as bool?;
          return true;
        });
    addTearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(androidChannel, null);
    });

    final bool active = await isExternalSystemVoiceCallActive(
      invokeNative: (MethodChannel channel, bool fluxerOwnsVoice) async {
        final bool? result = await channel.invokeMethod<bool>(
          'isExternalCallActive',
          <String, Object>{'fluxerOwnsVoice': fluxerOwnsVoice},
        );
        return result ?? false;
      },
    );

    expect(invokedFluxerOwnsVoice, isFalse);
    expect(active, isTrue);
  });

  test('does not call native when Fluxer owns the voice session', () async {
    await ChatAttachmentAudioSession.instance.clearForVoiceCall();
    var channelInvoked = false;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(androidChannel, (MethodCall call) async {
          channelInvoked = true;
          return true;
        });
    addTearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(androidChannel, null);
    });

    final bool active = await isExternalSystemVoiceCallActive();

    expect(active, isFalse);
    expect(channelInvoked, isFalse);
  });
}
