enum VoiceProcessingMode {
  voice,
  studio,
  custom;

  static VoiceProcessingMode fromJson(String? value) {
    return VoiceProcessingMode.values.firstWhere(
      (VoiceProcessingMode mode) => mode.name == value,
      orElse: () => VoiceProcessingMode.voice,
    );
  }
}

enum NoiseSuppressionTier {
  enhanced,
  standard,
  none;

  static NoiseSuppressionTier fromJson(String? value) {
    return NoiseSuppressionTier.values.firstWhere(
      (NoiseSuppressionTier tier) => tier.name == value,
      orElse: () => NoiseSuppressionTier.enhanced,
    );
  }
}

enum CameraResolution {
  low,
  medium,
  high;

  static CameraResolution fromJson(String? value) {
    return CameraResolution.values.firstWhere(
      (CameraResolution resolution) => resolution.name == value,
      orElse: () => CameraResolution.medium,
    );
  }
}

enum ScreenshareResolution {
  low480p,
  medium,
  high;

  static ScreenshareResolution fromJson(String? value) {
    if (value == 'low_480p') {
      return ScreenshareResolution.low480p;
    }
    return ScreenshareResolution.values.firstWhere(
      (ScreenshareResolution resolution) => resolution.name == value,
      orElse: () => ScreenshareResolution.medium,
    );
  }

  String toJson() {
    if (this == ScreenshareResolution.low480p) {
      return 'low_480p';
    }
    return name;
  }
}

enum VoiceCameraFacing {
  front,
  back;

  static VoiceCameraFacing fromJson(String? value) {
    return VoiceCameraFacing.values.firstWhere(
      (VoiceCameraFacing facing) => facing.name == value,
      orElse: () => VoiceCameraFacing.front,
    );
  }

  VoiceCameraFacing switched() {
    return this == VoiceCameraFacing.front
        ? VoiceCameraFacing.back
        : VoiceCameraFacing.front;
  }
}

const String kDefaultVoiceDeviceId = 'default';
const int kDefaultVoiceVolumePercent = 100;
const int kMinVoiceVolumePercent = 0;
const int kMaxVoiceVolumePercent = 200;
const int kDefaultVideoFrameRate = 30;

enum ScreenShareCodecPreference { auto, av1, h265, vp9, h264, vp8 }

class VoiceSettingsState {
  const VoiceSettingsState({
    this.inputDeviceId = kDefaultVoiceDeviceId,
    this.outputDeviceId = kDefaultVoiceDeviceId,
    this.videoDeviceId = kDefaultVoiceDeviceId,
    this.inputVolume = kDefaultVoiceVolumePercent,
    this.outputVolume = kDefaultVoiceVolumePercent,
    this.voiceProcessingMode = VoiceProcessingMode.voice,
    this.noiseSuppressionTier = NoiseSuppressionTier.enhanced,
    this.echoCancellation = true,
    this.noiseSuppression = true,
    this.autoGainControl = true,
    this.preferSpeakerOutput = true,
    this.cameraResolution = CameraResolution.medium,
    this.cameraFacing = VoiceCameraFacing.front,
    this.mirrorCamera = true,
    this.screenshareResolution = ScreenshareResolution.medium,
    this.videoFrameRate = kDefaultVideoFrameRate,
    this.participantVolumes = const <String, int>{},
    this.streamAudioVolumes = const <String, int>{},
    this.streamAudioMuted = const <String, bool>{},
    this.showVoiceConnectionAvatarStack = true,
    this.showVoiceConnectionId = true,
    this.showConnectionVolumeControls = false,
    this.preferredScreenShareCodec = ScreenShareCodecPreference.auto,
    this.suppressNewDeviceAlerts = false,
    this.pauseOwnScreenSharePreviewOnUnfocus = true,
  });

  final String inputDeviceId;
  final String outputDeviceId;
  final String videoDeviceId;
  final int inputVolume;
  final int outputVolume;
  final VoiceProcessingMode voiceProcessingMode;
  final NoiseSuppressionTier noiseSuppressionTier;
  final bool echoCancellation;
  final bool noiseSuppression;
  final bool autoGainControl;
  final bool preferSpeakerOutput;
  final CameraResolution cameraResolution;
  final VoiceCameraFacing cameraFacing;
  final bool mirrorCamera;
  final ScreenshareResolution screenshareResolution;
  final int videoFrameRate;
  final Map<String, int> participantVolumes;
  final Map<String, int> streamAudioVolumes;
  final Map<String, bool> streamAudioMuted;
  final bool showVoiceConnectionAvatarStack;
  final bool showVoiceConnectionId;
  final bool showConnectionVolumeControls;
  final ScreenShareCodecPreference preferredScreenShareCodec;
  final bool suppressNewDeviceAlerts;
  final bool pauseOwnScreenSharePreviewOnUnfocus;

  bool get shouldMirrorOwnCamera =>
      mirrorCamera && cameraFacing == VoiceCameraFacing.front;

  VoiceSettingsState copyWith({
    String? inputDeviceId,
    String? outputDeviceId,
    String? videoDeviceId,
    int? inputVolume,
    int? outputVolume,
    VoiceProcessingMode? voiceProcessingMode,
    NoiseSuppressionTier? noiseSuppressionTier,
    bool? echoCancellation,
    bool? noiseSuppression,
    bool? autoGainControl,
    bool? preferSpeakerOutput,
    CameraResolution? cameraResolution,
    VoiceCameraFacing? cameraFacing,
    bool? mirrorCamera,
    ScreenshareResolution? screenshareResolution,
    int? videoFrameRate,
    Map<String, int>? participantVolumes,
    Map<String, int>? streamAudioVolumes,
    Map<String, bool>? streamAudioMuted,
    bool? showVoiceConnectionAvatarStack,
    bool? showVoiceConnectionId,
    bool? showConnectionVolumeControls,
    ScreenShareCodecPreference? preferredScreenShareCodec,
    bool? suppressNewDeviceAlerts,
    bool? pauseOwnScreenSharePreviewOnUnfocus,
  }) {
    return VoiceSettingsState(
      inputDeviceId: inputDeviceId ?? this.inputDeviceId,
      outputDeviceId: outputDeviceId ?? this.outputDeviceId,
      videoDeviceId: videoDeviceId ?? this.videoDeviceId,
      inputVolume: inputVolume ?? this.inputVolume,
      outputVolume: outputVolume ?? this.outputVolume,
      voiceProcessingMode: voiceProcessingMode ?? this.voiceProcessingMode,
      noiseSuppressionTier: noiseSuppressionTier ?? this.noiseSuppressionTier,
      echoCancellation: echoCancellation ?? this.echoCancellation,
      noiseSuppression: noiseSuppression ?? this.noiseSuppression,
      autoGainControl: autoGainControl ?? this.autoGainControl,
      preferSpeakerOutput: preferSpeakerOutput ?? this.preferSpeakerOutput,
      cameraResolution: cameraResolution ?? this.cameraResolution,
      cameraFacing: cameraFacing ?? this.cameraFacing,
      mirrorCamera: mirrorCamera ?? this.mirrorCamera,
      screenshareResolution:
          screenshareResolution ?? this.screenshareResolution,
      videoFrameRate: videoFrameRate ?? this.videoFrameRate,
      participantVolumes: participantVolumes ?? this.participantVolumes,
      streamAudioVolumes: streamAudioVolumes ?? this.streamAudioVolumes,
      streamAudioMuted: streamAudioMuted ?? this.streamAudioMuted,
      showVoiceConnectionAvatarStack:
          showVoiceConnectionAvatarStack ?? this.showVoiceConnectionAvatarStack,
      showVoiceConnectionId:
          showVoiceConnectionId ?? this.showVoiceConnectionId,
      showConnectionVolumeControls:
          showConnectionVolumeControls ?? this.showConnectionVolumeControls,
      preferredScreenShareCodec:
          preferredScreenShareCodec ?? this.preferredScreenShareCodec,
      suppressNewDeviceAlerts:
          suppressNewDeviceAlerts ?? this.suppressNewDeviceAlerts,
      pauseOwnScreenSharePreviewOnUnfocus:
          pauseOwnScreenSharePreviewOnUnfocus ??
          this.pauseOwnScreenSharePreviewOnUnfocus,
    );
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'inputDeviceId': inputDeviceId,
      'outputDeviceId': outputDeviceId,
      'videoDeviceId': videoDeviceId,
      'inputVolume': inputVolume,
      'outputVolume': outputVolume,
      'voiceProcessingMode': voiceProcessingMode.name,
      'noiseSuppressionTier': noiseSuppressionTier.name,
      'echoCancellation': echoCancellation,
      'noiseSuppression': noiseSuppression,
      'autoGainControl': autoGainControl,
      'preferSpeakerOutput': preferSpeakerOutput,
      'cameraResolution': cameraResolution.name,
      'cameraFacing': cameraFacing.name,
      'mirrorCamera': mirrorCamera,
      'screenshareResolution': screenshareResolution.toJson(),
      'videoFrameRate': videoFrameRate,
      'participantVolumes': participantVolumes,
      'streamAudioVolumes': streamAudioVolumes,
      'streamAudioMuted': streamAudioMuted,
      'showVoiceConnectionAvatarStack': showVoiceConnectionAvatarStack,
      'showVoiceConnectionId': showVoiceConnectionId,
      'showConnectionVolumeControls': showConnectionVolumeControls,
      'preferredScreenShareCodec': preferredScreenShareCodec.name,
      'suppressNewDeviceAlerts': suppressNewDeviceAlerts,
      'pauseOwnScreenSharePreviewOnUnfocus':
          pauseOwnScreenSharePreviewOnUnfocus,
    };
  }

  factory VoiceSettingsState.fromJson(Map<String, Object?> json) {
    return VoiceSettingsState(
      inputDeviceId: json['inputDeviceId'] as String? ?? kDefaultVoiceDeviceId,
      outputDeviceId:
          json['outputDeviceId'] as String? ?? kDefaultVoiceDeviceId,
      videoDeviceId: json['videoDeviceId'] as String? ?? kDefaultVoiceDeviceId,
      inputVolume: _clampVolume(json['inputVolume']),
      outputVolume: _clampVolume(json['outputVolume']),
      voiceProcessingMode: VoiceProcessingMode.fromJson(
        json['voiceProcessingMode'] as String?,
      ),
      noiseSuppressionTier: _resolveNoiseSuppressionTier(json),
      echoCancellation: json['echoCancellation'] as bool? ?? true,
      noiseSuppression: json['noiseSuppression'] as bool? ?? true,
      autoGainControl: json['autoGainControl'] as bool? ?? true,
      preferSpeakerOutput: json['preferSpeakerOutput'] as bool? ?? true,
      cameraResolution: CameraResolution.fromJson(
        json['cameraResolution'] as String?,
      ),
      cameraFacing: VoiceCameraFacing.fromJson(json['cameraFacing'] as String?),
      mirrorCamera: json['mirrorCamera'] as bool? ?? true,
      screenshareResolution: ScreenshareResolution.fromJson(
        json['screenshareResolution'] as String?,
      ),
      videoFrameRate: _clampFrameRate(json['videoFrameRate']),
      participantVolumes: _parseParticipantVolumes(json['participantVolumes']),
      streamAudioVolumes: _parseParticipantVolumes(json['streamAudioVolumes']),
      streamAudioMuted: _parseStreamAudioMuted(json['streamAudioMuted']),
      showVoiceConnectionAvatarStack:
          json['showVoiceConnectionAvatarStack'] as bool? ?? true,
      showVoiceConnectionId: json['showVoiceConnectionId'] as bool? ?? true,
      showConnectionVolumeControls:
          json['showConnectionVolumeControls'] as bool? ?? false,
      preferredScreenShareCodec: _screenShareCodecFromJson(
        json['preferredScreenShareCodec'] as String?,
      ),
      suppressNewDeviceAlerts:
          json['suppressNewDeviceAlerts'] as bool? ?? false,
      pauseOwnScreenSharePreviewOnUnfocus:
          json['pauseOwnScreenSharePreviewOnUnfocus'] as bool? ?? true,
    );
  }
}

ScreenShareCodecPreference _screenShareCodecFromJson(String? value) {
  return ScreenShareCodecPreference.values.firstWhere(
    (ScreenShareCodecPreference codec) => codec.name == value,
    orElse: () => ScreenShareCodecPreference.auto,
  );
}

Map<String, bool> _parseStreamAudioMuted(Object? value) {
  if (value is! Map<Object?, Object?>) {
    return const <String, bool>{};
  }
  final Map<String, bool> parsed = <String, bool>{};
  for (final MapEntry<Object?, Object?> entry in value.entries) {
    final String? streamKey = entry.key?.toString();
    if (streamKey == null || streamKey.isEmpty) {
      continue;
    }
    if (entry.value is! bool) {
      continue;
    }
    parsed[streamKey] = entry.value! as bool;
  }
  return parsed;
}

Map<String, int> _parseParticipantVolumes(Object? value) {
  if (value is! Map<Object?, Object?>) {
    return const <String, int>{};
  }
  final Map<String, int> parsed = <String, int>{};
  for (final MapEntry<Object?, Object?> entry in value.entries) {
    final String? userId = entry.key?.toString();
    if (userId == null || userId.isEmpty) {
      continue;
    }
    if (entry.value is! num) {
      continue;
    }
    parsed[userId] = clampVoiceVolumePercent((entry.value! as num).round());
  }
  return parsed;
}

NoiseSuppressionTier _resolveNoiseSuppressionTier(Map<String, Object?> json) {
  final String? tier = json['noiseSuppressionTier'] as String?;
  if (tier != null) {
    return NoiseSuppressionTier.fromJson(tier);
  }
  final bool deepFilter =
      json['deepFilterNoiseSuppression'] as bool? ??
      json['deepFilterNoiseSuppressionPrefV2'] as bool? ??
      true;
  if (deepFilter) {
    return NoiseSuppressionTier.enhanced;
  }
  final bool standardNs = json['noiseSuppression'] as bool? ?? true;
  return standardNs ? NoiseSuppressionTier.standard : NoiseSuppressionTier.none;
}

int _clampVolume(Object? value) {
  if (value is! num) {
    return kDefaultVoiceVolumePercent;
  }
  return value.round().clamp(kMinVoiceVolumePercent, kMaxVoiceVolumePercent);
}

int _clampFrameRate(Object? value) {
  if (value is! num) {
    return kDefaultVideoFrameRate;
  }
  return value.round().clamp(15, 60);
}

int clampVoiceVolumePercent(int value) {
  return value.clamp(kMinVoiceVolumePercent, kMaxVoiceVolumePercent);
}
