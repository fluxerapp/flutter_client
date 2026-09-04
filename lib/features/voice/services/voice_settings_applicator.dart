import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_noise_filter_provider.dart';
import 'package:fluxer_app/features/voice/utils/camera_resolution_presets.dart';
import 'package:fluxer_app/features/voice/utils/screen_share_presets.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';
import 'package:fluxer_app/features/voice/utils/voice_camera_platform.dart';
import 'package:fluxer_app/features/voice/utils/voice_processing_profile.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_settings_applicator.g.dart';

class VoiceSettingsApplicator {
  const VoiceSettingsApplicator({required this.noiseFilterSupported});

  final bool noiseFilterSupported;

  RoomOptions buildRoomOptions(VoiceSettingsState settings) {
    final ResolvedVoiceProcessing processing = resolveVoiceProcessing(
      settings: settings,
      noiseFilterSupported: noiseFilterSupported,
    );
    final String? audioDeviceId = _resolveDeviceId(settings.inputDeviceId);
    return RoomOptions(
      dynacast: true,
      defaultAudioCaptureOptions: AudioCaptureOptions(
        deviceId: audioDeviceId,
        echoCancellation: processing.echoCancellation,
        noiseSuppression: processing.noiseSuppression,
        autoGainControl: processing.autoGainControl,
      ),
      defaultCameraCaptureOptions: cameraCaptureOptionsFor(
        resolution: settings.cameraResolution,
        deviceId: settings.videoDeviceId,
        cameraFacing: settings.cameraFacing,
      ),
      defaultScreenShareCaptureOptions: screenShareCaptureOptionsFor(
        resolution: settings.screenshareResolution,
        frameRate: settings.videoFrameRate,
      ),
    );
  }

  AudioCaptureOptions buildAudioCaptureOptions(VoiceSettingsState settings) {
    final ResolvedVoiceProcessing processing = resolveVoiceProcessing(
      settings: settings,
      noiseFilterSupported: noiseFilterSupported,
    );
    return AudioCaptureOptions(
      deviceId: _resolveDeviceId(settings.inputDeviceId),
      echoCancellation: processing.echoCancellation,
      noiseSuppression: processing.noiseSuppression,
      autoGainControl: processing.autoGainControl,
    );
  }

  Future<void> attachNoiseFilterToMicrophone({
    required LocalParticipant participant,
    required VoiceSettingsState settings,
  }) async {
    final LocalAudioTrack? track = _microphoneTrack(participant);
    if (track == null) {
      return;
    }
    await attachNoiseFilterToTrack(track: track, settings: settings);
  }

  Future<void> attachNoiseFilterToTrack({
    required LocalAudioTrack track,
    required VoiceSettingsState settings,
  }) async {}

  LocalAudioTrack? _microphoneTrack(LocalParticipant participant) {
    final LocalTrackPublication? publication = participant
        .getTrackPublicationBySource(TrackSource.microphone);
    final LocalTrack? track = publication?.track;
    return track is LocalAudioTrack ? track : null;
  }

  CameraCaptureOptions buildCameraCaptureOptions(VoiceSettingsState settings) {
    return cameraCaptureOptionsFor(
      resolution: settings.cameraResolution,
      deviceId: settings.videoDeviceId,
      cameraFacing: settings.cameraFacing,
    );
  }

  ScreenShareCaptureOptions buildScreenShareCaptureOptions(
    VoiceSettingsState settings,
  ) {
    return screenShareCaptureOptionsFor(
      resolution: settings.screenshareResolution,
      frameRate: settings.videoFrameRate,
    );
  }

  VideoPublishOptions buildScreenSharePublishOptions(
    VoiceSettingsState settings,
  ) {
    return VideoPublishOptions(
      videoCodec: preferredScreenShareVideoCodec(
        settings.preferredScreenShareCodec,
      ),
    );
  }

  Future<void> setScreenShareEnabled({
    required LocalParticipant participant,
    required Room room,
    required VoiceSettingsState settings,
    required bool enabled,
    bool captureScreenAudio = false,
  }) async {
    if (!enabled) {
      await participant.setScreenShareEnabled(false);
      return;
    }

    final RoomOptions roomOptions = room.roomOptions;
    final ScreenShareCaptureOptions captureOptions =
        buildScreenShareCaptureOptions(settings);
    final VideoPublishOptions publishOptions = buildScreenSharePublishOptions(
      settings,
    );

    // setScreenShareEnabled has no publishOptions param.
    // ignore: invalid_use_of_internal_member
    room.engine.roomOptions = roomOptions.copyWith(
      defaultVideoPublishOptions: publishOptions,
      defaultScreenShareCaptureOptions: captureOptions,
    );
    try {
      await participant.setScreenShareEnabled(
        true,
        captureScreenAudio: captureScreenAudio,
        screenShareCaptureOptions: captureOptions,
      );
    } finally {
      // LiveKit internal API.
      // ignore: invalid_use_of_internal_member
      room.engine.roomOptions = roomOptions;
    }
  }

  Future<void> refreshScreenShare({
    required Room room,
    required VoiceSettingsState settings,
  }) async {
    final LocalParticipant? participant = room.localParticipant;
    if (participant == null) {
      return;
    }
    final bool isSharing =
        participant.getTrackPublicationBySource(TrackSource.screenShareVideo) !=
        null;
    if (!isSharing) {
      return;
    }
    final bool captureScreenAudio =
        participant.getTrackPublicationBySource(TrackSource.screenShareAudio) !=
        null;
    await setScreenShareEnabled(
      participant: participant,
      room: room,
      settings: settings,
      enabled: false,
    );
    await setScreenShareEnabled(
      participant: participant,
      room: room,
      settings: settings,
      enabled: true,
      captureScreenAudio: captureScreenAudio,
    );
  }

  Future<void> applyNoiseFilterBypass(VoiceSettingsState settings) async {}

  Future<void> refreshMicrophoneAfterRouteChange({
    required Room room,
    required VoiceSettingsState settings,
  }) async {
    final LocalParticipant? participant = room.localParticipant;
    if (participant == null) {
      return;
    }
    await applyNoiseFilterBypass(settings);
    final LocalAudioTrack? track = _microphoneTrack(participant);
    final AudioCaptureOptions options = buildAudioCaptureOptions(settings);
    if (track != null) {
      await track.restartTrack(options);
      await attachNoiseFilterToMicrophone(
        participant: participant,
        settings: settings,
      );
      return;
    }
    await refreshMicrophone(
      room: room,
      settings: settings,
      microphoneEnabled: true,
    );
  }

  Future<void> refreshMicrophone({
    required Room room,
    required VoiceSettingsState settings,
    required bool microphoneEnabled,
  }) async {
    final LocalParticipant? participant = room.localParticipant;
    if (participant == null) {
      return;
    }
    await applyNoiseFilterBypass(settings);
    if (!microphoneEnabled) {
      return;
    }
    await participant.setMicrophoneEnabled(
      false,
      audioCaptureOptions: buildAudioCaptureOptions(settings),
    );
    await participant.setMicrophoneEnabled(
      true,
      audioCaptureOptions: buildAudioCaptureOptions(settings),
    );
    await attachNoiseFilterToMicrophone(
      participant: participant,
      settings: settings,
    );
  }

  Future<void> refreshCamera({
    required Room room,
    required VoiceSettingsState settings,
    required bool cameraEnabled,
  }) async {
    final LocalParticipant? participant = room.localParticipant;
    if (participant == null) {
      return;
    }
    final CameraCaptureOptions options = buildCameraCaptureOptions(settings);
    if (!cameraEnabled) {
      await participant.setCameraEnabled(false, cameraCaptureOptions: options);
      return;
    }
    final LocalTrackPublication? publication = participant
        .getTrackPublicationBySource(TrackSource.camera);
    final LocalVideoTrack? track = publication?.track is LocalVideoTrack
        ? publication!.track! as LocalVideoTrack
        : null;
    if (track != null) {
      if (isMobileVoiceCameraPlatform()) {
        await track.setCameraPosition(
          liveKitCameraPosition(settings.cameraFacing),
        );
        return;
      }
      await track.restartTrack(options);
      return;
    }
    await participant.setCameraEnabled(true, cameraCaptureOptions: options);
  }

  Future<void> applySpeakerOutput({
    required VoiceSettingsState settings,
  }) async {
    if (!AudioManager.instance.canSwitchSpeakerphone) {
      return;
    }
    // CallKit stays on earpiece unless speaker is forced.
    final bool forceSpeaker = shouldForceSpeakerOutputForCallKit(
      preferSpeakerOutput: settings.preferSpeakerOutput,
      callKitOwnsAudioSession: _callKitOwnsAudioSession(),
    );
    await AudioManager.instance.setSpeakerOutputPreferred(
      settings.preferSpeakerOutput,
      force: forceSpeaker,
    );
  }

  bool _callKitOwnsAudioSession() {
    return AudioManager.instance.managementMode ==
        // LiveKit experimental API.
        // ignore: experimental_member_use
        AudioSessionManagementMode.externalCallSystem;
  }

  String? _resolveDeviceId(String deviceId) {
    if (deviceId == kDefaultVoiceDeviceId || deviceId.isEmpty) {
      return null;
    }
    return deviceId;
  }
}

@Riverpod(keepAlive: true)
VoiceSettingsApplicator voiceSettingsApplicator(Ref ref) {
  final AsyncValue<VoiceNoiseFilterState> noiseFilterState = ref.watch(
    voiceNoiseFilterProvider,
  );
  return noiseFilterState.maybeWhen(
    data: (VoiceNoiseFilterState value) =>
        VoiceSettingsApplicator(noiseFilterSupported: value.isSupported),
    orElse: () => const VoiceSettingsApplicator(noiseFilterSupported: false),
  );
}
