import 'package:fluxer_app/features/voice/utils/callkit/callkit_policy.dart';
import 'package:fluxer_app/features/voice/utils/callkit/callkit_session_store.dart';
import 'package:test/test.dart';

const VoiceCallKitVoiceSnapshot _inDm = (
  isInVoice: true,
  isConnected: true,
  isConnecting: false,
  channelId: 'dm-1',
  activeConnectionId: 'conn-1',
);

const VoiceCallKitVoiceSnapshot _idle = (
  isInVoice: false,
  isConnected: false,
  isConnecting: false,
  channelId: null,
  activeConnectionId: null,
);

void main() {
  final DateTime now = DateTime(2026, 11, 20, 12);

  group('programmatic end echoes', () {
    test('an echo of our own end is ignored even for the live call', () {
      expect(
        shouldIgnoreCallKitUserEndEvent(
          isEndingProgrammatically: false,
          isProgrammaticEnd: true,
          suppressUntil: null,
          now: now,
          isLiveVoiceCall: true,
        ),
        isTrue,
      );
    });

    test('a real hangup of the live call is still handled', () {
      expect(
        shouldIgnoreCallKitUserEndEvent(
          isEndingProgrammatically: false,
          suppressUntil: now.add(const Duration(seconds: 2)),
          now: now,
          isLiveVoiceCall: true,
        ),
        isFalse,
      );
    });

    test('an id ended by the app stays recognised for the window', () {
      expect(
        isProgrammaticCallKitEndEvent(
          endedAt: now.subtract(const Duration(seconds: 4)),
          endAllUntil: null,
          isTrackedSession: false,
          now: now,
        ),
        isTrue,
      );
      expect(
        isProgrammaticCallKitEndEvent(
          endedAt: now.subtract(kVoiceCallKitProgrammaticEndWindow),
          endAllUntil: null,
          isTrackedSession: false,
          now: now,
        ),
        isFalse,
      );
    });

    test('end-all window only covers ids the app no longer tracks', () {
      final DateTime until = now.add(const Duration(seconds: 1));
      expect(
        isProgrammaticCallKitEndEvent(
          endedAt: null,
          endAllUntil: until,
          isTrackedSession: false,
          now: now,
        ),
        isTrue,
      );
      expect(
        isProgrammaticCallKitEndEvent(
          endedAt: null,
          endAllUntil: until,
          isTrackedSession: true,
          now: now,
        ),
        isFalse,
      );
    });
  });

  group('decline while already in the channel', () {
    test('declining a ring for the current channel keeps the call', () {
      expect(
        shouldLeaveVoiceFromCallKitEnd(
          voice: _inDm,
          channelId: 'dm-1',
          isDecline: true,
        ),
        isFalse,
      );
      expect(
        shouldDeclineRingFromCallKitEnd(voice: _inDm, channelId: 'dm-1'),
        isFalse,
      );
    });

    test('ending the active call leaves voice', () {
      expect(
        shouldLeaveVoiceFromCallKitEnd(
          voice: _inDm,
          channelId: 'dm-1',
          sessionKind: VoiceCallKitSessionKind.activeVoice,
        ),
        isTrue,
      );
    });

    test('declining a ring elsewhere still declines it', () {
      expect(
        shouldDeclineRingFromCallKitEnd(voice: _inDm, channelId: 'dm-2'),
        isTrue,
      );
      expect(
        shouldDeclineRingFromCallKitEnd(voice: _idle, channelId: 'dm-1'),
        isTrue,
      );
    });

    test('only hangups fall back to the sole active call', () {
      expect(
        shouldFallBackToSoleActiveVoiceForCallKitEnd(
          isDecline: true,
          hasIncomingRing: false,
        ),
        isFalse,
      );
      expect(
        shouldFallBackToSoleActiveVoiceForCallKitEnd(
          isDecline: false,
          hasIncomingRing: false,
        ),
        isTrue,
      );
    });
  });

  group('sweeps never end an answered or live call', () {
    const VoiceCallKitSession answeredDm = VoiceCallKitSession(
      callKitId: 'uuid-1',
      channelId: 'dm-1',
      kind: VoiceCallKitSessionKind.activeVoice,
      messageId: 'msg-1',
    );
    const VoiceCallKitSession ring = VoiceCallKitSession(
      callKitId: 'uuid-2',
      channelId: 'dm-2',
      kind: VoiceCallKitSessionKind.incomingRing,
      messageId: 'msg-2',
    );

    test('active calls wipe keeps the connected channel', () {
      expect(
        shouldEndCallKitSessionForActiveCallsChange(
          session: answeredDm,
          activeCallChannelIds: const <String>{},
          liveVoiceChannelId: 'dm-1',
        ),
        isFalse,
      );
    });

    test('active calls wipe keeps an accept in flight', () {
      expect(
        shouldEndCallKitSessionForActiveCallsChange(
          session: answeredDm,
          activeCallChannelIds: const <String>{},
          acceptInFlight: const <String>{'uuid-1'},
        ),
        isFalse,
      );
    });

    test('a call that really ended is still cleaned up', () {
      expect(
        shouldEndCallKitSessionForActiveCallsChange(
          session: answeredDm,
          activeCallChannelIds: const <String>{},
          liveVoiceChannelId: 'dm-9',
        ),
        isTrue,
      );
    });

    test('pending ring sweep skips an accept in flight', () {
      expect(
        shouldEndIncomingRingCallKitSession(
          session: ring,
          pendingIncomingChannelIds: const <String>{},
          acceptInFlight: const <String>{'dm-2'},
        ),
        isFalse,
      );
      expect(
        shouldEndIncomingRingCallKitSession(
          session: ring,
          pendingIncomingChannelIds: const <String>{},
        ),
        isTrue,
      );
    });

    test('settle window holds sweeps right after READY', () {
      expect(
        isWithinCallKitActiveCallsSettleWindow(
          gatewayReady: true,
          readyAt: now.subtract(const Duration(seconds: 1)),
          now: now,
        ),
        isTrue,
      );
      expect(
        isWithinCallKitActiveCallsSettleWindow(
          gatewayReady: true,
          readyAt: now.subtract(kVoiceCallKitActiveCallsSettleDelay),
          now: now,
        ),
        isFalse,
      );
      expect(
        isWithinCallKitActiveCallsSettleWindow(
          gatewayReady: false,
          readyAt: null,
          now: now,
        ),
        isTrue,
      );
    });
  });

  group('foreground service and system call upkeep', () {
    test('ending another accepted call re-asserts the live call', () {
      expect(
        shouldReassertAndroidForegroundCall(
          isAndroid: true,
          endedChannelId: 'dm-1',
          endedWasAccepted: true,
          liveVoiceChannelId: 'dm-2',
          hasLiveVoiceSession: true,
        ),
        isTrue,
      );
    });

    test('ending the live call or a ring does not re-assert', () {
      expect(
        shouldReassertAndroidForegroundCall(
          isAndroid: true,
          endedChannelId: 'dm-2',
          endedWasAccepted: true,
          liveVoiceChannelId: 'dm-2',
          hasLiveVoiceSession: true,
        ),
        isFalse,
      );
      expect(
        shouldReassertAndroidForegroundCall(
          isAndroid: true,
          endedChannelId: 'dm-1',
          endedWasAccepted: false,
          liveVoiceChannelId: 'dm-2',
          hasLiveVoiceSession: true,
        ),
        isFalse,
      );
      expect(
        shouldReassertAndroidForegroundCall(
          isAndroid: false,
          endedChannelId: 'dm-1',
          endedWasAccepted: true,
          liveVoiceChannelId: 'dm-2',
          hasLiveVoiceSession: true,
        ),
        isFalse,
      );
    });

    test('foreground starts a missing system call for a live session', () {
      expect(
        shouldStartMissingCallKitOnForeground(
          isMobileCallKitPlatform: true,
          voice: _inDm,
          hasSessionForChannel: false,
        ),
        isTrue,
      );
      expect(
        shouldStartMissingCallKitOnForeground(
          isMobileCallKitPlatform: true,
          voice: _inDm,
          hasSessionForChannel: true,
        ),
        isFalse,
      );
      expect(
        shouldStartMissingCallKitOnForeground(
          isMobileCallKitPlatform: true,
          voice: _idle,
          hasSessionForChannel: false,
        ),
        isFalse,
      );
    });

    test('native outgoing calls are recognised as active voice', () {
      expect(
        isNativeActiveVoiceCallKitCall(<String, dynamic>{
          kVoiceCallKitExtraActiveVoice: true,
        }),
        isTrue,
      );
      expect(isNativeActiveVoiceCallKitCall(null), isFalse);
    });
  });

  group('hold', () {
    test('hold mutes only when not already muted', () {
      expect(
        shouldMuteForCallKitHold(isOnHold: true, isSelfMuted: false),
        isTrue,
      );
      expect(
        shouldMuteForCallKitHold(isOnHold: true, isSelfMuted: true),
        isFalse,
      );
    });

    test('unhold restores only a mute the hold applied', () {
      expect(
        shouldUnmuteAfterCallKitHold(
          isOnHold: false,
          mutedForHold: true,
          isSelfMuted: true,
          hasOtherHeldCalls: false,
        ),
        isTrue,
      );
      expect(
        shouldUnmuteAfterCallKitHold(
          isOnHold: false,
          mutedForHold: false,
          isSelfMuted: true,
          hasOtherHeldCalls: false,
        ),
        isFalse,
      );
      expect(
        shouldUnmuteAfterCallKitHold(
          isOnHold: false,
          mutedForHold: true,
          isSelfMuted: true,
          hasOtherHeldCalls: true,
        ),
        isFalse,
      );
    });
  });

  test('session store lists ids and can forget a connected mark', () {
    final VoiceCallKitSessionStore store = VoiceCallKitSessionStore();
    final String id = store.registerSession(
      channelId: 'dm-1',
      kind: VoiceCallKitSessionKind.activeVoice,
    );
    store.markCallKitConnected(id);
    expect(store.callKitIds, <String>[id]);
    store.clearCallKitConnected(id);
    expect(store.isCallKitConnected(id), isFalse);
  });
}
