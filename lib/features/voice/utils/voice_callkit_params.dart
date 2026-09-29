import 'package:flutter_callkit_incoming/entities/android_params.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/entities/ios_params.dart';
import 'package:flutter_callkit_incoming/entities/notification_params.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/utils/voice_call_ring.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_display_info.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const int kVoiceCallKitAudioType = 0;
const String kVoiceCallKitAndroidRingtone = 'incoming_ring';
const String kVoiceCallKitIosRingtone = 'incoming_ring.caf';
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
    headers: const <String, dynamic>{},
    android: AndroidParams(
      isCustomNotification: true,
      isShowFullLockedScreen: true,
      isCustomSmallExNotification: true,
      ringtonePath: kVoiceCallKitAndroidRingtone,
      incomingCallNotificationChannelName: display.nameCaller,
      missedCallNotificationChannelName: display.nameCaller,
      textAccept: l10n.incomingVoiceCallAccept,
      textDecline: l10n.incomingVoiceCallDecline,
    ),
    ios: const IOSParams(
      handleType: 'generic',
      supportsVideo: false,
      ringtonePath: kVoiceCallKitIosRingtone,
      configureAudioSession: false,
      audioSessionMode: 'videoChat',
      audioSessionActive: true,
    ),
  );
}

CallKitParams buildIncomingCallRingParams({
  required String callKitId,
  required CallRingDisplay display,
  String? channelId,
  String? messageId,
  String acceptLabel = 'Accept',
  String declineLabel = 'Decline',
  bool showMissedCall = true,
}) {
  return CallKitParams(
    id: callKitId,
    nameCaller: display.nameCaller,
    appName: 'Fluxer',
    avatar: display.avatar,
    handle: display.handle,
    type: kVoiceCallKitAudioType,
    duration: display.durationMs,
    missedCallNotification: NotificationParams(
      showNotification: showMissedCall,
      isShowCallback: false,
    ),
    extra: <String, dynamic>{
      if (channelId != null && channelId.isNotEmpty)
        kVoiceCallKitExtraChannelId: channelId,
      if (messageId != null && messageId.isNotEmpty)
        kVoiceCallKitExtraMessageId: messageId,
    },
    headers: const <String, dynamic>{},
    android: AndroidParams(
      isCustomNotification: true,
      isShowFullLockedScreen: true,
      isCustomSmallExNotification: true,
      ringtonePath: kVoiceCallKitAndroidRingtone,
      incomingCallNotificationChannelName: display.nameCaller,
      missedCallNotificationChannelName: display.nameCaller,
      textAccept: acceptLabel,
      textDecline: declineLabel,
    ),
    ios: const IOSParams(
      handleType: 'generic',
      supportsVideo: false,
      ringtonePath: kVoiceCallKitIosRingtone,
      configureAudioSession: false,
      audioSessionMode: 'videoChat',
      audioSessionActive: true,
    ),
  );
}

List<CallKitParams> callKitParamsFromNativeVoipCalls(Object? raw) {
  if (raw is! List) {
    return const <CallKitParams>[];
  }
  final List<CallKitParams> calls = <CallKitParams>[];
  for (final Object? entry in raw) {
    final CallKitParams? params = _callKitParamsFromNativeVoipCall(entry);
    if (params != null) {
      calls.add(params);
    }
  }
  return calls;
}

CallKitParams? _callKitParamsFromNativeVoipCall(Object? raw) {
  if (raw is! Map) {
    return null;
  }
  final Map<String, dynamic> json = <String, dynamic>{};
  for (final MapEntry<Object?, Object?> entry in raw.entries) {
    final String? key = entry.key?.toString();
    if (key == null || key.isEmpty) {
      continue;
    }
    json[key] = key == 'extra' ? _stringKeyMap(entry.value) : entry.value;
  }
  final Object? id = json['id'];
  if (id is! String || id.isEmpty) {
    return null;
  }
  return CallKitParams.fromJson(json);
}

Map<String, dynamic>? _stringKeyMap(Object? raw) {
  if (raw is! Map) {
    return null;
  }
  return Map<String, dynamic>.from(
    raw.map(
      (Object? key, Object? value) =>
          MapEntry<String, Object?>(key.toString(), value),
    ),
  );
}
