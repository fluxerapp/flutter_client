import 'dart:typed_data';

import 'package:fluxer_app/features/chat/utils/attachments/voice_message_wav_encoder.dart';
import 'package:test/test.dart';

void main() {
  test('encodePcmSliceToWav writes a 16-bit mono header and samples', () {
    final Uint8List wav = encodePcmSliceToWav(
      samples: Float32List.fromList(<double>[0, 1, -1, 0.5, 2]),
      sampleRate: 8000,
    );
    expect(
      wav,
      equals(<int>[
        0x52, 0x49, 0x46, 0x46, 46, 0, 0, 0, //
        0x57, 0x41, 0x56, 0x45, 0x66, 0x6d, 0x74, 0x20, //
        16, 0, 0, 0, 1, 0, 1, 0, //
        0x40, 0x1f, 0, 0, 0x80, 0x3e, 0, 0, //
        2, 0, 16, 0, 0x64, 0x61, 0x74, 0x61, //
        10, 0, 0, 0, //
        0, 0, 0xff, 0x7f, 0x00, 0x80, 0x00, 0x40, 0xff, 0x7f,
      ]),
    );
  });

  test('decodeWavMonoPcm round-trips encoded samples', () {
    final Uint8List wav = encodePcmSliceToWav(
      samples: Float32List.fromList(<double>[0, 1, -1, 0.5]),
      sampleRate: 8000,
    );
    final VoiceMessagePcmSlice? pcm = decodeWavMonoPcm(wav);
    expect(pcm, isNotNull);
    expect(pcm!.sampleRate, 8000);
    expect(pcm.durationSeconds, 4 / 8000);
    expect(pcm.samples[0], 0);
    expect(pcm.samples[1], 1);
    expect(pcm.samples[2], -1);
    expect(pcm.samples[3], closeTo(0.5, 1 / 0x7fff));
  });

  test('decodeWavMonoPcm rejects non-wav bytes', () {
    expect(decodeWavMonoPcm(Uint8List(64)), isNull);
  });
}
