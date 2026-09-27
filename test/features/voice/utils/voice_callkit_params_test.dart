import 'package:flutter/widgets.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/utils/voice_call_ring.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_params.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:test/test.dart';

void main() {
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
}
