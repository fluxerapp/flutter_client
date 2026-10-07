import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:fluxer_app/features/voice/utils/voice_call_ring.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_params.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_session_store.dart';
import 'package:test/test.dart';

void main() {
  const String messageId = 'm';
  const String channelId = 'channel';
  final String callKitId = callKitIdForMessageId(messageId);

  test('an unanswered native ring is adopted until the gateway drops it', () {
    final List<CallKitParams> reported = callKitParamsFromNativeVoipCalls(
      <Object?>[
        <Object?, Object?>{
          'id': callKitId,
          'nameCaller': 'Ada',
          'handle': 'Ada',
          'isAccepted': false,
          'extra': <Object?, Object?>{
            'channelId': channelId,
            'messageId': messageId,
          },
        },
      ],
    );
    expect(reported, hasLength(1));

    final CallKitParams params = reported.single;
    final String? resolved = resolveChannelIdFromCallKitExtra(params.extra);
    expect(resolved, channelId);
    expect(params.isAccepted, isFalse);

    final VoiceCallKitSessionStore store = VoiceCallKitSessionStore()
      ..registerSession(
        channelId: resolved!,
        callKitId: params.id,
        messageId: params.extra?['messageId'] as String?,
        kind: VoiceCallKitSessionKind.incomingRing,
      )
      ..markIncomingPresented(channelId);

    expect(store.hasIncomingRing, isTrue);
    expect(store.wasIncomingPresented(channelId), isTrue);
    expect(
      store.incomingRingChannelIdsAbsentFrom(<String>{channelId}),
      isEmpty,
    );

    final VoiceCallKitSession? session = store.sessionForCallKitId(callKitId);
    expect(
      shouldEndIncomingRingCallKitSession(
        session: session!,
        pendingIncomingChannelIds: <String>{channelId},
      ),
      isFalse,
    );
    expect(
      shouldEndIncomingRingCallKitSession(
        session: session,
        pendingIncomingChannelIds: const <String>{},
      ),
      isTrue,
    );
    expect(store.incomingRingChannelIdsAbsentFrom(<String>{}), <String>[
      channelId,
    ]);
  });

  test('an accepted native ring keeps the channel for the join', () {
    final List<CallKitParams> reported = callKitParamsFromNativeVoipCalls(
      <Object?>[
        <Object?, Object?>{
          'id': callKitId,
          'isAccepted': true,
          'extra': <Object?, Object?>{
            'channelId': channelId,
            'messageId': messageId,
          },
        },
      ],
    );

    final CallKitParams params = reported.single;
    expect(params.isAccepted, isTrue);
    expect(resolveChannelIdFromCallKitExtra(params.extra), channelId);
    expect(params.id, '1bd2b375-788b-5871-9fbb-3b369b2519d1');
  });

  test('a native ring without a channel cannot be adopted', () {
    final List<CallKitParams> reported = callKitParamsFromNativeVoipCalls(
      <Object?>[
        <Object?, Object?>{'id': callKitId, 'isAccepted': true},
      ],
    );
    expect(resolveChannelIdFromCallKitExtra(reported.single.extra), isNull);
  });

  test('a closed ring window is not still ringing', () {
    expect(
      callRingWindowHasClosed(
        expiresAtMs: 1000 - kCallRingExpiryDeliveryGraceMs,
        nowMs: 1000,
      ),
      isTrue,
    );
    expect(
      isCallRingPayload(const <String, String>{'type': 'call_ring'}),
      isTrue,
    );
    expect(
      isCallRingPayload(const <String, String>{'type': 'message'}),
      isFalse,
    );
  });
}
