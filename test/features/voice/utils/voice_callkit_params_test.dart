import 'package:flutter/widgets.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_call_ring.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_params.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('incoming ring params include headers', () {
    final CallKitParams params = buildIncomingCallRingParams(
      callKitId: 'call',
      display: const CallRingDisplay(
        nameCaller: 'Ada',
        handle: 'Ada',
        durationMs: 45000,
        avatar: 'https://example.com/a.png',
      ),
    );
    expect(params.headers, isEmpty);
  });

  test('voice session params include headers', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    final CallKitParams params = container.read(
      Provider<CallKitParams>((Ref ref) {
        return buildVoiceCallKitParams(
          ref: ref,
          callKitId: 'call',
          channelId: 'channel',
          l10n: lookupFluxerLocalizations(const Locale('en')),
        );
      }),
    );
    expect(params.headers, isEmpty);
  });

  test('native voip calls keep channel id and accepted state', () {
    final List<CallKitParams> calls = callKitParamsFromNativeVoipCalls(
      <Object?>[
        <Object?, Object?>{
          'id': 'call-1',
          'nameCaller': 'Ada',
          'handle': 'Ada',
          'isAccepted': true,
          'extra': <Object?, Object?>{
            'channelId': 'channel',
            'messageId': 'message',
          },
        },
        <Object?, Object?>{'nameCaller': 'missing id'},
        'not-a-call',
      ],
    );

    expect(calls, hasLength(1));
    expect(calls.single.id, 'call-1');
    expect(calls.single.isAccepted, isTrue);
    expect(calls.single.extra?['channelId'], 'channel');
    expect(calls.single.extra?['messageId'], 'message');
    expect(callKitParamsFromNativeVoipCalls(null), isEmpty);
  });

  test('native voip calls drop an empty id and a bad extra map', () {
    final List<CallKitParams> calls = callKitParamsFromNativeVoipCalls(
      <Object?>[
        <Object?, Object?>{
          'id': '',
          'extra': <Object?, Object?>{'channelId': 'channel'},
        },
        <Object?, Object?>{
          'id': 'ring',
          'isAccepted': false,
          'extra': 'channel',
        },
      ],
    );

    expect(calls, hasLength(1));
    expect(calls.single.id, 'ring');
    expect(calls.single.isAccepted, isFalse);
    expect(calls.single.extra, isNull);
  });
}
