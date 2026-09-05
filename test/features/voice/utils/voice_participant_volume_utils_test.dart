import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_volume_utils.dart';
import 'package:fluxer_app/features/voice/utils/voice_volume_utils.dart';
import 'package:test/test.dart';

void main() {
  group('resolveParticipantTrackVolume', () {
    test('unity input stays at 1.0', () {
      expect(
        resolveParticipantTrackVolume(
          participantVolumePercent: 100,
          outputVolumePercent: 100,
        ),
        closeTo(1, 0.0001),
      );
    });

    test('composes percents then boosts', () {
      expect(
        resolveParticipantTrackVolume(
          participantVolumePercent: 50,
          outputVolumePercent: 50,
        ),
        closeTo(boostedVoiceVolumePercentToTrackVolume(25), 0.0001),
      );
    });

    test('clamps composed boost at 200 percent', () {
      expect(
        resolveParticipantTrackVolume(
          participantVolumePercent: 150,
          outputVolumePercent: 150,
        ),
        closeTo(boostedVoiceVolumePercentToTrackVolume(200), 0.0001),
      );
    });

    test('applies output volume when participant volume is default', () {
      expect(
        resolveParticipantTrackVolume(
          participantVolumePercent: kDefaultVoiceVolumePercent,
          outputVolumePercent: 50,
        ),
        closeTo(boostedVoiceVolumePercentToTrackVolume(50), 0.0001),
      );
    });
  });

  test('defaultParticipantVolumeForUser uses 100 when unset', () {
    expect(
      defaultParticipantVolumeForUser(
        participantVolumes: const <String, int>{},
        userId: '42',
      ),
      kDefaultVoiceVolumePercent,
    );
    expect(
      defaultParticipantVolumeForUser(
        participantVolumes: const <String, int>{'42': 80},
        userId: '42',
      ),
      80,
    );
  });
}
