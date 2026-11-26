import 'dart:io';
import 'dart:isolate';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:fluxer_app/features/chat/services/voice_message_recording_service.dart';
import 'package:fluxer_app/features/chat/utils/attachments/voice_message_constants.dart';
import 'package:fluxer_app/features/chat/utils/attachments/voice_message_wav_encoder.dart';
import 'package:fluxer_app/features/chat/utils/attachments/voice_message_waveform.dart';
import 'package:test/test.dart';

Uint8List createPcmBytes(int sampleCount) {
  final ByteData data = ByteData(sampleCount * 2);
  for (int i = 0; i < sampleCount; i++) {
    final int value = (math.sin(i / 50) * 20000).round();
    data.setInt16(i * 2, value, Endian.little);
  }
  return data.buffer.asUint8List();
}

void main() {
  late Directory tempDir;

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync('voice_processing_test');
  });

  tearDown(() {
    tempDir.deleteSync(recursive: true);
  });

  test('pcmBytesToSlice converts little-endian int16 samples', () {
    final ByteData data = ByteData(6)
      ..setInt16(0, 0, Endian.little)
      ..setInt16(2, 0x7fff, Endian.little)
      ..setInt16(4, -0x8000, Endian.little);
    final VoiceMessagePcmSlice? slice =
        VoiceMessageRecordingService.pcmBytesToSlice(data.buffer.asUint8List());
    expect(slice, isNotNull);
    expect(slice!.samples, equals(<double>[0, 1, -1]));
    expect(slice.sampleRate, kVoiceMessageRecordingSampleRate);
    expect(slice.durationSeconds, 3 / kVoiceMessageRecordingSampleRate);
    expect(VoiceMessageRecordingService.pcmBytesToSlice(Uint8List(1)), isNull);
  });

  test(
    'processRecordingFile in an isolate matches the sync pipeline',
    () async {
      final Uint8List pcmBytes = createPcmBytes(
        kVoiceMessageRecordingSampleRate,
      );
      final String sourcePath = '${tempDir.path}/capture.pcm';
      final String outputPath = '${tempDir.path}/voice.wav';
      File(sourcePath).writeAsBytesSync(pcmBytes);
      final VoiceWaveformResult? result = await Isolate.run(
        () => VoiceMessageRecordingService.processRecordingFile(
          sourcePath: sourcePath,
          outputPath: outputPath,
          isPcmStream: true,
        ),
      );
      final VoiceMessagePcmSlice expectedPcm =
          VoiceMessageRecordingService.pcmBytesToSlice(pcmBytes)!;
      final VoiceWaveformResult expected = computeVoiceWaveformFromPcm(
        expectedPcm,
      );
      expect(result, isNotNull);
      expect(result!.duration, expected.duration);
      expect(result.waveform, expected.waveform);
      expect(
        File(outputPath).readAsBytesSync(),
        equals(
          encodePcmSliceToWav(
            samples: expectedPcm.samples,
            sampleRate: expectedPcm.sampleRate,
          ),
        ),
      );
    },
  );

  test('processRecordingFile decodes wav captures without rewriting', () {
    final Uint8List pcmBytes = createPcmBytes(22050);
    final VoiceMessagePcmSlice pcm =
        VoiceMessageRecordingService.pcmBytesToSlice(pcmBytes)!;
    final String wavPath = '${tempDir.path}/voice.wav';
    File(wavPath).writeAsBytesSync(
      encodePcmSliceToWav(samples: pcm.samples, sampleRate: pcm.sampleRate),
    );
    final String unusedOutput = '${tempDir.path}/unused.wav';
    final VoiceWaveformResult? result =
        VoiceMessageRecordingService.processRecordingFile(
          sourcePath: wavPath,
          outputPath: unusedOutput,
          isPcmStream: false,
        );
    final VoiceWaveformResult expected = computeVoiceWaveformFromPcm(
      decodeWavMonoPcm(File(wavPath).readAsBytesSync())!,
    );
    expect(result, isNotNull);
    expect(result!.waveform, expected.waveform);
    expect(result.duration, expected.duration);
    expect(File(unusedOutput).existsSync(), isFalse);
  });

  test('processRecordingFile returns null for invalid wav data', () {
    final String wavPath = '${tempDir.path}/broken.wav';
    File(wavPath).writeAsBytesSync(Uint8List(64));
    expect(
      VoiceMessageRecordingService.processRecordingFile(
        sourcePath: wavPath,
        outputPath: '${tempDir.path}/out.wav',
        isPcmStream: false,
      ),
      isNull,
    );
  });
}
