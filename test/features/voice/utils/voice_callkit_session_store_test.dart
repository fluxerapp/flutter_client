import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_session_store.dart';
import 'package:test/test.dart';

void main() {
  test('adopts the native call id and keeps it on a second register', () {
    final VoiceCallKitSessionStore store = VoiceCallKitSessionStore();
    final String adopted = store.registerSession(
      channelId: 'channel-1',
      callKitId: 'native-id',
      messageId: 'message-1',
      kind: VoiceCallKitSessionKind.incomingRing,
    );
    final String again = store.registerSession(
      channelId: 'channel-1',
      callKitId: 'other-id',
      kind: VoiceCallKitSessionKind.incomingRing,
    );
    expect(adopted, 'native-id');
    expect(again, 'native-id');
    expect(store.containsChannel('channel-1'), isTrue);
  });

  test('ends rings the gateway does not know about', () {
    final VoiceCallKitSessionStore store = VoiceCallKitSessionStore();
    store.registerSession(
      channelId: 'live',
      callKitId: 'a',
      kind: VoiceCallKitSessionKind.incomingRing,
    );
    store.registerSession(
      channelId: 'gone',
      callKitId: 'b',
      kind: VoiceCallKitSessionKind.incomingRing,
    );
    store.registerSession(
      channelId: 'voice',
      callKitId: 'c',
      kind: VoiceCallKitSessionKind.activeVoice,
    );
    expect(store.incomingRingChannelIdsAbsentFrom(<String>{'live'}), <String>[
      'gone',
    ]);
  });

  test('soleActiveVoiceChannelId is the only live voice session', () {
    final VoiceCallKitSessionStore store = VoiceCallKitSessionStore();
    store.registerSession(
      channelId: 'ring',
      callKitId: 'a',
      kind: VoiceCallKitSessionKind.incomingRing,
    );
    store.registerSession(
      channelId: 'voice',
      callKitId: 'b',
      kind: VoiceCallKitSessionKind.activeVoice,
    );
    expect(store.soleActiveVoiceChannelId, 'voice');
    store.registerSession(
      channelId: 'voice-2',
      callKitId: 'c',
      kind: VoiceCallKitSessionKind.activeVoice,
    );
    expect(store.soleActiveVoiceChannelId, isNull);
  });
}
