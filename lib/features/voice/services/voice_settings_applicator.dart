import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_noise_filter_provider.dart';
import 'package:fluxer_app/features/voice/utils/camera_resolution_presets.dart';
import 'package:fluxer_app/features/voice/utils/screen_share_presets.dart';
import 'package:fluxer_app/features/voice/utils/voice_audio_publish_options.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';
import 'package:fluxer_app/features/voice/utils/voice_camera_platform.dart';
import 'package:fluxer_app/features/voice/utils/voice_processing_profile.dart';
import 'package:fluxer_app/features/voice/utils/voice_volume_utils.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_settings_applicator.g.dart';

class VoiceSettingsApplicator {
  const VoiceSettingsApplicator({required this.noiseFilterSupported});

  final bool noiseFilterSupported;

  RoomOptions buildRoomOptions(
    VoiceSettingsState settings, {
    int? channelBitrate,
  }) {
    final ResolvedVoiceProcessing processing = resolveVoiceProcessing(
      settings: settings,
      noiseFilterSupported: noiseFilterSupported,
    );
    final String? audioDeviceId = _resolveDeviceId(settings.inputDeviceId);
    final AudioPublishOptions? audioPublish = buildMicrophonePublishOptions(
      channelBitrate: channelBitrate,
      processingMode: settings.voiceProcessingMode,
    );
    return RoomOptions(
      dynacast: true,
      defaultAudioCaptureOptions: AudioCaptureOptions(
        deviceId: audioDeviceId,
        echoCancellation: processing.echoCancellation,
        noiseSuppression: processing.noiseSuppression,
        autoGainControl: processing.autoGainControl,
        voiceIsolation: false,
      ),
      defaultAudioPublishOptions: audioPublish ?? const AudioPublishOptions(),
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
      voiceIsolation: false,
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

  Future<void> applyInputVolumeToMicrophone({
    required LocalParticipant participant,
    required int inputVolumePercent,
  }) async {
    final LocalAudioTrack? track = _microphoneTrack(participant);
    if (track == null) {
      return;
    }
    try {
      await Helper.setVolume(
        inputVoiceVolumePercentToGain(inputVolumePercent),
        track.mediaStreamTrack,
      );
    } on Object {
      return;
    }
  }

  Future<void> applyMicrophonePublishSettings({
    required Room room,
    required VoiceSettingsState settings,
    int? channelBitrate,
  }) async {
    final LocalParticipant? participant = room.localParticipant;
    if (participant == null) {
      return;
    }
    final LocalAudioTrack? track = _microphoneTrack(participant);
    final RTCRtpSender? sender = track?.sender;
    if (sender == null) {
      return;
    }
    final AudioPublishOptions? publishOptions = buildMicrophonePublishOptions(
      channelBitrate: channelBitrate,
      processingMode: settings.voiceProcessingMode,
    );
    final int? maxBitrate = publishOptions?.encoding?.maxBitrate;
    if (maxBitrate == null) {
      return;
    }
    final RTCRtpParameters parameters = sender.parameters;
    final List<RTCRtpEncoding> encodings = List<RTCRtpEncoding>.from(
      parameters.encodings ?? const <RTCRtpEncoding>[],
    );
    if (encodings.isEmpty) {
      encodings.add(RTCRtpEncoding(maxBitrate: maxBitrate));
    } else {
      final bool alreadyApplied = encodings.every(
        (RTCRtpEncoding encoding) => encoding.maxBitrate == maxBitrate,
      );
      if (alreadyApplied) {
        return;
      }
      for (final RTCRtpEncoding encoding in encodings) {
        encoding.maxBitrate = maxBitrate;
      }
    }
    parameters.encodings = encodings;
    try {
      await sender.setParameters(parameters);
    } on Object {
      return;
    }
  }

  Future<void> setMicrophoneEnabled({
    required Room room,
    required VoiceSettingsState settings,
    required bool enabled,
    int? channelBitrate,
  }) async {
    final LocalParticipant? participant = room.localParticipant;
    if (participant == null) {
      return;
    }
    final AudioCaptureOptions captureOptions = buildAudioCaptureOptions(
      settings,
    );
    final AudioPublishOptions? publishOptions = enabled
        ? buildMicrophonePublishOptions(
            channelBitrate: channelBitrate,
            processingMode: settings.voiceProcessingMode,
          )
        : null;
    await _withAudioPublishOptions(
      room: room,
      publishOptions: publishOptions,
      action: () => participant.setMicrophoneEnabled(
        enabled,
        audioCaptureOptions: captureOptions,
      ),
    );
    if (!enabled) {
      return;
    }
    await attachNoiseFilterToMicrophone(
      participant: participant,
      settings: settings,
    );
    await applyInputVolumeToMicrophone(
      participant: participant,
      inputVolumePercent: settings.inputVolume,
    );
    await applyMicrophonePublishSettings(
      room: room,
      settings: settings,
      channelBitrate: channelBitrate,
    );
  }

  Future<T> _withAudioPublishOptions<T>({
    required Room room,
    required AudioPublishOptions? publishOptions,
    required Future<T> Function() action,
  }) async {
    if (publishOptions == null) {
      return action();
    }
    final RoomOptions roomOptions = room.roomOptions;
    // setMicrophoneEnabled has no publishOptions param.
    // ignore: invalid_use_of_internal_member
    room.engine.roomOptions = roomOptions.copyWith(
      defaultAudioPublishOptions: publishOptions,
    );
    try {
      return await action();
    } finally {
      // LiveKit internal API.
      // ignore: invalid_use_of_internal_member
      room.engine.roomOptions = roomOptions;
    }
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
      defaultAudioPublishOptions: captureScreenAudio
          ? kScreenShareAudioPublishOptions
          : roomOptions.defaultAudioPublishOptions,
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
    int? channelBitrate,
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
      await applyInputVolumeToMicrophone(
        participant: participant,
        inputVolumePercent: settings.inputVolume,
      );
      await applyMicrophonePublishSettings(
        room: room,
        settings: settings,
        channelBitrate: channelBitrate,
      );
      return;
    }
    await refreshMicrophone(
      room: room,
      settings: settings,
      microphoneEnabled: true,
      channelBitrate: channelBitrate,
    );
  }

  Future<void> refreshMicrophone({
    required Room room,
    required VoiceSettingsState settings,
    required bool microphoneEnabled,
    int? channelBitrate,
  }) async {
    final LocalParticipant? participant = room.localParticipant;
    if (participant == null) {
      return;
    }
    await applyNoiseFilterBypass(settings);
    if (!microphoneEnabled) {
      return;
    }
    await setMicrophoneEnabled(
      room: room,
      settings: settings,
      enabled: false,
      channelBitrate: channelBitrate,
    );
    await setMicrophoneEnabled(
      room: room,
      settings: settings,
      enabled: true,
      channelBitrate: channelBitrate,
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
