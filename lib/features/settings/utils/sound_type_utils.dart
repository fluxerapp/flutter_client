import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const String kSoundTypeDeaf = 'deaf';
const String kSoundTypeUndeaf = 'undeaf';
const String kSoundTypeMute = 'mute';
const String kSoundTypeUnmute = 'unmute';
const String kSoundTypeIncomingRing = 'incoming-ring';
const String kSoundTypeUserJoin = 'user-join';
const String kSoundTypeUserLeave = 'user-leave';
const String kSoundTypeUserMove = 'user-move';
const String kSoundTypeViewerJoin = 'viewer-join';
const String kSoundTypeViewerLeave = 'viewer-leave';
const String kSoundTypeVoiceDisconnect = 'voice-disconnect';
const String kSoundTypeCameraOn = 'camera-on';
const String kSoundTypeCameraOff = 'camera-off';
const String kSoundTypeScreenShareStart = 'screen-share-start';
const String kSoundTypeScreenShareStop = 'screen-share-stop';

const Set<String> kCommonNotificationSoundTypes = <String>{
  kSoundTypeMessage,
  kSoundTypeDirectMessage,
  kSoundTypeSameChannelMessage,
  kSoundTypeIncomingRing,
  kSoundTypeMute,
  kSoundTypeUnmute,
  kSoundTypeDeaf,
  kSoundTypeUndeaf,
};

const List<String> kAllNotificationSoundTypes = <String>[
  kSoundTypeMessage,
  kSoundTypeDirectMessage,
  kSoundTypeSameChannelMessage,
  kSoundTypeIncomingRing,
  kSoundTypeMute,
  kSoundTypeUnmute,
  kSoundTypeDeaf,
  kSoundTypeUndeaf,
  kSoundTypeUserJoin,
  kSoundTypeUserLeave,
  kSoundTypeUserMove,
  kSoundTypeViewerJoin,
  kSoundTypeViewerLeave,
  kSoundTypeVoiceDisconnect,
  kSoundTypeCameraOn,
  kSoundTypeCameraOff,
  kSoundTypeScreenShareStart,
  kSoundTypeScreenShareStop,
];

FluxerSfxClip? fluxerSfxClipForSoundType(String soundType) {
  return switch (soundType) {
    kSoundTypeMessage => FluxerSfxClip.message,
    kSoundTypeDirectMessage => FluxerSfxClip.directMessage,
    kSoundTypeSameChannelMessage => FluxerSfxClip.sameChannelMessage,
    kSoundTypeDeaf => FluxerSfxClip.deaf,
    kSoundTypeUndeaf => FluxerSfxClip.undeaf,
    kSoundTypeMute => FluxerSfxClip.mute,
    kSoundTypeUnmute => FluxerSfxClip.unmute,
    kSoundTypeIncomingRing => FluxerSfxClip.incomingRing,
    kSoundTypeUserJoin => FluxerSfxClip.userJoin,
    kSoundTypeUserLeave => FluxerSfxClip.userLeave,
    kSoundTypeUserMove => FluxerSfxClip.userMove,
    kSoundTypeViewerJoin => FluxerSfxClip.viewerJoin,
    kSoundTypeViewerLeave => FluxerSfxClip.viewerLeave,
    kSoundTypeVoiceDisconnect => FluxerSfxClip.voiceDisconnect,
    kSoundTypeCameraOn => FluxerSfxClip.cameraOn,
    kSoundTypeCameraOff => FluxerSfxClip.cameraOff,
    kSoundTypeScreenShareStart => FluxerSfxClip.streamStart,
    kSoundTypeScreenShareStop => FluxerSfxClip.streamStop,
    _ => null,
  };
}

String? soundTypeForFluxerSfxClip(FluxerSfxClip clip) {
  return switch (clip) {
    FluxerSfxClip.message => kSoundTypeMessage,
    FluxerSfxClip.directMessage => kSoundTypeDirectMessage,
    FluxerSfxClip.sameChannelMessage => kSoundTypeSameChannelMessage,
    FluxerSfxClip.deaf => kSoundTypeDeaf,
    FluxerSfxClip.undeaf => kSoundTypeUndeaf,
    FluxerSfxClip.mute => kSoundTypeMute,
    FluxerSfxClip.unmute => kSoundTypeUnmute,
    FluxerSfxClip.incomingRing => kSoundTypeIncomingRing,
    FluxerSfxClip.userJoin => kSoundTypeUserJoin,
    FluxerSfxClip.userLeave => kSoundTypeUserLeave,
    FluxerSfxClip.userMove => kSoundTypeUserMove,
    FluxerSfxClip.viewerJoin => kSoundTypeViewerJoin,
    FluxerSfxClip.viewerLeave => kSoundTypeViewerLeave,
    FluxerSfxClip.voiceDisconnect => kSoundTypeVoiceDisconnect,
    FluxerSfxClip.cameraOn => kSoundTypeCameraOn,
    FluxerSfxClip.cameraOff => kSoundTypeCameraOff,
    FluxerSfxClip.streamStart => kSoundTypeScreenShareStart,
    FluxerSfxClip.streamStop => kSoundTypeScreenShareStop,
    FluxerSfxClip.pttActive || FluxerSfxClip.pttInactive => null,
  };
}

String notificationSoundTypeLabel(FluxerLocalizations l10n, String soundType) {
  return switch (soundType) {
    kSoundTypeMessage => l10n.notificationsSoundMessage,
    kSoundTypeDirectMessage => l10n.notificationsSoundDirectMessage,
    kSoundTypeSameChannelMessage => l10n.notificationsSoundSameChannelMessage,
    kSoundTypeMute => l10n.notificationsSoundMute,
    kSoundTypeUnmute => l10n.notificationsSoundUnmute,
    kSoundTypeDeaf => l10n.notificationsSoundDeaf,
    kSoundTypeUndeaf => l10n.notificationsSoundUndeaf,
    kSoundTypeUserJoin => l10n.notificationsSoundUserJoin,
    kSoundTypeUserLeave => l10n.notificationsSoundUserLeave,
    kSoundTypeUserMove => l10n.notificationsSoundUserMove,
    kSoundTypeViewerJoin => l10n.notificationsSoundViewerJoin,
    kSoundTypeViewerLeave => l10n.notificationsSoundViewerLeave,
    kSoundTypeVoiceDisconnect => l10n.notificationsSoundVoiceDisconnect,
    kSoundTypeIncomingRing => l10n.notificationsSoundIncomingRing,
    kSoundTypeCameraOn => l10n.notificationsSoundCameraOn,
    kSoundTypeCameraOff => l10n.notificationsSoundCameraOff,
    kSoundTypeScreenShareStart => l10n.notificationsSoundScreenShareStart,
    kSoundTypeScreenShareStop => l10n.notificationsSoundScreenShareStop,
    _ => soundType,
  };
}
