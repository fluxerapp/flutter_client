import 'package:fluxer_app/features/channels/data/read_state_utils.dart';

bool isQuickSwitcherChannelUnread({
  required String? channelLastMessageId,
  required String? ackLastMessageId,
  required int mentionCount,
  int fallbackAckMs = 0,
}) {
  return hasUnreadByReadState(
    channelLastMessageId: channelLastMessageId,
    ackLastMessageId: ackLastMessageId,
    fallbackAckMs: fallbackAckMs,
    mentionCount: mentionCount,
  );
}
