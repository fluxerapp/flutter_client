import 'package:flutter/widgets.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';
import 'package:test/test.dart';

void main() {
  group('shouldPresentIncomingVoiceSheet', () {
    test('desktop always presents sheet', () {
      expect(
        shouldPresentIncomingVoiceSheet(
          isMobileCallKitPlatform: false,
          isForeground: false,
        ),
        isTrue,
      );
    });
    test('mobile foreground presents sheet', () {
      expect(
        shouldPresentIncomingVoiceSheet(
          isMobileCallKitPlatform: true,
          isForeground: true,
        ),
        isTrue,
      );
    });
    test('mobile background skips sheet', () {
      expect(
        shouldPresentIncomingVoiceSheet(
          isMobileCallKitPlatform: true,
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
          isMobileCallKitPlatform: false,
          isForeground: false,
          hasPendingIncoming: true,
        ),
        isTrue,
      );
    });
    test('mobile background suppresses ring', () {
      expect(
        shouldPlayIncomingVoiceRingSfx(
          isMobileCallKitPlatform: true,
          isForeground: false,
          hasPendingIncoming: true,
        ),
        isFalse,
      );
    });
    test('mobile foreground plays ring', () {
      expect(
        shouldPlayIncomingVoiceRingSfx(
          isMobileCallKitPlatform: true,
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
    test('ios in voice keeps CallKit session', () {
      expect(
        shouldDismissCallKitOnForeground(isIos: true, isInVoice: true),
        isFalse,
      );
    });
    test('ios not in voice dismisses CallKit', () {
      expect(
        shouldDismissCallKitOnForeground(isIos: true, isInVoice: false),
        isTrue,
      );
    });
    test('android in voice still dismisses on foreground', () {
      expect(
        shouldDismissCallKitOnForeground(isIos: false, isInVoice: true),
        isTrue,
      );
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
}
