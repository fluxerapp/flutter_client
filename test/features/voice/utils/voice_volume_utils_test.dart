import 'package:fluxer_app/features/voice/utils/voice_volume_utils.dart';
import 'package:test/test.dart';

void main() {
  test('inputVoiceVolumePercentToGain maps unity gain to 1.0', () {
    expect(inputVoiceVolumePercentToGain(100), 1);
    expect(inputVoiceVolumePercentToGain(200), 2);
    expect(inputVoiceVolumePercentToGain(0), 0);
  });

  test('boostedVoiceVolumePercentToTrackVolume matches web curve', () {
    expect(boostedVoiceVolumePercentToTrackVolume(0), 0);
    expect(boostedVoiceVolumePercentToTrackVolume(100), closeTo(1, 0.0001));
    expect(boostedVoiceVolumePercentToTrackVolume(200), closeTo(2, 0.0001));
    expect(
      boostedVoiceVolumePercentToTrackVolume(50),
      lessThan(boostedVoiceVolumePercentToTrackVolume(100)),
    );
  });

  test('composeVoiceVolumePercent multiplies then clamps', () {
    expect(composeVoiceVolumePercent(<int>[100, 100]), 100);
    expect(composeVoiceVolumePercent(<int>[50, 50]), 25);
    expect(composeVoiceVolumePercent(<int>[150, 150]), 200);
    expect(composeVoiceVolumePercent(<int>[50, 100]), 50);
  });

  test('composedBoostedVoiceTrackVolume matches compose then boost', () {
    expect(
      composedBoostedVoiceTrackVolume(<int>[50, 50]),
      closeTo(boostedVoiceVolumePercentToTrackVolume(25), 0.0001),
    );
  });
}
