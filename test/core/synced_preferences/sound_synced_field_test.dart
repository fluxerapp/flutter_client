import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/sound_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers;
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';

SoundSyncedField _field() {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  return container.read(Provider<SoundSyncedField>(SoundSyncedField.new));
}

void main() {
  group('SoundSyncedField', () {
    test('toProtoMessageForPush preserves sound_overrides from wire', () {
      const local = SoundPreferencesState(
        masterVolume: 80,
        disabledSounds: {'message': true},
        soundOverrides: <String, double>{'direct-message': 50},
      );
      final wireBase = pickers.SoundSettings()..soundOverrides['message'] = 0.5;
      final pushed =
          _field().toProtoMessageForPush(local, wireSubMessage: wireBase)
              as pickers.SoundSettings;
      expect(pushed.allSoundsDisabled, isFalse);
      expect(pushed.masterVolume, 80);
      expect(pushed.disabledSounds['message'], isTrue);
      expect(pushed.soundOverrides['direct-message'], closeTo(50, 0.001));
      expect(pushed.soundOverrides['message'], isNull);
    });

    test('readFromProto roundtrips sound overrides', () {
      const local = SoundPreferencesState(
        masterVolume: 120,
        soundOverrides: <String, double>{'message': 75, 'mute': 25},
      );
      final SoundSyncedField field = _field();
      final proto = field.toProtoMessageForPush(local);
      final settings = pickers.SoundSettings()..mergeFromMessage(proto);
      final restored =
          field.toProtoMessageForPush(
                SoundPreferencesState(
                  masterVolume: settings.masterVolume,
                  allSoundsDisabled: settings.allSoundsDisabled,
                  disabledSounds: Map<String, bool>.from(
                    settings.disabledSounds,
                  ),
                  soundOverrides: Map<String, double>.from(
                    settings.soundOverrides,
                  ),
                ),
              )
              as pickers.SoundSettings;
      expect(restored.masterVolume, 120);
      expect(restored.soundOverrides['message'], closeTo(75, 0.001));
      expect(restored.soundOverrides['mute'], closeTo(25, 0.001));
    });
  });
}
