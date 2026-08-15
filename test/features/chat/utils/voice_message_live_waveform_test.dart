import 'dart:math' as math;
import 'dart:typed_data';

import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_live_waveform.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:material_ui/material_ui.dart';
import 'package:test/test.dart';

void main() {
  test('computeLiveWaveformBarsFromPcmWindow reacts to sine input', () {
    final Uint8List pcm = Uint8List(kVoiceMessageLivePcmWindowSamples * 2);
    final ByteData view = ByteData.sublistView(pcm);
    for (int i = 0; i < kVoiceMessageLivePcmWindowSamples; i++) {
      final double sample = math.sin(i / 4) * 0.8;
      final int intSample = (sample * 32767).round();
      view.setInt16(i * 2, intSample, Endian.little);
    }
    final List<double> silent = computeLiveWaveformBarsFromPcmWindow(
      pcmLe16: pcm,
      previous: List<double>.filled(kVoiceMessageWaveformBarCount, 0),
    );
    expect(silent.any((double v) => v > 0.15), isTrue);
    final List<double> louder = computeLiveWaveformBarsFromPcmWindow(
      pcmLe16: pcm,
      previous: silent,
    );
    expect(louder.any((double v) => v > silent.first), isTrue);
  });

  test('computeLiveRmsAmplitudeFromPcmWindow increases with signal', () {
    final Uint8List quiet = Uint8List(64);
    final Uint8List loud = Uint8List(64);
    final ByteData loudView = ByteData.sublistView(loud);
    for (int i = 0; i < 32; i++) {
      loudView.setInt16(i * 2, 20000, Endian.little);
    }
    expect(
      computeLiveRmsAmplitudeFromPcmWindow(loud),
      greaterThan(computeLiveRmsAmplitudeFromPcmWindow(quiet)),
    );
  });

  test('computeLiveWaveformBarsFromAmplitudeHistory uses recent samples', () {
    final List<double> history = List<double>.generate(30, (int i) => i / 30);
    final List<double> bars = computeLiveWaveformBarsFromAmplitudeHistory(
      previous: List<double>.filled(kVoiceMessageWaveformBarCount, 0),
      amplitudes: history,
    );
    expect(bars.last, greaterThan(bars.first));
  });

  test('lock threshold requires vertical drag not hold in place', () {
    const Offset start = Offset(100, 200);
    expect(
      voiceMessageLockGesturePassesThreshold(
        pointerStart: start,
        globalPosition: start,
      ),
      isFalse,
    );
    expect(
      voiceMessageLockGesturePassesThreshold(
        pointerStart: start,
        globalPosition: Offset(
          start.dx,
          start.dy - kVoiceMessageLockDragMinVerticalDeltaPx,
        ),
      ),
      isTrue,
    );
  });
}
