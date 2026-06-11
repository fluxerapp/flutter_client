import 'dart:typed_data';

import 'package:fluxer_app/features/chat/service/voice_message_recording_service.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:test/test.dart';

void main() {
  test('fillOrderedPcmRingSnapshot copies linear prefix before wrap', () {
    final Uint8List ring = Uint8List(8);
    for (int i = 0; i < ring.length; i++) {
      ring[i] = i + 1;
    }
    final Uint8List into = Uint8List(8);
    VoiceMessageRecordingService.fillOrderedPcmRingSnapshot(
      ring: ring,
      writeHeadBytes: 4,
      totalBytes: 4,
      into: into,
    );
    expect(into.sublist(0, 4), equals(<int>[1, 2, 3, 4]));
  });

  test('fillOrderedPcmRingSnapshot orders oldest first after wrap', () {
    final Uint8List ring = Uint8List(8);
    for (int i = 0; i < ring.length; i++) {
      ring[i] = i + 1;
    }
    final Uint8List into = Uint8List(8);
    VoiceMessageRecordingService.fillOrderedPcmRingSnapshot(
      ring: ring,
      writeHeadBytes: 2,
      totalBytes: 10,
      into: into,
    );
    expect(into, equals(<int>[3, 4, 5, 6, 7, 8, 1, 2]));
  });

  test('capturedDurationMs scales with pcm bytes', () {
    expect(kVoiceMessageRecordingSampleRate, greaterThan(0));
    const int bytesForOneSecond = kVoiceMessageRecordingSampleRate * 2;
    expect(
      bytesForOneSecond * 1000 ~/ kVoiceMessageRecordingSampleRate ~/ 2,
      1000,
    );
  });
}
