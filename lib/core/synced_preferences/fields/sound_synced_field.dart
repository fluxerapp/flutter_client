import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';

typedef SoundLocalState = SoundPreferencesState;

class SoundSyncedField
    extends ProtoSyncedFieldAdapter<SoundLocalState, pickers.SoundSettings> {
  SoundSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.sound;

  @override
  SoundLocalState readLocal() {
    return _ref.read(soundPreferencesProvider);
  }

  @override
  Future<void> applyRemote(SoundLocalState value) async {
    await _ref.read(soundPreferencesProvider.notifier).applySynced(value);
  }

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasSound();

  @override
  pickers.SoundSettings readSubMessage(pb.SyncedPreferences message) {
    return message.sound;
  }

  @override
  SoundLocalState fromProto(pickers.SoundSettings proto) {
    return SoundLocalState(
      allSoundsDisabled: proto.allSoundsDisabled,
      disabledSounds: Map<String, bool>.from(proto.disabledSounds),
      masterVolume: proto.hasMasterVolume() ? proto.masterVolume : 100,
      soundOverrides: Map<String, double>.from(proto.soundOverrides),
    );
  }

  @override
  void writeProto(pickers.SoundSettings proto, SoundLocalState local) {
    proto
      ..allSoundsDisabled = local.allSoundsDisabled
      ..masterVolume = local.masterVolume;
    proto.disabledSounds
      ..clear()
      ..addEntries(local.disabledSounds.entries);
    proto.soundOverrides
      ..clear()
      ..addEntries(local.soundOverrides.entries);
  }

  @override
  pickers.SoundSettings createEmptyProto() => pickers.SoundSettings();

  @override
  pb.SyncedPreferences wrapProto(pickers.SoundSettings proto) {
    return pb.SyncedPreferences(sound: proto);
  }

  @override
  bool statesEqual(SoundLocalState a, SoundLocalState b) {
    return a.allSoundsDisabled == b.allSoundsDisabled &&
        a.masterVolume == b.masterVolume &&
        mapEquals(a.disabledSounds, b.disabledSounds) &&
        mapEquals(a.soundOverrides, b.soundOverrides);
  }

  static pickers.SoundSettings toProtoForPush({
    required SoundLocalState local,
    pickers.SoundSettings? wireBase,
  }) {
    final settings = mergeOrCreate(wireBase, pickers.SoundSettings.new);
    settings
      ..allSoundsDisabled = local.allSoundsDisabled
      ..masterVolume = local.masterVolume;
    settings.disabledSounds
      ..clear()
      ..addEntries(local.disabledSounds.entries);
    settings.soundOverrides
      ..clear()
      ..addEntries(local.soundOverrides.entries);
    return settings;
  }
}
