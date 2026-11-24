import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/audio/external_audio_processor.dart';

void main() {
  test('detects known processors by device label', () {
    expect(
      detectExternalAudioProcessor('Microphone (NVIDIA Broadcast)'),
      'NVIDIA Broadcast',
    );
    expect(detectExternalAudioProcessor('krisp microphone'), 'Krisp');
    expect(
      detectExternalAudioProcessor('VoiceMeeter Output (VB-Audio)'),
      'VoiceMeeter',
    );
    expect(detectExternalAudioProcessor('Sonar - Mic'), 'SteelSeries Sonar');
  });

  test('ignores ordinary devices', () {
    expect(detectExternalAudioProcessor('MacBook Pro Microphone'), isNull);
    expect(detectExternalAudioProcessor(''), isNull);
  });
}
