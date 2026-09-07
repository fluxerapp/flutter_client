import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_live_gradient.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:test/test.dart';

void main() {
  test('glow height stays at idle when quiet', () {
    expect(
      voiceMessageGradientGlowHeight(
        level: kVoiceMessageGradientIdleLevel,
        maxHeight: 40,
      ),
      6,
    );
  });

  test('glow height fills the bar when loud', () {
    expect(voiceMessageGradientGlowHeight(level: 1, maxHeight: 40), 40);
  });

  test('glow height clamps level outside 0-1', () {
    expect(voiceMessageGradientGlowHeight(level: -1, maxHeight: 40), 0);
    expect(voiceMessageGradientGlowHeight(level: 4, maxHeight: 40), 40);
  });

  test('wave has more than two peaks across the bar', () {
    double sample(double x) {
      return voiceMessageGradientWaveUnit(
        x: x,
        width: 200,
        time: 0,
        frequency: 2.6,
        phase: 0.2,
      );
    }

    int peaks = 0;
    double previous = sample(0);
    double previousDelta = 0;
    for (int x = 1; x <= 200; x++) {
      final double value = sample(x.toDouble());
      final double delta = value - previous;
      if (previousDelta > 0 && delta <= 0 && previous > 0.55) {
        peaks += 1;
      }
      previousDelta = delta;
      previous = value;
    }
    expect(peaks, greaterThan(2));
  });

  test('wave unit can reach near the top of the bar', () {
    double peak = 0;
    for (int x = 0; x <= 200; x++) {
      final double value = voiceMessageGradientWaveUnit(
        x: x.toDouble(),
        width: 200,
        time: 0.4,
        frequency: 2.8,
        phase: 0.2,
      );
      if (value > peak) {
        peak = value;
      }
    }
    expect(peak, greaterThan(0.85));
  });

  test('voice level holds at idle when silent', () {
    expect(voiceMessageGradientVoiceLevel(0), kVoiceMessageGradientIdleLevel);
    expect(
      voiceMessageGradientVoiceLevel(0.01),
      kVoiceMessageGradientIdleLevel,
    );
    expect(voiceMessageGradientVoiceLevel(1), 1);
    expect(
      voiceMessageGradientVoiceLevel(0.25),
      greaterThan(kVoiceMessageGradientIdleLevel),
    );
  });
}
