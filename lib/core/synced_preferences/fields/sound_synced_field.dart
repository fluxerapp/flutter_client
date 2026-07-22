import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:protobuf/protobuf.dart' as $pb;

typedef SoundLocalState = SoundPreferencesState;

class SoundSyncedField extends SyncedFieldAdapter<SoundLocalState> {
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
  SoundLocalState? readFromProto(pb.SyncedPreferences message) {
    if (!message.hasSound()) {
      return null;
    }
    final pickers.SoundSettings sound = message.sound;
    return SoundLocalState(
      allSoundsDisabled: sound.allSoundsDisabled,
      disabledSounds: Map<String, bool>.from(sound.disabledSounds),
      masterVolume: sound.hasMasterVolume() ? sound.masterVolume : 100,
      soundOverrides: Map<String, double>.from(sound.soundOverrides),
    );
  }

  @override
  $pb.GeneratedMessage toProtoMessage(SoundLocalState local) {
    return pickers.SoundSettings(
      allSoundsDisabled: local.allSoundsDisabled,
      masterVolume: local.masterVolume,
      disabledSounds: local.disabledSounds.entries,
      soundOverrides: local.soundOverrides.entries,
    );
  }

  @override
  $pb.GeneratedMessage? readWireSubMessage(pb.SyncedPreferences wire) {
    return wire.hasSound() ? wire.sound : null;
  }

  @override
  $pb.GeneratedMessage toProtoMessageForPush(
    SoundLocalState local, {
    $pb.GeneratedMessage? wireSubMessage,
  }) {
    return toProtoForPush(
      local: local,
      wireBase: wireSubMessage as pickers.SoundSettings?,
    );
  }

  @override
  bool statesEqual(SoundLocalState a, SoundLocalState b) {
    return a.allSoundsDisabled == b.allSoundsDisabled &&
        a.masterVolume == b.masterVolume &&
        _mapsEqual(a.disabledSounds, b.disabledSounds) &&
        _doubleMapsEqual(a.soundOverrides, b.soundOverrides);
  }

  @override
  SoundLocalState mergeForMigration({
    required SoundLocalState local,
    required SoundLocalState remote,
  }) {
    return remote;
  }

  @override
  bool verifyRoundtrip(SoundLocalState candidate) {
    final proto = toProtoMessage(candidate) as pickers.SoundSettings;
    final roundtripped = readFromProto(pb.SyncedPreferences(sound: proto));
    return roundtripped != null && statesEqual(candidate, roundtripped);
  }

  bool _mapsEqual(Map<String, bool> a, Map<String, bool> b) {
    if (a.length != b.length) {
      return false;
    }
    for (final MapEntry<String, bool> entry in a.entries) {
      if (b[entry.key] != entry.value) {
        return false;
      }
    }
    return true;
  }

  bool _doubleMapsEqual(Map<String, double> a, Map<String, double> b) {
    if (a.length != b.length) {
      return false;
    }
    for (final MapEntry<String, double> entry in a.entries) {
      if (b[entry.key] != entry.value) {
        return false;
      }
    }
    return true;
  }

  static pickers.SoundSettings toProtoForPush({
    required SoundLocalState local,
    pickers.SoundSettings? wireBase,
  }) {
    final pickers.SoundSettings settings =
        (wireBase != null
              ? (pickers.SoundSettings()..mergeFromMessage(wireBase))
              : pickers.SoundSettings())
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
