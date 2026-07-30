import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/providers/voice_connection_stats_provider.dart';

void main() {
  group('voiceLatencySignalTone', () {
    test('returns loading when latency is null', () {
      expect(
        voiceLatencySignalTone(latencyMs: null),
        VoiceLatencySignalTone.loading,
      );
    });

    test('maps latency ranges to tones', () {
      expect(
        voiceLatencySignalTone(latencyMs: 50),
        VoiceLatencySignalTone.green,
      );
      expect(
        voiceLatencySignalTone(latencyMs: 150),
        VoiceLatencySignalTone.yellow,
      );
      expect(
        voiceLatencySignalTone(latencyMs: 250),
        VoiceLatencySignalTone.orange,
      );
      expect(
        voiceLatencySignalTone(latencyMs: 500),
        VoiceLatencySignalTone.red,
      );
    });
  });

  group('VoiceConnectionStats', () {
    test('stores latency history snapshot', () {
      const VoiceConnectionStats stats = VoiceConnectionStats(
        currentLatencyMs: 90,
        latencyHistory: <int>[35, 90],
        participantCount: 2,
      );

      expect(stats.currentLatencyMs, 90);
      expect(stats.latencyHistory, <int>[35, 90]);
      expect(stats.participantCount, 2);
    });
  });
}
