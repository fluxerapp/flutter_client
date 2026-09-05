import 'package:flutter_callkit_incoming/entities/android_params.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/entities/ios_params.dart';
import 'package:flutter_callkit_incoming/entities/notification_params.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_display_info.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const int kVoiceCallKitAudioType = 0;
const Duration kVoiceCallKitRingDuration = Duration(seconds: 45);

CallKitParams buildVoiceCallKitParams({
  required Ref ref,
  required String callKitId,
  required String channelId,
  required FluxerLocalizations l10n,
  String? messageId,
  String? guildId,
  bool forActiveVoice = false,
}) {
  final VoiceCallKitDisplayInfo display = resolveVoiceCallKitDisplayInfo(
    ref: ref,
    channelId: channelId,
    guildId: guildId,
    forActiveVoice: forActiveVoice,
    l10n: l10n,
  );
  return CallKitParams(
    id: callKitId,
    nameCaller: display.nameCaller,
    appName: 'Fluxer',
    avatar: display.avatar,
    handle: display.handle,
    type: kVoiceCallKitAudioType,
    duration: kVoiceCallKitRingDuration.inMilliseconds,
    missedCallNotification: NotificationParams(
      showNotification: true,
      isShowCallback: false,
      subtitle: display.isDm
          ? display.nameCaller
          : display.notificationSubtitle,
      callbackText: '',
    ),
    callingNotification: NotificationParams(
      showNotification: true,
      isShowCallback: true,
      subtitle: display.isDm
          ? display.nameCaller
          : display.notificationSubtitle,
      callbackText: l10n.incomingVoiceCallDecline,
    ),
    extra: <String, dynamic>{
      kVoiceCallKitExtraChannelId: channelId,
      kVoiceCallKitExtraMessageId: ?messageId,
      kVoiceCallKitExtraIsDm: display.isDm,
    },
    android: AndroidParams(
      isCustomNotification: true,
      isShowFullLockedScreen: true,
      isCustomSmallExNotification: true,
      ringtonePath: 'system_ringtone_default',
      incomingCallNotificationChannelName: display.nameCaller,
      missedCallNotificationChannelName: display.nameCaller,
      textAccept: l10n.incomingVoiceCallAccept,
      textDecline: l10n.incomingVoiceCallDecline,
    ),
    ios: const IOSParams(
      handleType: 'generic',
      supportsVideo: false,
      ringtonePath: 'system_ringtone_default',
      configureAudioSession: false,
      audioSessionMode: 'videoChat',
      audioSessionActive: true,
    ),
  );
}
