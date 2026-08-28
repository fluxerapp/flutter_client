import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_join_timing.dart';

void main() {
  test('markOnce logs a step only the first time', () {
    final VoiceJoinTiming timing = VoiceJoinTiming(channelId: 'ch1');
    timing.markOnce('first_remote_audio');
    timing.markOnce('first_remote_audio');
    expect(timing.elapsedMs, greaterThanOrEqualTo(0));
  });
}
