import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';

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

enum NoiseSuppressionBackend {
  none,
  standard,
  gate,
  rnnoise;

  static const Set<NoiseSuppressionBackend> native = <NoiseSuppressionBackend>{
    gate,
    rnnoise,
  };

  bool get isNative => native.contains(this);

  bool get isEnhanced => this == rnnoise;

  static NoiseSuppressionBackend? fromJson(String? value) {
    return NoiseSuppressionBackend.values.asNameMap()[value];
  }
}

const NoiseSuppressionBackend kDefaultNoiseSuppressionBackend =
    NoiseSuppressionBackend.rnnoise;

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
const int kDefaultVadThreshold = 50;

enum ScreenShareCodecPreference { auto, av1, h265, vp9, h264, vp8 }

const Set<String> kVoiceAccountSettingFields = <String>{
  'participantVolumes',
  'participantLocalMutes',
  'streamAudioVolumes',
  'streamAudioMuted',
  'showVoiceConnectionAvatarStack',
  'showVoiceConnectionId',
  'showConnectionVolumeControls',
  'prioritizeSpeakingParticipants',
};

class VoiceSettingsState {
  const VoiceSettingsState({
    this.inputDeviceId = kDefaultVoiceDeviceId,
    this.outputDeviceId = kDefaultVoiceDeviceId,
    this.videoDeviceId = kDefaultVoiceDeviceId,
    this.inputVolume = kDefaultVoiceVolumePercent,
    this.outputVolume = kDefaultVoiceVolumePercent,
    this.voiceProcessingMode = VoiceProcessingMode.voice,
    this.noiseSuppressionBackend,
    this.echoCancellation = true,
    this.autoGainControl = true,
    this.outputRoute = VoiceOutputRoute.speaker,
    this.outputRouteOverride,
    this.outputDeviceOverride,
    this.cameraResolution = CameraResolution.medium,
    this.cameraFacing = VoiceCameraFacing.front,
    this.mirrorCamera = true,
    this.screenshareResolution = ScreenshareResolution.medium,
    this.videoFrameRate = kDefaultVideoFrameRate,
    this.participantVolumes = const <String, int>{},
    this.participantLocalMutes = const <String, bool>{},
    this.streamAudioVolumes = const <String, int>{},
    this.streamAudioMuted = const <String, bool>{},
    this.showVoiceConnectionAvatarStack = true,
    this.showVoiceConnectionId = true,
    this.showConnectionVolumeControls = false,
    this.preferredScreenShareCodec = ScreenShareCodecPreference.auto,
    this.suppressNewDeviceAlerts = false,
    this.pauseOwnScreenSharePreviewOnUnfocus = true,
    this.prioritizeSpeakingParticipants = false,
    this.vadAutoSensitivity = true,
    this.vadThreshold = kDefaultVadThreshold,
    this.screenShareAv1OptIn = false,
    this.screenShareHevcOptIn = false,
    this.disableScreenSharePip = false,
  });

  final String inputDeviceId;
  final String outputDeviceId;
  final String videoDeviceId;
  final int inputVolume;
  final int outputVolume;
  final VoiceProcessingMode voiceProcessingMode;
  final NoiseSuppressionBackend? noiseSuppressionBackend;
  final bool echoCancellation;
  final bool autoGainControl;
  final VoiceOutputRoute outputRoute;
  final VoiceOutputRoute? outputRouteOverride;
  final int? outputDeviceOverride;
  final CameraResolution cameraResolution;
  final VoiceCameraFacing cameraFacing;
  final bool mirrorCamera;
  final ScreenshareResolution screenshareResolution;
  final int videoFrameRate;
  final Map<String, int> participantVolumes;
  final Map<String, bool> participantLocalMutes;
  final Map<String, int> streamAudioVolumes;
  final Map<String, bool> streamAudioMuted;
  final bool showVoiceConnectionAvatarStack;
  final bool showVoiceConnectionId;
  final bool showConnectionVolumeControls;
  final ScreenShareCodecPreference preferredScreenShareCodec;
  final bool suppressNewDeviceAlerts;
  final bool pauseOwnScreenSharePreviewOnUnfocus;
  final bool prioritizeSpeakingParticipants;
  final bool vadAutoSensitivity;
  final int vadThreshold;
  final bool screenShareAv1OptIn;
  final bool screenShareHevcOptIn;
  final bool disableScreenSharePip;

  bool get shouldMirrorOwnCamera =>
      mirrorCamera && cameraFacing == VoiceCameraFacing.front;

  VoiceSettingsState copyWith({
    String? inputDeviceId,
    String? outputDeviceId,
    String? videoDeviceId,
    int? inputVolume,
    int? outputVolume,
    VoiceProcessingMode? voiceProcessingMode,
    NoiseSuppressionBackend? noiseSuppressionBackend,
    bool? echoCancellation,
    bool? autoGainControl,
    VoiceOutputRoute? outputRoute,
    VoiceOutputRoute? outputRouteOverride,
    int? outputDeviceOverride,
    bool clearOutputRouteOverride = false,
    CameraResolution? cameraResolution,
    VoiceCameraFacing? cameraFacing,
    bool? mirrorCamera,
    ScreenshareResolution? screenshareResolution,
    int? videoFrameRate,
    Map<String, int>? participantVolumes,
    Map<String, bool>? participantLocalMutes,
    Map<String, int>? streamAudioVolumes,
    Map<String, bool>? streamAudioMuted,
    bool? showVoiceConnectionAvatarStack,
    bool? showVoiceConnectionId,
    bool? showConnectionVolumeControls,
    ScreenShareCodecPreference? preferredScreenShareCodec,
    bool? suppressNewDeviceAlerts,
    bool? pauseOwnScreenSharePreviewOnUnfocus,
    bool? prioritizeSpeakingParticipants,
    bool? vadAutoSensitivity,
    int? vadThreshold,
    bool? screenShareAv1OptIn,
    bool? screenShareHevcOptIn,
    bool? disableScreenSharePip,
  }) {
    return VoiceSettingsState(
      inputDeviceId: inputDeviceId ?? this.inputDeviceId,
      outputDeviceId: outputDeviceId ?? this.outputDeviceId,
      videoDeviceId: videoDeviceId ?? this.videoDeviceId,
      inputVolume: inputVolume ?? this.inputVolume,
      outputVolume: outputVolume ?? this.outputVolume,
      voiceProcessingMode: voiceProcessingMode ?? this.voiceProcessingMode,
      noiseSuppressionBackend:
          noiseSuppressionBackend ?? this.noiseSuppressionBackend,
      echoCancellation: echoCancellation ?? this.echoCancellation,
      autoGainControl: autoGainControl ?? this.autoGainControl,
      outputRoute: outputRoute ?? this.outputRoute,
      outputRouteOverride: clearOutputRouteOverride
          ? null
          : outputRouteOverride ?? this.outputRouteOverride,
      outputDeviceOverride: clearOutputRouteOverride
          ? null
          : outputDeviceOverride ?? this.outputDeviceOverride,
      cameraResolution: cameraResolution ?? this.cameraResolution,
      cameraFacing: cameraFacing ?? this.cameraFacing,
      mirrorCamera: mirrorCamera ?? this.mirrorCamera,
      screenshareResolution:
          screenshareResolution ?? this.screenshareResolution,
      videoFrameRate: videoFrameRate ?? this.videoFrameRate,
      participantVolumes: participantVolumes ?? this.participantVolumes,
      participantLocalMutes:
          participantLocalMutes ?? this.participantLocalMutes,
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
      prioritizeSpeakingParticipants:
          prioritizeSpeakingParticipants ?? this.prioritizeSpeakingParticipants,
      vadAutoSensitivity: vadAutoSensitivity ?? this.vadAutoSensitivity,
      vadThreshold: vadThreshold ?? this.vadThreshold,
      screenShareAv1OptIn: screenShareAv1OptIn ?? this.screenShareAv1OptIn,
      screenShareHevcOptIn: screenShareHevcOptIn ?? this.screenShareHevcOptIn,
      disableScreenSharePip:
          disableScreenSharePip ?? this.disableScreenSharePip,
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
      'noiseSuppressionBackend': noiseSuppressionBackend?.name,
      'echoCancellation': echoCancellation,
      'autoGainControl': autoGainControl,
      'outputRoute': outputRoute.name,
      'cameraResolution': cameraResolution.name,
      'cameraFacing': cameraFacing.name,
      'mirrorCamera': mirrorCamera,
      'screenshareResolution': screenshareResolution.toJson(),
      'videoFrameRate': videoFrameRate,
      'participantVolumes': participantVolumes,
      'participantLocalMutes': participantLocalMutes,
      'streamAudioVolumes': streamAudioVolumes,
      'streamAudioMuted': streamAudioMuted,
      'showVoiceConnectionAvatarStack': showVoiceConnectionAvatarStack,
      'showVoiceConnectionId': showVoiceConnectionId,
      'showConnectionVolumeControls': showConnectionVolumeControls,
      'preferredScreenShareCodec': preferredScreenShareCodec.name,
      'suppressNewDeviceAlerts': suppressNewDeviceAlerts,
      'pauseOwnScreenSharePreviewOnUnfocus':
          pauseOwnScreenSharePreviewOnUnfocus,
      'prioritizeSpeakingParticipants': prioritizeSpeakingParticipants,
      'vadAutoSensitivity': vadAutoSensitivity,
      'vadThreshold': vadThreshold,
      'screenShareAv1OptIn': screenShareAv1OptIn,
      'screenShareHevcOptIn': screenShareHevcOptIn,
      'disableScreenSharePip': disableScreenSharePip,
    };
  }

  Map<String, Object?> deviceJson() => toJson()
    ..removeWhere(
      (String field, _) => kVoiceAccountSettingFields.contains(field),
    );

  Map<String, Object?> accountJson() => toJson()
    ..removeWhere(
      (String field, _) => !kVoiceAccountSettingFields.contains(field),
    );

  static VoiceSettingsState? tryFromJson(Map<String, Object?> json) {
    try {
      return VoiceSettingsState.fromJson(json);
    } on Object {
      return null;
    }
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
      noiseSuppressionBackend: _resolveNoiseSuppressionBackend(json),
      echoCancellation: json['echoCancellation'] as bool? ?? true,
      autoGainControl: json['autoGainControl'] as bool? ?? true,
      outputRoute: _outputRouteFromJson(json),
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
      participantLocalMutes: _parseStreamAudioMuted(
        json['participantLocalMutes'],
      ),
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
      prioritizeSpeakingParticipants:
          json['prioritizeSpeakingParticipants'] as bool? ?? false,
      vadAutoSensitivity: json['vadAutoSensitivity'] as bool? ?? true,
      vadThreshold:
          ((json['vadThreshold'] as num?)?.round() ?? kDefaultVadThreshold)
              .clamp(0, 100),
      screenShareAv1OptIn: json['screenShareAv1OptIn'] as bool? ?? false,
      screenShareHevcOptIn: json['screenShareHevcOptIn'] as bool? ?? false,
      disableScreenSharePip: json['disableScreenSharePip'] as bool? ?? false,
    );
  }
}

Map<String, Object?> changedVoiceFields(
  Map<String, Object?> previous,
  Map<String, Object?> next,
) => <String, Object?>{
  for (final MapEntry<String, Object?> entry in next.entries)
    if (entry.value != previous[entry.key]) entry.key: entry.value,
};

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

VoiceOutputRoute _outputRouteFromJson(Map<String, Object?> json) {
  final Object? storedRoute = json['outputRoute'];
  if (storedRoute is String) {
    return voiceOutputRouteFromName(storedRoute);
  }
  final Object? storedSpeaker = json['preferSpeakerOutput'];
  return voiceOutputRouteFromSpeakerPreference(
    preferSpeaker: storedSpeaker is bool ? storedSpeaker : null,
  );
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

NoiseSuppressionBackend? _resolveNoiseSuppressionBackend(
  Map<String, Object?> json,
) {
  if (json.containsKey('noiseSuppressionBackend')) {
    return NoiseSuppressionBackend.fromJson(
      json['noiseSuppressionBackend'] as String?,
    );
  }
  final String? tier = json['noiseSuppressionTier'] as String?;
  if (tier != null) {
    return tier == 'enhanced' ? null : NoiseSuppressionBackend.fromJson(tier);
  }
  final bool deepFilter =
      json['deepFilterNoiseSuppression'] as bool? ??
      json['deepFilterNoiseSuppressionPrefV2'] as bool? ??
      true;
  if (deepFilter) {
    return null;
  }
  final bool standard = json['noiseSuppression'] as bool? ?? true;
  return standard
      ? NoiseSuppressionBackend.standard
      : NoiseSuppressionBackend.none;
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
