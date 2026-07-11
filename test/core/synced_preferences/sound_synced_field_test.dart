import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/sound_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers;
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';

void main() {
  group('SoundSyncedField', () {
    test('toProtoForPush preserves sound_overrides from wire', () {
      const local = SoundPreferencesState(
        masterVolume: 80,
        disabledSounds: {'message': true},
      );
      final wireBase = pickers.SoundSettings()..soundOverrides['message'] = 0.5;
      final pushed = SoundSyncedField.toProtoForPush(
        local: local,
        wireBase: wireBase,
      );
      expect(pushed.allSoundsDisabled, isFalse);
      expect(pushed.masterVolume, 80);
      expect(pushed.disabledSounds['message'], isTrue);
      expect(pushed.soundOverrides['message'], closeTo(0.5, 0.001));
    });
  });
}
