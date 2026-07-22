import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

/// VoiceSessionState.errorMessage when camera access was denied
const String kVoiceSessionErrorCameraPermission = 'VOICE_ERR_CAMERA_PERM';

/// A generic screen-share toggle failure (unclassified).
const String kVoiceSessionErrorScreenShareToggle =
    'VOICE_ERR_SCREEN_SHARE_TOGGLE';

/// Screen-share permission being denied by the OS.
const String kVoiceSessionErrorScreenSharePermissionDenied =
    'VOICE_ERR_SCREEN_SHARE_PERM';

/// Screen share toggle being invoked on a platform or device
/// that doesn't support it.
const String kVoiceSessionErrorScreenShareUnsupported =
    'VOICE_ERR_SCREEN_SHARE_UNSUPPORTED';

/// Join rejected because the channel requires an E2EE capable client.
const String kVoiceSessionErrorE2eeRequired = 'VOICE_ERR_E2EE_REQUIRED';

/// Mic track publish failed, user may still be connected listen only.
const String kVoiceSessionErrorMicPublish = 'VOICE_ERR_MIC_PUBLISH';

/// Join rejected because the user lacks Connect permission in the channel.
const String kVoiceSessionErrorNoConnectPermission =
    'VOICE_ERR_NO_CONNECT_PERM';

/// Microphone permission was denied before a voice join could start.
const String kVoiceSessionErrorMicPermission = 'VOICE_ERR_MIC_PERM';

/// LiveKit/WebRTC transport failed (ICE, network, or media connect timeout).
const String kVoiceSessionErrorTransportFailed = 'VOICE_ERR_TRANSPORT';

/// Other devices did not disconnect before a switch-to-this-device join.
const String kVoiceSessionErrorMultiDeviceDisconnectFailed =
    'VOICE_ERR_MULTI_DEVICE_DISCONNECT';

/// Maps a stored `VoiceSessionState.errorMessage` to a localized
/// human-readable string.
String resolveVoiceSessionErrorMessage(
  String message,
  FluxerLocalizations l10n,
) {
  switch (message) {
    case kVoiceSessionErrorCameraPermission:
      return l10n.voiceCameraPermissionRequired;
    case kVoiceSessionErrorScreenShareToggle:
      return l10n.voiceErrorScreenShareToggle;
    case kVoiceSessionErrorScreenSharePermissionDenied:
      return l10n.voiceErrorScreenSharePermissionDenied;
    case kVoiceSessionErrorScreenShareUnsupported:
      return l10n.voiceErrorScreenShareUnsupported;
    case kVoiceSessionErrorE2eeRequired:
      return l10n.voiceE2eeUpdateRequired;
    case kVoiceSessionErrorMicPublish:
      return l10n.voiceMicPublishFailedStayConnected;
    case kVoiceSessionErrorNoConnectPermission:
      return l10n.voiceChannelNoConnectPermission;
    case kVoiceSessionErrorMicPermission:
      return l10n.voiceMessageMicPermissionDenied;
    case kVoiceSessionErrorTransportFailed:
      return l10n.voiceJoinCallFailed;
    case kVoiceSessionErrorMultiDeviceDisconnectFailed:
      return l10n.voiceMultiDeviceDisconnectFailed;
    default:
      return message;
  }
}
