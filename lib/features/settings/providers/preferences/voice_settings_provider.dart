import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_settings_provider.g.dart';

@Riverpod(keepAlive: true)
class VoiceSettings extends _$VoiceSettings {
  String? _userId;

  @override
  VoiceSettingsState build() => _parse(
    ref.watch(localSettingsStoreProvider).read(LocalSettingKeys.voiceDevice),
  );

  Future<void> load(String userId) async {
    _userId = userId;
    final LocalSettingsStore store = ref.read(localSettingsStoreProvider);
    state = _parse(<String, Object?>{
      ...store.read(LocalSettingKeys.voiceDevice),
      ...store.readAccount(
        LocalSettingKeys.voiceDeviceOverrides,
        userId: userId,
      ),
      ...store.readAccount(LocalSettingKeys.voiceAccount, userId: userId),
    });
  }

  VoiceSettingsState _parse(Map<String, Object?> json) =>
      VoiceSettingsState.tryFromJson(json) ?? const VoiceSettingsState();

  Future<void> setInputDeviceId(String value) async {
    _update(state.copyWith(inputDeviceId: value));
  }

  Future<void> setOutputDeviceId(String value) async {
    _update(state.copyWith(outputDeviceId: value));
  }

  Future<void> setVideoDeviceId(String value) async {
    _update(state.copyWith(videoDeviceId: value));
  }

  Future<void> setInputVolume(int value) async {
    _update(state.copyWith(inputVolume: clampVoiceVolumePercent(value)));
  }

  Future<void> setOutputVolume(int value) async {
    _update(state.copyWith(outputVolume: clampVoiceVolumePercent(value)));
  }

  Future<void> setVoiceProcessingMode(VoiceProcessingMode value) async {
    _update(state.copyWith(voiceProcessingMode: value));
  }

  Future<void> setNoiseSuppressionBackend(NoiseSuppressionBackend value) async {
    _update(state.copyWith(noiseSuppressionBackend: value));
  }

  Future<void> setEchoCancellation({required bool value}) async {
    _update(state.copyWith(echoCancellation: value));
  }

  Future<void> setAutoGainControl({required bool value}) async {
    _update(state.copyWith(autoGainControl: value));
  }

  Future<void> setOutputRoute(VoiceOutputRoute route) async {
    _update(state.copyWith(outputRoute: route));
  }

  Future<void> selectOutputDevice(VoiceOutputDevice device) async {
    final VoiceOutputRoute route = device.route;
    _update(
      state
          .copyWith(clearOutputRouteOverride: true)
          .copyWith(
            outputRoute: isBuiltInVoiceOutputRoute(route) ? route : null,
            outputRouteOverride: route,
            outputDeviceOverride: device.id,
          ),
    );
  }

  void clearOutputRouteOverride() {
    if (state.outputRouteOverride == null) {
      return;
    }
    state = state.copyWith(clearOutputRouteOverride: true);
  }

  Future<void> setCameraFacing(VoiceCameraFacing value) async {
    _update(state.copyWith(cameraFacing: value));
  }

  Future<void> setCameraResolution(CameraResolution value) async {
    _update(state.copyWith(cameraResolution: value));
  }

  Future<void> setMirrorCamera({required bool value}) async {
    _update(state.copyWith(mirrorCamera: value));
  }

  Future<void> setScreenshareResolution(ScreenshareResolution value) async {
    _update(state.copyWith(screenshareResolution: value));
  }

  Future<void> setVideoFrameRate(int value) async {
    _update(state.copyWith(videoFrameRate: value));
  }

  Future<void> setShowVoiceConnectionAvatarStack({required bool value}) async {
    _update(state.copyWith(showVoiceConnectionAvatarStack: value));
  }

  Future<void> setShowVoiceConnectionId({required bool value}) async {
    _update(state.copyWith(showVoiceConnectionId: value));
  }

  Future<void> setShowConnectionVolumeControls({required bool value}) async {
    _update(state.copyWith(showConnectionVolumeControls: value));
  }

  Future<void> setPreferredScreenShareCodec(
    ScreenShareCodecPreference value,
  ) async {
    _update(state.copyWith(preferredScreenShareCodec: value));
  }

  Future<void> setSuppressNewDeviceAlerts({required bool value}) async {
    _update(state.copyWith(suppressNewDeviceAlerts: value));
  }

  Future<void> setPauseOwnScreenSharePreviewOnUnfocus({
    required bool value,
  }) async {
    _update(state.copyWith(pauseOwnScreenSharePreviewOnUnfocus: value));
  }

  Future<void> setPrioritizeSpeakingParticipants({required bool value}) async {
    _update(state.copyWith(prioritizeSpeakingParticipants: value));
  }

  Future<void> setVadAutoSensitivity({required bool value}) async {
    _update(state.copyWith(vadAutoSensitivity: value));
  }

  Future<void> setVadThreshold(int value) async {
    _update(state.copyWith(vadThreshold: value.clamp(0, 100)));
  }

  Future<void> setScreenShareAv1OptIn({required bool value}) async {
    _update(state.copyWith(screenShareAv1OptIn: value));
  }

  Future<void> setScreenShareHevcOptIn({required bool value}) async {
    _update(state.copyWith(screenShareHevcOptIn: value));
  }

  Future<void> setDisableScreenSharePip({required bool value}) async {
    _update(state.copyWith(disableScreenSharePip: value));
  }

  Future<void> setParticipantVolume(String userId, int value) async {
    final int clamped = clampVoiceVolumePercent(value);
    final Map<String, int> nextVolumes = Map<String, int>.from(
      state.participantVolumes,
    );
    nextVolumes[userId] = clamped;
    _update(state.copyWith(participantVolumes: nextVolumes));
  }

  Future<void> setParticipantLocalMuted(
    String userId, {
    required bool muted,
  }) async {
    final Map<String, bool> nextMuted = Map<String, bool>.from(
      state.participantLocalMutes,
    );
    nextMuted[userId] = muted;
    _update(state.copyWith(participantLocalMutes: nextMuted));
  }

  Future<void> setStreamVolume(String streamKey, int value) async {
    final int clamped = clampVoiceVolumePercent(value);
    final Map<String, int> nextVolumes = Map<String, int>.from(
      state.streamAudioVolumes,
    );
    nextVolumes[streamKey] = clamped;
    _update(state.copyWith(streamAudioVolumes: nextVolumes));
  }

  Future<void> setStreamMuted(String streamKey, {required bool muted}) async {
    final Map<String, bool> nextMuted = Map<String, bool>.from(
      state.streamAudioMuted,
    );
    nextMuted[streamKey] = muted;
    _update(state.copyWith(streamAudioMuted: nextMuted));
  }

  void _update(VoiceSettingsState next) {
    final Map<String, Object?> changed = changedVoiceFields(
      state.deviceJson(),
      next.deviceJson(),
    );
    state = next;
    final LocalSettingsStore store = ref.read(localSettingsStoreProvider);
    if (changed.isNotEmpty) {
      store.write(LocalSettingKeys.voiceDevice, <String, Object?>{
        ...store.read(LocalSettingKeys.voiceDevice),
        ...changed,
      });
    }
    final String? userId = _userId;
    if (userId == null) {
      return;
    }
    store.writeAccount(
      LocalSettingKeys.voiceAccount,
      next.accountJson(),
      userId: userId,
    );
    _dropOverrides(changed.keys.toSet(), userId: userId);
  }

  void _dropOverrides(Set<String> fields, {required String userId}) {
    final LocalSettingsStore store = ref.read(localSettingsStoreProvider);
    final Map<String, Object?> overrides = store.readAccount(
      LocalSettingKeys.voiceDeviceOverrides,
      userId: userId,
    );
    if (!overrides.keys.any(fields.contains)) {
      return;
    }
    store.writeAccount(LocalSettingKeys.voiceDeviceOverrides, <String, Object?>{
      for (final MapEntry<String, Object?> entry in overrides.entries)
        if (!fields.contains(entry.key)) entry.key: entry.value,
    }, userId: userId);
  }
}
