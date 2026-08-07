import 'package:fluxer_app/features/settings/domain/tts_notification_mode.dart';

bool shouldSpeakIncomingMessage({
  required TtsNotificationMode mode,
  required bool enableTtsCommand,
  required bool isExplicitTts,
  required bool isSelf,
  required bool isSystemMessage,
  required String messageChannelId,
  required String? activeChannelId,
}) {
  if (isSelf && !isSystemMessage) {
    return false;
  }
  if (mode == TtsNotificationMode.never) {
    return isExplicitTts && enableTtsCommand;
  }
  if (mode == TtsNotificationMode.forCurrentChannel) {
    if (activeChannelId == null || messageChannelId != activeChannelId) {
      return false;
    }
  }
  return true;
}
