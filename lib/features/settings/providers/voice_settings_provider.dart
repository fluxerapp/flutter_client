import 'dart:async';
import 'dart:convert';

import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_settings_provider.g.dart';

const Duration _kVoiceSettingsPersistDebounce = Duration(milliseconds: 500);

@Riverpod(keepAlive: true)
class VoiceSettings extends _$VoiceSettings {
  String? _userId;
  Timer? _persistTimer;

  @override
  VoiceSettingsState build() {
    ref.onDispose(() {
      _persistTimer?.cancel();
    });
    return const VoiceSettingsState();
  }

  Future<void> load(String userId) async {
    _userId = userId;
    final db = ref.read(fluxerDatabaseProvider);
    final String? json = await db.userPreferencesDao.getVoiceSettingsJson(
      userId,
    );
    if (json == null || json.isEmpty) {
      return;
    }
    try {
      final Object? decoded = jsonDecode(json);
      if (decoded is! Map<String, Object?>) {
        return;
      }
      state = VoiceSettingsState.fromJson(decoded);
    } on Object {
      return;
    }
  }

  Future<void> update(VoiceSettingsState value) async {
    state = value;
    _schedulePersist();
  }

  Future<void> setInputDeviceId(String value) async {
    state = state.copyWith(inputDeviceId: value);
    _schedulePersist();
  }

  Future<void> setOutputDeviceId(String value) async {
    state = state.copyWith(outputDeviceId: value);
    _schedulePersist();
  }

  Future<void> setVideoDeviceId(String value) async {
    state = state.copyWith(videoDeviceId: value);
    _schedulePersist();
  }

  Future<void> setInputVolume(int value) async {
    state = state.copyWith(inputVolume: clampVoiceVolumePercent(value));
    _schedulePersist();
  }

  Future<void> setOutputVolume(int value) async {
    state = state.copyWith(outputVolume: clampVoiceVolumePercent(value));
    _schedulePersist();
  }

  Future<void> setVoiceProcessingMode(VoiceProcessingMode value) async {
    state = state.copyWith(voiceProcessingMode: value);
    _schedulePersist();
  }

  Future<void> setNoiseSuppressionTier(NoiseSuppressionTier value) async {
    state = state.copyWith(noiseSuppressionTier: value);
    _schedulePersist();
  }

  Future<void> setEchoCancellation({required bool value}) async {
    state = state.copyWith(echoCancellation: value);
    _schedulePersist();
  }

  Future<void> setNoiseSuppression({required bool value}) async {
    state = state.copyWith(noiseSuppression: value);
    _schedulePersist();
  }

  Future<void> setAutoGainControl({required bool value}) async {
    state = state.copyWith(autoGainControl: value);
    _schedulePersist();
  }

  Future<void> setPreferSpeakerOutput({required bool value}) async {
    state = state.copyWith(preferSpeakerOutput: value);
    _schedulePersist();
  }

  Future<void> setCameraFacing(VoiceCameraFacing value) async {
    state = state.copyWith(cameraFacing: value);
    _schedulePersist();
  }

  Future<void> setCameraResolution(CameraResolution value) async {
    state = state.copyWith(cameraResolution: value);
    _schedulePersist();
  }

  Future<void> setMirrorCamera({required bool value}) async {
    state = state.copyWith(mirrorCamera: value);
    _schedulePersist();
  }

  Future<void> setScreenshareResolution(ScreenshareResolution value) async {
    state = state.copyWith(screenshareResolution: value);
    _schedulePersist();
  }

  Future<void> setVideoFrameRate(int value) async {
    state = state.copyWith(videoFrameRate: value);
    _schedulePersist();
  }

  int participantVolumeFor(String userId) {
    return state.participantVolumes[userId] ?? kDefaultVoiceVolumePercent;
  }

  Future<void> setParticipantVolume(String userId, int value) async {
    final int clamped = clampVoiceVolumePercent(value);
    final Map<String, int> nextVolumes = Map<String, int>.from(
      state.participantVolumes,
    );
    nextVolumes[userId] = clamped;
    state = state.copyWith(participantVolumes: nextVolumes);
    _schedulePersist();
  }

  Future<void> setStreamVolume(String streamKey, int value) async {
    final int clamped = clampVoiceVolumePercent(value);
    final Map<String, int> nextVolumes = Map<String, int>.from(
      state.streamAudioVolumes,
    );
    nextVolumes[streamKey] = clamped;
    state = state.copyWith(streamAudioVolumes: nextVolumes);
    _schedulePersist();
  }

  Future<void> setStreamMuted(String streamKey, {required bool muted}) async {
    final Map<String, bool> nextMuted = Map<String, bool>.from(
      state.streamAudioMuted,
    );
    nextMuted[streamKey] = muted;
    state = state.copyWith(streamAudioMuted: nextMuted);
    _schedulePersist();
  }

  void _schedulePersist() {
    _persistTimer?.cancel();
    _persistTimer = Timer(_kVoiceSettingsPersistDebounce, () {
      unawaited(_persist());
    });
  }

  Future<void> _persist() async {
    final String? userId = _userId;
    if (userId == null) {
      return;
    }
    final db = ref.read(fluxerDatabaseProvider);
    await db.userPreferencesDao.setVoiceSettingsJson(
      userId,
      jsonEncode(state.toJson()),
    );
  }
}
