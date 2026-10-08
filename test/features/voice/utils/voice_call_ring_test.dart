import 'package:fluxer_app/features/voice/utils/voice_call_ring.dart';
import 'package:test/test.dart';

void main() {
  const int nowMs = 1_000_000;

  test('uses the caller name as sent', () {
    final CallRingDisplay display = resolveCallRingDisplay(
      payload: const <String, String>{
        'type': 'call_ring',
        'caller_name': 'Ada',
        'caller_avatar_url': 'https://cdn.example/a.png',
        'expires_at_ms': '1045000',
      },
      nowMs: nowMs,
      knownChannelName: 'Other',
    );
    expect(display.nameCaller, 'Ada');
    expect(display.avatar, 'https://cdn.example/a.png');
    expect(display.durationMs, 45000);
  });

  test('keeps a name when the avatar was dropped', () {
    final CallRingDisplay display = resolveCallRingDisplay(
      payload: const <String, String>{
        'caller_name': 'Ada',
        'expires_at_ms': '1000500',
      },
      nowMs: nowMs,
    );
    expect(display.nameCaller, 'Ada');
    expect(display.avatar, isNull);
    expect(display.durationMs, kCallRingMinimumDurationMs);
  });

  test('uses a generic label when caller fields are missing', () {
    final CallRingDisplay display = resolveCallRingDisplay(
      payload: const <String, String>{
        'type': 'call_ring',
        'expires_at_ms': '1045000',
      },
      nowMs: nowMs,
    );
    expect(display.nameCaller, kCallRingFallbackHandle);
    expect(display.handle, kCallRingFallbackHandle);
  });

  test('falls back to a known channel name without caller fields', () {
    final CallRingDisplay display = resolveCallRingDisplay(
      payload: const <String, String>{'caller_id': '9'},
      nowMs: nowMs,
      knownChannelName: 'General',
    );
    expect(display.nameCaller, 'General');
    expect(display.nameCaller, isNot('9'));
  });

  test('call kit id matches the native ring uuid', () {
    expect(callKitIdForMessageId('m'), '1bd2b375-788b-5871-9fbb-3b369b2519d1');
    expect(
      callKitIdForMessageId('message-1'),
      '8146be86-bada-5038-87d5-7b21e7c93021',
    );
    expect(callKitIdForMessageId('m'), callKitIdForMessageId('m'));
    expect(callKitIdForMessageId('m'), isNot(callKitIdForMessageId('m-2')));
  });

  test('a message notification collapses onto the ring', () {
    expect(
      payloadCollidesWithCallRing(
        payload: const <String, String>{'message_id': 'm-1'},
        activeCallMessageIds: const <String>['m-1'],
      ),
      isTrue,
    );
    expect(
      payloadCollidesWithCallRing(
        payload: const <String, String>{
          'type': 'call_ring',
          'message_id': 'm-1',
        },
        activeCallMessageIds: const <String>['m-1'],
      ),
      isFalse,
    );
  });

  test('a closed ring window is detected', () {
    expect(
      callRingWindowHasClosed(
        expiresAtMs: nowMs - kCallRingExpiryDeliveryGraceMs,
        nowMs: nowMs,
      ),
      isTrue,
    );
    expect(
      callRingWindowHasClosed(expiresAtMs: nowMs + 1, nowMs: nowMs),
      isFalse,
    );
  });

  test('uses the default ring length when expiry is missing', () {
    expect(
      callRingDurationMs(expiresAtMs: null, nowMs: nowMs),
      kCallRingDefaultDurationMs,
    );
  });
}
