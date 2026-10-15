import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const String kVoiceSessionErrorCameraPermission = 'VOICE_ERR_CAMERA_PERM';

const String kVoiceSessionErrorScreenShareToggle =
    'VOICE_ERR_SCREEN_SHARE_TOGGLE';

const String kVoiceSessionErrorScreenSharePermissionDenied =
    'VOICE_ERR_SCREEN_SHARE_PERM';

const String kVoiceSessionErrorScreenShareUnsupported =
    'VOICE_ERR_SCREEN_SHARE_UNSUPPORTED';

const String kVoiceSessionErrorE2eeRequired = 'VOICE_ERR_E2EE_REQUIRED';

const String kVoiceSessionErrorP2pConsentRequired =
    'VOICE_ERR_P2P_CONSENT_REQUIRED';

const String kVoiceSessionErrorP2pUnavailable = 'VOICE_ERR_P2P_UNAVAILABLE';

const String kVoiceSessionErrorChannelFull = 'VOICE_ERR_CHANNEL_FULL';

const String kVoiceSessionErrorP2pScreenShareUnavailable =
    'VOICE_ERR_P2P_SCREEN_SHARE_UNAVAILABLE';

const String kVoiceSessionErrorTimedOut = 'VOICE_ERR_TIMED_OUT';

const String kVoiceSessionErrorUnclaimed = 'VOICE_ERR_UNCLAIMED';

const String kVoiceSessionErrorUnclaimedDirectCall =
    'VOICE_ERR_UNCLAIMED_DIRECT_CALL';

const String kVoiceSessionErrorUserLimit = 'VOICE_ERR_USER_LIMIT';

const String kVoiceSessionErrorConnectionLimit = 'VOICE_ERR_CONNECTION_LIMIT';

const String kVoiceSessionErrorChannelUnavailable =
    'VOICE_ERR_CHANNEL_UNAVAILABLE';

const Map<String, String> kVoiceGatewayJoinErrors = <String, String>{
  'VOICE_E2EE_REQUIRED': kVoiceSessionErrorE2eeRequired,
  'VOICE_P2P_CONSENT_REQUIRED': kVoiceSessionErrorP2pConsentRequired,
  'VOICE_P2P_UNAVAILABLE': kVoiceSessionErrorP2pUnavailable,
  'VOICE_CHANNEL_FULL': kVoiceSessionErrorChannelFull,
  'VOICE_MEMBER_TIMED_OUT': kVoiceSessionErrorTimedOut,
  'VOICE_CONNECTION_LIMIT_REACHED': kVoiceSessionErrorConnectionLimit,
  'VOICE_UNCLAIMED_ACCOUNT': kVoiceSessionErrorUnclaimed,
  'VOICE_PERMISSION_DENIED': kVoiceSessionErrorNoConnectPermission,
  'VOICE_CHANNEL_NOT_FOUND': kVoiceSessionErrorChannelUnavailable,
  'VOICE_INVALID_CHANNEL_TYPE': kVoiceSessionErrorChannelUnavailable,
  'VOICE_GUILD_NOT_FOUND': kVoiceSessionErrorChannelUnavailable,
};

const String kVoiceSessionErrorMicPublish = 'VOICE_ERR_MIC_PUBLISH';

const String kVoiceSessionErrorNoConnectPermission =
    'VOICE_ERR_NO_CONNECT_PERM';

const String kVoiceSessionErrorDirectCallNotEligible =
    'VOICE_ERR_DIRECT_CALL_NOT_ELIGIBLE';

const String kVoiceSessionErrorMicPermission = 'VOICE_ERR_MIC_PERM';

const String kVoiceSessionErrorTransportFailed = 'VOICE_ERR_TRANSPORT';

const String kVoiceSessionErrorMultiDeviceDisconnectFailed =
    'VOICE_ERR_MULTI_DEVICE_DISCONNECT';

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
    case kVoiceSessionErrorP2pConsentRequired:
      return l10n.voiceP2pConsentRequiredError;
    case kVoiceSessionErrorP2pUnavailable:
      return l10n.voiceP2pUnavailableError;
    case kVoiceSessionErrorChannelFull:
      return l10n.voiceChannelFullError;
    case kVoiceSessionErrorP2pScreenShareUnavailable:
      return l10n.voiceP2pScreenShareUnavailable;
    case kVoiceSessionErrorMicPublish:
      return l10n.voiceMicPublishFailedStayConnected;
    case kVoiceSessionErrorNoConnectPermission:
      return l10n.voiceChannelNoConnectPermission;
    case kVoiceSessionErrorDirectCallNotEligible:
      return l10n.directVoiceCallNotEligible;
    case kVoiceSessionErrorMicPermission:
      return l10n.voiceMessageMicPermissionDenied;
    case kVoiceSessionErrorTransportFailed:
      return l10n.voiceJoinCallFailed;
    case kVoiceSessionErrorMultiDeviceDisconnectFailed:
      return l10n.voiceMultiDeviceDisconnectFailed;
    case kVoiceSessionErrorTimedOut:
      return l10n.voiceJoinTimedOut;
    case kVoiceSessionErrorUnclaimed:
      return l10n.voiceJoinClaimAccount;
    case kVoiceSessionErrorUnclaimedDirectCall:
      return l10n.voiceJoinClaimAccountDirectCall;
    case kVoiceSessionErrorUserLimit:
      return l10n.voiceJoinUserLimit;
    case kVoiceSessionErrorConnectionLimit:
      return l10n.voiceJoinConnectionLimit;
    case kVoiceSessionErrorChannelUnavailable:
      return l10n.voiceJoinChannelUnavailable;
    default:
      return message;
  }
}
