import 'dart:convert';
import 'dart:typed_data';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entrance_sound_library_provider.g.dart';

const int kEntranceSoundMaxPerUser = 8;
const int kEntranceSoundMaxBytes = 1024 * 1024;
const int kEntranceSoundMaxDurationMs = 5200;
const int kEntranceSoundNameMaxLength = 32;
const List<String> kEntranceSoundExtensions = <String>[
  'mp3',
  'ogg',
  'm4a',
  'wav',
];
const String kEntranceSoundGlobalScope = 'global';
const String kEntranceSoundGuildsScope = 'guilds';
const String kEntranceSoundDmsScope = 'dms';

String entranceSoundGuildScope(String guildId) => 'guild:$guildId';

class EntranceSoundLibraryState {
  const EntranceSoundLibraryState({
    this.sounds = const <EntranceSoundResponse>[],
    this.selections = const <String, String>{},
  });

  final List<EntranceSoundResponse> sounds;
  final Map<String, String> selections;

  String? selectionFor(String scopeId) => selections[scopeId];

  EntranceSoundLibraryState copyWith({
    List<EntranceSoundResponse>? sounds,
    Map<String, String>? selections,
  }) {
    return EntranceSoundLibraryState(
      sounds: sounds ?? this.sounds,
      selections: selections ?? this.selections,
    );
  }
}

@riverpod
class EntranceSoundLibrary extends _$EntranceSoundLibrary {
  @override
  Future<EntranceSoundLibraryState> build() async {
    final EntranceSoundLibraryResponse response = await ref
        .read(fluxerClientProvider)
        .users
        .listEntranceSounds();
    return EntranceSoundLibraryState(
      sounds: response.sounds,
      selections: <String, String>{
        for (final EntranceSoundLibraryResponseSelections selection
            in response.selections)
          if (selection.soundId.isNotEmpty)
            selection.scopeId: selection.soundId,
      },
    );
  }

  EntranceSoundLibraryState get _current =>
      state.value ?? const EntranceSoundLibraryState();

  Future<void> select({required String scopeId, String? soundId}) async {
    await ref
        .read(fluxerClientProvider)
        .users
        .setEntranceSoundSelection(
          body: EntranceSoundSelectionRequest(
            scopeId: scopeId,
            soundId: soundId,
          ),
        );
    final Map<String, String> selections = Map<String, String>.from(
      _current.selections,
    );
    if (soundId == null) {
      selections.remove(scopeId);
    } else {
      selections[scopeId] = soundId;
    }
    state = AsyncData(_current.copyWith(selections: selections));
  }

  Future<EntranceSoundResponse> upload({
    required String name,
    required Uint8List bytes,
  }) async {
    final String trimmed = name.length > kEntranceSoundNameMaxLength
        ? name.substring(0, kEntranceSoundNameMaxLength)
        : name;
    final EntranceSoundResponse sound = await ref
        .read(fluxerClientProvider)
        .users
        .uploadEntranceSound(
          body: EntranceSoundUploadRequest(
            name: trimmed,
            audio: base64Encode(bytes),
          ),
        );
    state = AsyncData(
      _current.copyWith(
        sounds: <EntranceSoundResponse>[..._current.sounds, sound],
      ),
    );
    return sound;
  }

  Future<void> delete(String soundId) async {
    await ref
        .read(fluxerClientProvider)
        .users
        .deleteEntranceSound(soundId: soundId);
    state = AsyncData(
      EntranceSoundLibraryState(
        sounds: _current.sounds
            .where((EntranceSoundResponse sound) => sound.id != soundId)
            .toList(growable: false),
        selections: <String, String>{
          for (final MapEntry<String, String> entry
              in _current.selections.entries)
            if (entry.value != soundId) entry.key: entry.value,
        },
      ),
    );
  }
}
