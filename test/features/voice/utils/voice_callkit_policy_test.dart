import 'package:flutter/widgets.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';
import 'package:test/test.dart';

void main() {
  group('shouldPresentIncomingVoiceSheet', () {
    test('desktop always presents sheet', () {
      expect(
        shouldPresentIncomingVoiceSheet(
          isNativeVoiceCallKitPlatform: false,
          isRuntimeMobileFormFactor: false,
          isForeground: false,
        ),
        isTrue,
      );
    });
    test('mobile foreground presents sheet', () {
      expect(
        shouldPresentIncomingVoiceSheet(
          isNativeVoiceCallKitPlatform: true,
          isRuntimeMobileFormFactor: false,
          isForeground: true,
        ),
        isTrue,
      );
    });
    test('mobile background skips sheet', () {
      expect(
        shouldPresentIncomingVoiceSheet(
          isNativeVoiceCallKitPlatform: true,
          isRuntimeMobileFormFactor: false,
          isForeground: false,
        ),
        isFalse,
      );
    });
    test('runtime mobile form factor foreground presents sheet', () {
      expect(
        shouldPresentIncomingVoiceSheet(
          isNativeVoiceCallKitPlatform: false,
          isRuntimeMobileFormFactor: true,
          isForeground: true,
        ),
        isTrue,
      );
    });
    test('runtime mobile form factor background skips sheet', () {
      expect(
        shouldPresentIncomingVoiceSheet(
          isNativeVoiceCallKitPlatform: false,
          isRuntimeMobileFormFactor: true,
          isForeground: false,
        ),
        isFalse,
      );
    });
  });

  group('shouldPresentIncomingVoiceCallKit', () {
    test('mobile background with pending incoming shows CallKit', () {
      expect(
        shouldPresentIncomingVoiceCallKit(
          isMobileCallKitPlatform: true,
          isForeground: false,
          hasPendingIncoming: true,
        ),
        isTrue,
      );
    });
    test('mobile foreground does not show CallKit', () {
      expect(
        shouldPresentIncomingVoiceCallKit(
          isMobileCallKitPlatform: true,
          isForeground: true,
          hasPendingIncoming: true,
        ),
        isFalse,
      );
    });
    test('desktop never shows CallKit', () {
      expect(
        shouldPresentIncomingVoiceCallKit(
          isMobileCallKitPlatform: false,
          isForeground: false,
          hasPendingIncoming: true,
        ),
        isFalse,
      );
    });
  });

  group('shouldPlayIncomingVoiceRingSfx', () {
    test('desktop plays ring whenever pending', () {
      expect(
        shouldPlayIncomingVoiceRingSfx(
          isNativeVoiceCallKitPlatform: false,
          isForeground: false,
          hasPendingIncoming: true,
        ),
        isTrue,
      );
    });
    test('mobile background suppresses ring', () {
      expect(
        shouldPlayIncomingVoiceRingSfx(
          isNativeVoiceCallKitPlatform: true,
          isForeground: false,
          hasPendingIncoming: true,
        ),
        isFalse,
      );
    });
    test('mobile foreground plays ring', () {
      expect(
        shouldPlayIncomingVoiceRingSfx(
          isNativeVoiceCallKitPlatform: true,
          isForeground: true,
          hasPendingIncoming: true,
        ),
        isTrue,
      );
    });
  });

  group('shouldSuppressIncomingVoiceCallKitForChannel', () {
    test('suppresses incoming CallKit for the active voice channel', () {
      expect(
        shouldSuppressIncomingVoiceCallKitForChannel(
          channelId: 'channel-1',
          activeVoice: (
            isInVoice: true,
            isConnected: true,
            isConnecting: false,
            channelId: 'channel-1',
            activeConnectionId: 'conn-1',
          ),
        ),
        isTrue,
      );
    });
    test('allows incoming CallKit for a different channel', () {
      expect(
        shouldSuppressIncomingVoiceCallKitForChannel(
          channelId: 'channel-2',
          activeVoice: (
            isInVoice: true,
            isConnected: true,
            isConnecting: false,
            channelId: 'channel-1',
            activeConnectionId: 'conn-1',
          ),
        ),
        isFalse,
      );
    });
    test('suppresses incoming CallKit while connecting on same channel', () {
      expect(
        shouldSuppressIncomingVoiceCallKitForChannel(
          channelId: 'channel-1',
          activeVoice: (
            isInVoice: true,
            isConnected: false,
            isConnecting: true,
            channelId: 'channel-1',
            activeConnectionId: null,
          ),
        ),
        isTrue,
      );
    });
  });

  group('shouldStartCallKitOnVoiceJoin', () {
    test('starts CallKit only after LiveKit is connected', () {
      expect(
        shouldStartCallKitOnVoiceJoin(
          voice: (
            isInVoice: true,
            isConnected: false,
            isConnecting: true,
            channelId: 'channel-1',
            activeConnectionId: null,
          ),
        ),
        isFalse,
      );
      expect(
        shouldStartCallKitOnVoiceJoin(
          voice: (
            isInVoice: true,
            isConnected: true,
            isConnecting: false,
            channelId: 'channel-1',
            activeConnectionId: 'conn-1',
          ),
        ),
        isTrue,
      );
    });
  });

  group('shouldLeaveVoiceFromCallKitEnd', () {
    test('leaves voice only when connected on the same channel', () {
      expect(
        shouldLeaveVoiceFromCallKitEnd(
          voice: (
            isInVoice: true,
            isConnected: false,
            isConnecting: true,
            channelId: 'channel-1',
            activeConnectionId: null,
          ),
          channelId: 'channel-1',
        ),
        isFalse,
      );
      expect(
        shouldLeaveVoiceFromCallKitEnd(
          voice: (
            isInVoice: true,
            isConnected: true,
            isConnecting: false,
            channelId: 'channel-1',
            activeConnectionId: 'conn-1',
          ),
          channelId: 'channel-1',
        ),
        isTrue,
      );
      expect(
        shouldLeaveVoiceFromCallKitEnd(
          voice: (
            isInVoice: true,
            isConnected: true,
            isConnecting: false,
            channelId: 'channel-1',
            activeConnectionId: 'conn-1',
          ),
          channelId: 'channel-2',
        ),
        isFalse,
      );
    });
  });

  group('didJoinVoiceCall', () {
    test('detects first voice join', () {
      expect(
        didJoinVoiceCall(
          previous: null,
          next: (
            isInVoice: true,
            isConnected: false,
            isConnecting: true,
            channelId: 'channel-1',
            activeConnectionId: null,
          ),
        ),
        isTrue,
      );
    });
    test('detects voice channel switch', () {
      expect(
        didJoinVoiceCall(
          previous: (
            isInVoice: true,
            isConnected: true,
            isConnecting: false,
            channelId: 'channel-1',
            activeConnectionId: 'conn-1',
          ),
          next: (
            isInVoice: true,
            isConnected: false,
            isConnecting: true,
            channelId: 'channel-2',
            activeConnectionId: null,
          ),
        ),
        isTrue,
      );
    });
    test('ignores connected state updates on same channel', () {
      expect(
        didJoinVoiceCall(
          previous: (
            isInVoice: true,
            isConnected: false,
            isConnecting: true,
            channelId: 'channel-1',
            activeConnectionId: null,
          ),
          next: (
            isInVoice: true,
            isConnected: true,
            isConnecting: false,
            channelId: 'channel-1',
            activeConnectionId: 'conn-1',
          ),
        ),
        isFalse,
      );
    });
    test('ignores leaving voice', () {
      expect(
        didJoinVoiceCall(
          previous: (
            isInVoice: true,
            isConnected: true,
            isConnecting: false,
            channelId: 'channel-1',
            activeConnectionId: 'conn-1',
          ),
          next: (
            isInVoice: false,
            isConnected: false,
            isConnecting: false,
            channelId: null,
            activeConnectionId: null,
          ),
        ),
        isFalse,
      );
    });
  });

  group('shouldEndIncomingRingCallKitSession', () {
    test('ends incoming ring when channel is not pending', () {
      expect(
        shouldEndIncomingRingCallKitSession(
          session: const VoiceCallKitSession(
            callKitId: 'uuid-in',
            channelId: 'dm-1',
            kind: VoiceCallKitSessionKind.incomingRing,
            messageId: 'msg-1',
          ),
          pendingIncomingChannelIds: const <String>{},
        ),
        isTrue,
      );
    });
    test('keeps incoming ring while channel is still pending', () {
      expect(
        shouldEndIncomingRingCallKitSession(
          session: const VoiceCallKitSession(
            callKitId: 'uuid-in',
            channelId: 'dm-1',
            kind: VoiceCallKitSessionKind.incomingRing,
            messageId: 'msg-1',
          ),
          pendingIncomingChannelIds: const <String>{'dm-1'},
        ),
        isFalse,
      );
    });
    test('ignores non-incoming-ring sessions', () {
      expect(
        shouldEndIncomingRingCallKitSession(
          session: const VoiceCallKitSession(
            callKitId: 'uuid-active',
            channelId: 'dm-1',
            kind: VoiceCallKitSessionKind.activeVoice,
            messageId: 'msg-1',
          ),
          pendingIncomingChannelIds: const <String>{},
        ),
        isFalse,
      );
    });
  });

  group('shouldEndCallKitSessionForActiveCallsChange', () {
    test(
      'keeps guild voice CallKit when channel is absent from activeCalls',
      () {
        expect(
          shouldEndCallKitSessionForActiveCallsChange(
            session: const VoiceCallKitSession(
              callKitId: 'uuid-1',
              channelId: 'guild-voice-1',
              kind: VoiceCallKitSessionKind.activeVoice,
            ),
            activeCallChannelIds: const <String>{},
          ),
          isFalse,
        );
      },
    );
    test('ends DM CallKit when gateway call was removed', () {
      expect(
        shouldEndCallKitSessionForActiveCallsChange(
          session: const VoiceCallKitSession(
            callKitId: 'uuid-2',
            channelId: 'dm-1',
            kind: VoiceCallKitSessionKind.activeVoice,
            messageId: 'msg-1',
          ),
          activeCallChannelIds: const <String>{},
        ),
        isTrue,
      );
    });
    test('ends incoming ring CallKit when gateway call was removed', () {
      expect(
        shouldEndCallKitSessionForActiveCallsChange(
          session: const VoiceCallKitSession(
            callKitId: 'uuid-3',
            channelId: 'dm-2',
            kind: VoiceCallKitSessionKind.incomingRing,
            messageId: 'msg-2',
          ),
          activeCallChannelIds: const <String>{},
        ),
        isTrue,
      );
    });
    test('keeps DM CallKit while gateway call remains active', () {
      expect(
        shouldEndCallKitSessionForActiveCallsChange(
          session: const VoiceCallKitSession(
            callKitId: 'uuid-4',
            channelId: 'dm-3',
            kind: VoiceCallKitSessionKind.activeVoice,
            messageId: 'msg-3',
          ),
          activeCallChannelIds: const {'dm-3'},
        ),
        isFalse,
      );
    });
  });

  group('shouldDeferMobileCallKitStartCall', () {
    test('defers new startCall when app is paused', () {
      expect(
        shouldDeferMobileCallKitStartCall(
          isMobileCallKitPlatform: true,
          lifecycleState: AppLifecycleState.paused,
        ),
        isTrue,
      );
    });
    test('defers new startCall when app is hidden', () {
      expect(
        shouldDeferMobileCallKitStartCall(
          isMobileCallKitPlatform: true,
          lifecycleState: AppLifecycleState.hidden,
        ),
        isTrue,
      );
    });
    test('allows startCall while app is inactive', () {
      expect(
        shouldDeferMobileCallKitStartCall(
          isMobileCallKitPlatform: true,
          lifecycleState: AppLifecycleState.inactive,
        ),
        isFalse,
      );
    });
    test('allows startCall from mobile foreground', () {
      expect(
        shouldDeferMobileCallKitStartCall(
          isMobileCallKitPlatform: true,
          lifecycleState: AppLifecycleState.resumed,
        ),
        isFalse,
      );
    });
    test('desktop background does not defer', () {
      expect(
        shouldDeferMobileCallKitStartCall(
          isMobileCallKitPlatform: false,
          lifecycleState: AppLifecycleState.paused,
        ),
        isFalse,
      );
    });
  });

  group('shouldMaintainBackgroundVoiceCallKit', () {
    test('mobile background in voice maintains CallKit', () {
      expect(
        shouldMaintainBackgroundVoiceCallKit(
          isMobileCallKitPlatform: true,
          isForeground: false,
          isInVoice: true,
        ),
        isTrue,
      );
    });
    test('foreground does not maintain background CallKit', () {
      expect(
        shouldMaintainBackgroundVoiceCallKit(
          isMobileCallKitPlatform: true,
          isForeground: true,
          isInVoice: true,
        ),
        isFalse,
      );
    });
  });

  group('shouldDismissCallKitOnForeground', () {
    test('in voice keeps CallKit session', () {
      expect(shouldDismissCallKitOnForeground(isInVoice: true), isFalse);
    });
    test('not in voice dismisses CallKit', () {
      expect(shouldDismissCallKitOnForeground(isInVoice: false), isTrue);
    });
  });

  group('resolveVoiceCallKitSessionId', () {
    test('always generates uuid for CallKit id', () {
      final RegExp uuidPattern = RegExp(
        r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
      );
      expect(resolveVoiceCallKitSessionId(), matches(uuidPattern));
      expect(resolveVoiceCallKitSessionId(), matches(uuidPattern));
    });
    test('generates unique ids per call', () {
      expect(
        resolveVoiceCallKitSessionId(),
        isNot(resolveVoiceCallKitSessionId()),
      );
    });
  });

  group('resolveChannelIdFromCallKitExtra', () {
    test('reads channel id from extra map', () {
      expect(
        resolveChannelIdFromCallKitExtra(<String, dynamic>{
          kVoiceCallKitExtraChannelId: 'channel-1',
        }),
        'channel-1',
      );
    });
    test('returns null when extra missing', () {
      expect(resolveChannelIdFromCallKitExtra(null), isNull);
    });
  });

  group('shouldEnableLiveKitEngineForCallKitAudioSession', () {
    test('enables engine when CallKit audio session is active', () {
      expect(
        shouldEnableLiveKitEngineForCallKitAudioSession(
          isAudioSessionActive: true,
        ),
        isTrue,
      );
    });
    test('disables engine when CallKit audio session is inactive', () {
      expect(
        shouldEnableLiveKitEngineForCallKitAudioSession(
          isAudioSessionActive: false,
        ),
        isFalse,
      );
    });
  });

  group('shouldRestoreLiveKitAutomaticAudioSession', () {
    test('restores when CallKit owned audio and no sessions remain', () {
      expect(
        shouldRestoreLiveKitAutomaticAudioSession(
          callKitOwnsAudio: true,
          hasCallKitSessions: false,
        ),
        isTrue,
      );
    });
    test('keeps external ownership while CallKit sessions remain', () {
      expect(
        shouldRestoreLiveKitAutomaticAudioSession(
          callKitOwnsAudio: true,
          hasCallKitSessions: true,
        ),
        isFalse,
      );
    });
    test('does nothing when CallKit never owned audio', () {
      expect(
        shouldRestoreLiveKitAutomaticAudioSession(
          callKitOwnsAudio: false,
          hasCallKitSessions: false,
        ),
        isFalse,
      );
    });
  });

  group('hasActiveVoiceCallKitSession', () {
    test('true when an activeVoice session exists', () {
      expect(
        hasActiveVoiceCallKitSession(<VoiceCallKitSession>[
          const VoiceCallKitSession(
            callKitId: 'a',
            channelId: 'c1',
            kind: VoiceCallKitSessionKind.incomingRing,
          ),
          const VoiceCallKitSession(
            callKitId: 'b',
            channelId: 'c2',
            kind: VoiceCallKitSessionKind.activeVoice,
          ),
        ]),
        isTrue,
      );
    });
    test('false when only ring sessions exist', () {
      expect(
        hasActiveVoiceCallKitSession(<VoiceCallKitSession>[
          const VoiceCallKitSession(
            callKitId: 'a',
            channelId: 'c1',
            kind: VoiceCallKitSessionKind.incomingRing,
          ),
        ]),
        isFalse,
      );
    });
  });

  group('shouldScheduleCallKitAudioSessionRecovery', () {
    test('schedules recovery on deactivate while active voice remains', () {
      expect(
        shouldScheduleCallKitAudioSessionRecovery(
          isAudioSessionActive: false,
          hasActiveVoiceSession: true,
        ),
        isTrue,
      );
    });
    test('does not schedule when session activates', () {
      expect(
        shouldScheduleCallKitAudioSessionRecovery(
          isAudioSessionActive: true,
          hasActiveVoiceSession: true,
        ),
        isFalse,
      );
    });
    test('does not schedule when no active voice session', () {
      expect(
        shouldScheduleCallKitAudioSessionRecovery(
          isAudioSessionActive: false,
          hasActiveVoiceSession: false,
        ),
        isFalse,
      );
    });
  });

  group('shouldReapplySpeakerOutputOnCallKitAudioSessionActive', () {
    test('reapplies speaker when CallKit activates during voice', () {
      expect(
        shouldReapplySpeakerOutputOnCallKitAudioSessionActive(
          isAudioSessionActive: true,
          isInVoice: true,
        ),
        isTrue,
      );
    });
    test('skips when CallKit audio session is inactive', () {
      expect(
        shouldReapplySpeakerOutputOnCallKitAudioSessionActive(
          isAudioSessionActive: false,
          isInVoice: true,
        ),
        isFalse,
      );
    });
    test('skips when not in voice', () {
      expect(
        shouldReapplySpeakerOutputOnCallKitAudioSessionActive(
          isAudioSessionActive: true,
          isInVoice: false,
        ),
        isFalse,
      );
    });
  });

  group('shouldForceSpeakerOutputForCallKit', () {
    test('forces speaker when preferred and CallKit owns audio', () {
      expect(
        shouldForceSpeakerOutputForCallKit(
          preferSpeakerOutput: true,
          callKitOwnsAudioSession: true,
        ),
        isTrue,
      );
    });
    test('does not force when speaker is not preferred', () {
      expect(
        shouldForceSpeakerOutputForCallKit(
          preferSpeakerOutput: false,
          callKitOwnsAudioSession: true,
        ),
        isFalse,
      );
    });
    test('does not force when CallKit does not own audio', () {
      expect(
        shouldForceSpeakerOutputForCallKit(
          preferSpeakerOutput: true,
          callKitOwnsAudioSession: false,
        ),
        isFalse,
      );
    });
  });
}
